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
                    <h3>充值中心</h3>
                </div>
                <hr>
                <form style="margin-bottom: 15px;">
                    <div class="row">
                        <div class="col-lg-6 form-group">
                            <label>充值金额</label>
                            <input type="number" class="form-control" min="1" max="1000000" name="balance"
                                   id="balance" placeholder="请输入充值金额" value="100"
                                   onkeyup="if(this.value.length==1){this.value=this.value.replace(/[^0-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}">
                        </div>
                    </div>
                    <button type="button" id="profile-balance" class="btn-custom" >确认充值</button>
                </form>
                <div class="acr-welcome-message">
                    <h3>充值记录</h3>
                </div>
                <div class="checkout-table">
                    <table class="mb-0">
                        <thead>
                        <tr>
                            <th>充值金额</th>
                            <th>充值时间</th>
                        </tr>
                        </thead>
                        <tbody>
                        <#if pageBean.getContent()?? && (pageBean.getContent()?size > 0)>
                        <#list pageBean.getContent() as record>
                             <tr>
                                 <td>${record.money}</td>
                                 <td>${record.createTime}</td>
                             </tr>
                        </#list>

                        <#else>
                         <tr>
                             <td colspan="2">您还没有充值记录！</td>
                         </tr>
                        </#if>
                        </tbody>

                    </table>
                </div>
                <#if pageBean.getContent()?? && (pageBean.getContent()?size > 0)>
                         <!-- Pagination Start -->
                <ul class="pagination">
    <#if pageBean.currentPage == 1>
        <li class="page-item" style="background-color: #ada9a9;"><a class="page-link" style="background-color: #ada9a9;"> <i
                class="fas fa-chevron-left"></i> </a></li>
    <#else>
         <li class="page-item"><a class="page-link" href="recharge?currentPage=${pageBean.currentPage-1}"> <i
                 class="fas fa-chevron-left"></i> </a></li>
    </#if>
                    <li class="page-item"><a class="page-link" href="recharge?currentPage=${pageBean.currentPage}">${pageBean.currentPage}</a>
                    </li>
                    <#if pageBean.currentPage+1 lte pageBean.totalPage>
                             <li class="page-item"><a class="page-link" href="recharge?currentPage=${pageBean.currentPage}">
                                 <i class="fas fa-chevron-right"></i> </a></li>
                    <#else>
                        <li class="page-item"><a class="page-link" style="background-color: #ada9a9;"> <i
                                class="fas fa-chevron-right"></i> </a></li>
                    </#if>
                </ul>
                <!-- Pagination End -->
                </#if>

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

    //充值中心
    $("#profile-balance").click(function(){
       var balance=$("#balance").val();
       if(balance==""){
           alert("充值金额不能为空");
           return;
       }
       $.post('confirm_recharge',{balance:balance},function(result){
           if(result.code==0){
               alert("充值成功");
               window.location.reload();
           }else{
               alert(result.msg);
           }
       });
    });
</script>
</body>

</html>
