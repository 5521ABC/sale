<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>我的竞价列表</title>
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
                    <h3>我的竞价列表</h3>
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
                            <th>竞价时间</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                <#if recordList??  && (recordList?size > 0)>
                      <#list recordList as record>
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
                    <td>${record.bid}</td>
                    <td>${record.quantity}</td>
                    <td>
                        <#if record.payStatus==0>
                            未支付
                        <#elseif  record.payStatus==1>
                            成功
                        <#else>
                            流局
                        </#if>
                    </td>
                    <td>${record.createTime}</td>
                        <#if record.payStatus==0 && record.biddingStatus==1>
                          <td data-title="Action">
                              <a href="javascript:void(0);" data-id="${record.id}"
                                 class="btn-custom primary the-payment">确认付款</a>
                          </td>
                        <#elseif record.payStatus==1 && record.biddingStatus==2>
                          <td data-title="Action">
                              <a href="javascript:void(0);" data-id="${record.id}"
                                 class="btn-custom evaluate the-evaluate">开始评价</a>
                          </td>
                        <#elseif record.biddingStatus==3>
                          <td data-title="Action">
                              <span>已完成</span>
                          </td>
                        <#elseif record.biddingStatus==0 && record.payStatus==0>
  <td data-title="Action">
      <a href="javascript:void(0);" class="btn-custom-2 grey">等待交易</a>
  </td>
                        <#else>
                         <td data-title="Action">
                             <a href="javascript:void(0);" class="btn-custom-2 grey">已出局</a>
                         </td>
                        </#if>
                </tr>
                      </#list>
                <#else>
                 <tr>
                     <td colspan="5">你还未竞价,赶紧去竞价吧</td>
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
<!-- Modal -->
<div class="modal fade" id="evaluateModel" tabindex="-1" aria-labelledby="evaluateModel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="evaluateModel">评价内容</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <input type="hidden" name="id" id="record-id"/>
                <div class="form-group">
                    <label for="exampleFormControlTextarea1">评分</label>
                    <div id="add-evaluate">

                    </div>
                </div>
                <div class="form-group">
                    <label for="exampleFormControlTextarea1">评价内容</label>
                    <textarea class="form-control" id="content" name="content" rows="3"></textarea>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="save-evaluate">确认评价</button>
            </div>
        </div>
    </div>
</div>
     <#include "../common/footer.ftl"/>
 <#include "../common/footer-js.ftl"/>
<script type="text/javascript" src="/home/raty/lib/jquery.raty.min.js"></script>
<script type="text/javascript">
    $(".the-payment").click(function () {
        var id = $(this).attr("data-id");
        $.post("/home/index/payment", {id: id}, function (result) {
            if (result.code == 0) {
                alert("支付成功");
                location.reload();
            } else {
                alert(result.msg);
            }
        });
    });

    //评价
    $(".the-evaluate").click(function () {
        $('#add-evaluate').raty({
            score: function () {
                return $(this).attr('data-score');
            }
        });
        $("#record-id").val($(this).attr("data-id"));
        $("#evaluateModel").modal("show");
    });
    //保存评价
    $("#save-evaluate").click(function () {
        var score = $('input[name="score"]').val();
        var content = $("#content").val();
        var recordId = $("#record-id").val();
        $.post("/home/index/evaluate_save", {score: score, content: content, recordId: recordId}, function (result) {
            if (result.code == 0) {
                alert("评价成功!");
                window.location.reload();
            } else {
                alert(result.msg);
            }
        });
    });
</script>
</body>
</html>
