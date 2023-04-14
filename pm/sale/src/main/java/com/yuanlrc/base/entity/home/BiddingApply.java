package com.yuanlrc.base.entity.home;

import com.yuanlrc.base.entity.admin.BaseEntity;
import com.yuanlrc.base.entity.common.Account;
import com.yuanlrc.base.entity.common.BiddingProject;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import javax.persistence.*;

/**
 * 竞拍报名表
 */
@Entity
@Table(name = "ylrc_bidding_apply")
@EntityListeners(AuditingEntityListener.class)
public class BiddingApply extends BaseEntity {

    @ManyToOne
    @JoinColumn(name="account_id")
    private Account account;//用户

    @ManyToOne
    @JoinColumn(name="bidding_project_id")
    private BiddingProject biddingProject;//竞拍项目

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

    @Override
    public String toString() {
        return "BiddingApply{" +
                "account=" + account +
                ", biddingProject=" + biddingProject +
                '}';
    }
}
