package com.yuanlrc.base.entity.home;

import com.yuanlrc.base.entity.admin.BaseEntity;
import com.yuanlrc.base.entity.common.Account;
import com.yuanlrc.base.entity.common.BiddingProject;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import javax.persistence.*;

/**
 * 商品竞价表
 * @author Administrator
 *
 */
@Entity
@Table(name="ylrc_bidd_record")
@EntityListeners(AuditingEntityListener.class)
public class BiddingRecord extends BaseEntity{

	public static final int STATUS_YES = 1;//状态为是
	public static final int STATUS_NO = 0;//状态为否
	public static final int STATUS_SITUATION=2;//流局
	public static final int BIDDING_STATUS_DEFAULT=0;//未交易
	public static final int BIDDING_STATUS_SUCCESS=1;//确认交易
	public static final int BIDDING_STATUS_EVALUATE=2;//待评价
	public static final int BIDDING_STATUS_EVALUATED=3;//已评价


	@ManyToOne
	@JoinColumn(name="account_id")
	private Account account;//前台竞拍用户

	@ManyToOne
	@JoinColumn(name="bidding_project_id")
	private BiddingProject biddingProject;//竞拍项目

	@Column(name = "bid")
	private int bid;//出价

	@Column(name = "quantity")
	private int quantity;//数量

	@Column(name = "bidding_status")
	private Integer biddingStatus=BIDDING_STATUS_DEFAULT;//竞拍状态

	@Column(name = "pay_status")
	private Integer payStatus = STATUS_NO;//支付状态 默认为否 未支付

	public Account getAccount() {
		return account;
	}

	public void setAccount(Account account) {
		this.account = account;
	}

	public BiddingProject getBiddingProject() {
		return biddingProject;
	}

	public void setBiddingProject(BiddingProject biddingProject) {
		this.biddingProject = biddingProject;
	}

	public int getBid() {
		return bid;
	}

	public void setBid(int bid) {
		this.bid = bid;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public Integer getBiddingStatus() {
		return biddingStatus;
	}

	public void setBiddingStatus(Integer biddingStatus) {
		this.biddingStatus = biddingStatus;
	}

	public Integer getPayStatus() {
		return payStatus;
	}

	public void setPayStatus(Integer payStatus) {
		this.payStatus = payStatus;
	}

	@Override
	public String toString() {
		return "BiddingRecord{" +
				"account=" + account +
				", biddingProject=" + biddingProject +
				", bid=" + bid +
				", quantity=" + quantity +
				", biddingStatus=" + biddingStatus +
				", payStatus=" + payStatus +
				'}';
	}
}
