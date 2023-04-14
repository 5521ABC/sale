<!DOCTYPE html>
<html lang="zh">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
<title>${siteName!""}|商品管理-添加商品</title>
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
              <div class="card-header"><h4>添加商品</h4></div>
              <div class="card-body">
                <form id="category-add-form" class="row">
                    <div class="form-group col-md-12">
                        <label>商品图片上传</label>
                        <div class="form-controls">
                            <ul class="list-inline clearfix lyear-uploads-pic" id="show-uploaded-pic">

                                <input type="hidden" name="picture" id="picture">
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
                    <input type="text" class="form-control required" id="name" name="name" value="" placeholder="请输入商品名称" tips="请填写商品名称" />
                </div>
                    <div class="input-group m-b-10">
                        <span class="input-group-addon">商品分类</span>
                        <select name="projectCategory.id" class="form-control select" id="add-projectCategory" tips="请选择商品分类">
                            <option value="-1">--请选择商品分类--</option>
                                    	<#list projectCategoryList as projectCategory>
                                            <option value="${projectCategory.id}">${projectCategory.name}</option>
                                        </#list>
                        </select>
                    </div>
                    <div class="input-group m-b-10">
                        <div class="row">
                            <div class="col-xs-3">
                                <label>起拍价</label>
                                <input type="number" class="form-control required"
                                       id="add-startPrice" onkeyup="if(this.value.length==1){this.value=this.value.replace(/[^0-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}"
                                       name="startPrice" autocomplete="off" min="0" max="10000"
                                       placeholder="请填写起拍价" tips="请填写起拍价" >
                            </div>
                            <div class="col-xs-3">
                                <label>商品数量</label>
                                <input type="number" class="form-control required" id="quantity" name="quantity" value="" placeholder="请输入商品数量" tips="请填写商品数量"  onkeyup="if(this.value.length==1){this.value=this.value.replace(/[^0-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}"/>
                            </div>
                            <div class="col-xs-6">
                                <label>商品地址</label>
                                <input type="text" class="form-control required"
                                       id="add-address"
                                       name="address" autocomplete="off"
                                       placeholder="请选择商品地址" tips="请选择商品地址">
                            </div>
                            <div class="col-xs-3">
                                <label>最低信用分</label>
                                <input type="number"class="form-control required"  min="0" maxlength="3" max="100"  id="add-credit"  name="credit" value="" placeholder="请输入最低信用分" tips="请填写最低信用分"  onkeyup="if(this.value.length==1){this.value=this.value.replace(/[^0-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}"/>
                            </div>
                            <div class="col-xs-6">
                                <label>付款方式</label>
                                <input type="text" class="form-control required"
                                       id="add-paymentMethod"
                                       name="paymentMethod" autocomplete="off"
                                       placeholder="请填写付款方式" tips="请填写付款方式">
                            </div>
                        </div>
                    </div>

                    <div class="input-group m-b-10">
                        <div class="row">
                            <div class="col-xs-3">
                                <label>报名开始时间</label>
                                <input type="text" class="form-control datepicker-time"
                                       id="add-startTime"
                                       name="startTime" autocomplete="off"
                                       placeholder="请选择报名开始时间" tips="请选择报名开始时间"readonly>
                            </div>
                            <div class="col-xs-3">
                                <label>报名结束时间</label>
                                <input type="text" class="form-control datepicker-time"
                                       id="add-endTime"
                                       name="endTime" autocomplete="off"
                                       placeholder="请选择报名结束时间" tips="请选择报名结束时间" readonly>
                            </div>
                            <div class="col-xs-3">
                                <label>竞拍开始时间</label>
                                <input type="text" class="form-control datepicker-time"
                                       id="add-biddingStartTime"
                                       name="biddingStartTime" autocomplete="off"
                                       placeholder="请选择竞拍开始时间" tips="请选择竞拍开始时间" readonly>
                            </div>
                            <div class="col-xs-3">
                                <label>竞拍结束时间</label>
                                <input type="text" class="form-control datepicker-time"
                                       id="add-biddingEndTime"
                                       name="biddingEndTime" autocomplete="off"
                                       placeholder="请选择竞拍结束时间" tips="请选择竞拍结束时间" readonly>
                            </div>
                        </div>
                    </div>
                    <div class="input-group m-b-10" >
                        <span class="input-group-addon">详情描述</span>
                        <textarea style="width:auto;height:250px" id="add-describes"
                                  name="describes"></textarea>
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
    kindeditor("add-describes");
	//提交按钮监听事件
	$("#add-form-submit-btn").click(function(){
	   var picture=$("#picture").val();
        if(picture==""){
            showWarningMsg("商品图片不能为空");
            return;
        }
        if($("#add-projectCategory").val()==-1){
            showWarningMsg("请选择商品分类");
            return;
        }
		if(!checkForm("category-add-form")){
			return;
		}
        if(!checkDateTime(".form-control.datepicker-time")){
            return;
        }
        var describes=$("#add-describes").val().trim();
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
        $("#add-describes").val(describes);
		var data = $("#category-add-form").serialize();
		$.ajax({
			url:'add',
			type:'POST',
			data:data,
			dataType:'json',
			success:function(data){
				if(data.code == 0){
					showSuccessMsg('商品添加成功!',function(){
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
        var pictures = $("#picture").val() == '' ? '' : $("#picture").val() + ';';
        $("#picture").val(pictures + data.data);
    });
}

function kindeditor(name){
    KindEditor.ready(function (K) {
        K.create('#'+name, {
            uploadJson: '/upload/uploadFile',
            filePostName: 'imgFile',
            allowFileManager: true,
            allowImageUpload: true,
            width: '100%',  //编辑器的宽
            height: '460px',  //编辑器的高
            items: ['fontname', 'fontsize', 'forecolor', 'hilitecolor', 'bold',
                'italic', 'underline', 'removeformat', 'justifyleft', 'justifycenter', 'justifyright',
                'insertorderedlist', 'insertunorderedlist', 'emoticons', 'image'
            ],
            afterBlur: function () {
                this.sync();
            },
            allowImageRemote: false,
            afterUpload: function (url, data, name) { //上传文件后执行的回调函数，必须为3个参数
                if (name == "image" || name == "multiimage") { //单个和批量上传图片时
                    var img = new Image();
                    img.src = url;
                    img.onload = function () {
                    }
                }
            }
        });
    });
}
</script>
</body>
</html>