package com.yuanlrc.base.dao.home;

import com.yuanlrc.base.entity.home.BiddingRecord;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 竞价Dao
 */
@Repository
public interface BiddingRecordDao extends JpaRepository<BiddingRecord,Long>, JpaSpecificationExecutor<BiddingRecord> {

    /**
     * 根据id查询
     * @param id
     * @return
     */
    @Query("select b from BiddingRecord b where id = :id")
    BiddingRecord find(@Param("id") Long id);

    /**
     * 根据项目id查找竞价列表
     * @param projectId
     * @return
     */
    List<BiddingRecord>findByBiddingProjectId(@Param("projectId") Long projectId);

    /**
     * 根据项目Id和状态查询竞价列表
     * @param projectId
     * @param status
     * @return
     */
    List<BiddingRecord>findByBiddingProjectIdAndPayStatusOrderByBidDesc(@Param("projectId")Long projectId,@Param("status")int status);

    /**
     * 根据项目id 和状态查询
     * @param projectId
     * @param status
     * @return
     */
    BiddingRecord findByBiddingProjectIdAndBiddingStatus(Long projectId, Integer status);

    /**
     * 根据id更新竞拍状态
     * @param id
     * @param status
     * @return
     */
    @Transactional
    @Modifying
    @Query(value = "update ylrc_bidd_record set bidding_status=:status where id=:id",nativeQuery = true)
    int updateBiddingStatus(@Param("id") Long id,@Param("status") Integer status);


    /**
     * 根据记录id更新支付状态
     * @param id
     * @param payStatus
     * @return
     */
    @Transactional
    @Modifying
    @Query(value = "update ylrc_bidd_record set pay_status=:payStatus where id=:id",nativeQuery = true)
    int updatePaymentStatusById(@Param("id")Long id,@Param("payStatus")int payStatus);
    /**
     * 根据id更新竞拍状态和支付状态
     * @param id
     * @param payStatus
     * @param status
     * @return
     */
    @Transactional
    @Modifying
    @Query(value = "update ylrc_bidd_record set bidding_status=:status,pay_status=:payStatus where id=:id",nativeQuery = true)
    int updatePayStatusAndBiddingStatus(@Param("id")Long id,@Param("payStatus")int payStatus,@Param("status")int status);

    /**
     * 根据用户查询所有的竞价记录
     * @param accountId
     * @return
     */
    List<BiddingRecord> findByAccountIdOrderByBidDesc(@Param("accountId")Long accountId);


    /**
     * 根据项目Id更新付款状态
     * @param projectId
     * @param state
     * @return
     */
    @Transactional
    @Modifying
    @Query(value = "update ylrc_bidd_record set pay_status=:state where bidding_project_id=:projectId and id <>:id",nativeQuery = true)
    int updateByProjectIdPayStatus(@Param("projectId") Long projectId, @Param("state") Integer state,@Param("id")Long id);

    /**
     * 根据用户id已支付的查询竞价记录
     * @param accountId
     * @param payStatus
     * @return
     */
    List<BiddingRecord>findByAccountIdAndPayStatus(@Param("accountId")Long accountId,@Param("payStatus")int payStatus);

}
