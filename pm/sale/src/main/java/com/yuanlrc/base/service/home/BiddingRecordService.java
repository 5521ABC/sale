package com.yuanlrc.base.service.home;

import com.yuanlrc.base.bean.*;
import com.yuanlrc.base.dao.admin.OrganizationDao;
import com.yuanlrc.base.dao.common.AccountDao;
import com.yuanlrc.base.dao.common.ProjectDao;
import com.yuanlrc.base.dao.home.BiddingApplyDao;
import com.yuanlrc.base.dao.home.BiddingRecordDao;
import com.yuanlrc.base.entity.common.Account;
import com.yuanlrc.base.entity.common.BiddingProject;
import com.yuanlrc.base.entity.home.BiddingRecord;
import com.yuanlrc.base.entity.home.ProjectTimeVO;
import com.yuanlrc.base.util.DateUtil;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;


@Service
public class BiddingRecordService {

    @Autowired
    private BiddingRecordDao biddingRecordDao;

    @Autowired
    private BiddingApplyDao biddingApplyDao;

    @Autowired
    private ProjectDao biddingProjectDao;

    @Autowired
    private AccountDao homeUserDao;

    @Autowired
    private OrganizationDao organizationDao;


    /**
     * 根据id查询
     *
     * @param id
     * @return
     */
    public BiddingRecord find(Long id) {
        return biddingRecordDao.find(id);
    }

    /**
     * 分页查询用户竞拍
     *
     * @param homeUserId
     * @param projectTimeVO
     * @param pageBean
     * @return
     */
    public PageBean<BiddingRecord> findList(Long homeUserId, ProjectTimeVO projectTimeVO, PageBean<BiddingRecord> pageBean, Integer biddingStatus) {
        Specification<BiddingRecord> specification = new Specification<BiddingRecord>() {
            private static final long serialVersionUID = 1L;

            @Override
            public Predicate toPredicate(Root<BiddingRecord> root,
                                         CriteriaQuery<?> criteriaQuery, CriteriaBuilder criteriaBuilder) {
                Predicate predicate = criteriaBuilder.equal(root.get("account"), homeUserId);
                Predicate status = criteriaBuilder.equal(root.get("biddingStatus"), biddingStatus);
                predicate = criteriaBuilder.and(predicate, status);
                if (!StringUtils.isEmpty(projectTimeVO.getStartTime())) {
                    Predicate start = greater(root, projectTimeVO.getStartTime(), "endTime", criteriaBuilder);
                    predicate = criteriaBuilder.and(predicate, start);
                }
                if (!StringUtils.isEmpty(projectTimeVO.getEndTime())) {
                    Predicate end = lessThan(root, projectTimeVO.getEndTime(), "startTime", criteriaBuilder);
                    predicate = criteriaBuilder.and(predicate, end);
                }
                if (!StringUtils.isEmpty(projectTimeVO.getBiddingStartTime())) {
                    Predicate biddingStart = greater(root, projectTimeVO.getBiddingStartTime(), "biddingEndTime", criteriaBuilder);
                    predicate = criteriaBuilder.and(predicate, biddingStart);
                }
                if (!StringUtils.isEmpty(projectTimeVO.getBiddingEndTime())) {
                    Predicate biddingEnd = lessThan(root, projectTimeVO.getBiddingEndTime(), "biddingStartTime", criteriaBuilder);
                    predicate = criteriaBuilder.and(predicate, biddingEnd);
                }
                if (projectTimeVO.getStatus() != -1) {
                    Predicate equal = criteriaBuilder.equal(root.get("biddingProject").get("projectStatus"), projectTimeVO.getStatus());
                    predicate = criteriaBuilder.and(predicate, equal);
                }
                return predicate;
            }
        };
        Sort sort = Sort.by(Sort.Direction.DESC, "updateTime");
        PageRequest pageable = PageRequest.of(pageBean.getCurrentPage() - 1, pageBean.getPageSize(), sort);
        Page<BiddingRecord> findAll = biddingRecordDao.findAll(specification, pageable);
        pageBean.setContent(findAll.getContent());
        pageBean.setTotal(findAll.getTotalElements());
        pageBean.setTotalPage(findAll.getTotalPages());
        return pageBean;
    }

    /**
     * 保存
     *
     * @param biddingRecord
     * @return
     */
    public BiddingRecord save(BiddingRecord biddingRecord) {
        return biddingRecordDao.save(biddingRecord);
    }


