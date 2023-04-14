<!DOCTYPE html>
<html lang="en" dir="ltr">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>竞拍登录页面 </title>
    <style>
        #zichuang2{
            width:auto;
            height:auto;
            padding-left: 20%;
            background: url("/home/assets/img/banner/4.jpg");
        }
        #username{
            width: 410px;
            height: 50px;
            border: 1px solid #A6A6A6;
            /* 设置边框圆角*/
            border-radius: 10px;
            padding-left: 10px;
        }
    </style>
<#include "../common/header.ftl"/>
</head>

<body>
<#include "../common/header-menu.ftl"/>
  <div class="acr-auth-container" id="zichuang2" >
    <div class="acr-auth-content">
        <div class="alert alert-warning" role="alert"  style="display: none">
            <div style="text-align: center">
                <span style="text-align: center" id="alert-content"></span>
            </div>
        </div>
      <form id="login-form">
        <div class="auth-text">
          <h3>用户登录</h3>
<#--          <p>一个人会走的很快，但一群人会走的很远。</p>-->
        </div>
        <div class="form-group">
          <label>用户名</label>
          <input type="text" class="form-control form-control-light required" id="username" placeholder="请输入用户名" name="username" value="" tips="请填写用户名">
        </div>
        <div class="form-group">
          <label>密码</label>
          <input type="password" class="form-control form-control-light required" id="password"  placeholder="请输入密码" name="password" value="" tips="请填写密码">
        </div>
        <div class="form-group">
          <a href="javascript:void(0);" class="forgot-password" data-toggle="modal" data-target="#forgetModal">忘记密码?</a>
          <a href="/home/index/index" style="float: right;">前往首页</a>
        </div>
        <button type="button" class="btn-custom secondary btn-block" id="login-btn">登录</button>

      </form>
    </div>
    <#--<div class="acr-auth-bg">
      <div class="acr-auth-bg-slider acr-cs-bg-slider">
        <div class="acr-auth-bg-item bg-cover bg-center" style="background-image: url('/home/assets/img/coming-soon/2.jpg')">
          <div class="acr-auth-quote">
            <h6>Quote of the day</h6>
            <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s</p>
          </div>
        </div>
        <div class="acr-auth-bg-item bg-cover bg-center" style="background-image: url('/home/assets/img/coming-soon/3.jpg')">
          <div class="acr-auth-quote">
            <h6>Quote of the day</h6>
            <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s</p>
          </div>
        </div>
        <div class="acr-auth-bg-item bg-cover bg-center" style="background-image: url('/home/assets/img/coming-soon/1.jpg')">
          <div class="acr-auth-quote">
            <h6>Quote of the day</h6>
            <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s</p>
          </div>
        </div>
      </div>
    </div>-->
  </div>

 <#include "../common/footer-js.ftl"/>
<!-- Modal -->
<div class="modal fade" id="forgetModal" tabindex="-1" aria-labelledby="forgetModal" aria-hidden="true">
    <div class="modal-dialog" style="margin-top: 10%;">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">忘记密码</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="forget-password-form">
                <div class="form-group">
                    <label>手机号</label>
                    <input type="tel" class="form-control form-control-light required" placeholder="请填写手机号" id="forget-mobile" name="mobile" value="" tips="请填写手机号">
                </div>
                <div class="form-group">
                    <label>邮箱</label>
                    <input type="email" class="form-control form-control-light required" placeholder="请填写邮箱" id="forget-email" name="email" value="" tips="请填写邮箱">
                </div>
                <div class="form-group">
                    <label>密码</label>
                    <input type="password" class="form-control form-control-light required" id="forget-password"  placeholder="请输入密码" name="password" value="" tips="请填写密码">
                </div>
                <div class="form-group">
                    <label>确认密码</label>
                    <input type="password" class="form-control form-control-light required" id="confim-password"  placeholder="请输入确认密码"  value="" tips="请输入确认密码">
                </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" onclick="forgetPassword()">确定</button>
            </div>
        </div>
    </div>
</div>
</body>
<script type="text/javascript">
    $("#login-btn").click(function(){
        if(!checkForm("login-form","alert-warning","alert-content")){
            setTime("alert-warning");
            return;
        }
        var data=$("#login-form").serialize();
        ajaxRequest('login','POST',data,function(result){
            if(result.code==0){
                $("#alert-content").text("登录成功");
                $(".alert-warning").show();
                location.href="index";
            }
        });
    });
    function setTime(clazz){
        setTimeout(function () {
            $("."+clazz).hide();
        },2000);
    }

    //忘记密码操作
    function forgetPassword(){
      var mobile=$("#forget-mobile").val();
      //验证手机号
        var regMobile = /^[1][3,4,5,7,8][0-9]{9}$/;
        if (!regMobile.test(mobile)) {
           alert("请填写正确的手机号。")
            return false;
        }
        //验证邮箱
       var email=$("#forget-email").val();
        var regEmail = /^[0-9a-zA-Z_.-]+[@][0-9a-zA-Z_.-]+([.][a-zA-Z]+){1,2}$/;
        if (!regEmail.test(email)) {
          alert("请填写正确的邮箱!");
          return false;
        }
        var password=$("#forget-password").val();
        if(password.length<4){
            alert("密码至少为4位!");
            return false;
        }
        if(password.length>32){
            alert("密码最多为32位!");
            return false;
        }
        var regPassword=$("#confim-password").val();
        if(regPassword!=password){
            alert("两次密码不一致!");
            return false;
        }
        var data=$("#forget-password-form").serialize();
        $.post("forget_password",data,function(result){
            if(result.code==0){
                alert("密码更新成功!");
                window.location.reload();
            }else{
                alert(result.msg);
            }
        });
    }

</script>

</html>
