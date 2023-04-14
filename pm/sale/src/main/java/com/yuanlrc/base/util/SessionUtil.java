package com.yuanlrc.base.util;

import com.yuanlrc.base.constant.SessionConstant;
import com.yuanlrc.base.entity.admin.User;
import com.yuanlrc.base.entity.common.Account;
import com.yuanlrc.base.entity.common.Organization;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * session统一操作工具类
 * @author Administrator
 *
 */
public class SessionUtil {

	/**
	 * 获取请求request
	 * @return
	 */
	public static HttpServletRequest getRequest(){
		ServletRequestAttributes attributes =(ServletRequestAttributes)RequestContextHolder.getRequestAttributes();
		return attributes == null ? null : attributes.getRequest();
	}
	
	/**
	 * 获取session
	 * @return
	 */
	public static HttpSession getSession(){
		HttpServletRequest request = getRequest();
		if(request != null){
			return request.getSession();
		}
		return null;
	}
	
	/**
	 * 获取指定键的值
	 * @param key
	 * @return
	 */
	public static Object get(String key){
		HttpSession session = getSession();
		if(session != null){
			return session.getAttribute(key);
		}
		return null;
	}
	
	/**
	 * 设置session值
	 * @param key
	 * @param object
	 */
	public static void set(String key,Object object){
		HttpSession session = getSession();
		if(session != null){
			session.setAttribute(key,object);
		}
	}
	
	/**
	 * 获取当前登录的用户
	 * @return
	 */
	public static User getLoginedUser(){
		HttpSession session = getSession();
		if(session != null){
			Object attribute = session.getAttribute(SessionConstant.SESSION_USER_LOGIN_KEY);
			return attribute == null ? null : (User)attribute;
		}
		return null;
	}

	/**
	 * 获取拍卖者登录信息
	 * @return
	 */
	public static Organization getOraganization(){
		HttpSession session=getSession();
		if(session!=null){
			Object attribute = session.getAttribute(SessionConstant.SESSION_USER_ORGANIZATION);
			return attribute==null?null:(Organization) attribute;
		}
		return null;
	}

	/**
	 * 获取前台用户登录信息
	 * @return
	 */
	public static Account getAccount(){
		HttpSession session = getSession();
		if(session!=null){
			Object attribute = session.getAttribute(SessionConstant.SESSION_HOME_USER_LOGIN_KEY);
			return attribute==null?null:(Account) attribute;
		}
		return null;
	}
}
