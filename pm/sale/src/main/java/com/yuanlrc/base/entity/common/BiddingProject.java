package com.yuanlrc.base.entity.common;

import com.yuanlrc.base.annotion.ValidateEntity;
import com.yuanlrc.base.bean.ProjectStatus;
import com.yuanlrc.base.entity.admin.BaseEntity;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.util.Date;

/**
 * 商品实体类
 * @author Administrator
 *
 */
@Entity
@Table(name="ylrc_bidd_project")
@EntityListeners(AuditingEntityListener.class)
public class BiddingProject extends BaseEntity{

	@ValidateEntity(required = true,errorRequiredMsg = "商品名称不能为空",requiredLeng = true,minLength = 2,maxLength = 10,errorMinLengthMsg = "商品名称至少为2个字符",errorMaxLengthMsg ="商品名称最多为10个字符")
	@Column(name = "name",nullable=false,length=18)
	private String name;//商品名称

	@Column(name = "project_number")
	private String projectNumber;//商品编号

	@Lob
	@ValidateEntity(required =true,errorRequiredMsg = "请填写商品描述",requiredLeng = true,minLength = 50,maxLength = 2000,errorMinLengthMsg = "商品描述至少为50个字",errorMaxLengthMsg = "商品描述最多为2000个字")
	@Column(name = "describes")
	private String describes;//商品描述

	@ValidateEntity(required = true, errorRequiredMsg = "请上传图片")
	@Column(name = "picture", nullable = false, length = 512)
	private String picture;//图片 √

	@ValidateEntity(required = true,errorRequiredMsg = "商品数量不能为空")
	@Column(name = "quantity")
	private int quantity;//商品数量

	@Column(name = "start_price", nullable = false, length = 11)
	private int startPrice;//起拍价

	@Column(name = "transaction_price")
	private int transactionPrice;//最高价

	@Column(name = "applicants_number")
	private int applicantsNumber;//报名人数

	@Column(name = "auction_times")
	private int auctionTimes;//竞拍次数

	@ValidateEntity(required = true,errorRequiredMsg = "商品地址不能为空")
	@Column(name = "address",nullable = false,length = 32)
	private String address;//商品地址

	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
	@ValidateEntity(required = true, errorRequiredMsg = "请选择报名开始时间")
	@Column(name = "start_time", nullable = false)
	private Date startTime;//报名开始时间

	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
	@ValidateEntity(required = true, errorRequiredMsg = "请选择报名结束时间")
	@Column(name = "end_time")
	private Date endTime;//报名结束时间

	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
	@ValidateEntity(required = true, errorRequiredMsg = "请选择竞拍开始时间")
	@Column(name = "biddind_start_time")
	private Date biddingStartTime;//竞拍开始时间

	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
	@ValidateEntity(required = true, errorRequiredMsg = "请选择竞拍结束时间")
	@Column(name = "bidding_end_time")
	private Date biddingEndTime;//竞拍结束时间

	@ManyToOne
	@JoinColumn(name = "home_account_id")
	private Account account;//拍卖者

	@ManyToOne
	@JoinColumn(name = "home_project_category")
	private ProjectCategory projectCategory; //分类

	@Enumerated
	@Column(name = "project_status",nullable = false,length = 5)
	private ProjectStatus projectStatus=ProjectStatus.REVIEWED;//商品状态

	@ValidateEntity(required = true,errorRequiredMsg = "付款方式不能为空")
	@Column(name = "payment_method",length = 10)
	private String paymentMethod;//付款方式

	@ValidateEntity(required = true,errorRequiredMsg = "信用分不能为空")
	@Column(name = "credit",length =5)
	private int credit;//信用分

	@ManyToOne
	@JoinColumn(name = "organization")
	private Organization organization;//发布企业

	@Column(name = "reason")
	private String reason; //审批理由

	@Column(name = "rate")
	private Double rate=0.0;//评分

	@Column(name = "views_number")
	private int viewsNumber;//浏览次数

	public Double getRate() {
		return rate;
	}

	public void setRate(Double rate) {
		this.rate = rate;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public Organization getOrganization() {
		return organization;
	}

	public void setOrganization(Organization organization) {
		this.organization = organization;
	}

	public ProjectStatus getProjectStatus() {
		return projectStatus;
	}

	public void setProjectStatus(ProjectStatus projectStatus) {
		this.projectStatus = projectStatus;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getProjectNumber() {
		return projectNumber;
	}

	public void setProjectNumber(String projectNumber) {
		this.projectNumber = projectNumber;
	}

	public String getDescribes() {
		return describes;
	}

	public void setDescribes(String describes) {
		this.describes = describes;
	}

	public String getPicture() {
		return picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public int getStartPrice() {
		return startPrice;
	}

	public void setStartPrice(int startPrice) {
		this.startPrice = startPrice;
	}

	public int getTransactionPrice() {
		return transactionPrice;
	}

	public void setTransactionPrice(int transactionPrice) {
		this.transactionPrice = transactionPrice;
	}

	public int getApplicantsNumber() {
		return applicantsNumber;
	}

	public void setApplicantsNumber(int applicantsNumber) {
		this.applicantsNumber = applicantsNumber;
	}

	public int getAuctionTimes() {
		return auctionTimes;
	}

	public void setAuctionTimes(int auctionTimes) {
		this.auctionTimes = auctionTimes;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Date getStartTime() {
		return startTime;
	}

	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}

	public Date getEndTime() {
		return endTime;
	}

	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}

	public Date getBiddingStartTime() {
		return biddingStartTime;
	}

	public void setBiddingStartTime(Date biddingStartTime) {
		this.biddingStartTime = biddingStartTime;
	}

	public Date getBiddingEndTime() {
		return biddingEndTime;
	}

	public void setBiddingEndTime(Date biddingEndTime) {
		this.biddingEndTime = biddingEndTime;
	}

	public Account getAccount() {
		return account;
	}

	public void setAccount(Account account) {
		this.account = account;
	}

	public ProjectCategory getProjectCategory() {
		return projectCategory;
	}

	public void setProjectCategory(ProjectCategory projectCategory) {
		this.projectCategory = projectCategory;
	}

	public String getPaymentMethod() {
		return paymentMethod;
	}

	public void setPaymentMethod(String paymentMethod) {
		this.paymentMethod = paymentMethod;
	}

	public int getCredit() {
		return credit;
	}

	public void setCredit(int credit) {
		this.credit = credit;
	}

	public int getViewsNumber() {
		return viewsNumber;
	}

	public void setViewsNumber(int viewsNumber) {
		this.viewsNumber = viewsNumber;
	}

	@Override
	public String toString() {
		return "BiddingProject{" +
				"name='" + name + '\'' +
				", projectNumber='" + projectNumber + '\'' +
				", describes='" + describes + '\'' +
				", picture='" + picture + '\'' +
				", quantity=" + quantity +
				", startPrice=" + startPrice +
				", transactionPrice=" + transactionPrice +
				", applicantsNumber=" + applicantsNumber +
				", auctionTimes=" + auctionTimes +
				", address='" + address + '\'' +
				", startTime=" + startTime +
				", endTime=" + endTime +
				", biddingStartTime=" + biddingStartTime +
				", biddingEndTime=" + biddingEndTime +
				", account=" + account +
				", projectCategory=" + projectCategory +
				'}';
	}
}
