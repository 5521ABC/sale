package com.yuanlrc.base.bean;
/**
 * 错误码统一处理类，所有的错误码统一定义在这里
 * @author Administrator
 *
 */
public class CodeMsg {

	private int code;//错误码
	
	private String msg;//错误信息
	
	/**
	 * 构造函数私有化即单例模式
	 * @param code
	 * @param msg
	 */
	private CodeMsg(int code,String msg){
		this.code = code;
		this.msg = msg;
	}
	
	public int getCode() {
		return code;
	}



	public void setCode(int code) {
		this.code = code;
	}



	public String getMsg() {
		return msg;
	}



	public void setMsg(String msg) {
		this.msg = msg;
	}
	
	//通用错误码定义
	//处理成功消息码
	public static CodeMsg SUCCESS = new CodeMsg(0, "success");
	//非法数据错误码
	public static CodeMsg DATA_ERROR = new CodeMsg(-1, "非法数据！");
	public static CodeMsg CPACHA_EMPTY = new CodeMsg(-2, "验证码不能为空！");
	public static CodeMsg VALIDATE_ENTITY_ERROR = new CodeMsg(-3, "");
	public static CodeMsg SESSION_EXPIRED = new CodeMsg(-4, "会话已失效，请刷新页面重试！");
	public static CodeMsg CPACHA_ERROR = new CodeMsg(-5, "验证码错误！");
	public static CodeMsg USER_SESSION_EXPIRED = new CodeMsg(-6, "还未登录或会话失效，请重新登录！");
	public static CodeMsg UPLOAD_PHOTO_SUFFIX_ERROR = new CodeMsg(-7, "图片格式不正确！");
	public static CodeMsg UPLOAD_PHOTO_ERROR = new CodeMsg(-8, "图片上传错误！");
	public static CodeMsg SAVE_ERROR = new CodeMsg(-11, "保存失败，请联系管理员！");
	public static CodeMsg ORDER_SN_ERROR = new CodeMsg(-12, "订单编号错误！");
	public static CodeMsg PHONE_ERROR = new CodeMsg(-13, "手机号错误！");
	public static CodeMsg ORDER_AUTH_ERROR = new CodeMsg(-14, "\u8ba2\u5355\u9a8c\u8bc1\u5931\u8d25\uff0c\u8ba2\u5355\u7f16\u53f7\u6216\u624b\u673a\u53f7\u8f93\u5165\u6709\u8bef\u6216\u8005\u53ef\u80fd\u4f60\u8d2d\u4e70\u7684\u662f\u76d7\u7248\uff0c\u8bf7\u8054\u7cfb\u3010\u733f\u6765\u5165\u6b64\u3011\u5ba2\u670d\uff01");


	//后台管理类错误码
	//用户管理类错误
	public static CodeMsg ADMIN_USERNAME_EMPTY = new CodeMsg(-2000, "用户名不能为空！");
	public static CodeMsg ADMIN_PASSWORD_EMPTY = new CodeMsg(-2001, "密码不能为空！");
	public static CodeMsg ADMIN_NO_RIGHT = new CodeMsg(-2002, "您所属的角色没有该权限！");
	
	//登录类错误码
	public static CodeMsg ADMIN_USERNAME_NO_EXIST = new CodeMsg(-3000, "该用户名不存在！");
	public static CodeMsg ADMIN_PASSWORD_ERROR = new CodeMsg(-3001, "密码错误！");
	public static CodeMsg ADMIN_USER_UNABLE = new CodeMsg(-3002, "该用户已被冻结，请联系管理员！");
	public static CodeMsg ADMIN_USER_ROLE_UNABLE = new CodeMsg(-3003, "该用户所属角色状态不可用，请联系管理员！");
	public static CodeMsg ADMIN_USER_ROLE_AUTHORITES_EMPTY = new CodeMsg(-3004, "该用户所属角色无可用权限，请联系管理员！");
	
