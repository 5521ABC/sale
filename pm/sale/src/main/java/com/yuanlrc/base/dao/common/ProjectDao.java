package com.yuanlrc.base.dao.common;

import com.yuanlrc.base.bean.ProjectStatus;
import com.yuanlrc.base.entity.common.BiddingProject;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 商品项目数据库处理层
 * @author Administrator
 *
 */
@Repository
public interface ProjectDao extends JpaRepository<BiddingProject, Long>,JpaSpecificationExecutor<BiddingProject> {

	/**
	 * 按照商品项目名称查找商品
	 * @param name
	 * @return
	 */
	public BiddingProject findByName(String name);

	/**
	 * 根据商品id查询
	 * @param id
	 * @return
	 */
	@Query("select b from BiddingProject b where id = :id")
	public BiddingProject find(@Param("id") Long id);


	/**
	 * 商品审核
	 * @param biddingProject
	 * @return
	 */
	@Transactional
	@Modifying(clearAutomatically = true)
	@Query(value = "update ylrc_bidd_project set project_status=:#{#biddingProject.projectStatus.code},reason=:#{#biddingProject.reason} where id=:#{#biddingProject.id}",nativeQuery = true)
	int projectExamine(@Param("biddingProject") BiddingProject biddingProject);

	/**
	 * 首页4条
	 * @param projectStatus
	 * @return
	 */
	List<BiddingProject> findTop3ByProjectStatusAndProjectStatusOrderByCreateTimeDesc(@Param("ProjectStatus") ProjectStatus projectStatus,@Param("ProjectState")ProjectStatus projectState);

	/**
	 * 根据分类获取最近3条数据
	 * @param cid
	 * @return
	 */
	List<BiddingProject>findTop3ByProjectCategoryIdOrderByCreateTimeDesc(@Param("cid")Long cid);

	/**
	 * 获取最新的4条商品
	 * @return
	 */
	@Query(value = "select * from ylrc_bidd_project p where p.project_status in (1,3,4,10,11) order by p.create_time desc limit 0,4",nativeQuery = true)
	List<BiddingProject> findTop4ByProjectStatusOrderByCreateTime();


	/**
	 * 根据状态发布中和竞拍中查找项目
	 * @param release
	 * @param bidding
	 * @return
	 */
	List<BiddingProject> findByProjectStatusOrProjectStatusOrProjectStatus(ProjectStatus release,ProjectStatus bidding,ProjectStatus signUp);


	/**
	 * 更新项目状态
	 * @param id
	 * @param status
	 * @return
	 */
	@Transactional
	@Modifying(clearAutomatically = true)
	@Query(value = "update ylrc_bidd_project set project_status=:status where id=:id",nativeQuery = true)
	int  updateStatus(@Param("id")Long id,@Param("status") int status);

	/**
	 * 更新浏览量
	 * @param viewNumber
	 * @param id
	 * @return
	 */
	@Transactional
	@Modifying(clearAutomatically = true)
	@Query(value = "update ylrc_bidd_project set views_number=:viewNumber where id=:id",nativeQuery = true)
	int updateViewsNumber(@Param("viewNumber")int viewNumber,@Param("id")Long id);

	/**
	 * 更新评分
	 * @param rate
	 * @param id
	 * @return
	 */
	@Transactional
	@Modifying(clearAutomatically = true)
	@Query(value = "update ylrc_bidd_project set rate=:rate where id=:id",nativeQuery = true)
	int updateProjectRate(@Param("rate")Double rate,@Param("id")Long id);

	/**
	 * 更新项目竞拍次数
	 * @param auctionTimes
	 * @param id
	 * @return
	 */
	@Transactional
	@Modifying(clearAutomatically = true)
	@Query("update BiddingProject bt set bt.auctionTimes=?1 where bt.id=?2")
	int updateAuctionTimes(@Param("auctionTimes")int auctionTimes,@Param("id")Long id);

	/**
	 * 更新项目最高价
	 * @param maxMoney
	 * @param id
	 * @return
	 */
	@Transactional
	@Modifying(clearAutomatically = true)
	@Query("update BiddingProject bt set bt.transactionPrice=?1 where bt.id=?2")
	int updateMaxMoney(@Param("maxMoney")int maxMoney,@Param("id")Long id);


	/**
	 * 初始化最高价,更新商品数量
	 * @param quantity
	 * @return
	 */
	@Transactional
	@Modifying(clearAutomatically = true)
	@Query("update BiddingProject bt set bt.transactionPrice=0,bt.quantity=?1 where bt.id=?2")
	int updateMaxMoneyAndQuantity(@Param("quantity")int quantity,@Param("projectId")Long id);
	/**
	 * 根据项目Id更新报名人数
	 * @param applicantsNumber
	 * @param id
	 * @return
	 */
	@Transactional
	@Modifying(clearAutomatically = true)
	@Query(value = "update ylrc_bidd_project set applicants_number=:applicantsNumber where id=:id",nativeQuery = true)
	int updateApplicantsNumber(@Param("applicantsNumber")int applicantsNumber,@Param("id")Long id);
}
