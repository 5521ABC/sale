<!DOCTYPE html>
<html lang="en" dir="ltr">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>拍卖者注册页面</title>
<#include "../common/header.ftl"/>

</head>

<body>
<#include "../common/header-menu.ftl"/>
  <div class="section login-style-2">
    <div class="container">
      <div class="acr-auth-container">
    <div class="acr-auth-content">

      <form method="post">
        <div class="auth-text">
          <h3>拍卖者注册页面</h3>
          <p>拍卖行是指为买卖双方提供交易场所和各种服务项目，以公开拍卖形式决定价格，组织买卖成交的代理商。 </p>
        </div>
          <div class="form-group">
              <img src="/home/assets/img/coming-soon/3.jpg" class="img-thumbnail" id="add-license" name="">
          </div>
        <div class="form-group">
          <input type="text" class="form-control form-control-light" placeholder="Username" name="username" value="">
        </div>
        <div class="form-group">
          <input type="email" class="form-control form-control-light" placeholder="Email Address" name="email" value="">
        </div>
        <div class="form-group">
          <input type="password" class="form-control form-control-light" placeholder="Password" name="password" value="">
        </div>

          <div class="form-group">
              <input type="text" class="form-control form-control-light" placeholder="Username" name="username" value="">
          </div>
          <div class="form-group">
              <input type="email" class="form-control form-control-light" placeholder="Email Address" name="email" value="">
          </div>
          <div class="form-group">
              <input type="password" class="form-control form-control-light" placeholder="Password" name="password" value="">
          </div>
          <button type="submit" class="btn-custom secondary btn-block">Register</button>
          <p class="text-center mb-0">Already have an account? <a href="login-v2.html">Login</a> </p>
      </form>
    </div>
    <div class="acr-auth-bg bg-cover bg-center dark-overlay dark-overlay-2" style="background-image: url('/home/assets/img/coming-soon/3.jpg')">
        <div class="form-group">
            <img src="/home/assets/img/coming-soon/3.jpg" class="img-thumbnail" id="add-license" name="">
        </div>
    </div>
    </div>
    </div>
  </div>
<#include "../common/footer-js.ftl"/>
</body>

</html>
