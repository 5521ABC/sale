<!DOCTYPE html>
<html lang="en" dir="ltr">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>竞拍首页</title>
<#include "../common/header.ftl"/>
</head>

<body>
<#include "../common/header-menu.ftl"/>
<!-- Banner Start -->
<div class="banner banner-1 bg-cover bg-center" style="background-image: url('/home/assets/img/banner/6.jpg')">
    <div class="container">

        <div class="banner-item">
            <#--<div class="banner-inner">
                <div class="banner-text">
                    <h1 class="title">欢迎来到闲置物品拍卖</h1>
                   <!-- <p class="subtitle">成千上万的人想出售或购买。别错过抢夺商品的机会。 </p>&ndash;&gt;
                </div>
            </div>-->
            <h1 class="title">欢迎来到闲置物品拍卖</h1>
        </div>

    </div>

    <div class="container d-none d-lg-block">
        <div class="row">
            <div class="col-md-8">
                <div class="section-title-wrap dark-bg">
                    <h5 class="text-white custom-primary">闲置物品拍卖</h5>
                    <h2 class="text-white title"><span class="custom-primary">我们的目标，高价卖出闲置物品</span></h2>
                    <p class="text-white subtitle">如买卖过程中出现问题请及时给我们留言</p>
                </div>
            </div>
        </div>
    </div>

</div>
<!-- Banner End -->

<!-- Products center mode start -->
<div class="section section-padding">
    <div class="spacer spacer-lg dark-bg"></div>

    <div class="container">
        <div class="products-slider-center">
            <#list releaseTop4List as project>
                <!-- Product Start -->
                <div class="product">
                    <div class="product-thumbnail" style="height: 300px;">
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
                            <span class="product-badge sale">${project.projectStatus.getValue()}</span>
                        </div>
                    </div>
                    <div class="product-body">
                        <h5 class="product-title">
                            <a href="/home/project/detail?id=${project.id}"
                               title="Scacco Diamond Ring">${project.name}</a>
                        </h5>
                        <span class="product-price">$${project.startPrice} </span>
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
            </#list>
        </div>
    </div>

</div>
<!-- Products center mode end -->

<!-- CTA Start -->
<div class="section section-padding pt-0">

    <div class="container">
        <div class="row">
            <div class="col-lg-6">
                <div class="cta cta-2 item1">
                    <i class="flaticon-sales-agent"></i>
                    <div class="cta-body">
                        <h4>想成为拍卖者吗？</h4>
                        <p>
                            成为拍卖者之后可以发布自己的商品供购买者拍卖
                        </p>
                        <a href="/admin/organization/register" class="btn-link">成为拍卖者<i class="fas fa-arrow-right"></i>
                        </a>
                    </div>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="cta cta-2 item2">
                    <i class="flaticon-buy"></i>
                    <div class="cta-body">
                        <h4>有什么疑问？</h4>
                        <p>
                            可以联系我们哦
                        </p>
                        <#--<a href="pricing.html" class="btn-link">去留言<i class="fas fa-arrow-right"></i> </a>-->
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="spacer spacer-lg spacer-bottom dark-bg"></div>

</div>
<!-- CTA End -->

<!-- Icons Start -->
<div class="section section-padding dark-bg infographics-3 pt-0">
    <div class="container">

        <div class="row">

            <div class="col-lg-4">
                <div class="acr-infographic-item">
                    <i class="text-white flaticon-ribbon"></i>
                    <div class="acr-infographic-item-body">
                        <h5 class="text-white">我们的特色</h5>
                        <p class="text-white">服务好,商品质量高,购买者对我们的评价也很满意</p>
                    </div>
                </div>
            </div>

            <div class="col-lg-4">
                <div class="acr-infographic-item">
                    <i class="text-white flaticon-necklace"></i>
                    <div class="acr-infographic-item-body">
                        <h5 class="text-white">我们的商品</h5>
                        <p class="text-white">我们的商品都要经过专家的审核,质量好,价格优</p>
                    </div>
                </div>
            </div>

            <div class="col-lg-4">
                <div class="acr-infographic-item">
                    <i class="text-white flaticon-sales-agent"></i>
                    <div class="acr-infographic-item-body">
                        <h5 class="text-white">我们的团队</h5>
                        <p class="text-white">优质的高校毕业生保证我们的支付安全</p>
                    </div>
                </div>
            </div>

        </div>

    </div>
