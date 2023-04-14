
package com.yuanlrc.base.service.home;

import com.yuanlrc.base.bean.PageBean;
import com.yuanlrc.base.dao.home.ProjectEvaluateDao;
import com.yuanlrc.base.entity.home.ProjectEvaluate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import java.util.List;

/**
 * 商品评论Service
 */
@Service
public class ProjectEvaluateService {

    @Autowired
    private ProjectEvaluateDao projectEvaluateDao;



    /**
     * 添加保存
     * @param projectEvaluate
     * @return
     */
    public ProjectEvaluate save(ProjectEvaluate projectEvaluate) {
        return projectEvaluateDao.save(projectEvaluate);
    }

    /**
     * 根据id查询
     *
     * @param id
     * @return
     */
    public ProjectEvaluate find(Long id) {
        return projectEvaluateDao.find(id);
    }


    /**
     * 评价列表分页查询
     * @param projectEvaluate
     * @param pageBean
     * @return
     */
    public PageBean<ProjectEvaluate> findList(ProjectEvaluate projectEvaluate, PageBean<ProjectEvaluate> pageBean){
        Specification<ProjectEvaluate> specification = new Specification<ProjectEvaluate>() {
            @Override
            public Predicate toPredicate(Root root, CriteriaQuery criteriaQuery, CriteriaBuilder criteriaBuilder) {
                Predicate predicate = criteriaBuilder.equal(root.get("biddingProject"), projectEvaluate.getBiddingProject().getId());
                return predicate;
            }
        };
        Sort sort = Sort.by(Sort.Direction.DESC, "createTime");
        Pageable pageable = PageRequest.of(pageBean.getCurrentPage() - 1, pageBean.getPageSize(),sort);
        Page<ProjectEvaluate> findAll = projectEvaluateDao.findAll(specification, pageable);
        pageBean.setContent(findAll.getContent());
        pageBean.setTotal(findAll.getTotalElements());
        pageBean.setTotalPage(findAll.getTotalPages());
        return pageBean;
    }
    /**
     * 根据项目id查询商品评论列表
     * @param projectId
     * @return
     */
    public List<ProjectEvaluate> findByBiddingProjectId(Long projectId){
        return projectEvaluateDao.findByBiddingProjectId(projectId);
    }
    /**
     * 根据id更新回复内容
     * @param id
     * @param replay
     * @return
     */
   public int updateReplay(Long id,String replay){
       return projectEvaluateDao.updateReplay(id,replay);
   }
}

