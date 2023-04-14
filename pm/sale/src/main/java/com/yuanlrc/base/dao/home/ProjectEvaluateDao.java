package com.yuanlrc.base.dao.home;

import com.yuanlrc.base.entity.home.ProjectEvaluate;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 商品评价Dao
 */
@Repository
public interface ProjectEvaluateDao extends JpaRepository<ProjectEvaluate,Long>, JpaSpecificationExecutor<ProjectEvaluate> {

    /**
     * 根据id查询
     * @param id
     * @return
     */
    @Query("select p from ProjectEvaluate p where id = :id")
    ProjectEvaluate find(@Param("id") Long id);

    /**
     * 根据项目id查找评价列表
     * @param projectId
     * @return
     */
    List<ProjectEvaluate>findByBiddingProjectId(@Param("projectId") Long projectId);


    /**
     * 根据id更新回复内容
     * @param id
     * @param replay
     * @return
     */
    @Transactional
    @Modifying
    @Query("update ProjectEvaluate p set p.reply=?2 where p.id=?1")
    int updateReplay(@Param("id")Long id,@Param("replay")String replay);
}
