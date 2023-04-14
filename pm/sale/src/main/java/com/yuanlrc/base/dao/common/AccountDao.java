package com.yuanlrc.base.dao.common;

import com.yuanlrc.base.entity.common.Account;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;

/**
 * 用户数据库处理层
 * @author Administrator
 *
 */
@Repository
public interface AccountDao extends JpaRepository<Account, Long>{

	/**
	 * 按照用户名查找用户信息
	 * @param username
	 * @return
	 */
	public Account findByUsername(String username);

	/**
	 * 根据用户id查询
	 * @param id
	 * @return
	 */
	@Query("select a from Account a where id = :id")
	public Account find(@Param("id") Long id);

	/**
	 * 根据邮箱和手机号查询用户信息
	 * @param email
	 * @param mobile
	 * @return
	 */
	Account findByEmailAndMobile(@Param("email")String email,@Param("mobile")String mobile);


	/**
	 * 根据用户id更新密码
	 * @param password
	 * @param id
	 * @return
	 */
	@Transactional
	@Modifying(clearAutomatically = true)
	@Query("update Account at set at.password=?1 where at.id=?2")
	int updatePassword(@Param("password")String password,@Param("id")Long id);

	/**
	 * 用户更新头像
	 * @param headPic
	 * @param id
	 * @return
	 */
	@Transactional
	@Modifying(clearAutomatically = true)
	@Query("update Account at set at.headPic=?1 where at.id=?2")
	int updateHeadPic(@Param("headPic")String headPic,@Param("id")Long id);


	/**
	 * 根据用户id更新余额
	 * @param balance
	 * @param id
	 * @return
	 */
	@Transactional
	@Modifying(clearAutomatically = true)
	@Query("update Account at set at.balance=?1 where at.id=?2")
	int updateBalance(@Param("balance")BigDecimal balance, @Param("id")Long id);


	/**
	 * 根据用户id更新信用分
	 * @param creditScore
	 * @param id
	 * @return
	 */
	@Transactional
	@Modifying(clearAutomatically = true)
	@Query("update Account at set at.creditScore=?1 where at.id=?2")
	int updateCreditScore(@Param("creditScore")int creditScore, @Param("id")Long id);
}
