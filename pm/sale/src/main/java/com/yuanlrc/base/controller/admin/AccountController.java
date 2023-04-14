package com.yuanlrc.base.controller.admin;

import com.yuanlrc.base.bean.CodeMsg;
import com.yuanlrc.base.bean.PageBean;
import com.yuanlrc.base.bean.Result;
import com.yuanlrc.base.entity.common.Account;
import com.yuanlrc.base.service.admin.OperaterLogService;
import com.yuanlrc.base.service.common.AccountService;
import com.yuanlrc.base.util.ValidateEntityUtil;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

/**
 * 前台用户控制器
 *
 * @author Administrator
 */
@RequestMapping("/admin/account")
@Controller
public class AccountController {

    @Autowired
    private AccountService accountService;

    @Autowired
    private OperaterLogService operaterLogService;

    /**
     * 前台用户列表
     * @param model
     * @param account
     * @param pageBean
     * @return
     */
    @GetMapping("/list")
    public String list(Model model,Account account,PageBean<Account> pageBean){
        model.addAttribute("title", "前台用户列表");
        model.addAttribute("username", account.getUsername());
        model.addAttribute("pageBean", accountService.findList(account, pageBean));
        return "admin/account/list";
    }


    /**
     * 前台用户添加
     * @param model
     * @return
     */
    @GetMapping("/add")
    public String add(Model model){
        return "admin/account/add";
    }

    /**
     * 前台用户添加操作
     * @param account
     * @return
     */
    @ResponseBody
    @PostMapping("/add")
    public Result<Boolean> add(Account account){
        CodeMsg validate = ValidateEntityUtil.validate(account);
        if(validate.getCode() != CodeMsg.SUCCESS.getCode()){
            return Result.error(validate);
        }
        if(StringUtils.isEmpty(account.getPmPwd())){
            return Result.error(CodeMsg.ADMIN_ACCOUNT_PMPWD_ERROR);
        }
        Account byUsername = accountService.findByUsername(account.getUsername());
        if(byUsername!=null){
            return Result.error(CodeMsg.HOME_ACCOUNT_USERNAME_EXIST);
        }
        //一切顺利添加到数据库
        if(accountService.save(account)==null){
            return Result.error(CodeMsg.ADMIN_ACCOUNT_ADD_ERROR);
        }
        operaterLogService.add("添加前台用户，用户名：" + account.getUsername());
        return Result.success(true);
    }

    /**
     * 前台用户编辑页面
     * @param id
     * @param model
     * @return
     */
    @GetMapping("/edit")
    public String edit(@RequestParam(name = "id",required = true)Long id,Model model){
        Account account = accountService.find(id);
        model.addAttribute("account",account);
        return "admin/account/edit";
    }

    /**
     * 前台用户编辑操作
     * @param account
     * @return
     */
    @ResponseBody
    @PostMapping("/edit")
    public Result<Boolean> edit(Account account){
        CodeMsg validate = ValidateEntityUtil.validate(account);
        if(validate.getCode() != CodeMsg.SUCCESS.getCode()){
            return Result.error(validate);
        }
        if(StringUtils.isEmpty(account.getPmPwd())){
            return Result.error(CodeMsg.ADMIN_ACCOUNT_PMPWD_ERROR);
        }
        //查找是否用户名已存在
        if(accountService.isExistUsername(account.getUsername(), account.getId())){
            return Result.error(CodeMsg.HOME_ACCOUNT_USERNAME_EXIST);
        }
        //根据Id查询
        Account findAccount = accountService.find(account.getId());
        if(findAccount==null){
            return Result.error(CodeMsg.HOME_ACCOUNT_NOT_EXIST_ERROR);
        }
        BeanUtils.copyProperties(account,findAccount,"id","createTime","updateTime","balance","creditScore");
        if(accountService.save(findAccount)==null){
            return Result.error(CodeMsg.ADMIN_ACCOUNT_EDIT_ERROR);
        }
        operaterLogService.add("编辑前台用户，用户名：" + account.getUsername());
        return Result.success(true);
    }

    /**
     * 删除操作
     * @param id
     * @return
     */
    @ResponseBody
    @PostMapping("/delete")
    public Result<Boolean> delete(@RequestParam(name = "id",required = true)Long id){
        try {
            accountService.delete(id);
        } catch (Exception e) {
            return Result.error(CodeMsg.ADMIN_USE_DELETE_ERROR);
        }
        operaterLogService.add("删除用户，用户ID：" + id);
        return Result.success(true);
    }

}