	//后台菜单管理类错误码
	public static CodeMsg ADMIN_MENU_ADD_ERROR = new CodeMsg(-4000, "菜单添加失败，请联系管理员！");
	public static CodeMsg ADMIN_MENU_EDIT_ERROR = new CodeMsg(-4001, "菜单编辑失败，请联系管理员！");
	public static CodeMsg ADMIN_MENU_ID_EMPTY = new CodeMsg(-4002, "菜单ID不能为空！");
	public static CodeMsg ADMIN_MENU_ID_ERROR = new CodeMsg(-4003, "菜单ID错误！");
	public static CodeMsg ADMIN_MENU_DELETE_ERROR = new CodeMsg(-4004, "改菜单下有子菜单，不允许删除！");
	//后台角色管理类错误码
	public static CodeMsg ADMIN_ROLE_ADD_ERROR = new CodeMsg(-5000, "角色添加失败，请联系管理员！");
	public static CodeMsg ADMIN_ROLE_NO_EXIST = new CodeMsg(-5001, "该角色不存在！");
	public static CodeMsg ADMIN_ROLE_EDIT_ERROR = new CodeMsg(-5002, "角色编辑失败，请联系管理员！");
	public static CodeMsg ADMIN_ROLE_DELETE_ERROR = new CodeMsg(-5003, "该角色下存在用户信息，不可删除！");
	//后台用户管理类错误码
	public static CodeMsg ADMIN_USER_ROLE_EMPTY = new CodeMsg(-6000, "请选择用户所属角色！");
	public static CodeMsg ADMIN_USERNAME_EXIST = new CodeMsg(-6001, "该用户名已存在，请换一个试试！");
	public static CodeMsg ADMIN_USE_ADD_ERROR = new CodeMsg(-6002, "用户添加失败，请联系管理员！");
	public static CodeMsg ADMIN_USE_NO_EXIST = new CodeMsg(-6003, "用户不存在！");
	public static CodeMsg ADMIN_USE_EDIT_ERROR = new CodeMsg(-6004, "用户编辑失败，请联系管理员！");
	public static CodeMsg ADMIN_USE_DELETE_ERROR = new CodeMsg(-6005, "该用户存在关联数据，不允许删除！");
	public static CodeMsg ADMIN_ORGANIZATION_UNABLE = new CodeMsg(-6006, "该拍卖者已被冻结，请联系管理员！");


	//后台用户修改密码类错误码
	public static CodeMsg ADMIN_USER_UPDATE_PWD_ERROR = new CodeMsg(-7000, "旧密码错误！");
	public static CodeMsg ADMIN_USER_UPDATE_PWD_EMPTY = new CodeMsg(-7001, "新密码不能为空！");
	
	//后台用户修改密码类错误码
	public static CodeMsg ADMIN_DATABASE_BACKUP_NO_EXIST = new CodeMsg(-8000, "备份记录不存在！");
	public static CodeMsg PASSWORD_MIN_LENGTH_ERROR = new CodeMsg(-8001, "密码最少为4位");
	public static CodeMsg PASSWORD_MAX_LENGTH_ERROR = new CodeMsg(-8002, "密码最多为32位");
	public static CodeMsg USERNAME_MIN_LENGTH_ERROR = new CodeMsg(-8003, "账号最少为4位");
	public static CodeMsg USERNAME_MAX_LENGTH_ERROR = new CodeMsg(-8004, "账号最多为32位");
	public static CodeMsg ACCOUNT_PASSWORD_EDIT_ERROR=new CodeMsg(-8005,"找回密码失败,请联系管理员!");
	//后台前台用户类错误码
	public static CodeMsg ADMIN_ACCOUNT_PMPWD_ERROR=new CodeMsg(-11000,"支付密码不能为空");
	public static CodeMsg ADMIN_ACCOUNT_ADD_ERROR=new CodeMsg(-11001,"前台用户添加失败,请联系管理员");
    public static CodeMsg ADMIN_ACCOUNT_EDIT_ERROR=new CodeMsg(-11002,"前台用户编辑失败,请联系管理员");
    public static CodeMsg ADMIN_ACCOUNT_EDIT_PROFILE_ERROR=new CodeMsg(-11003,"个人信息修改失败,请联系管理员");

