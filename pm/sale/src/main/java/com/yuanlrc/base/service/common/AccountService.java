package com.yuanlrc.base.service.common;

import com.yuanlrc.base.bean.PageBean;
import com.yuanlrc.base.dao.common.AccountDao;
import com.yuanlrc.base.entity.common.Account;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.*;
import org.springframework.data.domain.ExampleMatcher.GenericPropertyMatchers;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;

/**
 * 前台前台用户管理service
 * @author Administrator
 *
 */
@Service
public class AccountService {

	@Autowired
	private AccountDao accountDao;
	
	/**
	 * 根据前台用户id查询
	 * @param id
	 * @return
	 */
	public Account find(Long id){
		return accountDao.find(id);
	}
	
	/**
	 * 按照前台用户名查找前台用户
	 * @param username
	 * @return
	 */
	public Account findByUsername(String username){
		return accountDao.findByUsername(username);
	}
	
	/**
	 * 前台用户添加/编辑操作
	 * @param account
	 * @return
	 */
	public Account save(Account account){
		return accountDao.save(account);
	}
	
	/**
	 * 分页查询前台用户列表
	 * @param account
	 * @param pageBean
	 * @return
	 */
	public PageBean<Account> findList(Account account,PageBean<Account> pageBean){
		ExampleMatcher withMatcher = ExampleMatcher.matching().withMatcher("username", GenericPropertyMatchers.contains());
		withMatcher = withMatcher.withIgnorePaths("status","sex");
		Example<Account> example = Example.of(account, withMatcher);
		Pageable pageable = PageRequest.of(pageBean.getCurrentPage()-1, pageBean.getPageSize());
		Page<Account> findAll = accountDao.findAll(example, pageable);
		pageBean.setContent(findAll.getContent());
		pageBean.setTotal(findAll.getTotalElements());
		pageBean.setTotalPage(findAll.getTotalPages());
		return pageBean;
	}
	
	/**
	 * 判断前台用户名是否存在，添加和编辑均可判断
	 * @param username
	 * @param id
	 * @return
	 */
	public boolean isExistUsername(String username,Long id){
		Account account = accountDao.findByUsername(username);
		if(account != null){
			//表示前台用户名存在，接下来判断是否是编辑前台用户的本身
			if(account.getId().longValue() != id.longValue()){
				return true;
			}
		}
		return false;
	}
	
	/**
	 * 按照前台用户id删除
	 * @param id
	 */
	public void delete(Long id){
		accountDao.deleteById(id);
	}
	
	/**
	 * 返回前台用户总数
	 * @return
	 */
	public long total(){
		return accountDao.count();
	}

	/**
	 * 根据邮箱和手机号查询用户信息
	 * @param email
	 * @param mobile
	 * @return
	 */
	public Account findByEmailAndMobile(String email,String mobile){
		return accountDao.findByEmailAndMobile(email,mobile);
	}


	/**
	 * 根据用户id更新密码
	 * @param password
	 * @param id
	 * @return
	 */
	public int updatePassword(String password,Long id){
		return accountDao.updatePassword(password,id);
	}

	/**
	 * 用户更新头像
	 * @param headPic
	 * @param id
	 * @return
	 */
	public int updateHeadPic(String headPic,Long id){
		return accountDao.updateHeadPic(headPic,id);
	}

	/**
	 * 根据用户id更新余额
	 * @param balance
	 * @param id
	 * @return
	 */
	public int updateBalance(BigDecimal balance, Long id){
		return accountDao.updateBalance(balance,id);
	}

	/**
	 * 根据用户id更新信用分
	 * @param creditScore
	 * @param id
	 * @return
	 */
	public int updateCreditScore(int creditScore,Long id){
		return accountDao.updateCreditScore(creditScore,id);
	}
}
