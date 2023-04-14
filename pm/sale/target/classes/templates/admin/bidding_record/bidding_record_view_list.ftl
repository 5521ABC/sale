<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"/>
    <title>${siteName!""}|竞拍管理-${title!""}</title>
<#include "../common/header.ftl"/>
    <style>
        td {
            vertical-align: middle;
        }
        .thead-th {
            text-align: center;
        }
        .tbody-tr {
            text-align: center;
        }
    </style>
</head>

<body>
<div class="lyear-layout-web">
    <div class="lyear-layout-container">
        <!--左侧导航-->
        <aside class="lyear-layout-sidebar">

            <!-- logo -->
            <div id="logo" class="sidebar-header">
                <a href="/system/index"><img src="/admin/images/logo-sidebar.png" title="${siteName!""}"
                                          alt="${siteName!""}"/></a>
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
                            <div class="card-toolbar clearfix">

                <#include "../common/third-menu.ftl"/>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered">
                                        <thead>
                                        <tr>
                                            <th>
                                                <label class="lyear-checkbox checkbox-primary">
                                                    <input type="checkbox" id="check-all"><span></span>
                                                </label>
                                            </th>
                                            <th class="thead-th">竞拍价格</th>
                                            <th class="thead-th">竞拍数量</th>
                                            <th class="thead-th">用户名称</th>
                                            <th class="thead-th">用户联系方式</th>
                                            <th class="thead-th">用户信用分</th>
                                            <th class="thead-th">收货地址</th>
                                            <th class="thead-th">竞拍时间</th>
                                            <th class="thead-th">操作</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                      <#if pageBean.content?size gt 0>
                      <#list pageBean.content as record>
                      <tr class="tbody-tr">
                          <td style="vertical-align:middle;">
                              <label class="lyear-checkbox checkbox-primary">
                                  <input type="checkbox" name="ids[]" value="${record.id}">
                                  <span></span>
                              </label>
                          </td>
                          <td style="vertical-align:middle;">${record.bid!""}</td>
                          <td style="vertical-align:middle;">${record.quantity}</td>
                          <td style="vertical-align:middle;">${record.account.username}</td>
                          <td style="vertical-align:middle;">${record.account.mobile}</td>
                          <td style="vertical-align:middle;">${record.account.creditScore}</td>
                          <td style="vertical-align:middle;">${record.account.address!""}</td>
                          <td style="vertical-align:middle;">${record.account.createTime}</td>
                          <td>
                              <#if record.payStatus==2>
                                <#if record.biddingStatus==1>
                                <button class="btn btn-label btn-info" type="button" data-id="${record.id}" data-accountId="${record.account.id}" onclick="overdue(this)"><label><i class="mdi mdi-checkbox-marked-circle-outline"></i></label> 确认逾期</button>
                                <#else>
                                 <button class="btn btn-dark btn-w-md disabled" type="button">已流局</button>
                                </#if>
                              <#else>
                              <button class="btn btn-label btn-primary" type="button" data-rid="${record.id}" onclick="transactionProject(this)"><label><i class="mdi mdi-checkbox-marked-circle-outline"></i></label> 确认交易</button>
                              </#if>
                          </td>
                      </tr>
                      </#list>
                      <#else>
                    <tr align="center">
                        <td colspan="10">这里空空如也！</td>
                    </tr>
                      </#if>
                                        </tbody>
                                    </table>
                                </div>
                <#if pageBean.total gt 0>
                <ul class="pagination">
                  <#if pageBean.currentPage == 1>
                  <li class="disabled"><span>«</span></li>
                  <#else>
                  <li><a href="record_list?currentPage=1">«</a></li>
                  </#if>
                  <#list pageBean.currentShowPage as showPage>
                      <#if pageBean.currentPage == showPage>
                  <li class="active"><span>${showPage}</span></li>
                      <#else>
                  <li><a href="record_list?currentPage=${showPage}">${showPage}</a></li>
                      </#if>
                  </#list>
                  <#if pageBean.currentPage == pageBean.totalPage>
                  <li class="disabled"><span>»</span></li>
                  <#else>
                  <li><a href="record_list?currentPage=${pageBean.totalPage}">»</a></li>
                  </#if>
                    <li><span>共${pageBean.totalPage}页,${pageBean.total}条数据</span></li>
                </ul>
                </#if>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        <!--End 页面主要内容-->
    </div>
</div>
<div class="modal" id="viewProjectDetail" tabindex="-1" role="dialog" aria-labelledby="viewRegistratition">
    <div class="modal-dialog" role="document">
        <div class="modal-content" style="width:1000px;border: 1px solid #b1acac;">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">商品详情</h4>
            </div>
            <div class="projet-body" id="projet-body">

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            </div>
        </div>
    </div>
</div>
<#include "../common/footer.ftl"/>
<script type="text/javascript" src="/admin/js/perfect-scrollbar.min.js"></script>
<script type="text/javascript" src="/admin/js/main.min.js"></script>
<script type="text/javascript">

    //确认交易操作
  function transactionProject(t){
      var rid=$(t).attr("data-rid");
          $.confirm({
              title: '警告',
              content: '请认真考虑是否确定交易',
              type: 'orange',
              typeAnimated: false,
              buttons: {
                  ok: {
                      text: '确认',
                      action: function(){
                         $.post('transaction',{rid:rid},function(result){
                            if(result.code==0){
                                showSuccessMsg("确认交易成功!",function () {
                                    location.href="list";
                                });
                            }else{
                                showErrorMsg(result.msg);
                            }
                          });
                      }
                  },
                  close: {
                      text: '关闭',
                  }
              }
          });
  }


    //逾期操作
    function overdue(t){
        var accountId=$(t).attr("data-accountId");
        var recordId=$(t).attr("data-id");
        $.confirm({
            title: '警告',
            content: '确认逾期吗?这样会使用户减少信用分的哦！考虑一下哦',
            type: 'red',
            typeAnimated: false,
            buttons: {
                ok: {
                    text: '确认',
                    action: function(){
                        $.post('overdue',{accountId:accountId,recordId:recordId},function(result){
                            if(result.code==0){
                                showSuccessMsg("逾期操作成功!",function () {
                                    location.href="list";
                                });
                            }else{
                                showErrorMsg(result.msg);
                            }
                        });
                    }
                },
                close: {
                    text: '关闭',
                }
            }
        });
    }
</script>
</body>
</html>