    //后台项目分类错误码
	public static CodeMsg ADMIN_PROJECT_CATEGORY_NAME_EXIST=new CodeMsg(-12001,"项目分类名称已存在");
	public static CodeMsg ADMIN_PROJECT_CATEGORY_ADD_ERROR=new CodeMsg(-12002,"项目分类添加失败!");
	public static CodeMsg ADMIN_PROJECT_CATEGORY_EDIT_ERROR=new CodeMsg(-12003,"项目分类编辑失败!");
	public static CodeMsg ADMIN_PROJECT_CATEGORY_EXIST_ERROR=new CodeMsg(-12004,"请填写正确数据");
	public static CodeMsg ADMIN_PROJECT_CATEGORY_DELETE_ERROR=new CodeMsg(-12005,"项目分类删除失败,请联系管理员!");

	//后台拍卖者注册错误码
	public static CodeMsg COMMON_PHONE_FORMAET_ERROR = new CodeMsg(-90000, "手机号格式错误");
	public static CodeMsg COMMON_EMAIL_EXSITER_ERROR = new CodeMsg(-90001, "邮箱已经存在了");
	public static CodeMsg COMMON_PHONE_EXSITER_ERROR = new CodeMsg(-90002, "手机号已经存在了");
	public static CodeMsg ADMIN_ORGANIZATION_PASSWORD_ERROR=new CodeMsg(-90003,"密码格式错误,请重写填写!");
	public static CodeMsg ADMIN_ORGANIZATION_UPDATE_PASSWORD_ERROR=new CodeMsg(-90004,"找回密码错误");
	public static CodeMsg ADMIN_ORGANIZATION_NAME_ERROR = new CodeMsg(-76020, "拍卖者名称重复");
	public static CodeMsg ADMIN_REGISTER_ERROR = new CodeMsg(-70012, "注册失败");
	public static CodeMsg ADMIN_ORGANIZATION_LEGALPERSON_MIN_LENGTH_ERROR=new CodeMsg(-70013,"联系人至少为2位");
	public static CodeMsg ADMIN_ORGANIZATION_LEGALPERSON_MAX_LENGTH_ERROR=new CodeMsg(-70014,"联系人最多为30位");
	//前台注册用户类错误码
	public static CodeMsg HOME_ACCOUNT_EMAIL_ERROR=new CodeMsg(-9000,"邮箱格式错误");
	public static CodeMsg HOME_ACCOUNT_PHONE_ERROR=new CodeMsg(-9001,"手机号格式错误");
	public static CodeMsg HOME_ACCOUNT_USERNAME_EXIST=new CodeMsg(-9002,"用户名已存在,请重新填写");
	public static CodeMsg HOME_ACCOUNT_ADD_ERROR=new CodeMsg(-9003,"注册失败，请联系管理员");

	//前台登录用户类错误码
	public static CodeMsg HOME_ACCOUNT_LOGIN_ERROR=new CodeMsg(-10000,"请填写正确数据");
	public static CodeMsg HOME_ACCOUNT_USERNAME_ERROR=new CodeMsg(-10001,"请填写用户名");
	public static CodeMsg HOME_ACCOUNT_NOT_EXIST_ERROR=new CodeMsg(-10002,"未找到用户,请注册");
	public static CodeMsg HOME_ACCOUNT_PASSWORD_ERROR=new CodeMsg(-10003,"用户密码错误");
	public static CodeMsg HOME_ACCOUNT_STATUS_ERROR=new CodeMsg(-10004,"该用户已被冻结,请联系管理员");
	public static CodeMsg HOME_ACCOUNT_OLDPASSWORD_ERROR=new CodeMsg(-10005,"旧密码错误,请重新填写");


	//后台审核拍卖者错误码
	public static CodeMsg ADMIN_ORGANIZATION_STATUS_ERROR=new CodeMsg(-20000,"审核状态错误");
	public static CodeMsg ADMIN_ORGANIZATION_STATUS_EDIT_ERROR=new CodeMsg(-20001,"状态更新失败,请联系管理员");

