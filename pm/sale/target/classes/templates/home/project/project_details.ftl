<!DOCTYPE html>
<html lang="en" dir="ltr">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>商品详情</title>
  <#include "../common/header.ftl"/>
</head>

<body>
<#include "../common/header-menu.ftl"/>
<!-- Subheader Start -->
<div class="subheader bg-cover bg-center dark-overlay" style="background-image: url('/home/assets/img/subheader.jpg')">
    <div class="container">
        <div class="subheader-inner">
            <h1 class="text-white">商品详情</h1>
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="/home/index/index"> <i class="fas fa-home"></i> </a></li>
                    <li class="breadcrumb-item"><a href="/home/project/list">竞拍列表</a></li>
                    <li class="breadcrumb-item active" aria-current="page">商品详情</li>
                </ol>
            </nav>
        </div>
    </div>
</div>
<!-- Subheader End -->

<!-- Shop Detail Start -->

<div class="section">
    <div class="container">
        <div class="row">
            <div class="col-lg-6">
                <div class="detail-slider-wrapper">
                    <div class="detail-page-slider-nav-1">
               <#if projectDetail.picture??>
                 <#if projectDetail.picture?length gt 0>
                     <#list projectDetail.picture?split(";") as picture>
                                      <img src="/photo/view?filename=${picture}" alt="product" width="290px"
                                           height="193px">
                     </#list>
                 </#if>
               <#else>
            <img src="/admin/images/default-head.jpg" width="130px" height="70px">
               </#if>
                    </div>
                    <div class="detail-page-slider-1">
            <#if projectDetail.picture??>
              <#if projectDetail.picture?length gt 0>
                  <#list projectDetail.picture?split(";") as picture>
                  <div class="slide-item">
                      <div class="product-zoom-image">
                          <img src="/photo/view?filename=${picture}" alt="image" style="height: 500px;width: 420px;">
                      </div>
                  </div>
                  </#list>
              </#if>
            </#if>
                    </div>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="shop-detail-wrapper">

                    <div class="shop-detail-title">
                        <h3 class="mb-0">${projectDetail.name}</h3>
                    </div>
                    <div class="rating d-flex">
                        <div id="project-rate">

                        </div>
                        <span>评价人数：${projectEvaluates?size}</span>
                    </div>
                    <div class="product-price-box">
              <span class="product-price">${projectDetail.startPrice}$
              </span>
                    </div>
                    <div class="product-descr">
                        <p class="mb-0">
                            商品数量:<span
                                style="color: red;font-weight: bolder;margin-left: 10px;font-size: 32px;">${projectDetail.quantity}</span>
                        </p>
                    </div>
                    <div class="product-descr">
                        <p class="mb-0">浏览次数:${projectDetail.viewsNumber}</p>
                    </div>
                    <div class="product-descr">
                        <p class="mb-0">报名人数:${projectDetail.applicantsNumber}</p>
                    </div>
                    <div class="product-descr">
                        <p class="mb-0">报名时间:${projectDetail.startTime} --${projectDetail.endTime}</p>
                    </div>
                    <div class="product-descr">
                        <p class="mb-0">竞价时间:${projectDetail.biddingStartTime} --${projectDetail.biddingEndTime}</p>
                    </div>
              <#if projectDetail.projectStatus.getCode()==10>
                <div class="block-item lafite_djs">
                    <span class="t_djs_value">距离开始</span>
                    <span class="lafitewu_main font-size1 margin-left-20 date_value">

					</span>
                </div>
              <#elseif projectDetail.projectStatus.getCode()==4>
            <div class="block-item lafite_djs">
                <span class="t_djs_value">距离结束</span>
                <span class="lafitewu_main font-size1 margin-left-20 date_value"
                      style="color: red;font-weight: bolder;">

					</span>
            </div>
              </#if>
                    <form class="product-variation-form">
                        <div class="product-variation-wrapper">
                            <p>
                                竞拍状态：
                    <#if projectDetail.projectStatus.getCode()==11>
                    <span style="color: red;">${projectDetail.projectStatus.getValue()}</span>
                    <#elseif projectDetail.projectStatus.getCode()==10>
                      <span style="color: orangered">${projectDetail.projectStatus.getValue()}</span>
                    <#elseif projectDetail.projectStatus.getCode()==4>
                     <span style="color: deepskyblue">${projectDetail.projectStatus.getValue()}</span>
                    <#else>
                      <span style="color: deepskyblue">${projectDetail.projectStatus.getValue()}</span>
                    </#if>
                            </p>
                        </div>
                        <div class="alert alert-primary close" id="alert-xin" style="display: none">

                        </div>
              <#if ylrc_home??>
                  <#if projectDetail.projectStatus.getCode()==10>
                    <a href="javascript:void(0);" class="btn-custom secondary sign" data-pid="${projectDetail.id}"
                       id="signUpBtn" onclick="signUp(this)">点击报名</a>
                  <#elseif projectDetail.projectStatus.getCode()==11>
                       <a href="javascript:void(0);" class="btn-custom secondary notstart">马上开始</a>
                  <#elseif projectDetail.projectStatus.getCode()==6>
                   <a href="javascript:void(0);" class="btn-custom secondary end">竞价结束</a>
                  <#else>
                <div class="shop-button-box"
                     <#if  projectDetail.projectStatus.getCode()==1> </#if>>
                    <div class="qty-box">
                        数量：
                        <span class="qty-subtract">
                    <i class="fa fa-minus"></i>
                  </span>
                        <input type="number" data-max="${projectDetail.quantity}" min="1"
                               max="${projectDetail.quantity}" id="quantity" name="quantity" value="1"
                               onkeyup="if(this.value.length==1){this.value=this.value.replace(/[^0-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}">
                        <span class="qty-add">
                    <i class="fa fa-plus"></i>
                  </span>
                    </div>
                    <div class="qty-box">
                        出价：
                        <span class="qty-subtract">
                    <i class="fa fa-minus"></i>
                  </span>
                        <input type="number" data-max="${projectDetail.startPrice}" min="1" max="1000000" id="money"
                               name="money" data-price="${projectDetail.startPrice}" value="${projectDetail.startPrice}"
                               onkeyup="if(this.value.length==1){this.value=this.value.replace(/[^0-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}">
                        <span class="qty-add">
                    <i class="fa fa-plus"></i>
                  </span>
                    </div>
                    <a href="javascript:void(0);" class="btn-custom primary" id="auction-price"
                       data-pid="${projectDetail.id}">确定拍价</a>
                </div>
                  </#if>
              <#else>
                  <a href="/home/index/login" class="btn-custom secondary login" id="account-login">还未登录请登录！</a>
              </#if>

                    </form>
                    <ul class="product-extra-info">
                        <li>
                            <span>商品分类: </span>
                            <div class="product-info-item">
                                <a href="#">${projectDetail.projectCategory.name}</a>
                            </div>
                        </li>
                        <li>
                            <span>商品地址: </span>
                            <div class="product-info-item">
                            ${projectDetail.address}
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="section pt-0">
    <div class="container">
        <div class="product-additional-info">
            <div class="row">
                <div class="col-lg-4">
                    <ul class="nav product-sticky-sec" id="bordered-tab" role="tablist">
                        <li class="nav-item">
                            <a class="nav-link active" id="tab-product-desc-tab" data-toggle="pill"
                               href="#tab-product-desc" role="tab" aria-controls="tab-product-desc"
                               aria-selected="true">商品描述</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" id="tab-product-info-tab" data-toggle="pill" href="#tab-product-info"
                               role="tab" aria-controls="tab-product-info" aria-selected="false">竞买记录</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" id="tab-product-reviews-tab" data-toggle="pill"
                               href="#tab-product-reviews" role="tab" aria-controls="tab-product-reviews"
                               aria-selected="false">拍卖者信息</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" id="tab-product-reviews-tab" data-toggle="pill"
                               href="#tab-product-evaluate" role="tab" aria-controls="tab-product-reviews"
                               aria-selected="false">评价列表</a>
                        </li>
                    </ul>
                </div>
                <div class="col-lg-8">
                    <div class="tab-content" id="bordered-tabContent">
                        <div class="tab-pane fade show active" id="tab-product-desc" role="tabpanel"
                             aria-labelledby="tab-product-desc-tab">
                            <h4>商品描述</h4>
                        ${projectDetail.describes!""}
                        </div>
                        <div class="tab-pane fade" id="tab-product-info" role="tabpanel"
                             aria-labelledby="tab-product-info-tab">
                            <h4>竞买记录</h4>
                            <table>
                                <thead>
                                <tr>
                                    <th scope="col">竞价人</th>
                                    <th scope="col">竞价数量</th>
                                    <th scope="col">竞价价格</th>
                                </tr>
                                </thead>
                                <tbody>
                  <#if recordList?? &&(recordList?size gt 0)>
                       <#list recordList as record>
                  <tr>
                      <td>
                          <strong>${record.account.username}</strong>
                      </td>
                      <td>${record.quantity}</td>
                      <td>${record.bid}</td>
                  </tr>
                       </#list>
                  <#else>
                  <tr>
                      <td colspan="3">
                          暂无竞价记录
                      </td>
                  </tr>
                  </#if>
                                </tbody>
                            </table>
                        </div>
                        <div class="tab-pane fade" id="tab-product-reviews" role="tabpanel"
                             aria-labelledby="tab-product-reviews-tab">
                            <div class="comment-form">
                                <h4>拍卖者信息</h4>
                                <table>
                                    <thead>
                                    <tr>
                                        <th scope="col">拍卖者名称</th>
                                        <th scope="col">联系方式</th>
                                        <th scope="col">联系人</th>
                                        <th scope="col">地址</th>
                                        <th scope="col">信用分</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td>${projectDetail.organization.name}</td>
                                        <td>${projectDetail.organization.mobile}</td>
                                        <td>${projectDetail.organization.legalPerson!""}</td>
                                        <td>${projectDetail.organization.address!""}</td>
                                        <td>${projectDetail.organization.rate!"0"}</td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>

                        <div class="tab-pane fade" id="tab-product-evaluate" role="tabpanel"
                             aria-labelledby="tab-product-info-tab">
                            <div class="comment-form">
                                <h4>评论列表</h4>
                            </div>
                            <div class="comments-list">
                                <ul>
                                    <#if projectEvaluates?? && (projectEvaluates?size gt 0)>
                                        <#list projectEvaluates as evaluates>
                                        <li class="comment-item">
                                            <#if evaluates.account.headPic?? && (evaluates.account.headPic?length gt 0)>
                                               <img src="/photo/view?filename=${evaluates.account.headPic!""}" alt="comment author">
                                            <#else>
                                             <img src="/home/assets/img/people/1.jpg" alt="comment author">
                                            </#if>
                                            <div class="comment-body">
                                                <h5>${evaluates.account.username}</h5>
                                                <span>${evaluates.createTime}</span>
                                                <p>${evaluates.content!""}</p>
                                            </div>
                                            <#if evaluates.reply??>
                                            <ul>
                                                <li class="comment-item">
                                                     <#if evaluates.biddingProject.organization.headPic?? && (evaluates.biddingProject.organization.headPic?length gt 0)>
                                                     <img src="/photo/view?filename=${evaluates.biddingProject.organization.headPic!""}" alt="comment author">
                                                     <#else>
                                             <img src="/home/assets/img/people/1.jpg" alt="comment author">
                                                     </#if>
                                                    <div class="comment-body">
                                                        <h5>${evaluates.biddingProject.organization.name}</h5>
                                                        <span>${evaluates.updateTime!""}</span>
                                                        <p>${evaluates.reply!""}</p>
                                                    </div>
                                                </li>
                                            </ul>
                                            </#if>
                                        </li>
                                        </#list>
                                        <#else>
                                        <li>暂无评价</li>
                                    </#if>

                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Shop Detail End -->
 <#include "../common/footer.ftl"/>
 <#include "../common/footer-js.ftl"/>
