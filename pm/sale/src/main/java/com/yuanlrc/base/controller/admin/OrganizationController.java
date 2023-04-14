package com.yuanlrc.base.controller.admin;


import com.yuanlrc.base.bean.AuditStatus;
import com.yuanlrc.base.bean.CodeMsg;
import com.yuanlrc.base.bean.PageBean;
import com.yuanlrc.base.bean.Result;
import com.yuanlrc.base.constant.SessionConstant;
import com.yuanlrc.base.entity.common.Organization;
import com.yuanlrc.base.service.admin.OrganizationService;
import com.yuanlrc.base.util.SessionUtil;
import com.yuanlrc.base.util.StringUtil;
import com.yuanlrc.base.util.ValidateEntityUtil;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

/**
 * 拍卖者管理
 * @author zhong
 */
@Controller
@RequestMapping("/admin/organization")
public class OrganizationController {

    @Autowired
    private OrganizationService organizationService;


    @RequestMapping("/list")
    public String list(Model model, Organization organization, PageBean<Organization> pageBean) {
        model.addAttribute("title", "拍卖者列表");
        model.addAttribute("pageBean", organizationService.findList(organization, pageBean));
        model.addAttribute("name", organization.getName());
        return "admin/organization/list";
    }

    /**
     * 拍卖者注册页面
     *
     * @param model
     * @return
     */
    @GetMapping("/register")
    public String register(Model model) {
        return "admin/organization/register";
    }

    /**
     * 拍卖者注册操作
     *
     * @param organization
     * @param
     * @return
     * @throws Exception
     */
    @PostMapping("/register")
    @ResponseBody
    public Result<Boolean> register(Organization organization) {
        organization.setRole(organizationService.findOrganizationRole());
        CodeMsg codeMsg = ValidateEntityUtil.validate(organization);
        if (codeMsg.getCode() != CodeMsg.SUCCESS.getCode())
            return Result.error(codeMsg);
        //验证邮箱
        if (!StringUtil.emailFormat(organization.getEmail()))
            return Result.error(CodeMsg.HOME_ACCOUNT_EMAIL_ERROR);
        //验证手机号
        if (!StringUtil.isMobile(organization.getMobile()))
            return Result.error(CodeMsg.COMMON_PHONE_FORMAET_ERROR);
        //判断手机号是否注册过和邮箱
        if (organizationService.findByEmail(organization.getEmail()) != null)
            return Result.error(CodeMsg.COMMON_EMAIL_EXSITER_ERROR);

        if (organizationService.findByPhone(organization.getMobile()) != null)
            return Result.error(CodeMsg.COMMON_PHONE_EXSITER_ERROR);
        //判断拍卖者名称
        if (organizationService.findByName(organization.getName()) != null)
            return Result.error(CodeMsg.ADMIN_ORGANIZATION_NAME_ERROR);
        if (organizationService.save(organization) == null) {
            return Result.error(CodeMsg.ADMIN_REGISTER_ERROR);
        }
        return Result.success(true);
    }


    /**
     * 改变拍卖者状态
     * @param id
     * @param type
     * @param notPassReason
     * @return
     */
    @PostMapping("/examine")
    @ResponseBody
    public Result<Boolean> examine(Long id,@RequestParam(name="type")String type, String notPassReason) {
        Organization find = organizationService.find(id);
        if (find == null)
            return Result.error(CodeMsg.DATA_ERROR);
        if(!"PASS,NOT_PASS,FROZEN,THAW".contains(type)){
            return Result.error(CodeMsg.ADMIN_ORGANIZATION_STATUS_ERROR);
        }
        switch (type){
            case "PASS":
                find.setAuditStatus(AuditStatus.PASS.getCode());
                break;
            case "NOT_PASS":
                find.setAuditStatus(AuditStatus.NOT_PASS.getCode());
                break;
            case "FROZEN"  :
                find.setAuditStatus(AuditStatus.FREEZE.getCode());
                break;
            default:
                find.setAuditStatus(AuditStatus.PASS.getCode());
        }
        find.setNotPassReason(notPassReason);
        if(organizationService.save(find)==null){
            return Result.error(CodeMsg.ADMIN_ORGANIZATION_STATUS_EDIT_ERROR);
        }
        return Result.success(true);
    }