    /**
     * 根据项目id查找竞价列表
     *
     * @param projectId
     * @return
     */
    public List<BiddingRecord> findByBiddingProjectId(Long projectId) {
        return biddingRecordDao.findByBiddingProjectId(projectId);
    }



    public Predicate greater(Root root, String date, String attribute, CriteriaBuilder criteriaBuilder) {
        Date time = DateUtil.toDate(date);
        Predicate predicate = criteriaBuilder.greaterThanOrEqualTo(root.get("biddingProject").get(attribute), time);
        return predicate;
    }

    public Predicate lessThan(Root root, String date, String attribute, CriteriaBuilder criteriaBuilder) {
        Date time = DateUtil.toDate(date);
        time = DateUtil.tommorrow(time, 1);
        Predicate predicate = criteriaBuilder.lessThan(root.get("biddingProject").get(attribute), time);
        return predicate;
    }

    /**
     * 查出这个项目领先的人
     *
     * @param projectId
     * @return
     */
    public BiddingRecord findByBiddingProjectIdAndBiddingStatus(Long projectId) {
        return biddingRecordDao.findByBiddingProjectIdAndBiddingStatus(projectId, BiddingStatus.LEADING.getCode());
    }


    /**
     * 根据id更新竞拍状态
     *
     * @param id
     * @param status
     * @return
     */
    public int updateBiddingStatus(Long id, Integer status) {
        return biddingRecordDao.updateBiddingStatus(id, status);
    }

    /**
     * 根据项目id查询
     * @param biddingProjectId
     * @param pageBean
     * @return
     */
    public PageBean<BiddingRecord> findByBiddingProject(Long biddingProjectId, PageBean<BiddingRecord> pageBean) {
        Specification<BiddingRecord> specification = new Specification<BiddingRecord>() {
            private static final long serialVersionUID = 1L;

            @Override
            public Predicate toPredicate(Root<BiddingRecord> root,
                                         CriteriaQuery<?> criteriaQuery, CriteriaBuilder criteriaBuilder) {
                Predicate predicate = criteriaBuilder.equal(root.get("biddingProject"), biddingProjectId);
                Predicate equal = criteriaBuilder.equal(root.get("payStatus"), BiddingRecord.STATUS_NO);
                predicate = criteriaBuilder.and(predicate, equal);
                return predicate;
            }
        };
        Sort sort = Sort.by(Sort.Direction.DESC, "biddingStatus", "createTime");
        PageRequest pageable = PageRequest.of(pageBean.getCurrentPage() - 1, pageBean.getPageSize(), sort);
        Page<BiddingRecord> findAll = biddingRecordDao.findAll(specification, pageable);
        pageBean.setContent(findAll.getContent());
        pageBean.setTotal(findAll.getTotalElements());
        pageBean.setTotalPage(findAll.getTotalPages());
        return pageBean;
    }

    /**
     * 根据项目id查询竞价表 拍卖者
     * @param biddingProjectId
     * @param pageBean
     * @return
     */
    public PageBean<BiddingRecord> findByOraganizationList(Long biddingProjectId, PageBean<BiddingRecord> pageBean) {
        Specification<BiddingRecord> specification = new Specification<BiddingRecord>() {
            private static final long serialVersionUID = 1L;

            @Override
            public Predicate toPredicate(Root<BiddingRecord> root,
                                         CriteriaQuery<?> criteriaQuery, CriteriaBuilder criteriaBuilder) {
                Predicate predicate = criteriaBuilder.equal(root.get("biddingProject"), biddingProjectId);
                return predicate;
            }
        };
        Sort sort = Sort.by(Sort.Direction.DESC, "biddingStatus", "createTime");
        PageRequest pageable = PageRequest.of(pageBean.getCurrentPage() - 1, pageBean.getPageSize(), sort);
        Page<BiddingRecord> findAll = biddingRecordDao.findAll(specification, pageable);
        pageBean.setContent(findAll.getContent());
        pageBean.setTotal(findAll.getTotalElements());
        pageBean.setTotalPage(findAll.getTotalPages());
        return pageBean;
    }


