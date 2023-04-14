package com.yuanlrc.base.entity.common;

import com.yuanlrc.base.annotion.ValidateEntity;
import com.yuanlrc.base.bean.AuditStatus;
import com.yuanlrc.base.entity.admin.BaseEntity;
import com.yuanlrc.base.entity.admin.Role;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import javax.persistence.*;
import java.math.BigDecimal;

/**
 * 前台拍卖者实体类
 * @author Administrator
 *
 */
@Entity
@Table(name="ylrc_organization")
@EntityListeners(AuditingEntityListener.class)
public class Organization extends BaseEntity{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private static final int ORGAN_SEX_MAN = 1;//性别男
	
	private static final int ORGAN_SEX_WOMAN = 2;//性别女
	
	private static final int ORGAN_SEX_UNKONW = 0;//性别未知
	
	public static final int HOME_ORGAN_STATUS_ENABLE = 1;//拍卖者状态正常可用
	public static final int HOME_ORGAN_STATUS_UNABLE = 0;//拍卖者状态不可用

	@ValidateEntity(required=true,requiredLeng=true,minLength=4,maxLength=18,errorRequiredMsg="拍卖者名称不能为空!",errorMinLengthMsg="拍卖者名称长度需大于4!",errorMaxLengthMsg="拍卖者名称长度不能大于18!")
	@Column(name="name",nullable=false,length=18,unique=true)
	private String name;//拍卖者名称

	@ValidateEntity(required=true,requiredLeng=true,minLength=4,maxLength=32,errorRequiredMsg="密码不能为空！",errorMinLengthMsg="密码长度需大于4!",errorMaxLengthMsg="密码长度不能大于32!")
	@Column(name="password",nullable=false,length=32)
	private String password;//登录密码

	@Column(name = "trading_img", nullable = false)
	@ValidateEntity(required = true, errorRequiredMsg = "请上传营业执照")
	private String tradingImg; //营业执照

	@Column(name = "card_img", nullable = false)
	@ValidateEntity(required = true, errorRequiredMsg = "请上传身份证图片")
	private String cardImg; //身份证图片

	@ValidateEntity(required=false)
	@Column(name="head_pic",length=128)
	private String headPic;//拍卖者头像

	@ValidateEntity(required=false)
	@Column(name="sex",length=1)
	private int sex = ORGAN_SEX_UNKONW;//拍卖者性别

	@ValidateEntity(required=true,errorRequiredMsg = "请填写拍卖者手机号")
	@Column(name="mobile",length=12)
	private String mobile;//拍卖者手机号

	@ValidateEntity(required=true,errorRequiredMsg = "请填写拍卖者邮箱")
	@Column(name="email",length=32)
	private String email;//拍卖者邮箱

	//联系人
	@Column(name = "legal_person")
	@ValidateEntity(required = true, requiredLeng = true, minLength = 2, maxLength = 30,
			errorRequiredMsg="联系人不能为空", errorMinLengthMsg = "联系人不能小于2个字", errorMaxLengthMsg = "联系人不能大于30个字")
	private String legalPerson;

	@Column(name = "audit_status")
	private Integer auditStatus = AuditStatus.AUDIT.getCode();	//审核状态

	@Column(name = "not_pass_reason")
	private String notPassReason;//不通过原因

	@Column(name = "balance")
	private BigDecimal balance=BigDecimal.ZERO;//余额

	@Column(name = "address")
	private String address;//地址

	@JoinColumn(name = "role_id")
	@ManyToOne(fetch = FetchType.EAGER)
	private Role role; //权限

	@Column(name = "rate")
	private Double rate;//信用分

	public Double getRate() {
		return rate;
	}

	public void setRate(Double rate) {
		this.rate = rate;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getTradingImg() {
		return tradingImg;
	}

	public void setTradingImg(String tradingImg) {
		this.tradingImg = tradingImg;
	}

	public String getCardImg() {
		return cardImg;
	}

	public void setCardImg(String cardImg) {
		this.cardImg = cardImg;
	}

	public String getHeadPic() {
		return headPic;
	}

	public void setHeadPic(String headPic) {
		this.headPic = headPic;
	}

	public int getSex() {
		return sex;
	}

	public void setSex(int sex) {
		this.sex = sex;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}


	public String getLegalPerson() {
		return legalPerson;
	}

	public void setLegalPerson(String legalPerson) {
		this.legalPerson = legalPerson;
	}

	public Integer getAuditStatus() {
		return auditStatus;
	}

	public void setAuditStatus(Integer auditStatus) {
		this.auditStatus = auditStatus;
	}

	public String getNotPassReason() {
		return notPassReason;
	}

	public void setNotPassReason(String notPassReason) {
		this.notPassReason = notPassReason;
	}

	public BigDecimal getBalance() {
		return balance;
	}

	public void setBalance(BigDecimal balance) {
		this.balance = balance;
	}

	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	@Override
	public String toString() {
		return "Organization{" +
				"name='" + name + '\'' +
				", password='" + password + '\'' +
				", tradingImg='" + tradingImg + '\'' +
				", cardImg='" + cardImg + '\'' +
				", headPic='" + headPic + '\'' +
				", sex=" + sex +
				", mobile='" + mobile + '\'' +
				", email='" + email + '\'' +
				", legalPerson='" + legalPerson + '\'' +
				", auditStatus=" + auditStatus +
				", notPassReason='" + notPassReason + '\'' +
				", balance=" + balance +
				", role=" + role +
				'}';
	}
}
