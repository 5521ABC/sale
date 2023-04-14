<!DOCTYPE html>
<html lang="zh">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
<title>${siteName!""}|商品管理-编辑商品</title>
<#include "../common/header.ftl"/>
    <link href="/admin/datepicker/bootstrap-datetimepicker.css" rel="stylesheet">
    <link href="/admin/kindeditor/themes/default/default.css" type="text/css" rel="stylesheet">
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
              <div class="card-header"><h4>编辑商品</h4></div>
              <div class="card-body">
                <form id="project-edit-form" class="row">
                    <input  type="hidden" name="id" value="${biddingProject.id}"/>
                    <div class="form-group col-md-12">
                        <label>商品图片上传</label>
                        <div class="form-controls">
                            <ul class="list-inline clearfix lyear-uploads-pic" id="show-uploaded-pic">
                                <input type="hidden" name="picture" id="edit-picture" value="${biddingProject.picture}">
                                  <#if biddingProject.picture??>
                                      <#if biddingProject.picture?length gt 0>
                                          <#list biddingProject.picture?split(";") as picture>
                                                      <li class="col-xs-4 col-sm-3 col-md-2">
                                                          <figure>
                                                              <img src="/photo/view?filename=${picture}" width="130px" height="150px">
                                                              <figcaption>
                                                                  <a class="btn btn-round btn-square btn-danger del-img-btn" href="javascript:void(0)" data-val="${picture}"><i class="mdi mdi-delete"></i></a>
                                                              </figcaption>
                                                          </figure>
                                                      </li>
                                          </#list>
                                      </#if>
                                  <#else>
                                              <img src="/admin/images/default-head.jpg" width="130px" height="150px">
                                  </#if>
                                <input type="file" id="select-picture-file" style="display:none;"
                                       onchange="uploadPicture()">
                                <li class="col-xs-4 col-sm-3 col-md-2">
                                    <a class="pic-add" id="add-pic-btn" href="javascript:void(0)"
                                       title="点击上传"></a>
                                </li>
                            </ul>
                        </div>
                    </div>
                  <div class="input-group m-b-10">
                    <span class="input-group-addon">商品名称</span>
                    <input type="text" class="form-control required" id="edit-name" name="name" value="${biddingProject.name}" placeholder="请输入商品名称" tips="请填写商品名称" />
                </div>
                    <div class="input-group m-b-10">
                        <span class="input-group-addon">商品分类</span>
                        <select name="projectCategory.id" class="form-control select" id="edit-projectCategory" tips="请选择商品分类">
                            <option value="-1">--请选择商品分类--</option>
                                    	<#list projectCategoryList as projectCategory>
                                            <option value="${projectCategory.id}" <#if projectCategory.id==biddingProject.projectCategory.id>selected</#if>>${projectCategory.name}</option>
                                        </#list>
                        </select>
                    </div>
                    <div class="input-group m-b-10">
                        <div class="row">
                            <div class="col-xs-3">
                                <label>起拍价</label>
                                <input type="number" class="form-control required"
                                       id="edit-startPrice" onkeyup="if(this.value.length==1){this.value=this.value.replace(/[^0-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}"
                                       name="startPrice" autocomplete="off" min="0" max="10000" value="${biddingProject.startPrice!""}"
                                       placeholder="请填写起拍价" tips="请填写起拍价" >
                            </div>
                            <div class="col-xs-3">
                                <label>商品数量</label>
                                <input type="number" class="form-control required" id="edit-quantity" name="quantity" value="${biddingProject.quantity!""}" placeholder="请输入商品数量" tips="请填写商品数量"  onkeyup="if(this.value.length==1){this.value=this.value.replace(/[^0-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}"/>
                            </div>
                            <div class="col-xs-6">
                                <label>商品地址</label>
                                <input type="text" class="form-control required"
                                       id="add-address"
                                       name="address" autocomplete="off" value="${biddingProject.address}"
                                       placeholder="请选择商品地址" tips="请选择商品地址">
                            </div>
                            <div class="col-xs-3">
                                <label>最低信用分</label>
                                <input type="number"class="form-control required"  min="0" maxlength="3" max="100"  id="edit-credit"  name="credit" value="${biddingProject.credit!""}" placeholder="请输入最低信用分" tips="请填写最低信用分"  onkeyup="if(this.value.length==1){this.value=this.value.replace(/[^0-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}"/>
                            </div>
                            <div class="col-xs-6">
                                <label>付款方式</label>
                                <input type="text" class="form-control required"
                                       id="edit-paymentMethod"
                                       name="paymentMethod" autocomplete="off" value="${biddingProject.paymentMethod}"
                                       placeholder="请填写付款方式" tips="请填写付款方式">
                            </div>
                        </div>
                    </div>

                    <div class="input-group m-b-10">
                        <div class="row">
                            <div class="col-xs-3">
                                <label>报名开始时间</label>
                                <input type="text" class="form-control datepicker-time"
                                       id="edit-startTime"
                                       name="startTime" autocomplete="off" value="${biddingProject.startTime!""}"
                                       placeholder="请选择报名开始时间" tips="请选择报名开始时间"readonly>
                            </div>
                            <div class="col-xs-3">
                                <label>报名结束时间</label>
                                <input type="text" class="form-control datepicker-time"
                                       id="edit-endTime"
                                       name="endTime" autocomplete="off" value="${biddingProject.endTime!""}"
                                       placeholder="请选择报名结束时间" tips="请选择报名结束时间" readonly>
                            </div>
                            <div class="col-xs-3">
                                <label>竞拍开始时间</label>
                                <input type="text" class="form-control datepicker-time"
                                       id="edit-biddingStartTime" value="${biddingProject.biddingStartTime!""}"
                                       name="biddingStartTime" autocomplete="off"
                                       placeholder="请选择竞拍开始时间" tips="请选择竞拍开始时间" readonly>
                            </div>
                            <div class="col-xs-3">
                                <label>竞拍结束时间</label>
                                <input type="text" class="form-control datepicker-time"
                                       id="edit-biddingEndTime"
                                       name="biddingEndTime" autocomplete="off" value="${biddingProject.biddingEndTime!""}"
                                       placeholder="请选择竞拍结束时间" tips="请选择竞拍结束时间" readonly>
                            </div>
                        </div>
                    </div>
                    <div class="input-group m-b-10" >
                        <span class="input-group-addon">详情描述</span>
                        <textarea style="width:auto;height:250px" id="edit-describes"
                                  name="describes">${biddingProject.describes!""}</textarea>
                    </div>
                  <div class="form-group col-md-12">
                    <button type="button" class="btn btn-primary ajax-post" id="edit-form-submit-btn">确 定</button>
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
<script src="/admin/Distpicker/js/distpicker.data.js"></script>
<script src="/admin/Distpicker/js/distpicker.js"></script>
<script src="/admin/Distpicker/js/main.js"></script>
<script src="/admin/js/bootstrap-datetimepicker/moment.min.js"></script>
<script type="text/javascript" src="/admin/datepicker/bootstrap-datetimepicker.js"></script>
<script type="text/javascript" src="/admin/js/datetimepicker.js"></script>
<script type="text/javascript" charset="utf-8" src="/admin/kindeditor/kindeditor-all-min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
    //富文本
    kindeditor("edit-describes");
	//提交按钮监听事件
	$("#edit-form-submit-btn").click(function(){
	   var picture=$("#picture").val();
        if(picture==""){
            showWarningMsg("商品图片不能为空");
            return;
        }
        if($("#edit-projectCategory").val()==-1){
            showWarningMsg("请选择商品分类");
            return;
        }
		if(!checkForm("project-edit-form")){
			return;
		}
        if(!checkDateTime(".form-control.datepicker-time")){
            return;
        }
       var  describes=$("#edit-describes").val().trim();
        if(describes==""){
            showWarningMsg("请填写商品详情");
            return;
        }
        if(describes.length<50){
            showWarningMsg("商品描述至少为50个字");
            return;
        }
        if(describes.length>2000){
            showWarningMsg("商品描述最多为2000个字");
            return;
        }
        $("#edit-describes").val(describes);
		var data = $("#project-edit-form").serialize();
		$.ajax({
			url:'edit',
			type:'POST',
			data:data,
			dataType:'json',
			success:function(data){
				if(data.code == 0){
					showSuccessMsg('商品编辑成功!',function(){
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
});

//监听上传图片按钮
$("#add-pic-btn").click(function () {
    $("#select-picture-file").click();
});
//封面图片上传
function uploadPicture() {
    if ($("#select-picture-file").val() == '') return;
    var picture = document.getElementById('select-picture-file').files[0];
    uploadPhoto(picture, function (data) {
        var html = '<li class="col-xs-4 col-sm-3 col-md-2 show-img"><figure>';
        html += '<img src="/photo/view?filename=' + data.data + '" alt="封面图片" width="130px" height="150px"></figure></li>';
        if ($("#show-uploaded-pic>li.show-img").length > 0) {
            $("#show-uploaded-pic>li.show-img:last").after(html);
        } else {
            $("#show-uploaded-pic").prepend(html);
        }
        var pictures = $("#edit-picture").val() == '' ? '' : $("#edit-picture").val() + ';';
        $("#edit-picture").val(pictures + data.data);
    });
}


//监听删除图片
$(".del-img-btn").click(function(){
    var pic = $(this).attr('data-val');
    var picture = $("#edit-picture").val();
    picture = picture.replace(pic+';','');
    picture = picture.replace(';' + pic,'');
    picture = picture.replace(pic,'');
    $("#edit-picture").val(picture);
    $(this).closest("li").remove();
});
</script>
</body>
</html>