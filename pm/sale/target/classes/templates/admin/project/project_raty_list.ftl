<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"/>
    <title>${siteName!""}|商品管理-${title!""}</title>
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
                                <form class="pull-right search-bar" role="form" style="max-width: 400px;">

                                </form>
                <#include "../common/third-menu.ftl"/>
                            </div>
                            <div class="card-body">

                                <div class="table-responsive">
                                    <table class="table table-bordered">
                                        <thead>
                                        <tr>
                                            <th class="thead-th">评价用户</th>
                                            <th class="thead-th">给予评分</th>
                                            <th class="thead-th">评价内容</th>
                                            <th class="thead-th">评价时间</th>
                                            <th class="thead-th">回复内容</th>
                                            <th class="thead-th">操作</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                      <#if pageBean.content?size gt 0>
                      <#list pageBean.content as rate>
                      <tr class="tbody-tr">
                          <td style="vertical-align:middle;">${rate.account.username!""}</td>
                          <td style="vertical-align:middle;">
                              ${rate.rate!""}
                          </td>
                          <td style="vertical-align:middle;">${rate.content!""}</td>
                          <td style="vertical-align:middle;">${rate.createTime!""}</td>
                          <td style="vertical-align:middle;">${rate.reply!""}</td>
                          <td>
                              <#if rate.reply??>
                                  <span>已回复</span>
                                  <#else>
                               <button class="btn btn-w-md btn-round btn-warning" data-id="${rate.id}" onclick="replayRate(this)" type="button">回复</button>
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
                <ul class="pagination ">
                  <#if pageBean.currentPage == 1>
                  <li class="disabled"><span>«</span></li>
                  <#else>
                  <li><a href="view_raty?currentPage=1">«</a></li>
                  </#if>
                  <#list pageBean.currentShowPage as showPage>
                      <#if pageBean.currentPage == showPage>
                  <li class="active"><span>${showPage}</span></li>
                      <#else>
                  <li><a href="view_raty?currentPage=${showPage}">${showPage}</a></li>
                      </#if>
                  </#list>
                  <#if pageBean.currentPage == pageBean.totalPage>
                  <li class="disabled"><span>»</span></li>
                  <#else>
                  <li><a href="view_raty?currentPage=${pageBean.totalPage}">»</a></li>
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
<div class="modal" id="ratyReply" tabindex="-1" role="dialog" aria-labelledby="ratyReply">
    <div class="modal-dialog" role="document">
        <div class="modal-content" style="width:1000px;border: 1px solid #b1acac;">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">回复</h4>
            </div>
            <div class="projet-body" id="projet-body">
                   <input type="hidden" id="raty-id" name="id"/>
                <div class="form-group">
                    <label for="exampleFormControlTextarea1">评价内容</label>
                    <textarea class="form-control" id="add-reply" name="reply" rows="3"></textarea>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="reply-save">确认回复</button>
            </div>
        </div>
    </div>
</div>
<#include "../common/footer.ftl"/>
<script type="text/javascript" src="/admin/js/perfect-scrollbar.min.js"></script>
<script type="text/javascript" src="/admin/js/main.min.js"></script>
<script type="text/javascript">

    //回复评价内容
    function replayRate(t) {
        $("#raty-id").val($(t).attr("data-id"));
        $("#ratyReply").modal("show");
    }

    //回复保存
    $("#reply-save").click(function(){
        var content=$("#add-reply").val();
        var id=$("#raty-id").val();
        ajaxRequest('view_raty','POST',{rid:id,content:content},function(result){
            if(result.code==0){
                showSuccessMsg("回复成功!");
                location.reload();
            }else{
                showErrorMsg(result.msg);
            }
        })
    });

</script>
</body>
</html>