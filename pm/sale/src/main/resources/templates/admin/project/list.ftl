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
                                            <#if type==1>
                                                  <th>
                                                      拍卖者名称
                                                  </th>
                                            </#if>
                                            <th class="thead-th">商品图片</th>
                                            <th class="thead-th">商品名称</th>
                                            <th class="thead-th">商品分类</th>
                                            <th class="thead-th">商品编号</th>
                                            <th class="thead-th">商品数量</th>
                                            <th class="thead-th">起拍价</th>
                                            <th class="thead-th">商品地址</th>
                                            <th class="thead-th">状态</th>
                                            <th class="thead-th">添加时间</th>
                                            <#if type==2>
                                                      <th class="thead-th">操作</th>
                                            </#if>
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
                           <#if type==1>
                            <td style="vertical-align:middle;">${project.organization.name!""}</td>
                           </#if>
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
                          <td style="vertical-align:middle;"><font class="text-success">${project.createTime}</font>
                          </td>
                          <#if type==2>
                               <td>
                             <#if project.projectStatus.getCode()==0>
                                 <button class="btn btn-danger btn-w-md" type="button" data-id="${project.id}"
                                         onclick="loadAndUnload(this,'load')">上架
                                 </button>
                             <#else>
                              <button class="btn btn-danger btn-w-md" type="button" disabled>上架</button>
                                 <#if project.projectStatus.getCode()==1 || project.projectStatus.getCode()==3>
                                       <button class="btn btn-danger btn-w-md" type="button"
                                               data-id="${project.id}" onclick="loadAndUnload(this,'unload')">下架
                                       </button>
                                 </#if>
                                 <#if project.projectStatus.getCode()==2>
                                    <button class="btn btn-cyan btn-w-md" type="button" data-reason="${project.reason!""}" onclick="viewReason(this)">查看拒绝原因</button>
                                 </#if>
                             </#if>
                               </td>
                          </#if>

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
    function del(url) {
        if ($("input[type='checkbox']:checked").length != 1) {
            showWarningMsg('请选择一条数据进行删除！');
            return;
        }
        if ($("input[type='checkbox'][name='checkAll']:checked").length != 0) {
            showWarningMsg('请选择一条数据进行删除！');
            return;
        }
        var id = $("input[type='checkbox']:checked").val();
        $.confirm({
            title: '确定删除？',
            content: '删除后数据不可恢复，请慎重！',
            buttons: {
                confirm: {
                    text: '确认',
                    action: function () {
                        deleteReq(id, url);
                    }
                },
                cancel: {
                    text: '关闭',
                    action: function () {

                    }
                }
            }
        });
    }

    //打开编辑页面
    function edit(url) {
        if ($("input[type='checkbox']:checked").length != 1) {
            showWarningMsg('请选择一条数据进行编辑！');
            return;
        }
        if ($("input[type='checkbox'][name='checkAll']:checked").length != 0) {
            showWarningMsg('请选择一条数据进行编辑！');
            return;
        }
        window.location.href = url + '?id=' + $("input[type='checkbox']:checked").val();
    }

    //查看评论
    function viewRaty(url){
        if ($("input[type='checkbox']:checked").length != 1) {
            showWarningMsg('请选择一条数据进行查看！');
            return;
        }
        if ($("input[type='checkbox'][name='checkAll']:checked").length != 0) {
            showWarningMsg('请选择一条数据进行查看！');
            return;
        }
        window.location.href = url + '?biddingProject.id=' + $("input[type='checkbox']:checked").val();
    }

    //调用删除方法
    function deleteReq(id, url) {
        $.ajax({
            url: url,
            type: 'POST',
            data: {id: id},
            dataType: 'json',
            success: function (data) {
                if (data.code == 0) {
                    showSuccessMsg('商品删除成功!', function () {
                        $("input[type='checkbox']:checked").parents("tr").remove();
                    })
                } else {
                    showErrorMsg(data.msg);
                }
            },
            error: function (data) {
                alert('网络错误!');
            }
        });
    }

    //查看商品详情
    function viewProject(url) {
        var checked = $("input[type='checkbox']:checked");
        if (checked.length != 1) {
            showWarningMsg('请选择一条数据进行查看详情！');
            return;
        }
        $.get("project_detail", {id: checked.val()}, function (result) {
            $(".projet-body").empty();
            $(".projet-body").html(result);
            $('#viewProjectDetail').modal('show');
        });
    }

    //审核
    function approved(url) {
        var checked = $("input[type='checkbox']:checked");
        if (checked.length != 1) {
            showWarningMsg('请选择一条数据进行审核！');
            return;
        }
        $.confirm({
            title:"项目审核",
            content: '' +
            '<form action="" class="formName">' +
            '<div class="form-group">' +
            '<label>(选填)具体理由</label>' +
            '<textarea type="text"  placeholder="请填写具体理由" class="form-control notPassReason" style="height:120px;"></textarea>' +
            '</div>' +
            '</form>',
            buttons: {
                formSubmit: {
                    text: '提交',
                    btnClass: 'btn-blue',
                    action: function () {
                        var reason = this.$content.find('.notPassReason').val();
                        var uri = url + "&id=" + checked.val()+"&reason="+reason;
                        ajaxRequest(uri, "POST", {}, function (result) {
                            if(result.code==0){
                                //表示成功
                                showSuccessMsg('审核成功!', function () {
                                    window.location.href = 'list';
                                })
                            }else{
                                showErrorMsg(result.msg);
                            }
                        });
                    }
                },
                cancel: {
                    text: '取消'
                }
            }
        });
    }

    //查看拒绝原因
    function viewReason(t){
        var reason=$(t).attr("data-reason");
        $.alert({
            title: '查看拒绝原因',
            content: reason,
            buttons: {
                cancel: {
                    text: '关闭',
                    action: function () {
                    }
                }
            }
        });
    }


    //上下架
    function loadAndUnload(t,type) {
        var id = $(t).attr("data-id");
        ajaxRequest("load_and_unload", "POST", {id: id,type:type}, function (result) {
            if (result.code == 0) {
                showSuccessMsg('商品操作成功!', function () {
                    window.location.href = 'list';
                })
            } else {
                showErrorMsg(data.msg);
            }
        });
    }
</script>
</body>
</html>