package com.yuanlrc.base.entity.home;

import com.yuanlrc.base.entity.admin.BaseEntity;
import com.yuanlrc.base.entity.common.Account;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import javax.persistence.*;

/**
 * 充值记录表
 * @author Administrator
 *
 */
@Entity
@Table(name="ylrc_recharge_record")
@EntityListeners(AuditingEntityListener.class)
public class RechargeRecord extends BaseEntity{

	@ManyToOne
	@JoinColumn(name="account_id")
	private Account account;//充值用户

	@Column(name = "money")
	private int money;//充值金额

	public Account getAccount() {
		return account;
	}

	public void setAccount(Account account) {
		this.account = account;
	}

	public int getMoney() {
		return money;
	}

	public void setMoney(int money) {
		this.money = money;
	}

	@Override
	public String toString() {
		return "RechargeRecord{" +
				"account=" + account +
				", money=" + money +
				'}';
	}
}
