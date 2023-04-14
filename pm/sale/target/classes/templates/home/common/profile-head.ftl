<!-- Subheader Start -->
<div class="subheader subheader-2 user-subheader bg-cover bg-center"
     style="background-image: url('/home/assets/img/profile.jpg')">
    <div class="container">
        <div class="media">
            <#if ylrc_home.headPic??>
                <#if ylrc_home.headPic?length gt 0>
               <img src="/photo/view?filename=${ylrc_home.headPic}" alt="agent" class="head-pic" id="show-picture-img">
                <#else>
              <img src="/home/assets/img/people/1.jpg" alt="agent" class="head-pic" id="show-picture-img">
                </#if>
            <#else>
          <img src="/home/assets/img/people/1.jpg" alt="agent" class="head-pic" id="show-picture-img">
            </#if>
            <input type="file" name="pic" id="select-file" style="display: none;"
                   onchange="uploadHead('show-picture-img')"/>
            <div class="media-body">
                <h3 class="text-white">${ylrc_home.username}</h3>
                <span class="user-email">${ylrc_home.email!""}</span>
            </div>
        </div>
    </div>
</div>
<!-- Subheader End -->
