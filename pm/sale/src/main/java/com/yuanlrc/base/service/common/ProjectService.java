package com.yuanlrc.base.service.common;

import com.yuanlrc.base.bean.PageBean;
import com.yuanlrc.base.bean.ProjectStatus;
import com.yuanlrc.base.dao.common.ProjectDao;
import com.yuanlrc.base.entity.common.BiddingProject;
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
import java.util.Date;
import java.util.List;

/**
 * 商品项目管理service
 *
 * @author Administrator
 */
@Service
public class ProjectService {

    @Autowired
    private ProjectDao projectDao;

    /**
     * 根据商品id查询
     *
     * @param id
     * @return
     */
    public BiddingProject find(Long id) {
        return projectDao.find(id);
    }

    /**
     * 按照商品名称查找商品
     *
     * @param name
     * @return
     */
    public BiddingProject findByName(String name) {
        return projectDao.findByName(name);
    }

    /**
     * 商品项目添加/编辑操作
     *
     * @param
     * @return
     */
    public BiddingProject save(BiddingProject biddingProject) {
        return projectDao.save(biddingProject);
    }

    /**
     * 分页查询商品项目列表
     *
     * @param biddingProject
     * @param pageBean
     * @return
     */
      public PageBean<BiddingProject> findList(BiddingProject biddingProject, PageBean<BiddingProject> pageBean) {
            Specification<BiddingProject> specification = new Specification<BiddingProject>() {
                private static final long serialVersionUID = 1L;
                @Override
                public Predicate toPredicate(Root root, CriteriaQuery criteriaQuery, CriteriaBuilder criteriaBuilder) {
                    Predicate predicate = criteriaBuilder.like(root.get("name"), "%" + (biddingProject.getName() == null ? "" : biddingProject.getName() + "%"));
                    if (biddingProject.getOrganization() != null) {
                        Predicate equal = criteriaBuilder.equal(root.get("organization"), biddingProject.getOrganization().getId());
                        predicate = criteriaBuilder.and(predicate, equal);
                    }
                    if(biddingProject.getOrganization()==null){
                        if (biddingProject.getProjectStatus() == ProjectStatus.REVIEWED) {
                            Predicate equal2 = criteriaBuilder.equal(root.get("projectStatus"), biddingProject.getProjectStatus().code);
                            predicate = criteriaBuilder.and(predicate, equal2);
                        }
                        if (biddingProject.getProjectStatus() == ProjectStatus.INPUBLIC) {
                            Predicate equal3 = criteriaBuilder.equal(root.get("projectStatus"), biddingProject.getProjectStatus().code);
                            predicate = criteriaBuilder.and(predicate, equal3);
                        }
                    }
                    if(biddingProject.getProjectCategory()!=null && biddingProject.getProjectCategory().getId()!=-1){
                        Predicate category = criteriaBuilder.equal(root.get("projectCategory"), biddingProject.getProjectCategory().getId());
                        predicate = criteriaBuilder.and(predicate, category);
                    }
                    return predicate;
                }
            };
            Sort sort = Sort.by(Sort.Direction.DESC, "createTime");
            Pageable pageable = PageRequest.of(pageBean.getCurrentPage() - 1, pageBean.getPageSize(), sort);
            Page<BiddingProject> findAll = projectDao.findAll(specification, pageable);
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
        BiddingProject byName = projectDao.findByName(name);
        if (byName != null) {
            if (byName.getId().longValue() != id.longValue()) {
                return true;
            }
        }
        return false;
    }

    /**
     * 按照商品id删除
     *
     * @param id
     */
    public void delete(Long id) {
        projectDao.deleteById(id);
    }

    /**
     * 返回商品总数
     *
     * @return
     */
    public long total() {
        return projectDao.count();
    }

    /**
     * 商品审核
     * @param biddingProject
     * @return
     */
    public int projectExamine(BiddingProject biddingProject){
        return projectDao.projectExamine(biddingProject);
    }

    /**
     * 首页4条
     * @param projectStatus
     * @return
     */
    public List<BiddingProject> findTop3ByProjectStatusAndProjectStatusOrderByCreateTimeDesc(ProjectStatus projectStatus,ProjectStatus projectState){
        return projectDao.findTop3ByProjectStatusAndProjectStatusOrderByCreateTimeDesc(projectStatus,projectState);
    }

    /**
     * 根据分类获取最近3条数据
     * @param cid
     * @return
     */
    public List<BiddingProject>findTop3ByProjectCategoryIdOrderByCreateTime(Long cid){
        return projectDao.findTop3ByProjectCategoryIdOrderByCreateTimeDesc(cid);
    }


