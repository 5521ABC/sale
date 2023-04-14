package com.yuanlrc.base.controller.admin;

import com.yuanlrc.base.bean.CodeMsg;
import com.yuanlrc.base.bean.PageBean;
import com.yuanlrc.base.bean.Result;
import com.yuanlrc.base.entity.common.Account;
import com.yuanlrc.base.entity.common.BiddingProject;
import com.yuanlrc.base.entity.common.Organization;
import com.yuanlrc.base.entity.home.BiddingRecord;
import com.yuanlrc.base.service.admin.OperaterLogService;
import com.yuanlrc.base.service.admin.ProjectCategoryService;
import com.yuanlrc.base.service.common.AccountService;
import com.yuanlrc.base.service.common.ProjectService;
import com.yuanlrc.base.service.home.BiddingRecordService;
import com.yuanlrc.base.util.SessionUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

/**
 * 后台项目竞价列表控制器
 *
 * @author Administrator
 */
@RequestMapping("/admin/bidding_record")
@Controller
public class ProjectRecordController {

    @Autowired
    private ProjectService projectService;

    @Autowired
    private ProjectCategoryService projectCategoryService;

    @Autowired
    private BiddingRecordService biddingRecordService;

    @Autowired
    private OperaterLogService operaterLogService;

    @Autowired
    private AccountService accountService;
    /**
     * 商品列表
     * @param model
     * @param biddingProject
     * @param pageBean
     * @return
     */
    @GetMapping("/list")
    public String list(Model model, BiddingProject biddingProject, PageBean<BiddingProject> pageBean){
        Organization oraganization = SessionUtil.getOraganization();
        biddingProject.setOrganization(oraganization);
        PageBean<BiddingProject> list = projectService.findList(biddingProject, pageBean);
        model.addAttribute("pageBean",list);
        model.addAttribute("title","竞价列表");
        model.addAttribute("categoryList",projectCategoryService.findAll());
        model.addAttribute("name",biddingProject.getName()==null?"":biddingProject.getName());
        model.addAttribute("currentCategory",biddingProject.getProjectCategory()==null?-1:biddingProject.getProjectCategory().getId());
        return "admin/bidding_record/list";
    }

    /**
     * 竞价记录列表
     * @param biddingRecord
     * @Param pageBean
     * @param model
     * @return
     */
    @GetMapping("/record_list")
    public String recordsList(BiddingRecord biddingRecord, PageBean<BiddingRecord> pageBean,Model model){
        BiddingProject biddingProject = projectService.find(biddingRecord.getBiddingProject().getId());
        if(biddingProject==null){
            model.addAttribute("msg","未找到该商品");
        }
        PageBean<BiddingRecord> biddingRecordList = biddingRecordService.findByOraganizationList(biddingProject.getId(), pageBean);
        model.addAttribute("biddingRecordList",biddingRecordList);
        model.addAttribute("title","竞价记录列表");
        return "admin/bidding_record/bidding_record_view_list";
    }

    /**
     * 确认交易操作
     * @param rid
     * @return
     */
    @ResponseBody
    @PostMapping("/transaction")
    public Result<Boolean> transaction(@RequestParam(name = "rid",required = true)Long rid){
        BiddingRecord biddingRecord = biddingRecordService.find(rid);
        if(biddingRecord==null){
            return Result.error(CodeMsg.ADMIN_PROJECT_BIDDINGRECORD_NOT_EXIST);
        }
        //清空本次商品的所有竞拍记录
        return biddingRecordService.updateRecordTransaction(biddingRecord);
    }

    /**
     * 用户未支付 逾期操作
     * @param accountId
     * @return
     */
    @ResponseBody
    @PostMapping("/overdue")
    public Result<Boolean> overdue(@RequestParam(name = "accountId")Long accountId,@RequestParam(name = "recordId")Long recordId){
        Account account = accountService.find(accountId);
        if(account==null){
            return Result.error(CodeMsg.HOME_ACCOUNT_NOT_EXIST_ERROR);
        }
        if(biddingRecordService.find(recordId)==null){
            return Result.error(CodeMsg.ADMIN_PROJECT_BIDDINGRECORD_NOT_EXIST);
        }
        int creditScore = account.getCreditScore();
        if(accountService.updateCreditScore(creditScore - 5, accountId)<=0){
            return Result.error(CodeMsg.ADMIN_PROJECT_BIDDINGRECORD_CREDITSCORE_SUBTRACT_ERROR);
        }
        //更改状态为未支付 未交易
        if(biddingRecordService.updatePayStatusAndBiddingStatus(recordId,BiddingRecord.STATUS_NO,BiddingRecord.BIDDING_STATUS_DEFAULT)<=0){
            return Result.error(CodeMsg.ADMIN_ORGANIZATION_STATUS_EDIT_ERROR);
        }
        return Result.success(true);
    }
}
