<!DOCTYPE html>
<html lang="en" dir="ltr">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>个人中心</title>
   <#include "../common/header.ftl"/>
</head>

<body>
<#include "../common/header-menu.ftl"/>
<#include "../common/profile-head.ftl"/>

<div class="section">
    <div class="container">
        <div class="row">
            <#include "../common/profile-menu.ftl"/>
            <div class="col-lg-8">

                <div class="acr-welcome-message">
                    <h3>Welcome Back ${account.username}</h3>
                </div>
                <form id="profile-form">
                    <input name="id" id="id" value="${account.id}"type="hidden"/>
                    <div class="row">
                        <div class="col-lg-6 form-group">
                            <label>用户名</label>
                            <input type="text" class="form-control" placeholder="请输入用户名" readonly
                                   value="${account.username}">
                        </div>
                        <div class="col-lg-6 form-group">
                            <label>邮箱</label>
                            <input type="email" class="form-control" id="profile-email" name="email" placeholder="请输入邮箱"
                                   value="${account.email}">
                        </div>
                        <div class="col-lg-6 form-group">
                            <label>手机号</label>
                            <input type="text" class="form-control" id="profile-mobile" name="mobile"
                                   placeholder="请输入手机号" value="${account.mobile}">
                        </div>
                        <div class="col-lg-6 form-group">
                            <label>收货地址</label>
                            <input type="text" class="form-control"  name="address" id="profile-address" placeholder="请输入收货地址"
                                   value="${account.address!""}">
                        </div>
                        <div class="col-lg-6 form-group">
                            <label>性别</label>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="sex" id="sex" value="1"
                                       <#if account.sex==1>checked</#if>>
                                <label class="form-check-label" for="inlineRadio1">男</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="sex" value="2"
                                       <#if account.sex=2>checked</#if>>
                                <label class="form-check-label" for="inlineRadio2">女</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="sex" value="0"
                                       <#if account.sex=0>checked</#if>>
                                <label class="form-check-label" for="inlineRadio2">未知</label>
                            </div>
                        </div>
                        <div class="col-lg-12 form-group">
                            <label>信用分</label>
                            <input type="text" class="form-control" readonly value="${account.creditScore}">
                        </div>
                        <div class="col-lg-12 form-group">
                            <label>余额</label>
                            <input type="text" class="form-control" readonly value="${account.balance!0}">
                        </div>
                        <div class="col-lg-12 form-group">
                            <label>状态</label>
                    <#if account.status==0>
                       <span style="color: red;">冻结</span>
                    <#else>
                      <span style="color: darkblue;">正常</span>
                    </#if>
                        </div>
                    </div>
                    <button type="button" id="profile-submit-btn" class="btn-custom">保存</button>
                </form>
                <hr>

                <div class="acr-welcome-message">
                    <h3>安全</h3>
                    <p>建议三个月修改一下密码，这样就可以保障账号安全了</p>
                </div>
                <form>
                    <div class="row">
                        <div class="col-lg-6 form-group">
                            <label>旧密码</label>
                            <input type="password" class="form-control" name="password" id="old-password" placeholder="请输入旧密码" value="">
                        </div>
                        <div class="col-lg-6 form-group">
                            <label>新密码</label>
                            <input type="password" class="form-control" id="new-password" placeholder="请输入新密码" value="">
                        </div>
                    </div>
                    <button type="button" name="profile-edit-password" id="profile-edit-password" class="btn-custom">修改密码</button>
                </form>
            </div>

        </div>
    </div>
</div>

  <#include "../common/footer.ftl"/>
 <#include "../common/footer-js.ftl"/>
<script type="text/javascript">
    $(".head-pic").click(function () {
        $("#select-file").click();
    });

    //上传头像
    function uploadHead(showPictureImg) {
        var formData = new FormData();
        formData.append('upload_head', document.getElementById('select-file').files[0]);
        $.ajax({
            url: 'upload_head',
            contentType: false,
            processData: false,
            data: formData,
            type: 'POST',
            success: function (data) {
                if (data.code == 0) {
                    $("#" + showPictureImg).attr('src', '/photo/view?filename=' + data.data);
                } else {
                    alert(data);
                }
            },
            error: function (data) {
                alert('网络错误!');
            }
        });
    }

    //保存操作
    $("#profile-submit-btn").click(function () {
        var mobile = $("#profile-mobile").val();
        //验证手机号
        var regMobile = /^[1][3,4,5,7,8][0-9]{9}$/;
        if (!regMobile.test(mobile)) {
            alert("请填写正确的手机号。")
            return false;
        }
        //验证邮箱
        var email = $("#profile-email").val();
        var regEmail = /^[0-9a-zA-Z_.-]+[@][0-9a-zA-Z_.-]+([.][a-zA-Z]+){1,2}$/;
        if (!regEmail.test(email)) {
            alert("请填写正确的邮箱!");
            return false;
        }
        var data=$("#profile-form").serialize();
        $.post('edit_profile',data,function(result){
           if(result.code==0){
               alert("编辑成功!");
               location.reload();
           }else{
               alert(result.msg);
           }
        });
    });
    //密码
    $("#profile-edit-password").click(function(){
      var oldPassword= $("#old-password").val();
      var newPassword=$("#new-password").val();
        if(oldPassword.length<4 || newPassword.length<4){
            alert("密码至少为4位!");
            return false;
        }
        if(oldPassword.length>32 || newPassword.length>32){
            alert("密码最多为32位!");
            return false;
        }
        $.post('edit_password',{oldPassword:oldPassword,newPassword:newPassword},function(result){
               if(result.code==0){
                   alert("修改成功！");
                   location.reload();
               }else{
                   alert(result.msg);
               }
        })
    });
</script>
</body>

</html>