    /*
     *//**
     * 竞价更新操作
     * @param oldRecord
     * @param newRecord
     *//*
    @Transactional
    public void recordExist(BiddingRecord oldRecord, BiddingRecord newRecord){
        try{
            //把之前的领先人更新为出局
            updateBiddingStatus(oldRecord.getId(), BiddingStatus.OUT.getCode());
            //添加新的领先人
            save(newRecord);
            //更新当前价
            int currentPrice = newRecord.getBid();
            BiddingProject biddingProject = newRecord.getBiddingProject();
            Long id = biddingProject.getId();
            biddingProjectDao.updateCurrentPrice(currentPrice,id);
            //更新竞拍次数
            biddingProjectDao.updateAuctionTimes(biddingProject.getAuctionTimes()+1,id);
            //判断是不是最后五分钟
            long biddingEndTime = biddingProject.getBiddingEndTime().getTime();
            long currentTime = System.currentTimeMillis();
            //延时周期
            int delayPeriod = biddingProject.getDelayPeriod();
            long diff=(biddingEndTime-currentTime)/1000/60;
            if(diff<=delayPeriod){
                //延长项目竞价结束时间
                Date date = DateUtil.addDateMinut(biddingProject.getBiddingEndTime(), delayPeriod);
                //更新项目竞价结束时间
                biddingProjectDao.updateBiddingEndTime(date, id);
            }
        }catch (Exception e){
            e.printStackTrace();
            TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
        }
    }*/


    /**
     * 根据用户查询所有的竞价记录
     *
     * @param accountId
     * @return
     */
    public List<BiddingRecord> findByAccountIdOrderByBidDesc(Long accountId) {
        return biddingRecordDao.findByAccountIdOrderByBidDesc(accountId);
    }

    /**
     * 确认交易后 更新一系列操作
     *
     * @param biddingRecord
     */
    @Transactional
    public Result<Boolean> updateRecordTransaction(BiddingRecord biddingRecord) {
        //确认交易状态改成确认交易
        try {
            Long id = biddingRecord.getId();
            int status = BiddingRecord.BIDDING_STATUS_SUCCESS;
            biddingRecordDao.updateBiddingStatus(id, status);
           BiddingProject biddingProject = biddingRecord.getBiddingProject();
            int projectQuantity = biddingProject.getQuantity();
            int biddingQuantity = biddingRecord.getQuantity();
            int quantity=projectQuantity - biddingQuantity;
            Long projectId = biddingProject.getId();
            //更新商品数量，清空最高价
            biddingProjectDao.updateMaxMoneyAndQuantity(quantity, projectId);
            //更新本次所有的竞拍记录状态为流局
            int state = BiddingRecord.STATUS_SITUATION;
            biddingRecordDao.updateByProjectIdPayStatus(projectId, state,id);
            if(quantity==0){
                //表示商品数量为0
                //更新项目状态
                biddingProjectDao.updateStatus(projectId,ProjectStatus.ENDBIDDING.getCode());
            }
            return Result.success(true);
        } catch (Exception e) {
            TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
            return Result.error(CodeMsg.ADMIN_PROJECT_BIDDINGRECORD_UPDATE_ERROR);
        }
    }

    /**
     * 根据项目Id和状态查询竞价列表
     * @param projectId
     * @param status
     * @return
     */
   public List<BiddingRecord>findByBiddingProjectIdAndPayStatusOrderByBidDesc(Long projectId,int status){
       return biddingRecordDao.findByBiddingProjectIdAndPayStatusOrderByBidDesc(projectId,status);
   }

    /**
     * 根据id更新竞拍状态和支付状态
     * @param id
     * @param payStatus
     * @param status
     * @return
     */
    public int updatePayStatusAndBiddingStatus(Long id,int payStatus,int status){
        return biddingRecordDao.updatePayStatusAndBiddingStatus(id,payStatus,status);
    }


    /**
     * 根据用户id和确认交易状态 未支付的查询竞价记录
     * @param accountId
     * @param payStatus
     * @return
     */
   public List<BiddingRecord>findByAccountIdAndPayStatus(Long accountId,int payStatus){
        return biddingRecordDao.findByAccountIdAndPayStatus(accountId,payStatus);
    }

    @Transactional
    public Result<Boolean> updateBalanceAndRecordStatus(BiddingRecord biddingRecord, Account account, BigDecimal balance){
       try{
           Long id = biddingRecord.getId();
           //更新竞价记录状态
           biddingRecordDao.updatePayStatusAndBiddingStatus(id,BiddingRecord.STATUS_YES,BiddingRecord.BIDDING_STATUS_EVALUATE);
           //更新账户余额
           homeUserDao.updateBalance(balance,account.getId());
           return Result.success(true);
       }catch (Exception e){
           TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
           return Result.error(CodeMsg.HOME_ACCOUNT_PROFILE_RECHARGE_ERROR);
       }
    }
}