</div>
<!-- Icons End -->
<#--<!-- About Section Start &ndash;&gt;
<div class="section pt-0">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-lg-6 mb-lg-30 acr-dots-wrapper acr-single-img-wrapper">
                <img src="/home/assets/img/products-list/3.jpg" alt="img">
            </div>
            <div class="col-lg-6">
                <div class="section-title-wrap mr-lg-30">
                    <h5 class="custom-primary">关于我们</h5>
                    <h2 class="title">我们有多年拍卖的经验，目前我们有数多用户使用我们的产品</h2>
                    <p class="subtitle">
                        We have many years of experience in auction, and now we have many users using our products
                    </p>
                    <p class="subtitle">
                        Lorem Ipsum has been the industry's standard dummy text ever since the 1500s
                    </p>
                </div>
            </div>

        </div>
    </div>
</div>-->
<!-- About Section End -->

<div class="section dark-bg pb-0">
    <div class="container">
        <div class="section-title-wrap section-header text-center">
            <h5 class="custom-primary">我们的商品</h5>
            <h2 class="title text-white">质量保证,七天无理由退换 </h2>
        </div>
    </div>
</div>
<!-- Product-tab-box Start -->
<div class="section section-padding pt-0">
    <div class="spacer dark-bg"></div>
    <div class="container">
        <div class="product-tab-wrapper">
            <ul class="nav nav-tabs border-0 row">
                  <#list categoryTop6List as category>
                      <li class="nav-item col-lg-2 col-sm-4 col-6">
                          <a href="javascript:void(0);" data-toggle="tab" data-id="${category.id}"
                             class="nav-link <#if category_index==0>active</#if>">
                              <i class="flaticon-gems"></i>
                              <span class="fw-500">${category.name}</span>
                          </a>
                      </li>
                  </#list>
            </ul>
            <div class="tab-content mt-0" >
                <div  class="tab-pane fade show active">
                    <div class="row" id="table-project">

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
</div>
<!-- Product-tab-box End -->

<#--<!-- Clients Start -->
<#--<div class="section dark-bg border-top-primary border-bottom-primary">
    <div class="container">
        <div class="clients-slider">
            <div class="acr-client-item text-center">
                <img src="/home/assets/img/clients/1-light.png" alt="client">
            </div>
            <div class="acr-client-item text-center">
                <img src="/home/assets/img/clients/2-light.png" alt="client">
            </div>
            <div class="acr-client-item text-center">
                <img src="/home/assets/img/clients/3-light.png" alt="client">
            </div>
            <div class="acr-client-item text-center">
                <img src="/home/assets/img/clients/4-light.png" alt="client">
            </div>
            <div class="acr-client-item text-center">
                <img src="/home/assets/img/clients/5-light.png" alt="client">
            </div>
            <div class="acr-client-item text-center">
                <img src="/home/assets/img/clients/6-light.png" alt="client">
            </div>
        </div>
    </div>
</div>-->
<!-- Clients End &ndash;&gt;-->
 <#include "../common/footer.ftl"/>
 <#include "../common/footer-js.ftl"/>
<script type="text/javascript">
    $(document).ready(function(){
        var cid=$(".nav-link.active").attr("data-id");
        $.get("category_top3", {id: cid}, function (result) {
            $("#table-project").empty();
            $("#table-project").append(result);
        });

    });
    $(".nav-link").click(function () {
        var categoryId = $(this).attr("data-id");
        $.get("category_top3", {id: categoryId}, function (result) {
            $("#table-project").empty();
            $("#table-project").append(result);
        });
    });

</script>

</body>

</html>