	//修改个人信息错误码
	public static CodeMsg ADMIN_USER_INFO_PERSON_ERROR=new CodeMsg(-21001,"联系人不可为空");
	public static CodeMsg ADMIN_USER_INFO_ADDRESS_ERROR=new CodeMsg(-21002,"地址不可为空");
	public static CodeMsg ADMIN_USER_INFO_SAVE_ERROR=new CodeMsg(-21003,"个人信息修改失败,请联系管理员");



	//后台竞拍错误码
	public static CodeMsg ADMIN_BIDDING_PROJECT_SIGNUP_DATE_ERROR=new CodeMsg(-22000,"报名开始日期不能大于结束日期");
	public static CodeMsg ADMIN_BIDDING_PROJECT_BIDDING_DATE_ERROR=new CodeMsg(-22001,"竞拍开始日期不能大于结束日期");
	public static CodeMsg ADMIN_BIDDING_PROJECT_NOT_EXIST_ERROR=new CodeMsg(-22002,"竞拍不存在,请联系管理员！");
	public static CodeMsg ADMIN_BIDDING_PROJECT_EDIT_ERROR=new CodeMsg(-22003,"竞拍商品编辑失败!");
	public static CodeMsg ADMIN_BIDDING_PROJECT_ADD_ERROR=new CodeMsg(-22004,"竞拍商品添加失败!");
	public static CodeMsg ADMIN_BIDDING_PROJECT_DELETE_ERROR=new CodeMsg(-22005,"竞拍删除失败，竞拍下有关联数据!");
	public static CodeMsg ADMIN_BIDDING_PROJECT_RELEASE_ERROR=new CodeMsg(-22006,"竞拍发布失败,请联系管理员!");
	public static CodeMsg ADMIN_BIDDING_PROJECT_EXAMINE_ERROR=new CodeMsg(-22007,"竞拍商品审核失败,请联系管理员!");
	public static CodeMsg ADMIN_BIDDING_PROJECT_LOADING_ERROR=new CodeMsg(-22008,"竞拍商品上架失败!");
	public static CodeMsg ADMIN_BIDDING_PROJECT_UNLOADING_ERROR=new CodeMsg(-22009,"竞拍商品下架失败!");
	public static CodeMsg ADMIN_BIDDING_PROJECT_STATUS_ERROR=new CodeMsg(-22010,"该状态不能下架");
	public static CodeMsg ADMIN_BIDDING_PROJECT_APPLY_ERROR=new CodeMsg(-22011,"该项目已被报名,不可下架");
	public static CodeMsg ADMIN_BIDDING_PROJECT_SIGNUP_TIME_ERROR=new CodeMsg(-22012,"报名时间不能小于当前时间");
	public static CodeMsg ADMIN_BIDDING_PROJECT_SIN_TIME_ERROR=new CodeMsg(-22013,"报名时间已过，不能给与通过");
	public static CodeMsg ADMIN_BIDDING_PROJECT_STAUTS_ERROR=new CodeMsg(-22014,"该项目状态不可编辑");
	public static CodeMsg ADMIN_BIDDING_PROJECT_BOND_PAY_ERROR=new CodeMsg(-22015,"当前余额不足以支付保证金,请去个人用户充值");
	public static CodeMsg ADMIN_BIDDING_PROJECT_BIDDING_SIGNUP_ERROR=new CodeMsg(-22016,"竞拍开始时间不能小于报名时间");
	public static CodeMsg HOME_BIDDING_PROJECT_AUCTIONTIMES_ADD_ERROR=new CodeMsg(-22017,"竞拍次数更新失败");
	public static CodeMsg HOME_BIDDING_PROJECT_APPLICANTSNUMBER_UPDATE_ERROR=new CodeMsg(-22018,"竞拍报名人数更新失败,请联系管理员");
	public static CodeMsg HOME_BIDDING_PROJECT_EDIT_MAX_MONEY_ERROR=new CodeMsg(-22019,"竞拍最高价更新失败,请联系管理员!");
	public static CodeMsg HOME_BIDDING_PROJECT_CREDIT_ERROR=new CodeMsg(-22020,"抱歉,你的信用分未达到该商品的所需信用分");
	public static CodeMsg ADMIN_BIDDING_PROJECT_BIDDING_END_DATE_ERROR=new CodeMsg(-22021,"报名开始时间不能大于竞拍结束时间");

