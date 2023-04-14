package com.yuanlrc.base.dao.home;

import com.yuanlrc.base.entity.home.BiddingApply;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 竞拍报名Dao
 */
@Repository
public interface BiddingApplyDao extends JpaRepository<BiddingApply, Long>,JpaSpecificationExecutor<BiddingApply> {

    /**
     * 根据id查询
     * @param id
     * @return
     */
    @Query("select ba from BiddingApply ba where id = :id")
    public BiddingApply find(@Param("id") Long id);

    /**
     * 根据项目id查询报名列表
     * @param id
     * @return
     */
    public List<BiddingApply> findByBiddingProjectId(@Param("projectId") Long id);

    /**
     * 根据项目id和用户id查询
     * @param biddingProjectId
     * @param homeUserId
     * @return
     */
    BiddingApply findByBiddingProjectIdAndAccountId(Long biddingProjectId, Long homeUserId);


    /**
     * 查询该用户下所有的报名记录
     * @param accountId
     * @return
     */
    List<BiddingApply>findByAccountId(@Param("accountId")Long accountId);

}
