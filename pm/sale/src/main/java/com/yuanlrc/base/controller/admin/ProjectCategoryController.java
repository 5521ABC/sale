package com.yuanlrc.base.controller.admin;

import com.yuanlrc.base.bean.CategoryStatus;
import com.yuanlrc.base.bean.CodeMsg;
import com.yuanlrc.base.bean.PageBean;
import com.yuanlrc.base.bean.Result;
import com.yuanlrc.base.entity.common.ProjectCategory;
import com.yuanlrc.base.service.admin.OperaterLogService;
import com.yuanlrc.base.service.admin.ProjectCategoryService;
import com.yuanlrc.base.util.ValidateEntityUtil;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

/**
 * 后台项目分类控制器
 *
 * @author Administrator
 */
@RequestMapping("/admin/project_category")
@Controller
public class ProjectCategoryController {

    @Autowired
    private ProjectCategoryService projectCategoryService;

    @Autowired
    private OperaterLogService operaterLogService;
    /**
     * 项目分类列表
     * @param model
     * @param projectCategory
     * @param pageBean
     * @return
     */
    @GetMapping("/list")
    public String list(Model model, ProjectCategory projectCategory, PageBean<ProjectCategory> pageBean){
        model.addAttribute("title", "商品分类列表");
        model.addAttribute("name",projectCategory.getName());
        model.addAttribute("pageBean", projectCategoryService.findList(projectCategory, pageBean));
        return "admin/project_category/list";
    }


    /**
     * 项目分类添加
     * @param model
     * @return
     */
    @GetMapping("/add")
    public String add(Model model){
        model.addAttribute("categoryList",CategoryStatus.values());
        return "admin/project_category/add";
    }

    /**
     * 项目分类添加操作
     * @param projectCategory
     * @return
     */
    @ResponseBody
    @PostMapping("/add")
    public Result<Boolean> add(ProjectCategory projectCategory){
        CodeMsg validate = ValidateEntityUtil.validate(projectCategory);
        if(validate.getCode() != CodeMsg.SUCCESS.getCode()){
            return Result.error(validate);
        }
        ProjectCategory byName = projectCategoryService.findByName(projectCategory.getName());
        if(byName!=null){
            return Result.error(CodeMsg.ADMIN_PROJECT_CATEGORY_NAME_EXIST);
        }

        //一切顺利添加到数据库
        if(projectCategoryService.save(projectCategory)==null){
            return Result.error(CodeMsg.ADMIN_PROJECT_CATEGORY_ADD_ERROR);
        }
        operaterLogService.add("添加项目分类，分类名：" + projectCategory.getName());
        return Result.success(true);
    }

    /**
     * 项目分类编辑页面
     * @param id
     * @param model
     * @return
     */
    @GetMapping("/edit")
    public String edit(@RequestParam(name = "id",required = true)Long id,Model model){
        ProjectCategory projectCategory = projectCategoryService.find(id);
        model.addAttribute("projectCategory",projectCategory);
        model.addAttribute("categoryList",CategoryStatus.values());
        return "admin/project_category/edit";
    }

    /**
     * 项目分类编辑操作
     * @param projectCategory
     * @return
     */
    @ResponseBody
    @PostMapping("/edit")
    public Result<Boolean> edit(ProjectCategory projectCategory){
        CodeMsg validate = ValidateEntityUtil.validate(projectCategory);
        if(validate.getCode() != CodeMsg.SUCCESS.getCode()){
            return Result.error(validate);
        }
        //查找是否项目分类名称已存在
        if(projectCategoryService.isExistUsername(projectCategory.getName(), projectCategory.getId())){
            return Result.error(CodeMsg.ADMIN_PROJECT_CATEGORY_NAME_EXIST);
        }
        //根据Id查询
        ProjectCategory projectCategory1 = projectCategoryService.find(projectCategory.getId());
        if(projectCategory1==null){
            return Result.error(CodeMsg.ADMIN_PROJECT_CATEGORY_EXIST_ERROR);
        }
        BeanUtils.copyProperties(projectCategory,projectCategory1,"id","createTime","updateTime");
        if(projectCategoryService.save(projectCategory1)==null){
            return Result.error(CodeMsg.ADMIN_PROJECT_CATEGORY_EDIT_ERROR);
        }
        operaterLogService.add("编辑项目分类，分类名：" + projectCategory1.getName());
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
            projectCategoryService.delete(id);
        } catch (Exception e) {
            return Result.error(CodeMsg.ADMIN_PROJECT_CATEGORY_DELETE_ERROR);
        }
        operaterLogService.add("删除分类Id，分类ID：" + id);
        return Result.success(true);
    }

}
