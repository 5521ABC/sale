<!-- Vendor Scripts -->
  <script src="/home/assets/js/plugins/jquery-3.4.1.min.js"></script>
  <script src="/home/assets/js/plugins/popper.min.js"></script>
  <script src="/home/assets/js/plugins/waypoint.js"></script>
  <script src="/home/assets/js/plugins/bootstrap.min.js"></script>
  <script src="/home/assets/js/plugins/jquery.magnific-popup.min.js"></script>
  <script src="/home/assets/js/plugins/jquery.slimScroll.min.js"></script>
  <script src="/home/assets/js/plugins/imagesloaded.min.js"></script>
  <script src="/home/assets/js/plugins/jquery.steps.min.js"></script>
  <script src="/home/assets/js/plugins/jquery.countdown.min.js"></script>
  <script src="/home/assets/js/plugins/isotope.pkgd.min.js"></script>
  <script src="/home/assets/js/plugins/slick.min.js"></script>
  <script src="/home/assets/js/plugins/select2.min.js"></script>
  <script src="/home/assets/js/plugins/jquery.zoom.min.js"></script>
  <script src="/home/js/common.js"></script>
  <!-- Mini Scripts -->
  <script src="/home/assets/js/main.js"></script>


<script type="text/javascript">
    $(".profile-menu").find("li").each(function(i,e){
     var href=$(e).find("a").attr("href");
    if(href==window.location.pathname){
        $(e).siblings().find("a").removeClass("active")
        $(e).find("a").addClass("active");
    }
    });
</script>