	//后台商品错误码
	public static CodeMsg ADMIN_PROJECT_SHOPING_ADD_ERROR=new CodeMsg(-23000,"商品添加失败,请联系管理员!");
	public static CodeMsg ADMIN_PROJECT_SHOPING_NOT_EXIST=new CodeMsg(-23001,"未找到该商品!");
	public static CodeMsg ADMIN_PROJECT_SHOPING_APPLY_ERROR=new CodeMsg(-23002,"商品已有人报名,不可编辑");
	public static CodeMsg ADMIN_PROJECT_SHOPING_RATE_REPLY_ERROR=new CodeMsg(-23003,"回复失败,请联系管理员!");

	//前台报名错误码
	public static CodeMsg HOME_PROJECT_SIGN_UP_ERROR=new CodeMsg(-24000,"报名失败,请联系管理员！");
	public static CodeMsg HOME_SIGN_UP_EXIST_ERROR=new CodeMsg(-24001,"该项目你已经报过名，不可重复报名!");
	public static CodeMsg HOME_SIGN_UP_NOT_EXIST_ERROR=new CodeMsg(-24002,"你未报名该项目,不能报价,很抱歉");
	public static CodeMsg HOME_PROJECT_QUANTITY_ERROR=new CodeMsg(-24003,"报价数量大于商品数量");
	public static CodeMsg HOME_PROJECT_MINMONEY_ERROR=new CodeMsg(-24004,"报价价格不得低于起拍价");

	//前台竞价错误码
	public static CodeMsg HOME_PROJECT_BIDDINGRECORD_ADD_ERROR=new CodeMsg(-25001,"竞价记录添加失败,请联系管理员!");

	//后台竞价记录错误码
	public static CodeMsg ADMIN_PROJECT_BIDDINGRECORD_NOT_EXIST=new CodeMsg(-26000,"竞价记录已经飞走了!");
	public static CodeMsg ADMIN_PROJECT_BIDDINGRECORD_UPDATE_ERROR=new CodeMsg(-26001,"确认交易失败,请联系管理员!");
	public static CodeMsg ADMIN_PROJECT_BIDDINGRECORD_CREDITSCORE_SUBTRACT_ERROR=new CodeMsg(-26002,"信用分扣除失败!");

	//个人中心错误码
	public static CodeMsg HOME_ACCOUNT_PROFILE_RECHARGE_BALANCE_ERROR=new CodeMsg(-27000,"充值金额不能小于0");
	public static CodeMsg HOME_ACCOUNT_PROFILE_RECHARGE_ERROR=new CodeMsg(-27001,"余额更新失败,请联系管理员!");
	public static CodeMsg HOME_ACCOUNT_PROFILE_RECHAREGE_RECORD_ADD_ERROR=new CodeMsg(-27002,"充值记录添加失败");
	public static CodeMsg HOME_ACCOUNT_PROFILE_RECORD_PAYMENT_ERROR=new CodeMsg(-27003,"余额不足请充值");

	//评价内容
	public static CodeMsg HOME_ACCOUNT_PROJECT_EVALUATE_ADD_ERROR=new CodeMsg(-28000,"评价失败,请联系管理员");
	public static CodeMsg HOME_ACCOUNT_PROJECT_EVALUATE_NOT_EXIST_ERROR=new CodeMsg(-28001,"未找到该评价");
	//拍卖者前台错误码
	public static CodeMsg HOME_ORGANIZATION_RATE_ADD_ERROR=new CodeMsg(-29000,"拍卖者信用分更新失败,请联系管理员!");
}
