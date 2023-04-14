package com.yuanlrc.base.controller.common;

import com.yuanlrc.base.bean.*;
import com.yuanlrc.base.entity.common.BiddingProject;
import com.yuanlrc.base.entity.common.Organization;
import com.yuanlrc.base.entity.common.ProjectCategory;
import com.yuanlrc.base.entity.home.BiddingApply;
import com.yuanlrc.base.entity.home.ProjectEvaluate;
import com.yuanlrc.base.service.admin.OperaterLogService;
import com.yuanlrc.base.service.admin.ProjectCategoryService;
import com.yuanlrc.base.service.common.ProjectService;
import com.yuanlrc.base.service.home.BiddingApplyService;
import com.yuanlrc.base.service.home.ProjectEvaluateService;
import com.yuanlrc.base.util.SessionUtil;
import com.yuanlrc.base.util.StringUtil;
import com.yuanlrc.base.util.ValidateEntityUtil;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.List;

/**
 * 竞拍商品控制器
 *
 * @author Administrator
 */
@RequestMapping("/admin/project")
@Controller
public class ProjectController {

    @Autowired
    private ProjectService projectService;

    @Autowired
    private OperaterLogService operaterLogService;

    @Autowired
    private ProjectCategoryService projectCategoryService;

    @Autowired
    private BiddingApplyService biddingApplyService;

    @Autowired
    private ProjectEvaluateService projectEvaluateService;
    /**
     * 商品列表
     * @param model
     * @param biddingProject
     * @param pageBean
     * @return
     */
    @GetMapping("/list")
    public String list(Model model, BiddingProject biddingProject, PageBean<BiddingProject> pageBean){
        int type = (int) SessionUtil.get("type");
        if(type==LoginType.ORGANIZATION.getCode()){
            Organization oraganization = SessionUtil.getOraganization();
            biddingProject.setOrganization(oraganization);
        }else{
            biddingProject.setProjectStatus(ProjectStatus.REVIEWED);
        }
        model.addAttribute("title", "商品项目列表");
        model.addAttribute("name",biddingProject.getName()==null?"":biddingProject.getName());
        model.addAttribute("currentCategory",biddingProject.getProjectCategory()==null?-1:biddingProject.getProjectCategory().getId());
        model.addAttribute("pageBean", projectService.findList(biddingProject, pageBean));
        model.addAttribute("categoryList",projectCategoryService.findAll());
        return "admin/project/list";
    }

    /**
     * 商品添加
     * @param model
     * @return
     */
    @GetMapping("/add")
    public String add(Model model){
        List<ProjectCategory> projectCategoryList = projectCategoryService.findByStatus(CategoryStatus.AVAILABLE);
        model.addAttribute("projectCategoryList",projectCategoryList);
        return "admin/project/add";
    }

    /**
     * 商品添加操作
     * @param biddingProject
     * @return
     */
    @ResponseBody
    @PostMapping("/add")
    public Result<Boolean> add(BiddingProject biddingProject){
        Organization loginedOrganization = SessionUtil.getOraganization();
        if (loginedOrganization == null) {
            return Result.error(CodeMsg.USER_SESSION_EXPIRED);
        }
        CodeMsg validate = ValidateEntityUtil.validate(biddingProject);
        if(validate.getCode() != CodeMsg.SUCCESS.getCode()){
            return Result.error(validate);
        }
        //报名日期比较
        if (!biddingProject.getStartTime().before(biddingProject.getEndTime())) {
            return Result.error(CodeMsg.ADMIN_BIDDING_PROJECT_SIGNUP_DATE_ERROR);
        }
        //竞拍日期比较
        if (!biddingProject.getBiddingStartTime().before(biddingProject.getBiddingEndTime())) {
            return Result.error(CodeMsg.ADMIN_BIDDING_PROJECT_BIDDING_DATE_ERROR);
        }
        //报名开始时间和竞拍结束时间比较
        if(!biddingProject.getStartTime().before(biddingProject.getBiddingEndTime())){
            return Result.error(CodeMsg.ADMIN_BIDDING_PROJECT_BIDDING_END_DATE_ERROR);
        }
        String projectNumber = StringUtil.gneerateSn("xm");
        biddingProject.setProjectNumber(projectNumber);
        biddingProject.setOrganization(loginedOrganization);
        String describes = biddingProject.getDescribes();
        biddingProject.setDescribes(describes.trim());
        //一切顺利添加到数据库
        if(projectService.save(biddingProject)==null){
            return Result.error(CodeMsg.ADMIN_PROJECT_SHOPING_ADD_ERROR);
        }
        operaterLogService.add("添加商品成功，商品名：" + biddingProject.getName());
        return Result.success(true);
    }