    /**
     * 前台分页查询商品项目列表
     * @param biddingProject
     * @param pageBean
     * @return
     */
    public PageBean<BiddingProject> homeFindList(BiddingProject biddingProject, PageBean<BiddingProject> pageBean) {
        Specification<BiddingProject> specification = new Specification<BiddingProject>() {
            private static final long serialVersionUID = 1L;
            @Override
            public Predicate toPredicate(Root root, CriteriaQuery criteriaQuery, CriteriaBuilder criteriaBuilder) {
                Predicate predicate = criteriaBuilder.like(root.get("name"), biddingProject.getName() == null ? "%%" : "%" + biddingProject.getName() + "%");
                if(biddingProject.getProjectStatus()!=ProjectStatus.NOSELECTED && biddingProject.getProjectStatus()!=ProjectStatus.REVIEWED){
                    predicate= criteriaBuilder.equal(root.get("projectStatus"), biddingProject.getProjectStatus());
                }else{
                    predicate= activeStatus(criteriaBuilder, root, predicate);
                }
                if(biddingProject.getProjectCategory()!=null){
                    if(biddingProject.getProjectCategory().getId()!=-1){
                        Predicate equal = criteriaBuilder.equal(root.get("projectCategory"), biddingProject.getProjectCategory().getId());
                        predicate=criteriaBuilder.and(predicate,equal);
                    }
                }
                return predicate;
            }
        };
        Sort sort = Sort.by(Sort.Direction.DESC, "createTime");
        Pageable pageable = PageRequest.of(pageBean.getCurrentPage() - 1, pageBean.getPageSize(), sort);
        Page<BiddingProject> findAll = projectDao.findAll(specification, pageable);
        pageBean.setContent(findAll.getContent());
        pageBean.setTotal(findAll.getTotalElements());
        pageBean.setTotalPage(findAll.getTotalPages());
        return pageBean;
    }

    //获取项目可用状态
    public Predicate activeStatus(CriteriaBuilder criteriaBuilder, Root root, Predicate predicate) {
        //发布中
        Predicate status = criteriaBuilder.equal(root.get("projectStatus"), ProjectStatus.RELEASE.code);

        //公示中
        Predicate status3 = criteriaBuilder.equal(root.get("projectStatus"), ProjectStatus.INPUBLIC.code);

        //即将开始竞拍
        Predicate status4 = criteriaBuilder.equal(root.get("projectStatus"), ProjectStatus.AUCTIONSOON.code);

        //报名中
        Predicate status5 = criteriaBuilder.equal(root.get("projectStatus"), ProjectStatus.REGISTERING.code);

        //结束
        Predicate status6 = criteriaBuilder.equal(root.get("projectStatus"), ProjectStatus.ENDBIDDING.getCode());

        //竞价中
        Predicate status2 = criteriaBuilder.equal(root.get("projectStatus"), ProjectStatus.BIDDING.getCode());

        status = criteriaBuilder.or(status, status2, status3, status4, status5,status6);
        predicate = criteriaBuilder.and(predicate, status);
        return predicate;
    }
    /**
     * 获取最新的4条商品
     * @return
     */
    public List<BiddingProject> findTop4ByProjectStatusOrderByCreateTime(){
        return projectDao.findTop4ByProjectStatusOrderByCreateTime();
    }

    /**
     * 根据状态发布中中和竞拍中,报名中查找项目
     *
     * @param release
     * @param bidding
     * @return
     */
    public List<BiddingProject> findByProjectStatusOrProjectStatus(ProjectStatus release, ProjectStatus bidding,ProjectStatus signUp) {
        return projectDao.findByProjectStatusOrProjectStatusOrProjectStatus(release, bidding,signUp);
    }

    /**
     * 更新项目状态
     * @param id
     * @param status
     * @return
     */
    public int updateStatus(Long id, int status) {
        return projectDao.updateStatus(id, status);
    }

    public BiddingProject status(BiddingProject biddingProject, Date date) {
        if (biddingProject.getProjectStatus() != ProjectStatus.ENDBIDDING && biddingProject.getProjectStatus() != ProjectStatus.SUCCESSFULBIDDING && biddingProject.getProjectStatus() != ProjectStatus.CLOSED) {
            //计算距离开始时间
            if (biddingProject.getProjectStatus() != ProjectStatus.BIDDING) {
                //报名开始
                Date startTime = biddingProject.getStartTime();
                //竞拍开始时间
                Date startDate = biddingProject.getBiddingStartTime();
                Date endDate = biddingProject.getBiddingEndTime();
                if (startTime.getTime() <= date.getTime() && date.getTime() <= biddingProject.getEndTime().getTime()) {
                    biddingProject.setProjectStatus(ProjectStatus.REGISTERING);
                } else if (startDate.getTime() > date.getTime() && date.getTime() <endDate.getTime()) {
                    biddingProject.setProjectStatus(ProjectStatus.AUCTIONSOON);
                }else if(startTime.getTime()<date.getTime()&&date.getTime()<endDate.getTime()){
                    biddingProject.setProjectStatus(ProjectStatus.RELEASE);
                }else {
                    biddingProject.setProjectStatus(ProjectStatus.ENDBIDDING);
                }
            }
        }
        return biddingProject;
    }

    /**
     * 更新浏览量
     *
     * @param viewsNumber
     * @param id
     * @return
     */
    public int updateViewsNumber(int viewsNumber, Long id) {
        return projectDao.updateViewsNumber(viewsNumber, id);
    }

    /**
     * 更新项目竞拍次数
     * @param auctionTimes
     * @param id
     * @return
     */
    public int updateAuctionTimes(int auctionTimes,Long id){
        return projectDao.updateAuctionTimes(auctionTimes,id);
    }
    /**
     * 更新项目最高价
     * @param maxMoney
     * @param id
     * @return
     */
    public int updateMaxMoney(int maxMoney,Long id){
        return projectDao.updateMaxMoney(maxMoney,id);
    }
    /**
     * 根据项目Id更新报名人数
     *
     * @param applicantsNumber
     * @param id
     * @return
     */
    public int updateApplicantsNumber(int applicantsNumber, Long id) {
        return projectDao.updateApplicantsNumber(applicantsNumber, id);
    }

    /**
     * 更新评分
     * @param rate
     * @param id
     * @return
     */
    public int updateProjectRate(Double rate,Long id){
        return projectDao.updateProjectRate(rate,id);
    }
}