<script src="/home/js/countdown.min.js"></script>
<script type="text/javascript" src="/home/raty/lib/jquery.raty.min.js"></script>

<script type="text/javascript">
    //点击报名按钮
    function signUp(t) {
        var _this = $(t);
        var projectId = _this.attr("data-pid");
        $.ajax({
            url: 'sign_up',
            type: 'POST',
            data: {projectId: projectId},
            dataType: 'json',
            success: function (rst) {
                if (rst.code == 0) {
                    $("#alert-xin").html("报名成功");
                    $("#alert-xin").show();
                    setTimeout(function () {
                        $("#alert-xin").hide();
                    }, 1000)
                    window.location.reload();
                } else {
                    $("#alert-xin").html(rst.msg);
                    $("#alert-xin").show();
                    setTimeout(function () {
                        $("#alert-xin").hide();
                    }, 1000)
                }
            },
            error: function (data) {
                alert('网络错误!');
            }
        });
    }

    //确认拍价
    $("#auction-price").click(function () {
        var quantity = $("#quantity").val();
        var money = $("#money").val();
        if (quantity <= 0) {
            alert("竞拍数量不能大于商品数量");
            return;
        }
        if (money <= 0) {
            alert("出价不能低于0");
            return;
        }
        var price = $("#money").attr("data-price");
        if (parseInt(price) > parseInt(money)) {
            alert("出价不能小于起拍价");
            return;
        }
        //商品id
        var pid = $(this).attr("data-pid");
        $.post("auction_price", {id: pid, quantity: quantity, money: money}, function (result) {
            if (result.code == 0) {
                alert("竞价成功！");
                location.reload();
            } else {
                alert(result.msg);
            }
        });
    });
    $(document).ready(function () {
        $("#project-rate").raty({ readOnly: true,score: ${ratys} });
        var status =${projectDetail.projectStatus.getCode()};
        if (status == 4) {
            countDown('${projectDetail.biddingEndTime}', '${systemDate}');
        }
        else {
            if (status != 5 && status != 6 && status != 7) {
                countDown('${projectDetail.biddingStartTime}', '${systemDate}');
            }
        }

    });

    //倒计时
    function countDown(times, systemDate) {
        // 倒计时
        $(".lafitewu_main").countDown({
            times: times,  //'2018/8/13 18:00:00'
            system_time: systemDate,
            days: true,
            ms: false,
            Hour: true,
            unit: {
                days: '天',
                hour: '时',
                min: '分',
                second: '秒'
            }
        }, function () {
            $(".Days_val,.Hour_val,.Min_val,.Second_val").html("00");
            //window.location.reload();
        });
    }


</script>
</body>

</html>
