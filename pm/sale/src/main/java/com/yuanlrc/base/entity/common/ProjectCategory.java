package com.yuanlrc.base.entity.common;

import com.yuanlrc.base.annotion.ValidateEntity;
import com.yuanlrc.base.bean.CategoryStatus;
import com.yuanlrc.base.entity.admin.BaseEntity;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import javax.persistence.*;

/**
 * 项目分类实体类
 * @author Administrator
 *
 */
@Entity
@Table(name="ylrc_project_category")
@EntityListeners(AuditingEntityListener.class)
public class ProjectCategory extends BaseEntity{

	@ValidateEntity(required = true,errorRequiredMsg = "项目分类名称不能为空")
	@Column(name = "name",nullable = false,length = 32)
	private String name;//分类名称

	@Enumerated
	@Column(name ="status",nullable = false,length = 6)
	private CategoryStatus status=CategoryStatus.AVAILABLE;//分类状态

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public CategoryStatus getStatus() {
		return status;
	}

	public void setStatus(CategoryStatus status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "ProjectCategory{" +
				"name='" + name + '\'' +
				", status=" + status +
				'}';
	}
}
