<!-- Product Start -->
<#list top3Project as project>
                              <div class="col-lg-4">
                                  <div class="product">
                                      <div class="product-thumbnail" style="height: 300px;">
                                          <a href="/home/project/detail?id=${project.id}">
                          <#if project.picture??>
                            <#if project.picture?length gt 0>
                                <#list project.picture?split(";") as picture>
                                    <#if picture_index==0>
                                      <img src="/photo/view?filename=${picture}"  alt="product" width="290px" height="193px">
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
                                          <div class="product-controls">
                                              <a href="#" class="favorite"><i class="far fa-heart"></i></a>
                                              <a href="#" class="compare"><i class="fas fa-sync-alt"></i></a>
                                              <a href="#" data-toggle="modal" data-target="#quickViewModal" class="quick-view"><i class="fas fa-eye"></i></a>
                                          </div>
                                      </div>
                                      <div class="product-body">
                                          <h5 class="product-title">
                                              <a href="/home/project/detail?id=${project.id}" title="Scacco Diamond Ring">${project.name}</a>
                                          </h5>
                                          <span class="product-price">$${project.startPrice} </span>
                                          <div class="product-gallery-wrapper">
                                              <a href="/home/project/detail?id=${project.id}" class="btn-custom btn-sm secondary">参与竞拍</a>
                                          </div>
                                      </div>
                                  </div>
                              </div>
                       <!-- Product End -->

</#list>