package com.yuanlrc.base.constant;

import java.util.Arrays;
import java.util.List;

/**
 * 系统运行时的常量
 * @author Administrator
 *
 */
public class RuntimeConstant {

	//后台登录拦截器无需拦截的url
	public static List<String> loginExcludePathPatterns = Arrays.asList(
			"/home/**",
			"/admin/Distpicker/**",
			"/admin/kindeditor/**",
			"/system/login",
			"/system/auth_order",
			"/admin/css/**",
			"/admin/fonts/**",
			"/admin/js/**",
			"/admin/organization/register",
			"/admin/images/**",
			"/error",
			"/upload/**",
			"/photo/view",
			"/cpacha/generate_cpacha",
			"/admin/organization/forget_password"
	);
	//后台权限拦截器无需拦截的url
	public static List<String> authorityExcludePathPatterns = Arrays.asList(
			"/home/**",
			"/system/login",
			"/system/auth_order",
			"/system/index",
			"/system/no_right",
			"/admin/kindeditor/**",
			"/admin/organization/register",
			"/admin/datepicker/**",
			"/admin/Distpicker/**",
			"/admin/css/**",
			"/admin/fonts/**",
			"/admin/js/**",
			"/admin/images/**",
			"/error",
			"/cpacha/generate_cpacha",
			"/system/logout",
			"/system/update_userinfo",
			"/system/update_pwd",
			"/upload/**",
			"/photo/view",
			"/admin/organization/forget_password"
	);

	//前台登录拦截器无需拦截的url
	public static List<String> homeLoginExcludePathPatterns = Arrays.asList(
			"/admin/**",
			"/home/index/index",
			"/home/index/register",
			"/home/index/auctioneerRegister",
			"/home/index/login",
			"/home/index/category_top3",
			"/system/auth_order",
			"/home/css/**",
			"/home/fonts/**",
			"/admin/datepicker/**",
			"/home/js/**",
			"/home/images/**",
			"/system/**",
			"/error",
			"/photo/view",
			"/cpacha/generate_cpacha",
			"/upload/**",
			"/home/picture/**",
			"/home/assets/**",
			"/home/project/list",
			"/home/project/detail",
			"/home/raty/**",
			"/home/project/*.png"
			);
	//前台全局拦截器无需拦截的url
	public static List<String> homeGlobalExcludePathPatterns = Arrays.asList(
			"/admin/**",
			"/home/index/index",
			"/home/index/register",
			"/home/index/auctioneerRegister",
			"/home/index/login",
			"/home/index/category_top3",
			"/home/css/**",
			"/home/fonts/**",
			"/home/js/**",
			"/home/images/**",
			"/home/picture/**",
			"/system/**",
			"/error",
			"/photo/view",
			"/upload/**",
			"/cpacha/generate_cpacha",
			"/home/picture/**",
			"/home/assets/**",
			"/home/project/list",
			"/home/project/detail",
			"/home/raty/**",
			"/home/project/*.png"
	);
}
