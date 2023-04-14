<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>我的报名列表</title>
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
            <h3>我的报名列表</h3>
            <p>
                Don't forget to go to the auction after signing up. No time
            </p>
          </div>
            <div class="checkout-table">
              <table class="mb-0">
                <thead>
                  <tr>
                    <th>商品信息</th>
                      <th>拍卖者名称</th>
                      <th>拍卖者联系人</th>
                    <th>拍卖者联系方式</th>
                      <th>报名时间</th>
                      <th>竞拍时间</th>
                  </tr>
                </thead>
                <tbody>
                <#if projectApplyList??  && (projectApplyList?size > 0) >
                  <#list projectApplyList as projectApply>
                <tr>
                    <td data-title="product">
                        <div class="product-box">
                             <#if projectApply.biddingProject.picture??>
                                 <#if  projectApply.biddingProject.picture?length gt 0>
                                     <#list  projectApply.biddingProject.picture?split(";") as picture>
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
                                    <a href="/home/project/detail?id=${projectApply.biddingProject.id}">${projectApply.biddingProject.name}</a>
                                </h6>
                                <p>${projectApply.biddingProject.projectCategory.name}</p>
                            </div>
                        </div>
                    </td>
                    <td >${projectApply.biddingProject.organization.name!""}</td>
                    <td >${projectApply.biddingProject.organization.legalPerson!""}</td>
                    <td>${projectApply.biddingProject.organization.mobile!""}</td>
                    <td >${projectApply.createTime}</td>
                    <td >${projectApply.biddingProject.biddingStartTime}</td>
                </tr>
                  </#list>
                <#else>
                 <tr >
                     <td colspan="6">你还未报名任何商品竞拍</td>
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
