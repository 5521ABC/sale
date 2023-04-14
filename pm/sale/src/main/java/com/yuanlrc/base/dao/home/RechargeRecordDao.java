package com.yuanlrc.base.dao.home;

import com.yuanlrc.base.entity.home.RechargeRecord;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 充值记录Dao
 */
@Repository
public interface RechargeRecordDao extends JpaRepository<RechargeRecord,Long>, JpaSpecificationExecutor<RechargeRecord> {

    /**
     * 根据id查询
     * @param id
     * @return
     */
    @Query("select b from RechargeRecord b where id = :id")
    RechargeRecord find(@Param("id") Long id);

    /**
     * 根据用户查询所有的充值记录
     * @param accountId
     * @return
     */
    List<RechargeRecord> findByAccountId(@Param("accountId") Long accountId);


}