    /**
     * 个人信息页面
     * @param model
     * @return
     */
    @GetMapping("/info")
    public String info(Model model){
        Organization oraganization = SessionUtil.getOraganization();
        model.addAttribute("item",oraganization);
        model.addAttribute("status",AuditStatus.values());
        return "admin/organization/info";
    }

    /**
     * 修改个人信息
     * @param organization
     * @return
     */
    @ResponseBody
    @PostMapping("/info")
    public Result<Boolean> info(Organization organization){
        Long id = organization.getId();
        if(!StringUtil.isMobile(organization.getMobile())){
            return Result.error(CodeMsg.HOME_ACCOUNT_PHONE_ERROR);
        }
        if(!StringUtil.emailFormat(organization.getEmail())){
            return Result.error(CodeMsg.HOME_ACCOUNT_EMAIL_ERROR);
        }
        String legalPerson = organization.getLegalPerson();
        if(StringUtils.isEmpty(legalPerson)){
            return Result.error(CodeMsg.ADMIN_USER_INFO_PERSON_ERROR);
        }
        if(legalPerson.length()<2){
            return Result.error(CodeMsg.ADMIN_ORGANIZATION_LEGALPERSON_MIN_LENGTH_ERROR);
        }
        if(legalPerson.length()>30){
            return Result.error(CodeMsg.ADMIN_ORGANIZATION_LEGALPERSON_MAX_LENGTH_ERROR);
        }
        if(StringUtils.isEmpty(organization.getAddress())){
            return Result.error(CodeMsg.ADMIN_USER_INFO_ADDRESS_ERROR);
        }
        //判断手机号是否注册过和邮箱
        Organization byEmail = organizationService.findByEmail(organization.getEmail());
        if (byEmail!= null)
            if(!byEmail.getId().equals(id)){
                return Result.error(CodeMsg.COMMON_EMAIL_EXSITER_ERROR);
            }
        Organization byPhone = organizationService.findByPhone(organization.getMobile());
        if ( byPhone!= null){
            if(!byPhone.getId().equals(id)){
                return Result.error(CodeMsg.COMMON_PHONE_EXSITER_ERROR);
            }
        }
        Organization organization1 = organizationService.find(organization.getId());
        if(organization1.getAuditStatus().equals(AuditStatus.NOT_PASS.getCode())){
            //表示未通过
            organization1.setAuditStatus(AuditStatus.AUDIT.getCode());
        }
        BeanUtils.copyProperties(organization,organization1,"auditStatus","password","name","role","balance","id","createTime","updateTime","rate");
        SessionUtil.set(SessionConstant.SESSION_USER_ORGANIZATION,organization1);
        if(organizationService.save(organization1)==null){
            return Result.error(CodeMsg.ADMIN_USER_INFO_SAVE_ERROR);
        }
        return Result.success(true);
    }

    /**
     * 拍卖者忘记密码
     * @param email
     * @param password
     * @return
     */
    @ResponseBody
    @PostMapping("/forget_password")
    public Result<Boolean> forgetPassword(@RequestParam(name = "email")String email,@RequestParam(name = "password")String password){
        Organization byEmail = organizationService.findByEmail(email);
        if(byEmail==null){
            return  Result.error(CodeMsg.HOME_ACCOUNT_NOT_EXIST_ERROR);
        }
        if(StringUtils.isEmpty(password)){
            return  Result.error(CodeMsg.ADMIN_ORGANIZATION_PASSWORD_ERROR);
        }
        if(password.length()<4){
            return Result.error(CodeMsg.PASSWORD_MIN_LENGTH_ERROR);
        }
        if(password.length()>32){
            return Result.error(CodeMsg.PASSWORD_MAX_LENGTH_ERROR);
        }
        byEmail.setPassword(password);
        if(organizationService.updatePassword(byEmail)<=0){
            return Result.error(CodeMsg.ADMIN_ORGANIZATION_UPDATE_PASSWORD_ERROR);
        }
        return Result.success(true);
    }
}