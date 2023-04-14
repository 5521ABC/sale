package com.yuanlrc.base.controller.home;

import com.yuanlrc.base.bean.CategoryStatus;
import com.yuanlrc.base.bean.CodeMsg;
import com.yuanlrc.base.bean.PageBean;
import com.yuanlrc.base.bean.ProjectStatus;
import com.yuanlrc.base.bean.Result;
import com.yuanlrc.base.config.AppConfig;
import com.yuanlrc.base.constant.SessionConstant;
import com.yuanlrc.base.entity.common.Account;
import com.yuanlrc.base.entity.common.BiddingProject;
import com.yuanlrc.base.entity.common.Organization;
import com.yuanlrc.base.entity.home.BiddingRecord;
import com.yuanlrc.base.entity.home.ProjectEvaluate;
import com.yuanlrc.base.entity.home.RechargeRecord;
import com.yuanlrc.base.service.admin.OperaterLogService;
import com.yuanlrc.base.service.admin.OrganizationService;
import com.yuanlrc.base.service.admin.ProjectCategoryService;
import com.yuanlrc.base.service.common.AccountService;
import com.yuanlrc.base.service.common.ProjectService;
import com.yuanlrc.base.service.home.BiddingRecordService;
import com.yuanlrc.base.service.home.ProjectEvaluateService;
import com.yuanlrc.base.service.home.RechargeRecordService;
import com.yuanlrc.base.util.SessionUtil;
import com.yuanlrc.base.util.StringUtil;
import com.yuanlrc.base.util.ValidateEntityUtil;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

/**
 * 前台首页控制器
 *
 * @author Administrator
 */
@RequestMapping("/home/index")
@Controller
public class HomeIndexController {

    @Autowired
    private AccountService accountService;

    @Autowired
    private OperaterLogService operaterLogService;

    @Autowired
    private ProjectService projectService;

    @Autowired
    private ProjectCategoryService projectCategoryService;

    @Autowired
    private RechargeRecordService rechargeRecordService;

    @Autowired
    private BiddingRecordService biddingRecordService;

    @Autowired
    private ProjectEvaluateService projectEvaluateService;

    @Autowired
    private OrganizationService organizationService;

    private String uploadPhotoSufix = ".jpg,.png,.gif,.jpeg";

    private long uploadPhotoMaxSize = 10240;

    private String uploadPhotoPath = System.getProperty("user.dir") + "/src/main/resources/upload/";//文件保存位置


    /**
     * 前台首页
     *
     * @param model
     * @return
     */
    @GetMapping("/index")
    public String index(Model model) {
        model.addAttribute("activeType", "index");
        List<BiddingProject> releaseTop4List = projectService.findTop3ByProjectStatusAndProjectStatusOrderByCreateTimeDesc(ProjectStatus.RELEASE, ProjectStatus.REGISTERING);
        model.addAttribute("releaseTop4List", releaseTop4List);
        model.addAttribute("categoryTop6List", projectCategoryService.findTop6ByStatusOrderByCreateTime(CategoryStatus.AVAILABLE));
        model.addAttribute(SessionConstant.SESSION_USER_AUTH_KEY, AppConfig.ORDER_AUTH);
        return "home/index/index";
    }

    /**
     * 注册页面
     *
     * @param model
     * @return
     */
    @GetMapping("/register")
    public String register(Model model) {
        return "home/index/register";
    }

    /**
     * 拍卖者注册
     *
     * @return
     */
    @GetMapping("/auctioneerRegister")
    public String auctioneerRegister() {
        return "home/index/auctionerr_register";
    }

    /**
     * 登录页面
     *
     * @param model
     * @return
     */
    @GetMapping("/login")
    public String login(Model model) {
        return "home/index/login";
    }

    /**
     * 登录操作
     *
     * @param account
     * @return
     */
    @ResponseBody
    @PostMapping("/login")
    public Result<Boolean> login(Account account) {
        if (account == null) {
            return Result.error(CodeMsg.HOME_ACCOUNT_LOGIN_ERROR);
        }
        if (account.getUsername() == null) {
            return Result.error(CodeMsg.HOME_ACCOUNT_USERNAME_ERROR);
        }
        Account byUsername = accountService.findByUsername(account.getUsername());
        if (byUsername == null) {
            return Result.error(CodeMsg.HOME_ACCOUNT_NOT_EXIST_ERROR);
        }
        if (!byUsername.getPassword().equals(account.getPassword())) {
            return Result.error(CodeMsg.HOME_ACCOUNT_PASSWORD_ERROR);
        }
        if (byUsername.getStatus() == Account.HOME_ACCOUNT_STATUS_UNABLE) {
            return Result.error(CodeMsg.HOME_ACCOUNT_STATUS_ERROR);
        }
        SessionUtil.set(SessionConstant.SESSION_HOME_USER_LOGIN_KEY, byUsername);
        return Result.success(true);
    }

