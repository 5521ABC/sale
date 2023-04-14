package com.yuanlrc.base.entity.home;

import com.yuanlrc.base.entity.admin.BaseEntity;
import com.yuanlrc.base.entity.common.Account;
import com.yuanlrc.base.entity.common.BiddingProject;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import javax.persistence.*;

/**
 * 商品评价表
 */
@Entity
@Table(name = "ylrc_evaluate")
@EntityListeners(AuditingEntityListener.class)
public class ProjectEvaluate extends BaseEntity {

    @ManyToOne
    @JoinColumn(name="account_id")
    private Account account;//评价用户

    @ManyToOne
    @JoinColumn(name="bidding_project_id")
    private BiddingProject biddingProject;//竞拍项目

    @Column(name = "rate")
    private int rate;//评分

    @Lob
    @Column(name = "content",length = 1000)
    private String content;//评价内容

    @Lob
    @Column(name = "reply",length = 1000)
    private String reply;//回复内容

    public String getReply() {
        return reply;
    }

    public void setReply(String reply) {
        this.reply = reply;
    }

    public int getRate() {
        return rate;
    }

    public void setRate(int rate) {
        this.rate = rate;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

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
        return "ProjectEvaluate{" +
                "account=" + account +
                ", biddingProject=" + biddingProject +
                ", rate=" + rate +
                ", content='" + content + '\'' +
                ", reply='" + reply + '\'' +
                '}';
    }
}
