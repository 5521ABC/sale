package com.yuanlrc.base.controller.home;

import com.yuanlrc.base.bean.*;
import com.yuanlrc.base.entity.common.Account;
import com.yuanlrc.base.entity.common.BiddingProject;
import com.yuanlrc.base.entity.home.BiddingApply;
import com.yuanlrc.base.entity.home.BiddingRecord;
import com.yuanlrc.base.entity.home.ProjectEvaluate;
import com.yuanlrc.base.service.admin.OperaterLogService;
import com.yuanlrc.base.service.admin.ProjectCategoryService;
import com.yuanlrc.base.service.common.AccountService;
import com.yuanlrc.base.service.common.ProjectService;
import com.yuanlrc.base.service.home.BiddingApplyService;
import com.yuanlrc.base.service.home.BiddingRecordService;
import com.yuanlrc.base.service.home.ProjectEvaluateService;
import com.yuanlrc.base.util.DateUtil;
import com.yuanlrc.base.util.SessionUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.List;

/**
 * 前台商品控制器
 *
 * @author Administrator
 */
@RequestMapping("/home/project")
@Controller
public class HomeProjectController {

    @Autowired
    private AccountService accountService;

    @Autowired
    private OperaterLogService operaterLogService;

    @Autowired
    private ProjectService projectService;

    @Autowired
    private ProjectCategoryService projectCategoryService;

    @Autowired
    private BiddingRecordService biddingRecordService;

    @Autowired
    private BiddingApplyService biddingApplyService;

    @Autowired
    private ProjectEvaluateService projectEvaluateService;

    /**
     * 前台商品列表
     *
     * @param model
     * @return
     */
    @GetMapping("/list")
    public String index(Model model, BiddingProject biddingProject, PageBean<BiddingProject> pageBean) {
        Date date = new Date();
        model.addAttribute("activeType", "project");
        PageBean<BiddingProject> biddingProjectPageBean = projectService.homeFindList(biddingProject, pageBean);
        for (BiddingProject project : biddingProjectPageBean.getContent()) {
            projectService.status(project, date);
        }
        model.addAttribute("pageBean", biddingProjectPageBean);
        model.addAttribute("newProjectTop4", projectService.findTop4ByProjectStatusOrderByCreateTime());
        model.addAttribute("projectStatus", HomeProjectStatus.values());
        model.addAttribute("projectCategoryList", projectCategoryService.findByStatus(CategoryStatus.AVAILABLE));
        model.addAttribute("projectName", biddingProject.getName() == null ? "" : biddingProject.getName());
        model.addAttribute("currentStatus", biddingProject.getProjectStatus());
        model.addAttribute("currentCategory", biddingProject.getProjectCategory() == null ? -1 : biddingProject.getProjectCategory().getId());
        return "home/project/project_list";
    }

    /**
     * 商品详情页面
     *
     * @param model
     * @param id
     * @param pageBean
     * @return
     */
    @GetMapping("/detail")
    public String projectDetails(Model model, @RequestParam(name = "id", required = true) Long id, PageBean<BiddingRecord> pageBean) {
        BiddingProject biddingProject = projectService.find(id);
        if (biddingProject == null) {
            model.addAttribute("msg", "未找到该项目!");
            return "/error/404";
        }
        //更新浏览量
        if (projectService.updateViewsNumber(biddingProject.getViewsNumber() + 1, biddingProject.getId()) <= 0) {
            model.addAttribute("msg", "浏览量更新失败");
            return "/error/404";
        }
        Date date = new Date();
        String currentTime = DateUtil.datetimeFormat.format(date);
        //计算周期
        String cycleDate = DateUtil.getDatePoor(biddingProject.getBiddingEndTime(), biddingProject.getBiddingStartTime());
        biddingProject = projectService.status(biddingProject, date);
        //查询该项目的所有竞价列表
        List<BiddingRecord> recordList = biddingRecordService.findByBiddingProjectIdAndPayStatusOrderByBidDesc(id, BiddingRecord.STATUS_NO);
        //查询该项目的所有评论
        List<ProjectEvaluate> projectEvaluates = projectEvaluateService.findByBiddingProjectId(id);
        //获取项目的评价
        int size = projectEvaluates.size();
        Double rate = biddingProject.getRate();
        int rates = rate.intValue();
        int ratys=0;
        if(size!=0){
            ratys= rates / size;
        }
        model.addAttribute("recordList", recordList);
        model.addAttribute("systemDate", currentTime);
        model.addAttribute("cycleDate", cycleDate);
        model.addAttribute("projectDetail", biddingProject);
        model.addAttribute("projectEvaluates",projectEvaluates);
        model.addAttribute("activeType", "project");
        model.addAttribute("ratys",ratys);
        return "home/project/project_details";
    }

