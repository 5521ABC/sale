<!DOCTYPE html>
<html lang="en" dir="ltr">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>竞拍注册页面 </title>
<#include "../common/header.ftl"/>
    <style>
        #zichuang1{
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
</head>

<body>
<#include "../common/header-menu.ftl"/>
  <div class="acr-auth-container" id="zichuang1">
    <div class="acr-auth-content">
        <div class="alert alert-warning" role="alert" class="close" style="display: none">
            <div style="text-align: center">
                <span style="text-align: center" id="alert-content"></span>
            </div>
        </div>
      <form id="register-add-form">
        <div class="auth-text">
          <h3>用户注册</h3>
          <#--<p>有人说慢慢来会比较快,于是我听了她的话,结果她却走远了。</p>-->
        </div>
        <div class="form-group">
                <td class="td_left">
          <label>用户名</label>
            <!--form-control form-control-light required-->
          <input type="text" class="td_left" placeholder="请输入用户名" name="username" id="username" value="" tips="请输入用户名">
        </div>
          <div class="form-group">
              <label>密码</label>
                  </td>
              <input type="password" class="form-control form-control-light required" placeholder="请输入密码" id="password" name="password" value="" tips="请输入密码">
          </div>
          <div class="form-group">
              <label>确认密码</label>
              <input type="password" class="form-control form-control-light required" placeholder="请确认密码"  id="second-password" tips="请确认密码">
          </div>
        <div class="form-group">
          <label>手机号</label>
          <input type="tel" class="form-control form-control-light required" placeholder="请填写手机号" id="mobile" name="mobile" value="" tips="请填写手机号">
        </div>
          <div class="form-group">
              <label>邮箱</label>
              <input type="email" class="form-control form-control-light required" placeholder="请填写邮箱" id="email" name="email" value="" tips="请填写邮箱">
          </div>
        <button type="button" class="btn-custom secondary btn-block popover-dismiss" id="submit-add-form"  data-content="">注册</button>
                <p class="text-center mb-0">已有账号去登录?
                    <a href="/home/index/login">登录&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</a>
                    <a href="/home/index/index">&nbsp&nbsp&nbsp前往首页</a>
                 </p>
<#--          <p class="text-center mb-0"><a href="/home/index/index">前往首页</a> </p>-->
      </form>
    </div>
<#--    <div class="acr-auth-bg">
      <div class="acr-auth-bg-slider acr-cs-bg-slider">
        <div class="acr-auth-bg-item bg-cover bg-center" style="background-image: url('/home/assets/img/coming-soon/2.jpg')">
          <div class="acr-auth-quote">
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

</body>
<#include "../common/footer-js.ftl"/>

<script type="text/javascript">
    $("#submit-add-form").click(function(s){
        if(!checkForm("register-add-form","alert-warning","alert-content")){
            setTime("alert-warning");
            return;
        }
        if($("#password").val()!=$("#second-password").val()){
            $("#alert-content").text("两次密码不一致");
            $(".alert-warning").show();
            setTime("alert-warning");
            return;
        }
        //表示成功
        var data =$("#register-add-form").serialize();
        ajaxRequest('/home/index/register','POST',data,function(result){
            if(result.code==0){
                $("#alert-content").text("注册成功");
                $(".alert-warning").show();
                location.href="login";
            }
        });
    });

    function setTime(clazz){
        setTimeout(function () {
            $("."+clazz).hide();
        },2000);
    }
</script>
</html>
