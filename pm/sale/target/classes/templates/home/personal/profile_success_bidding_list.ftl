<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>我的竞价订单列表</title>
      <#include "../common/header.ftl"/>
  </head>
  <body>
  <#include "../common/header-menu.ftl"/>
    <#include "../common/profile-head.ftl"/>
    <!-- Checkout Start -->
    <div class="section checkout-sec cart-sec">
      <div class="container">
        <div class="row">
           <#include "../common/profile-menu.ftl"/>
          <div class="col-lg-8">
            <div class="acr-welcome-message">
            <h3>我的竞价订单列表</h3>
            <p>
                Bidding records you can see the records of all the projects you bid for
            </p>
          </div>
            <div class="checkout-table">
              <table class="mb-0">
                <thead>
                  <tr>
                    <th>商品信息</th>
                      <th>竞价金额</th>
                      <th>竞价数量</th>
                      <th>竞价状态</th>
                      <th>付款状态</th>
                      <th>竞价时间</th>
                  </tr>
                </thead>
                <tbody>
                    <#if biddingRecordsList?? && (biddingRecordsList?size gt 0)>
                      <#list biddingRecordsList as record>
                        <tr>
                            <td data-title="product">
                                <div class="product-box">
                             <#if record.biddingProject.picture??>
                                 <#if  record.biddingProject.picture?length gt 0>
                                     <#list  record.biddingProject.picture?split(";") as picture>
                                         <#if picture_index==0>
                                      <img src="/photo/view?filename=${picture}" alt="product" width="290px"
                                           height="193px">
                                         </#if>
                                     </#list>
                                 </#if>
                             <#else>
            <img src="/admin/images/default-head.jpg" width="130px" height="70px">
                             </#if>
                                    <div class="product-name">
                                        <h6>
                                            <a href="/home/project/detail?id=${record.biddingProject.id}">${record.biddingProject.name}</a>
                                        </h6>
                                        <p>${record.biddingProject.projectCategory.name}</p>
                                    </div>
                                </div>
                            </td>
                            <td >${record.bid}</td>
                            <td >${record.quantity}</td>
                            <td >
                        <#if record.payStatus==0>
                            失败
                        <#elseif  record.payStatus==1>
                            成功
                        <#else>
                            流局
                        </#if>
                            </td>
                            <td>
                                <#if record.payStatus==0>
                                    未支付
                                    <#else>
                                    支付成功
                                </#if>
                            </td>
                            <td >${record.createTime}</td>
                        </tr>
                      </#list>
                    <#else>
                    <tr>
                        <td colspan="6">暂无竞拍成功订单!</td>
                    </tr>
                    </#if>
                </tbody>
              </table>
            </div>

          </div>
        </div>
      </div>
    </div>
    <!-- Checkout End -->
     <#include "../common/footer.ftl"/>
 <#include "../common/footer-js.ftl"/>
  </body>
</html>
