<!DOCTYPE html>
<html lang="zh">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
<title>${siteName!""}|前台用户管理-添加前台用户</title>
<#include "../common/header.ftl"/>

</head>
  
<body>
<div class="lyear-layout-web">
  <div class="lyear-layout-container">
    <!--左侧导航-->
    <aside class="lyear-layout-sidebar">
      
      <!-- logo -->
      <div id="logo" class="sidebar-header">
        <a href="/system/index"><img src="/admin/images/logo-sidebar.png" title="${siteName!""}" alt="${siteName!""}" /></a>
      </div>
      <div class="lyear-layout-sidebar-scroll"> 
        <#include "../common/left-menu.ftl"/>
      </div>
      
    </aside>
    <!--End 左侧导航-->
    
    <#include "../common/header-menu.ftl"/>
    
     <!--页面主要内容-->
    <main class="lyear-layout-content">
      
      <div class="container-fluid">
        
        <div class="row">
          <div class="col-lg-12">
            <div class="card">
              <div class="card-header"><h4>添加前台用户</h4></div>
              <div class="card-body">
                <form id="account-add-form" class="row">
                  <div class="form-group col-md-12">
                    <label>头像上传</label>
                    <div class="form-controls">
                      <ul class="list-inline clearfix lyear-uploads-pic">
                        <li class="col-xs-4 col-sm-3 col-md-2">
                          <figure>
                            <img src="/static/admin/images/default-head.jpg" id="show-picture-img" alt="默认头像">
                          </figure>
                        </li>
                        <input type="hidden" name="headPic" id="headPic">
                        <input type="file" id="select-file" style="display:none;" onchange="upload('show-picture-img','headPic')">
                        <li class="col-xs-4 col-sm-3 col-md-2">
                          <a class="pic-add" id="add-pic-btn" href="javascript:void(0)" title="点击上传"></a>
                        </li>
                      </ul>
                    </div>
                  </div>
                  <div class="input-group m-b-10">
                    <span class="input-group-addon">前台用户名称</span>
                    <input type="text" class="form-control required" id="username" name="username" value="" placeholder="请输入前台用户名" tips="请填写前台用户名" />
                  </div>
                  <div class="input-group m-b-10">
                    <span class="input-group-addon">登录密码</span>
                    <input type="password" class="form-control required" id="password" name="password" value="" placeholder="请输入登录密码" tips="请填写登录密码" />
                  </div>

                  <div class="input-group m-b-10">
                    <span class="input-group-addon">手机号码</span>
                    <input type="tel" class="form-control required" id="mobile" name="mobile" value="" placeholder="请输入手机号码" tips="请填写手机号码"/>
                  </div>
                  <div class="input-group m-b-10">
                    <span class="input-group-addon">邮箱账号</span>
                    <input type="email" class="form-control required" id="email" name="email" value="" placeholder="请输入邮箱账号" tips="请填写邮箱账号"/>
                  </div>
                    <div class="input-group m-b-10">
                        <span class="input-group-addon">支付密码</span>
                        <input type="password" class="form-control required" id="pmPwd" name="pmPwd" value="" placeholder="请输入支付密码" tips="请填写支付密码" />
                    </div>
                  <div class="input-group" style="margin-top:15px;margin-bottom:15px;padding-left:25px;">
                    性别：
                    <label class="lyear-radio radio-inline radio-primary" style="margin-left:30px;">
                    <input type="radio" name="sex" value="1" checked="" >
                    <span>男</span>
                    <label class="lyear-radio radio-inline radio-primary">
                    <input type="radio" name="sex" value="2">
                    <span>女</span>
                    <label class="lyear-radio radio-inline radio-primary">
                    <input type="radio" name="sex" value="0">
                    <span>未知</span>
                    </label>
                  </div>
                  <div class="input-group" style="margin-top:15px;margin-bottom:15px;padding-left:25px;">
                    状态：
                    <label class="lyear-radio radio-inline radio-primary" style="margin-left:30px;">
                    <input type="radio" name="status" value="1" checked="">
                    <span>正常</span>
                    <label class="lyear-radio radio-inline radio-primary">
                    <input type="radio" name="status" value="0">
                    <span>冻结</span>
                  </label>
                  </div>
                  <div class="form-group col-md-12">
                    <button type="button" class="btn btn-primary ajax-post" id="add-form-submit-btn">确 定</button>
                    <button type="button" class="btn btn-default" onclick="javascript:history.back(-1);return false;">返 回</button>
                  </div>
                </form>
       
              </div>
            </div>
          </div>
          
        </div>
        
      </div>
      
    </main>
    <!--End 页面主要内容-->
  </div>
</div>
<#include "../common/footer.ftl"/>
<script type="text/javascript" src="/admin/js/perfect-scrollbar.min.js"></script>
<script type="text/javascript" src="/admin/js/main.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	//提交按钮监听事件
	$("#add-form-submit-btn").click(function(){
		if(!checkForm("account-add-form")){
			return;
		}
		var data = $("#account-add-form").serialize();
		$.ajax({
			url:'add',
			type:'POST',
			data:data,
			dataType:'json',
			success:function(data){
				if(data.code == 0){
					showSuccessMsg('前台用户添加成功!',function(){
						window.location.href = 'list';
					})
				}else{
					showErrorMsg(data.msg);
				}
			},
			error:function(data){
				alert('网络错误!');
			}
		});
	});
	//监听上传图片按钮
	$("#add-pic-btn").click(function(){
		$("#select-file").click();
	});
});

</script>
</body>
</html>