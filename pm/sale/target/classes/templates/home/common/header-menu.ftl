<!-- Header Start -->
  <header class="acr-header header-style-4">
      <!-- Topbar -->
      <!-- Top Header Start -->
      <div class="top-header">
          <div class="top-header-inner">
              <#if ylrc_home??>
                  <ul class="top-header-nav" >
                      <li>
                          <a href="#">欢迎${ylrc_home.username!""}</a>
                      </li>
                      <li><a href="/home/index/logout">注销</a></li>
                  </ul>
              <#else>
                   <ul class="top-header-nav">
                       <li><a href="/home/index/login"> 登录</a></li>
                       <li>or</li>
                       <li><a href="/home/index/register"> 注册</a></li>
                   </ul>
              </#if>
          </div>
      </div>
      <!-- Middle sec -->
      <div class="middle-header">
          <div class="container">
              <div class="row align-items-center">
                  <div class="col-lg-3 col-6">
                      <div class="desktop-logo">
                          <a href="/home/index/index">
                              <img src="/home/assets/img/logo.png" class="img-fluid" alt="logo">
                          </a>
                      </div>
                  </div>
                  <div class="col-lg-6 order-3 order-lg-2">
                      <div class="mutiple-search d-lg-block">
                          <form action="/home/project/list" method="GET">
                              <div class="input-group">
                                  <input type="text" name="name" value="${projectName!""}" class="form-control"
                                         placeholder="搜索商品">
                                  <button type="submit">
                                      <i class="far fa-search"></i>
                                  </button>
                              </div>

                          </form>
                      </div>
                  </div>
              </div>
          </div>
      </div>
      <!-- Bottom sec -->
      <div class="bottom-header style-2">
          <div class="container">
              <div class="bottom-navigation">
                  <nav>
                      <ul class="main-navigation">
                          <li class="menu-item menu-item-has-children <#if activeType??><#if activeType=="index">active</#if></#if>">
                              <a href="/home/index/index">首页</a>
                          </li>
                          <li class="menu-item menu-item-has-children <#if activeType??><#if activeType=="project">active</#if></#if>">
                              <a href="/home/project/list">竞拍列表</a>
                          </li>
                          <#if ylrc_home??>
                                <li class="menu-item menu-item-has-children <#if activeType??><#if activeType=="profile">active</#if></#if>">
                                    <a href="#">个人中心</a>
                                    <ul class="sub-menu">
                                        <li class="menu-item">
                                            <a href="/home/index/profile">个人信息</a>
                                        </li>
                                    </ul>
                                </li>
                          </#if>

                      </ul>
                  </nav>
              </div>
          </div>
      </div>
  </header>
  <!-- Header End -->