    /**
     * 商品编辑页面
     * @param id
     * @param model
     * @return
     */
    @GetMapping("/edit")
    public String editProject(@RequestParam("id")Long id,Model model){
        BiddingProject biddingProject = projectService.find(id);
        model.addAttribute("biddingProject",biddingProject);
        model.addAttribute("projectCategoryList",projectCategoryService.findByStatus(CategoryStatus.AVAILABLE));
        return "admin/project/edit";
    }


    /**
     * 编辑商品操作
     * @param biddingProject
     * @return
     */
    @ResponseBody
    @PostMapping("/edit")
    public Result<Boolean> edit(BiddingProject biddingProject){
        Long projectId = biddingProject.getId();
        BiddingProject currentProject = projectService.find(projectId);
        if(currentProject==null){
            return Result.error(CodeMsg.ADMIN_PROJECT_SHOPING_NOT_EXIST);
        }
        List<BiddingApply> byBiddingProjectId = biddingApplyService.findByBiddingProjectId(projectId);
        if(byBiddingProjectId.size()<0){
            return Result.error(CodeMsg.ADMIN_PROJECT_SHOPING_APPLY_ERROR);
        }
        //用统一验证实体方法验证是否合法
        CodeMsg validate = ValidateEntityUtil.validate(biddingProject);
        if (validate.getCode() != CodeMsg.SUCCESS.getCode()) {
            return Result.error(validate);
        }
        //报名时间和当前时间比较
        if(biddingProject.getStartTime().before(new Date())){
            return Result.error(CodeMsg.ADMIN_BIDDING_PROJECT_SIGNUP_TIME_ERROR);
        }
        //报名日期比较
        if (!biddingProject.getStartTime().before(biddingProject.getEndTime())) {
            return Result.error(CodeMsg.ADMIN_BIDDING_PROJECT_SIGNUP_DATE_ERROR);
        }
        //竞拍日期比较
        if (!biddingProject.getBiddingStartTime().before(biddingProject.getBiddingEndTime())) {
            return Result.error(CodeMsg.ADMIN_BIDDING_PROJECT_BIDDING_DATE_ERROR);
        }
        //竞拍日期和报名日期比较
        if(!biddingProject.getStartTime().before(biddingProject.getBiddingStartTime())){
            return Result.error(CodeMsg.ADMIN_BIDDING_PROJECT_BIDDING_SIGNUP_ERROR);
        }
        if(!biddingProject.getEndTime().before(biddingProject.getBiddingEndTime())){
            return Result.error(CodeMsg.ADMIN_BIDDING_PROJECT_BIDDING_SIGNUP_ERROR);
        }
        //报名开始时间和竞拍结束时间比较
        if(!biddingProject.getStartTime().before(biddingProject.getBiddingEndTime())){
            return Result.error(CodeMsg.ADMIN_BIDDING_PROJECT_BIDDING_END_DATE_ERROR);
        }
        String describes = biddingProject.getDescribes();
        biddingProject.setDescribes(describes.trim());
        BeanUtils.copyProperties(biddingProject, currentProject, "id", "createTime", "updateTime", "projectNumber", "transactionPrice", "applicantsNumber","auctionTimes","account","organization","rate","viewsNumber");
        if (projectService.save(currentProject) == null) {
            return Result.error(CodeMsg.ADMIN_BIDDING_PROJECT_EDIT_ERROR);
        }
        operaterLogService.add("编辑商品，商品名称：" + biddingProject.getName());
        return Result.success(true);
    }

    /**
     * 删除竞拍商品操作
     *
     * @param id
     * @return
     */
    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    @ResponseBody
    public Result<Boolean> delete(@RequestParam(name = "id", required = true) Long id) {
        try {
            projectService.delete(id);
        } catch (Exception e) {
            return Result.error(CodeMsg.ADMIN_BIDDING_PROJECT_DELETE_ERROR);
        }
        operaterLogService.add("删除竞拍商品,竞拍商品ID：" + id);
        return Result.success(true);
    }


