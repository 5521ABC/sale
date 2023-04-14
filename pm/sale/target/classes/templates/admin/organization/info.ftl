<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
    <title>${siteName!""}|我的个人信息</title>
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
                            <div class="card-header"><h4>我的个人信息</h4></div>
                            <div class="card-body">
                                <form id="info-add-form"  class="row">
                                    <input type="hidden" name="id" value="${item.id}">
                                    <div class="form-group col-md-12">
                                        <label>头像上传</label>
                                        <div class="form-controls">
                                            <ul class="list-inline clearfix lyear-uploads-pic">
                                                <li class="col-xs-4 col-sm-3 col-md-2">
                                                    <figure>
                                                        <#if item.headPic??>
                                                            <#if item.headPic?length gt 0>
                                                                <img src="/photo/view?filename=${item.headPic}" id="show-picture-img">
                                                            <#else>
                                                                <img src="/admin/images/default-head.jpg" id="show-picture-img" alt="默认头像">
                                                            </#if>
                                                        <#else>
                                                            <img src="/admin/images/default-head.jpg" id="show-picture-img" alt="默认头像">
                                                        </#if>
                                                    </figure>
                                                </li>
                                                <input type="hidden" name="headPic" id="headPic" value="${item.headPic!''}">
                                                <input type="file" id="select-file" style="display:none;" onchange="upload('show-picture-img','headPic')">
                                                <li class="col-xs-4 col-sm-3 col-md-2">
                                                    <a class="pic-add" id="add-pic-btn" href="javascript:void(0)" title="点击上传"></a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="form-group col-md-12">
                                        <label>身份证图片</label>
                                        <div class="form-controls">
                                            <ul class="list-inline clearfix lyear-uploads-pic" id="show-uploaded-pic">
                                                <#list item.cardImg?split(";") as img>
                                                    <li>
                                                        <figure>
                                                            <img src="/photo/view?filename=${img}" style="width: 100px; height:100px; margin-left: 4px"/>
                                                            <#if item.auditStatus==2>
                                                                <figcaption>
                                                                    <a class="btn btn-round btn-square btn-danger del-img-btn" href="javascript:void(0)"
                                                                       data-val="${img}"><i class="mdi mdi-delete"></i></a>
                                                                </figcaption>
                                                            </#if>
                                                        </figure>
                                                    </li>
                                                </#list>
                                                <input type="hidden" name="cardImg" id="cardImg" value="${item.cardImg}">
                                                <#if item.auditStatus==2>
                                                    <input type="file" id="select-file-card" style="display:none;" onchange="uploadPicture()">
                                                    <li class="col-xs-4 col-sm-3 col-md-2" id="card-upload">
                                                        <a class="pic-add" id="add-card-btn" href="javascript:void(0)" title="点击上传"></a>
                                                    </li>
                                                </#if>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="form-group col-md-12">
                                        <label>营业执照</label>
                                        <div class="form-controls">
                                            <ul class="list-inline clearfix lyear-uploads-pic">
                                                <li class="col-xs-4 col-sm-3 col-md-2">
                                                    <figure>
                                                        <#if item.tradingImg??>
                                                            <#if item.tradingImg?length gt 0>
                                                                <img src="/photo/view?filename=${item.tradingImg}" id="show-tradingImg-img">
                                                            <#else>
                                                                <img src="/admin/images/default-head.jpg" id="show-tradingImg-img" alt="默认头像">
                                                            </#if>
                                                        <#else>
                                                            <img src="/admin/images/default-head.jpg" id="show-tradingImg-img" alt="默认头像">
                                                        </#if>
                                                    </figure>
                                                </li>
                                                <input type="hidden" name="tradingImg" id="tradingImg" value="${item.tradingImg}" />
                                                <#if item.auditStatus==2>
                                                    <input type="file" id="select-file2" style="display:none;" onchange="upload2('show-tradingImg-img','tradingImg')" />
                                                    <li class="col-xs-4 col-sm-3 col-md-2">
                                                        <a class="pic-add" id="add-pic-btn2" href="javascript:void(0)" title="点击上传"></a>
                                                    </li>
                                                </#if>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="input-group m-b-10">
                                        <span class="input-group-addon">拍卖者名称</span>
                                        <input type="text" class="form-control" id="name" name="name" value="${item.name}" disabled/>
                                    </div>
                                    <div class="input-group m-b-10">
                                        <span class="input-group-addon">联系人</span>
                                        <input type="text" class="form-control required" id="legalPerson" name="legalPerson" value="${item.legalPerson}" placeholder="请输入联系人" tips="请填写联系人" />
                                    </div>
                                    <div class="input-group m-b-10">
                                        <span class="input-group-addon">手机号</span>
                                        <input type="text" class="form-control required" id="mobile" name="mobile"
                                               value="${item.mobile}" placeholder="请输入手机号" tips="请填写手机号" />
                                    </div>
                                    <div class="input-group m-b-10">
                                        <span class="input-group-addon">邮箱</span>
                                        <input type="text" class="form-control required" id="email" name="email"
                                               value="${item.email}" placeholder="请输入邮箱" tips="请填写邮箱" />
                                    </div>

                                    <div class="input-group m-b-10">
                                        <span class="input-group-addon">地址</span>
                                        <input type="text" class="form-control required" id="address" name="address" value="${item.address}"  placeholder="请输入地址"tips="请填写地址"/>
                                    </div>
                                    <div class="input-group m-b-10">
                                        <span class="input-group-addon">余额</span>
                                        <input type="number" class="form-control" disabled id="balance" name="balance" value="${item.balance}"/>
                                    </div>
                                    <div class="input-group m-b-10">
                                        <span class="input-group-addon">当前状态</span>
                                        <select name="auditStatus" class="form-control" disabled style="width: 10%;">
                                            <#list status as statu>
                                                <option value="${statu.getCode()}" <#if statu.getCode() == item.auditStatus>selected</#if> >${statu.getValue()}</option>
                                            </#list>
                                        </select>
                                        <#if item.auditStatus==2>
                                            <button type="button" class="btn btn-primary" id="view-describe" data-describe="${item.notPassReason!""}">查看原因</button>
                                        </#if>
                                    </div>
                                    <div class="input-group" style="margin-top:15px;margin-bottom:15px;padding-left:25px;">
                                        性别：
                                        <label class="lyear-radio radio-inline radio-primary" style="margin-left:30px;">
                                            <input type="radio" name="sex" value="1" <#if item.sex == 1> checked </#if> >
                                            <span>男</span>
                                            <label class="lyear-radio radio-inline radio-primary">
                                                <input type="radio" name="sex" value="2" <#if item.sex == 2> checked </#if>>
                                                <span>女</span>
                                                <label class="lyear-radio radio-inline radio-primary">
                                                    <input type="radio" name="sex" value="0" <#if item.sex == 0> checked </#if>>
                                                    <span>未知</span>
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
            if(!checkForm("info-add-form")){
                return;
            }
            var email = $("#email").val().trim();
            var mobile = $("#mobile").val().trim();
            //验证邮箱
            var checkEmail = /\w[-\w.+]*@([A-Za-z0-9][-A-Za-z0-9]+\.)+[A-Za-z]{2,14}/;
            if(!checkEmail.test(email)) {
                showErrorMsg("请输入正确的邮箱");
                return ;
            }
            //验证手机号
            var checkmobile = /^1[3|4|5|7|8]\d{9}$/;
            if(!checkmobile.test(mobile)) {
                showErrorMsg("请输入正确手机号")
                return ;
            }
            //验证身份证图片
            var tradingImg = $("#tradingImg").val().trim();
            var cardImg = $("#cardImg").val().trim();

            if(tradingImg == null || tradingImg.length == 0)
            {
                showErrorMsg("请上传营业执照");
                return ;
            }

            if(cardImg == null || cardImg.length == 0)
            {
                showErrorMsg("请上传身份证图片");
                return ;
            }

            if(cardImg.split(";").length != 2)
            {
                showErrorMsg("身份证正反面为两张图片");
                return ;
            }
            var data = $("#info-add-form").serialize();
            $.ajax({
                url:'info',
                type:'POST',
                data:data,
                dataType:'json',
                success:function(data){
                    if(data.code == 0){
                        showSuccessMsg('保存成功!',function(){
                            window.location.href = 'info';
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
        //监听营业执照按钮
        $("#add-pic-btn2").click(function(){
            $("#select-file2").click();
        });

        //监听
        $("#add-card-btn").click(function(){
            $("#select-file-card").click();
        });
    });
    function uploadPicture(){
        if($("#select-file-card").val() == '')return;
        var picture = document.getElementById('select-file-card').files[0];
        uploadPhoto(picture,function(data){
            var html = '<li class="col-xs-4 col-sm-3 col-md-2 show-img"><figure>';
            html += '<img src="/photo/view?filename='+data.data+'" alt="封面图片" style="height: 130px; width:100%;">'
            '</figure></li>';
            if($("#show-uploaded-pic>li.show-img").length > 0){
                $("#show-uploaded-pic>li.show-img:last").after(html);
            }else{
                $("#show-uploaded-pic").prepend(html);
            }
            var pictures = $("#cardImg").val() == '' ? '' : $("#cardImg").val() + ';';
            $("#cardImg").val( pictures + data.data);
        });
    }
    //监听删除图片
    $(".del-img-btn").click(function(){
        var pic = $(this).attr('data-val');
        var picture = $("#cardImg").val();
        picture = picture.replace(pic+';','');
        picture = picture.replace(';' + pic,'');
        picture = picture.replace(pic,'');
        $("#cardImg").val(picture);
        $(this).closest("li").remove();
    });

    $('#view-describe').on('click', function () {
        $.confirm({
            title: '原因',
            content: $(this).attr("data-describe"),
            type: 'orange',
            typeAnimated: false,
            buttons: {
                close: {
                    text: '关闭',
                }
            }
        });
    });
</script>
</body>
</html>