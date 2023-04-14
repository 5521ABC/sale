<!DOCTYPE html>
<html lang="en" dir="ltr">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>竞拍商品列表</title>
  <#include "../common/header.ftl"/>
</head>

<body>
<#include "../common/header-menu.ftl"/>

<!-- Subheader Start -->
<div class="subheader bg-cover bg-center dark-overlay" style="background-image: url('/home/assets/img/subheader.jpg')">
    <div class="container">
        <div class="subheader-inner">
            <h1 class="text-white">商品列表</h1>
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="/home/index/index"> <i class="fas fa-home"></i> </a></li>
                    <li class="breadcrumb-item"><a href="/home/index/index">首页</a></li>
                    <li class="breadcrumb-item active" aria-current="page">商品列表</li>
                </ol>
            </nav>
        </div>
    </div>
</div>
<!-- Subheader End -->

<!-- Jewelry    Start -->
<div class="section">
    <div class="container">
        <div class="row">
            <!-- Sidebar Start -->
            <div class="col-lg-4">
                <div class="sidebar sidebar-left">
                    <div class="sidebar-widget">
                        <form method="get" action="list">
                            <h5>搜索</h5>
                            <div class="search-wrapper">
                                <input type="text" class="form-control" placeholder="搜索" name="name" value="${projectName!""}">
                                <button type="submit" class="btn-custom"><i class="far fa-search"></i></button>
                            </div>
                        </form>
                    </div>
                    <div class="sidebar-widget">
                        <div class="acr-collapse-trigger acr-custom-chevron-wrapper">
                            <h5>查询条件</h5>
                            <div class="acr-custom-chevron">
                                <span></span>
                                <span></span>
                            </div>
                        </div>
                        <div class="acr-collapsable">
                            <div class="acr-filter-form">
                                <form method="get" action="list">
                                    <div class="acr-custom-select form-group">
                                        <label>商品状态: </label>
                                        <select class="acr-select2" name="projectStatus">
                                            <option value="NOSELECTED">所有状态</option>
                                          <#list projectStatus as status>
                                              <option value="${status}" <#if currentStatus.getCode()==status.getCode()>selected</#if>>${status.getValue()}</option>
                                          </#list>
                                        </select>
                                    </div>
                                    <div class="acr-custom-select form-group">
                                        <label>商品分类: </label>
                                        <select class="acr-select2" name="projectCategory.id">
                                            <option value="-1">所有商品分类</option>
                                          <#list  projectCategoryList as category>
                                              <option value="${category.id}" <#if currentCategory=category.id>selected</#if> label="Type">${category.name}</option>
                                          </#list>
                                        </select>
                                    </div>
                                    <button type="submit" class="btn-block btn-custom" >确认搜索</button>
                                </form>
                            </div>
                        </div>

                    </div>

                    <div class="sidebar-widget">
                        <div class="acr-collapse-trigger acr-custom-chevron-wrapper">
                            <h5>最近的商品</h5>
                            <div class="acr-custom-chevron">
                                <span></span>
                                <span></span>
                            </div>
                        </div>
                        <div class="acr-collapsable">
                            <#if newProjectTop4??>
                                <#list newProjectTop4 as project>
                                     <!-- Product Start -->
                                <div class="product product-list">
                                    <div class="product-thumbnail" style="height: 90px;">
                                        <a href="/home/project/detail?id=${project.id}">
                                             <#if project.picture??>
                                                 <#if project.picture?length gt 0>
                                                     <#list project.picture?split(";") as picture>
                                                         <#if picture_index==0>
                                      <img src="/photo/view?filename=${picture}" alt="product" width="290px"
                                           height="193px">
                                                         </#if>
                                                     </#list>
                                                 </#if>
                                             <#else>
            <img src="/admin/images/default-head.jpg" width="130px" height="70px">
                                             </#if>
                                        </a>
                                    </div>
                                    <div class="product-body">
                                        <h6 class="product-title"><a href="/home/project/detail?id=${project.id}"
                                                                     title="Blue Blast">${project.name}</a></h6>
                                        <span class="product-price">${project.startPrice!""}$</span>
                                        <span>浏览次数：${project.viewsNumber}</span>
                                    </div>
                                </div>
                                <!-- Product End -->
                                </#list>
                            <#else>
                                      <!-- Product Start -->
                                <div class="product product-list">
                                    <div class="product-thumbnail" style="height: 90px;">
                                        <a>
                                            <img src="/home/images/depressed.jpg" width="130px" height="70px">
                                        </a>
                                    </div>
                                    <div class="product-body">
                                        <h6 class="product-title"><a title="Blue Blast">暂无该商品</a></h6>
                                    </div>
                                </div>
                            </#if>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Sidebar End -->

            <!-- Posts Start -->
            <div class="col-lg-8">
                <#if pageBean.getContent()?? && (pageBean.getContent()?size > 0)>
                    <#list pageBean.getContent() as project>
                     <!-- Product Start -->
                <div class="product product-list">
                    <div class="product-thumbnail">
                        <a href="/home/project/detail?id=${project.id}">
                             <#if project.picture??>
                                 <#if project.picture?length gt 0>
                                     <#list project.picture?split(";") as picture>
                                         <#if picture_index==0>
                                      <img src="/photo/view?filename=${picture}" alt="product" width="290px"
                                           height="193px">
                                         </#if>
                                     </#list>
                                 </#if>
                             <#else>
            <img src="/admin/images/default-head.jpg" width="130px" height="70px">
                             </#if>
                        </a>
                        <div class="product-badges">
                            <span class="product-badge stock">${project.projectStatus.getValue()}</span>
                        </div>
                    </div>
                    <div class="product-body">
                        <h5 class="product-title">
                            <a href="/home/project/detail?id=${project.id}" title="Blue Blast">
                                ${project.name}
                            </a>
                        </h5>
                        <span class="product-price">${project.startPrice!""}$ </span>
                        <span>浏览次数：${project.viewsNumber}</span>
                        <p class="product-text">
                             <#if project.describes?length lt 20>
                                 ${project.describes}
                             <#else>
                                 ${(project.describes?substring(0,19))}...
                             </#if>
                        </p>
                        <div class="product-gallery-wrapper">
                            <a href="/home/project/detail?id=${project.id}" class="btn-custom btn-sm secondary">参与竞拍</a>
                        </div>
                    </div>
                </div>
                <!-- Product End -->
                    </#list>
                <#else>
                         <!-- Product Start -->
                                <div class="product product-list">
                                    <div class="product-thumbnail" style="height: 90px;">
                                        <a>
                                            <img src="/home/images/depressed.jpg" width="130px" height="70px">
                                        </a>
                                    </div>
                                    <div class="product-body">
                                        <h6 class="product-title"><a title="Blue Blast">未找到相对应的商品</a></h6>
                                    </div>
                                </div>
                </#if>
                <!-- Pagination Start -->
                <ul class="pagination">
    <#if pageBean.currentPage == 1>
        <li class="page-item" style="background-color: #ada9a9;"><a class="page-link"
                                                                    style="background-color: #ada9a9;"> <i
                class="fas fa-chevron-left"></i> </a></li>
    <#else>
         <li class="page-item"><a class="page-link" href="/home/project/list?currentPage=${pageBean.currentPage-1}&projectStatus=${currentStatus}&name=${projectName!""}&projectCategory.id=${currentCategory}"> <i
                 class="fas fa-chevron-left"></i> </a></li>
    </#if>
                    <li class="page-item"><a class="page-link"
                                             href="/home/project/list?currentPage=${pageBean.currentPage}&projectStatus=${currentStatus}&name=${projectName!""}&projectCategory.id=${currentCategory}">${pageBean.currentPage}</a>
                    </li>
                    <#if pageBean.currentPage+1 lte pageBean.totalPage>
                             <li class="page-item"><a class="page-link"
                                                      href="/home/project/list?currentPage=${pageBean.currentPage+1}&projectStatus=${currentStatus}&name=${projectName!""}&projectCategory.id=${currentCategory}">
                                 <i class="fas fa-chevron-right"></i> </a></li>
                    <#else>
                        <li class="page-item"><a class="page-link" style="background-color: #ada9a9;"> <i
                                class="fas fa-chevron-right"></i> </a></li>
                    </#if>
                </ul>
                <!-- Pagination End -->
            </div>
            <!-- Posts End -->
        </div>

    </div>
</div>

 <#include "../common/footer.ftl"/>
 <#include "../common/footer-js.ftl"/>

</body>

</html>
