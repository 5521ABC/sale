<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"/>
    <title>${siteName!""}|竞价管理-${title!""}</title>
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
                                <form class="pull-right search-bar" method="get" action="list" role="form" style="max-width: 400px;">
                                    <div class="input-group">
                                        <div class="input-group-btn">
                                            <select name="projectCategory.id" class="form-control select" id="search-projectCategory" style="margin-right: 120px;">
                                                <option value="-1">--请选择分类--</option>
                                                <#list categoryList as category>
                                                     <option value="${category.id}" <#if currentCategory==category.id>selected</#if>>${category.name}</option>
                                                </#list>
                                            </select>
                                            <button class="btn btn-default dropdown-toggle" id="search-btn"
                                                    data-toggle="dropdown" type="button" aria-haspopup="true"
                                                    aria-expanded="false">
                                                商品名称 <span class="caret"></span>
                                            </button>
                                            <ul class="dropdown-menu">
                                                <li><a tabindex="-1" href="javascript:void(0)"
                                                       data-field="title">商品名称</a></li>
                                            </ul>
                                        </div>
                                        <input type="text" class="form-control" value="${name!""}" name="name"
                                               placeholder="请输入商品名称">
                                        <span class="input-group-btn">
                      <button class="btn btn-primary" type="submit">搜索</button>
                    </span>
                                    </div>
                                </form>
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
                                            <th class="thead-th">商品图片</th>
                                            <th class="thead-th">商品名称</th>
                                            <th class="thead-th">商品分类</th>
                                            <th class="thead-th">商品编号</th>
                                            <th class="thead-th">商品数量</th>
                                            <th class="thead-th">起拍价</th>
                                            <th class="thead-th">商品地址</th>
                                            <th class="thead-th">状态</th>
                                            <th class="thead-th">添加时间</th>
                                            <th class="thead-th">操作</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                      <#if pageBean.content?size gt 0>
                      <#list pageBean.content as project>
                      <tr class="tbody-tr">
                          <td style="vertical-align:middle;">
                              <label class="lyear-checkbox checkbox-primary">
                                  <input type="checkbox" name="ids[]" value="${project.id}">
                                  <span></span>
                              </label>
                          </td>
                          <td style="vertical-align:middle;">
                          <#if project.picture??>
                              <#if project.picture?length gt 0>
                                  <#list project.picture?split(";") as picture>
                                  <#if picture_index==0>
                                      <img src="/photo/view?filename=${picture}" width="130px" height="70px">
                                  </#if>
                                  </#list>
                              </#if>
                          <#else>
            <img src="/admin/images/default-head.jpg" width="130px" height="70px">
                          </#if>
                          </td>
                          <td style="vertical-align:middle;">${project.name!""}</td>
                          <td style="vertical-align:middle;">${project.projectCategory.name!""}</td>
                          <td style="vertical-align:middle;">${project.projectNumber!""}</td>
                          <td style="vertical-align:middle;">${project.quantity!""}</td>
                          <td style="vertical-align:middle;">${project.startPrice!""}</td>
                          <td style="vertical-align:middle;">${project.address!""}</td>
                          <td style="vertical-align:middle;color: goldenrod">
                                ${project.projectStatus.getValue()}
                          </td>
                          <td style="vertical-align:middle;"><font class="text-success">${project.createTime}</font></td>
                          <td>
                              <button class="btn btn-w-md btn-round btn-warning" type="button" data-pid="${project.id}" onclick="viewRecords(this)">查看竞价记录</button>
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
                  <li><a href="list?name=${name!""}&currentPage=1">«</a></li>
                  </#if>
                  <#list pageBean.currentShowPage as showPage>
                      <#if pageBean.currentPage == showPage>
                  <li class="active"><span>${showPage}</span></li>
                      <#else>
                  <li><a href="list?name=${name!""}&currentPage=${showPage}">${showPage}</a></li>
                      </#if>
                  </#list>
                  <#if pageBean.currentPage == pageBean.totalPage>
                  <li class="disabled"><span>»</span></li>
                  <#else>
                  <li><a href="list?name=${name!""}&currentPage=${pageBean.totalPage}">»</a></li>
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

    //查看商品详情
    function viewRecords(t) {
        var pid=$(t).attr("data-pid");
        window.location.href="record_list?biddingProject.id="+pid;
    }

</script>
</body>
</html>