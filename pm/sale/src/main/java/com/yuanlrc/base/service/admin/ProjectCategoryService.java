package com.yuanlrc.base.service.admin;

import com.yuanlrc.base.bean.CategoryStatus;
import com.yuanlrc.base.bean.PageBean;
import com.yuanlrc.base.dao.admin.ProjectCategoryDao;
import com.yuanlrc.base.entity.common.ProjectCategory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.*;
import org.springframework.data.domain.ExampleMatcher.GenericPropertyMatchers;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 项目分类管理service
 *
 * @author Administrator
 */
@Service
public class ProjectCategoryService {

    @Autowired
    private ProjectCategoryDao projectCategoryDao;

    /**
     * 根据分类id查询
     *
     * @param id
     * @return
     */
    public ProjectCategory find(Long id) {
        return projectCategoryDao.find(id);
    }

    /**
     * 按照分类名查找分类
     * @param name
     * @return
     */
    public ProjectCategory findByName(String name) {
        return projectCategoryDao.findByName(name);
    }

    /**
     * 查询所有的分类
     * @return
     */
    public List<ProjectCategory>findAll(){
        return projectCategoryDao.findAll();
    }

    /**
     * 项目分类添加/编辑操作
     *
     * @param
     * @return
     */
    public ProjectCategory save(ProjectCategory projectCategory) {
        return projectCategoryDao.save(projectCategory);
    }

    /**
     * 分页查询分类列表
     *
     * @param projectCategory
     * @param pageBean
     * @return
     */
    public PageBean<ProjectCategory> findList(ProjectCategory projectCategory, PageBean<ProjectCategory> pageBean) {
        ExampleMatcher withMatcher = ExampleMatcher.matching().withMatcher("name", GenericPropertyMatchers.contains());
        withMatcher = withMatcher.withIgnorePaths("status");
        Example<ProjectCategory> example = Example.of(projectCategory, withMatcher);
        Pageable pageable = PageRequest.of(pageBean.getCurrentPage() - 1, pageBean.getPageSize());
        Page<ProjectCategory> findAll = projectCategoryDao.findAll(example, pageable);
        pageBean.setContent(findAll.getContent());
        pageBean.setTotal(findAll.getTotalElements());
        pageBean.setTotalPage(findAll.getTotalPages());
        return pageBean;
    }

    /**
     * 判断名称是否存在，添加和编辑均可判断
     *
     * @param name
     * @param id
     * @return
     */
    public boolean isExistUsername(String name, Long id) {
        ProjectCategory byName = projectCategoryDao.findByName(name);
        if (byName != null) {
            if (byName.getId().longValue() != id.longValue()) {
                return true;
            }
        }
        return false;
    }

    /**
     * 按照分类id删除
     *
     * @param id
     */
    public void delete(Long id) {
        projectCategoryDao.deleteById(id);
    }

    /**
     * 返回分类总数
     *
     * @return
     */
    public long total() {
        return projectCategoryDao.count();
    }

    /**
     * 根据状态查询分类列表
     * @param status
     * @return
     */
    public List<ProjectCategory> findByStatus(CategoryStatus status){
        return projectCategoryDao.findByStatus(status);
    }


  	/**
     * 查询top4的分类列表
     * @param status
     * @return
     */
    public List<ProjectCategory> findTop6ByStatusOrderByCreateTime(CategoryStatus status){
        return projectCategoryDao.findTop6ByStatusOrderByCreateTime(status);
    }
}