    /**
     * 报名操作
     *
     * @param pid
     * @return
     */
    @ResponseBody
    @PostMapping("/sign_up")
    public Result<Boolean> signUp(@RequestParam(name = "projectId", required = true) Long pid) {
        BiddingProject biddingProject = projectService.find(pid);
        if (biddingProject == null) {
            return Result.error(CodeMsg.ADMIN_PROJECT_SHOPING_NOT_EXIST);
        }
        Account account = SessionUtil.getAccount();
        if (account == null) {
            return Result.error(CodeMsg.USER_SESSION_EXPIRED);
        }
        //判断该用户的信用分是否合格
        if (account.getCreditScore() < biddingProject.getCredit()) {
            return Result.error(CodeMsg.HOME_BIDDING_PROJECT_CREDIT_ERROR);
        }
        BiddingApply apply = biddingApplyService.findByBiddingProjectIdAndAccountId(biddingProject.getId(), account.getId());
        if (apply == null) {
            //表示没报名过
            BiddingApply biddingApply = new BiddingApply();
            biddingApply.setBiddingProject(biddingProject);
            biddingApply.setAccount(account);
            if (biddingApplyService.save(biddingApply) == null) {
                return Result.error(CodeMsg.HOME_PROJECT_SIGN_UP_ERROR);
            }
            //更新报名次数
            if (projectService.updateApplicantsNumber(biddingProject.getApplicantsNumber() + 1, pid) <= 0) {
                return Result.error(CodeMsg.HOME_BIDDING_PROJECT_APPLICANTSNUMBER_UPDATE_ERROR);
            }
        } else {
            //报名过
            return Result.error(CodeMsg.HOME_SIGN_UP_EXIST_ERROR);
        }
        return Result.success(true);
    }

    /**
     * 确定拍价
     *
     * @param pid
     * @param quantity
     * @param money
     * @return
     */
    @ResponseBody
    @PostMapping("/auction_price")
    public Result<Boolean> auctionPrice(@RequestParam(name = "id", required = true) Long pid, @RequestParam(name = "quantity", required = true) int quantity, @RequestParam(name = "money", required = true) int money) {
        Account account = SessionUtil.getAccount();
        //首先要根据项目id找到项目
        BiddingProject biddingProject = projectService.find(pid);
        if (biddingProject == null) {
            return Result.error(CodeMsg.ADMIN_PROJECT_SHOPING_NOT_EXIST);
        }
        //查询有没有报名
        BiddingApply biddingApply = biddingApplyService.findByBiddingProjectIdAndAccountId(pid, account.getId());
        if (biddingApply == null) {
            return Result.error(CodeMsg.HOME_SIGN_UP_NOT_EXIST_ERROR);
        }
        if (quantity > biddingProject.getQuantity()) {
            return Result.error(CodeMsg.HOME_PROJECT_QUANTITY_ERROR);
        }
        if (money < biddingProject.getStartPrice()) {
            return Result.error(CodeMsg.HOME_PROJECT_MINMONEY_ERROR);
        }
        //更新竞拍次数
        if (projectService.updateAuctionTimes(biddingProject.getAuctionTimes() + 1, pid) <= 0) {
            return Result.error(CodeMsg.HOME_BIDDING_PROJECT_AUCTIONTIMES_ADD_ERROR);
        }
        if (biddingProject.getTransactionPrice() < money) {
            //更新竞拍最高价
            if (projectService.updateMaxMoney(money, pid) <= 0) {
                return Result.error(CodeMsg.HOME_BIDDING_PROJECT_EDIT_MAX_MONEY_ERROR);
            }
        }
        //添加到竞拍表
        BiddingRecord biddingRecord = new BiddingRecord();
        biddingRecord.setAccount(account);
        biddingRecord.setBiddingProject(biddingProject);
        biddingRecord.setQuantity(quantity);
        biddingRecord.setBid(money);
        if (biddingRecordService.save(biddingRecord) == null) {
            return Result.error(CodeMsg.HOME_PROJECT_BIDDINGRECORD_ADD_ERROR);
        }
        return Result.success(true);
    }

    /**
     * 查询自己的报名记录
     *
     * @param
     * @return
     */
    @GetMapping("/apply_list")
    public String projectApply(Model model) {
        Account account = SessionUtil.getAccount();
        List<BiddingApply> applyList = biddingApplyService.findByAccountId(account.getId());
        model.addAttribute("projectApplyList", applyList);
        model.addAttribute("activeType", "profile");
        return "home/personal/profile_apply_list";
    }

    /**
     * 查询自己的竞价记录
     *
     * @param model
     * @return
     */
    @GetMapping("/bidding_record_list")
    public String projectBiddingRecord(Model model) {
        Account account = SessionUtil.getAccount();
        List<BiddingRecord> recordList = biddingRecordService.findByAccountIdOrderByBidDesc(account.getId());
        model.addAttribute("recordList", recordList);
        model.addAttribute("activeType", "profile");
        return "home/personal/profile_bidding_record_list";
    }


    /**
     * 查询出自己的竞价成功的记录
     *
     * @param model
     * @return
     */
    @GetMapping("/success_bidding_list")
    public String successBiddingList(Model model) {
        Account account = SessionUtil.getAccount();
        List<BiddingRecord> biddingRecordsList = biddingRecordService.findByAccountIdAndPayStatus(account.getId(), BiddingRecord.STATUS_YES);
        model.addAttribute("biddingRecordsList", biddingRecordsList);
        model.addAttribute("activeType", "profile");
        return "home/personal/profile_success_bidding_list";
    }
}