    /**
     * 注册用户操作
     *
     * @param account
     * @return
     */
    @ResponseBody
    @PostMapping("/register")
    public Result<Boolean> register(Account account) {
        //用统一验证实体方法验证是否合法
        CodeMsg validate = ValidateEntityUtil.validate(account);
        if (validate.getCode() != CodeMsg.SUCCESS.getCode()) {
            return Result.error(validate);
        }
        //验证邮箱
        if (!StringUtil.emailFormat(account.getEmail())) {
            return Result.error(CodeMsg.HOME_ACCOUNT_EMAIL_ERROR);
        }
        //验证手机号
        if (!StringUtil.isMobile(account.getMobile())) {
            return Result.error(CodeMsg.HOME_ACCOUNT_PHONE_ERROR);
        }
        Account byUsername = accountService.findByUsername(account.getUsername());
        if (byUsername != null) {
            return Result.error(CodeMsg.HOME_ACCOUNT_USERNAME_EXIST);
        }
        account.setBalance(BigDecimal.ZERO);
        //到这说明一切符合条件，进行数据库新增
        if (accountService.save(account) == null) {
            return Result.error(CodeMsg.HOME_ACCOUNT_ADD_ERROR);
        }
        operaterLogService.add("注册用户成功，用户名：" + account.getUsername());
        return Result.success(true);
    }

    /**
     * 根据分类Id获取最近3条数据
     *
     * @param cid
     * @return
     */
    @GetMapping("/category_top3")
    public String categoryTop3(@RequestParam(name = "id") Long cid, Model model) {
        List<BiddingProject> biddingProjects = projectService.findTop3ByProjectCategoryIdOrderByCreateTime(cid);
        model.addAttribute("top3Project", biddingProjects);
        return "/home/index/project_category";
    }

    /**
     * 前台注销
     *
     * @return
     */
    @GetMapping("/logout")
    public String logout() {
        Account account = SessionUtil.getAccount();
        if (account != null) {
            SessionUtil.set(SessionConstant.SESSION_HOME_USER_LOGIN_KEY, null);
        }
        return "redirect:index";
    }

    /**
     * 忘记密码操作
     *
     * @param account
     * @return
     */
    @ResponseBody
    @PostMapping("/forget_password")
    public Result<Boolean> forgetPassword(Account account) {
        if (!StringUtil.isMobile(account.getMobile())) {
            return Result.error(CodeMsg.COMMON_PHONE_FORMAET_ERROR);
        }
        if (!StringUtil.emailFormat(account.getEmail())) {
            return Result.error(CodeMsg.HOME_ACCOUNT_EMAIL_ERROR);
        }
        String password = account.getPassword();
        if (StringUtils.isEmpty(password)) {
            return Result.error(CodeMsg.ADMIN_PASSWORD_EMPTY);
        }
        if (password.length() < 4) {
            return Result.error(CodeMsg.PASSWORD_MIN_LENGTH_ERROR);
        }
        if (password.length() > 32) {
            return Result.error(CodeMsg.PASSWORD_MAX_LENGTH_ERROR);
        }
        Account byEmailAndMobile = accountService.findByEmailAndMobile(account.getEmail(), account.getMobile());
        if (byEmailAndMobile == null) {
            return Result.error(CodeMsg.ADMIN_USE_NO_EXIST);
        }
        if (accountService.updatePassword(password, byEmailAndMobile.getId()) <= 0) {
            return Result.error(CodeMsg.ACCOUNT_PASSWORD_EDIT_ERROR);
        }
        return Result.success(true);
    }


    /**
     * 个人中心
     *
     * @return
     */
    @GetMapping("/profile")
    public String profile(Model model) {
        Account account = SessionUtil.getAccount();
        if (account == null) {
            model.addAttribute("msg", "会话失效或未登录,请登录！");
            return "error/404";
        }
        model.addAttribute("activeType", "profile");
        model.addAttribute("account", account);
        return "home/personal/profile";
    }