    /**
     * 查看商品详情页面
     * @param id
     * @param model
     * @return
     */
    @GetMapping("/project_detail")
    public String projectDetail(@RequestParam("id")Long id,Model model){
        BiddingProject biddingProject = projectService.find(id);
        if (biddingProject == null) {
            model.addAttribute("msg", "不要搞破坏哦，乖!");
            return "/error/404";
        }
        model.addAttribute("biddingProject", biddingProject);
        return "/admin/project/project_detail";
    }

    /**
     * 管理员商品审核
     * @param type
     * @param id
     * @return
     */
    @ResponseBody
    @PostMapping("/examine")
    public Result<Boolean> approved(@RequestParam("type")String type,@RequestParam(name = "id")Long id,@RequestParam(name = "reason")String reason){
        BiddingProject biddingProject = projectService.find(id);
        if(biddingProject==null){
            return Result.error(CodeMsg.ADMIN_PROJECT_SHOPING_NOT_EXIST);
        }
        //表示同意
        if(type.equals("true")){
            if(!biddingProject.getStartTime().before(new Date())){
                biddingProject.setProjectStatus(ProjectStatus.RELEASE);
            }else{
                return Result.error(CodeMsg.ADMIN_BIDDING_PROJECT_SIN_TIME_ERROR);
            }
        }else if(type.equals("false")){
            //表示拒绝
            biddingProject.setProjectStatus(ProjectStatus.PASSAUDIT);
        }
        biddingProject.setReason(reason);
        if(projectService.projectExamine(biddingProject)<=0){
            return Result.error(CodeMsg.ADMIN_BIDDING_PROJECT_EXAMINE_ERROR);
        }
        return Result.success(true);
    }

    /**
     * 上下架操作
     * @param id
     * @param type
     * @return
     */
    @ResponseBody
    @PostMapping("/load_and_unload")
    public Result<Boolean> loadAndUnload(@RequestParam(name = "id")Long id,@RequestParam(name = "type")String type){
        BiddingProject biddingProject = projectService.find(id);
        if(biddingProject==null){
            return Result.error(CodeMsg.ADMIN_PROJECT_SHOPING_NOT_EXIST);
        }
        List<BiddingApply> byBiddingProjectId = biddingApplyService.findByBiddingProjectId(id);
        if(byBiddingProjectId.size()>0){
            return Result.error(CodeMsg.ADMIN_BIDDING_PROJECT_APPLY_ERROR);
        }
        if("load".equals(type)){
            //表示上架
            biddingProject.setProjectStatus(ProjectStatus.RELEASE);
        }else {
            //表示下架
            biddingProject.setProjectStatus(ProjectStatus.NOTSUBMIT);
        }
        if(projectService.projectExamine(biddingProject)<=0){
            if("load".equals(type)){
                return Result.error(CodeMsg.ADMIN_BIDDING_PROJECT_LOADING_ERROR);
            }else{
                return Result.error(CodeMsg.ADMIN_BIDDING_PROJECT_UNLOADING_ERROR);
            }
        }
        return Result.success(true);
    }

    /**
     * 商品的所有评论
     * @param projectEvaluate
     * @param pageBean
     * @param model
     * @return
     */
    @GetMapping("/view_raty")
    public String viewRaty(ProjectEvaluate projectEvaluate,PageBean<ProjectEvaluate>pageBean,Model model){
        model.addAttribute("pageBean",projectEvaluateService.findList(projectEvaluate, pageBean));
        model.addAttribute("title","商品评价列表");
        return "admin/project/project_raty_list";
    }

    /**
     * 评价回复操作
     * @param rid
     * @param content
     * @return
     */
    @ResponseBody
    @PostMapping("/view_raty")
    public Result<Boolean> saveReply(@RequestParam(name = "rid")Long rid,@RequestParam(name = "content")String content){
        ProjectEvaluate projectEvaluate = projectEvaluateService.find(rid);
        if(projectEvaluate==null){
            return Result.error(CodeMsg.HOME_ACCOUNT_PROJECT_EVALUATE_NOT_EXIST_ERROR);
        }
        if(projectEvaluateService.updateReplay(rid, content)<=0){
            return Result.error(CodeMsg.ADMIN_PROJECT_SHOPING_RATE_REPLY_ERROR);
        }
        return Result.success(true);
    }
}
