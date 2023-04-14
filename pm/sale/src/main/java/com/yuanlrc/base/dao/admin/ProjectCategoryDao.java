package com.yuanlrc.base.dao.admin;

import com.yuanlrc.base.bean.CategoryStatus;
import com.yuanlrc.base.entity.common.ProjectCategory;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 项目分类数据库处理层
 * @author Administrator
 *
 */
@Repository
public interface ProjectCategoryDao extends JpaRepository<ProjectCategory, Long>{

	/**
	 * 按照分类名称查找分类
	 * @param name
	 * @return
	 */
	public ProjectCategory findByName(String name);

	/**
	 * 根据分类id查询
	 * @param id
	 * @return
	 */
	@Query("select p from ProjectCategory p where id = :id")
	public ProjectCategory find(@Param("id") Long id);
	/**
	 * 根据状态查询分类列表
	 * @param status
	 * @return
	 */
	public List<ProjectCategory> findByStatus(CategoryStatus status);

	/**
	 * 查询top4的分类列表
	 * @param status
	 * @return
	 */
	List<ProjectCategory> findTop6ByStatusOrderByCreateTime(CategoryStatus status);
}