    /**
     * 头像上传
     *
     * @param photo
     * @return
     */
    @RequestMapping(value = "/upload_head", method = RequestMethod.POST)
    @ResponseBody
    public Result<String> uploadHead(@RequestParam(name = "upload_head", required = true) MultipartFile photo) {
        //判断文件类型是否是图片
        String originalFilename = photo.getOriginalFilename();
        //获取文件后缀
        String suffix = originalFilename.substring(originalFilename.lastIndexOf("."), originalFilename.length());
        if (!uploadPhotoSufix.contains(suffix.toLowerCase())) {
            return Result.error(CodeMsg.UPLOAD_PHOTO_SUFFIX_ERROR);
        }
        if (photo.getSize() / 1024 > uploadPhotoMaxSize) {
            CodeMsg codeMsg = CodeMsg.UPLOAD_PHOTO_ERROR;
            codeMsg.setMsg("图片大小不能超过" + (uploadPhotoMaxSize / 1024) + "M");
            return Result.error(codeMsg);
        }
        //准备保存文件
        File filePath = new File(uploadPhotoPath);
        if (!filePath.exists()) {
            //若不存在文件夹，则创建一个文件夹
            filePath.mkdir();
        }
        filePath = new File(uploadPhotoPath + "/" + StringUtil.getFormatterDate(new Date(), "yyyyMMdd"));
        //判断当天日期的文件夹是否存在，若不存在，则创建
        if (!filePath.exists()) {
            //若不存在文件夹，则创建一个文件夹
            filePath.mkdir();
        }
        String filename = StringUtil.getFormatterDate(new Date(), "yyyyMMdd") + "/" + System.currentTimeMillis() + suffix;
        try {
            photo.transferTo(new File(uploadPhotoPath + "/" + filename));
        } catch (IllegalStateException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        Account account = SessionUtil.getAccount();
        account.setHeadPic(filename);
        accountService.updateHeadPic(filename, account.getId());
        SessionUtil.set(SessionConstant.SESSION_HOME_USER_LOGIN_KEY, account);
        return Result.success(filename);
    }


    /**
     * 编辑个人信息
     *
     * @param account
     * @return
     */
    @ResponseBody
    @PostMapping("/edit_profile")
    public Result<Boolean> editProfile(Account account) {
        Account account1 = accountService.find(account.getId());
        if (account1 == null) {
            return Result.error(CodeMsg.HOME_ACCOUNT_NOT_EXIST_ERROR);
        }
        if (!StringUtil.emailFormat(account.getEmail())) {
            return Result.error(CodeMsg.HOME_ACCOUNT_EMAIL_ERROR);
        }
        if (!StringUtil.isMobile(account.getMobile())) {
            return Result.error(CodeMsg.HOME_ACCOUNT_PHONE_ERROR);
        }
        BeanUtils.copyProperties(account, account1, "id", "createTime", "updateTIme", "username", "password", "status", "headPic", "balance", "creditScore");
        if (accountService.save(account1) == null) {
            return Result.error(CodeMsg.ADMIN_ACCOUNT_EDIT_PROFILE_ERROR);
        }
        SessionUtil.set(SessionConstant.SESSION_HOME_USER_LOGIN_KEY, account1);
        return Result.success(true);
    }

    /**
     * 修改密码
     *
     * @param oldPassword
     * @param newPassword
     * @return
     */
    @ResponseBody
    @PostMapping("/edit_password")
    public Result<Boolean> editPassword(@RequestParam(name = "oldPassword") String oldPassword, @RequestParam(name = "newPassword") String newPassword) {
        Account account = SessionUtil.getAccount();
        if (StringUtils.isEmpty(oldPassword)) {
            return Result.error(CodeMsg.ADMIN_PASSWORD_EMPTY);
        }
        //验证旧密码
        if (!account.getPassword().equals(oldPassword)) {
            return Result.error(CodeMsg.HOME_ACCOUNT_OLDPASSWORD_ERROR);
        }
        if (StringUtils.isEmpty(newPassword)) {
            return Result.error(CodeMsg.ADMIN_PASSWORD_EMPTY);
        }
        if (newPassword.length() < 4) {
            return Result.error(CodeMsg.PASSWORD_MIN_LENGTH_ERROR);
        }
        if (newPassword.length() > 32) {
            return Result.error(CodeMsg.PASSWORD_MAX_LENGTH_ERROR);
        }
        if (accountService.updatePassword(newPassword, account.getId()) <= 0) {
            return Result.error(CodeMsg.ACCOUNT_PASSWORD_EDIT_ERROR);
        }
        account.setPassword(newPassword);
        SessionUtil.set(SessionConstant.SESSION_HOME_USER_LOGIN_KEY, account);
        return Result.success(true);
    }


    /**
     * 充值中心列表
     *
     * @param model
     * @return
     */
    @GetMapping("/recharge")
    public String recharge(Model model, RechargeRecord rechargeRecord, PageBean<RechargeRecord> pageBean) {
        Account account = SessionUtil.getAccount();
        rechargeRecord.setAccount(account);
        model.addAttribute("pageBean", rechargeRecordService.findList(rechargeRecord, pageBean));
        return "home/personal/recharge";
    }


    /**
     * 充值金额操作
     *
     * @param balance
     * @return
     */
    @ResponseBody
    @PostMapping("/confirm_recharge")
    public Result<Boolean> confirmRecharge(@RequestParam(name = "balance", required = true) BigDecimal balance) {
        if (balance.compareTo(BigDecimal.ZERO) == -1 || balance.compareTo(BigDecimal.ZERO) == 0) {
            return Result.error(CodeMsg.HOME_ACCOUNT_PROFILE_RECHARGE_BALANCE_ERROR);
        }
        Account account = SessionUtil.getAccount();
        BigDecimal currentBalance = account.getBalance();
        BigDecimal add = currentBalance.add(balance);
        if (accountService.updateBalance(add, account.getId()) <= 0) {
            return Result.error(CodeMsg.HOME_ACCOUNT_PROFILE_RECHARGE_ERROR);
        }
        RechargeRecord rechargeRecord = new RechargeRecord();
        rechargeRecord.setAccount(account);
        rechargeRecord.setMoney(balance.intValue());
        if (rechargeRecordService.save(rechargeRecord) == null) {
            return Result.error(CodeMsg.HOME_ACCOUNT_PROFILE_RECHAREGE_RECORD_ADD_ERROR);
        }
        account.setBalance(add);
        SessionUtil.set(SessionConstant.SESSION_HOME_USER_LOGIN_KEY, account);
        return Result.success(true);
    }


    /**
     * 确认支付操作
     *
     * @param pid
     * @return
     */
    @ResponseBody
    @PostMapping("/payment")
    public Result<Boolean> thePayment(@RequestParam(name = "id") Long pid) {
        BiddingRecord biddingRecord = biddingRecordService.find(pid);
        if (biddingRecord == null) {
            return Result.error(CodeMsg.ADMIN_PROJECT_BIDDINGRECORD_NOT_EXIST);
        }
        Account account = SessionUtil.getAccount();
        int bid = biddingRecord.getBid();
        BigDecimal balance = account.getBalance();
        //用余额减去竞价价格
        BigDecimal bids = new BigDecimal(bid);
        BigDecimal subtract = balance.subtract(bids);
        if (subtract.compareTo(BigDecimal.ZERO) == -1) {
            return Result.error(CodeMsg.HOME_ACCOUNT_PROFILE_RECORD_PAYMENT_ERROR);
        }
        //更新竞价记录状态和用户余额
        return biddingRecordService.updateBalanceAndRecordStatus(biddingRecord, account, subtract);
    }

    /**
     * 用户评价商品操作
     *
     * @param score
     * @param content
     * @return
     */
    @ResponseBody
    @PostMapping("/evaluate_save")
    public Result<Boolean> evaluateSave(@RequestParam(name = "score") Double score, @RequestParam(name = "content") String content, @RequestParam(name = "recordId") Long recordId) {
        Account account = SessionUtil.getAccount();
        BiddingRecord biddingRecord = biddingRecordService.find(recordId);
        BiddingProject biddingProject = biddingRecord.getBiddingProject();
        Organization organization = biddingProject.getOrganization();
        ProjectEvaluate projectEvaluate = new ProjectEvaluate();
        projectEvaluate.setAccount(account);
        projectEvaluate.setBiddingProject(biddingProject);
        projectEvaluate.setRate(score.intValue());
        projectEvaluate.setContent(content);
        if (projectEvaluateService.save(projectEvaluate) == null) {
            return Result.error(CodeMsg.HOME_ACCOUNT_PROJECT_EVALUATE_ADD_ERROR);
        }
        //更新竞价记录的状态
        if (biddingRecordService.updateBiddingStatus(biddingRecord.getId(), BiddingRecord.BIDDING_STATUS_EVALUATED) <= 0) {
            return Result.error(CodeMsg.ADMIN_ORGANIZATION_STATUS_EDIT_ERROR);
        }
        //更新拍卖者的信用分
        organization.setRate(score);
        if (organizationService.updateRate(organization) <= 0) {
            return Result.error(CodeMsg.HOME_ORGANIZATION_RATE_ADD_ERROR);
        }
        //更新商品的评分和评论人
        biddingProject.setRate(biddingProject.getRate() + score);
        projectService.updateProjectRate(biddingProject.getRate(), biddingProject.getId());
        return Result.success(true);
    }
}
