<table class="table table-bordered">
    <thead>
    <tr class="competition-tr">
        <th>商品图片</th>
 <#if biddingProject.picture??>
                <#if biddingProject.picture?length gt 0>
                    <#list biddingProject.picture?split(";") as picture>
                <figure>
                    <td width="174px">
                    <img src="/photo/view?filename=${picture}" width="130px" height="150px">
                    </td>
                </figure>
                    </#list>
                </#if>
 <#else>
            <img src="/admin/images/default-head.jpg" width="130px" height="150px">
 </#if>
        </td>
    </tr>
    <tr class="competition-tr">
        <th style="vertical-align: middle;">商品编号</th>
        <td>${biddingProject.projectNumber}</td>
        <th style="vertical-align: middle;">商品名称</th>
        <td>${biddingProject.name}</td>
        <th style="vertical-align: middle;" >商品分类</th>
        <td>${biddingProject.projectCategory.name}</td>
        <th style="vertical-align: middle;">商品状态</th>
        <td>${biddingProject.projectStatus.getValue()}</td>
    </tr>
    <tr class="competition-tr">
        <th style="vertical-align: middle;">起拍价</th>
        <td>${biddingProject.startPrice}</td>
        <th style="vertical-align: middle;">发布拍卖者</th>
        <td>${biddingProject.organization.name}</td>
        <th style="vertical-align: middle;">联系人</th>
        <td>${biddingProject.organization.legalPerson}</td>
        <th style="vertical-align: middle;">联系电话</th>
        <td>${biddingProject.organization.mobile}</td>
    </tr>
    <tr class="competition-tr">
        <th style="vertical-align: middle;">报名开始时间</th>
        <td>${biddingProject.startTime}</td>
        <th style="vertical-align: middle;">报名结束时间</th>
        <td>${biddingProject.endTime}</td>
        <th style="vertical-align: middle;">竞拍开始时间</th>
        <td>${biddingProject.biddingStartTime}</td>
        <th style="vertical-align: middle;">竞拍结束时间</th>
        <td>${biddingProject.biddingEndTime}</td>
    </tr>
    </thead>
</table>
<div>
    <span style="color: red;font-weight: bolder">详情描述</span>
    <div class="details">
    ${biddingProject.describes}
    </div>
</div>


