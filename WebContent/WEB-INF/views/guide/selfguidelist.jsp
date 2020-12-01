<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html >

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Self Guide </title>
  <meta content="" name="descriptison">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="assets/img/favicon.png" rel="icon">
  <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="<%=application.getContextPath() %>/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="<%=application.getContextPath() %>/resources/vendor/icofont/icofont.min.css" rel="stylesheet">
  <link href="<%=application.getContextPath() %>/resources/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">

   <link href="<%=application.getContextPath() %>/resources/vendor/owl.carousel/assets/owl.carousel.min.css" rel="stylesheet">
  <link href="<%=application.getContextPath() %>/resources/vendor/venobox/venobox.css" rel="stylesheet">
  <link href="<%=application.getContextPath() %>/resources/vendor/aos/aos.css" rel="stylesheet">
  <link href="<%=application.getContextPath() %>/resources/vendor/animate.css/animate.min.css" rel="stylesheet">

  <link href="<%=application.getContextPath() %>/resources/vendor/owl.carousel/assets/owl.carousel.min.css" rel="stylesheet">
  <link href="<%=application.getContextPath() %>/resources/vendor/venobox/venobox.css" rel="stylesheet">
	<link href="<%=application.getContextPath() %>/resources/vendor/aos/aos.css" rel="stylesheet">

 	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
  <!-- Template Main CSS File -->
  <link href="<%=application.getContextPath() %>/resources/css/style.css" rel="stylesheet">

  <!-- =======================================================
  * Template Name: Eterna - v2.1.0
  * Template URL: https://bootstrapmade.com/eterna-free-multipurpose-bootstrap-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>

<body>
	
	 <jsp:include page="/WEB-INF/views/include/Header.jsp"/>

  
  
  <section id="portfolio" class="portfolio">
      <div id = "listappend" class="container mt-5">
      		<p class="mb-4">
      		<h2 style="font-size:2vw; float:left">셀프 인테리어 가이드북 </h2>
      		
      		<span style="font-size:1vw; float:right" class="btn btn-info btn-lg" onClick="selfWrite()">글쓰기</span>
      		</p><br/>
      		
      		<img style="width:100%; height:200px;"src="https://image.ohou.se/i/bucketplace-v2-development/uploads/advices/guides/self_interior/pc_banner_image.v3.png?gif=1&w=1280&webp=1"/>
      		<p></p>
        <div id="addtag" style="width:100%; padding:0; margin:0" class="row col-md-12 mb-4">
			<jsp:include page="/WEB-INF/views/guide/selfguideFilter.jsp"/>
        </div>

      <div id = "12345" class="row portfolio-container abcd" data-aos="fade-up">
        <jsp:include page="/WEB-INF/views/guide/selfguide-photos.jsp"/>
       </div>
        

      </div>
    </section>
  <!-- ======= script ======= -->
	
	<script type="text/javascript">
	 var page = 2;
	  $(function(){
	      $(window).scroll(function(){
	          var $window = $(this);
	          var scrollTop = $window.scrollTop();
	          var windowHeight = $window.height();
	          var documentHeight = $(document).height();
	          
	          //console.log("documentHeight:" + documentHeight + " | scrollTop:" + scrollTop + " | windowHeight: " + windowHeight );
	          
	          if( scrollTop + windowHeight + 1000 > documentHeight ){
	        	  getList(page);
	        	  
		           page++; 
					console.log(page);
	
	            }   
	          
	   });
			    
	});
	function pagingList(){
	  $.ajax({
			url : "<%=application.getContextPath()%>/selfguide/selflist",
			method: "get",
			success:function(data){
				location.href="<%=application.getContextPath()%>/selfguide/selflist";
			}
		});
	}
	
	function checkSelfGuidFilter(filterString){
		console.log(filterString); 
		<%-- location.href="<%=application.getContextPath()%>/selfguide/selfguideFilter?filterString=${filterString}";
		 --%>
		$.ajax({
				url : "<%=application.getContextPath()%>/selfguide/selfguideFilter",
				data:{filterString:filterString},
				success:function(data){
					$("#12345").html(data);
					
				}
			});
		
	}
	
	</script>
	
	<script type="text/javascript">
		function selfWrite(){
			location.href="<%=application.getContextPath()%>/selfguide/selfguide-write";
		}
	</script>

  <!-- ======= script ======= -->
 

  <main id="main">

    <!-- ======= Breadcrumbs ======= -->
    <section id="portfolio" class="portfolio section">
    
    
    
    
    
    </section><!-- End Portfolio Section -->




    <!-- ======= Clients Section ======= -->
  

  </main><!-- End #main -->

  <!-- ======= Footer ======= -->
  <footer id="footer">
    <div class="footer-top">
      <div class="container">
        <div class="row">

          <div class="col-lg-3 col-md-6">
            <div class="footer-info">
              <h3>Maxim</h3>
              <p>
                A108 Adam Street <br>
                NY 535022, USA<br><br>
                <strong>Phone:</strong> +1 5589 55488 55<br>
                <strong>Email:</strong> info@example.com<br>
              </p>
              <div class="social-links mt-3">
                <a href="#" class="twitter"><i class="bx bxl-twitter"></i></a>
                <a href="#" class="facebook"><i class="bx bxl-facebook"></i></a>
                <a href="#" class="instagram"><i class="bx bxl-instagram"></i></a>
                <a href="#" class="google-plus"><i class="bx bxl-skype"></i></a>
                <a href="#" class="linkedin"><i class="bx bxl-linkedin"></i></a>
              </div>
            </div>
          </div>

          <div class="col-lg-2 col-md-6 footer-links">
            <h4>Useful Links</h4>
            <ul>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Home</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">About us</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Services</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Terms of service</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Privacy policy</a></li>
            </ul>
          </div>

          <div class="col-lg-3 col-md-6 footer-links">
            <h4>Our Services</h4>
            <ul>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Web Design</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Web Development</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Product Management</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Marketing</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Graphic Design</a></li>
            </ul>
          </div>

          <div class="col-lg-4 col-md-6 footer-newsletter">
            <h4>Our Newsletter</h4>
            <p>Tamen quem nulla quae legam multos aute sint culpa legam noster magna</p>
            <form action="" method="post">
              <input type="email" name="email"><input type="submit" value="Subscribe">
            </form>

          </div>

        </div>
      </div>
    </div>

    <div class="container">
      <div class="copyright">
        &copy; Copyright <strong><span>Maxim</span></strong>. All Rights Reserved
      </div>
      <div class="credits">
        All the links in the footer should remain intact.
        You can delete the links only if you purchased the pro version.
        Licensing information: https://bootstrapmade.com/license/
        Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/maxim-free-onepage-bootstrap-theme/
        Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
      </div>
    </div>
  </footer> <!-- End Footer -->

  <a href="#" class="back-to-top"><i class="icofont-simple-up"></i></a>

  <!-- Vendor JS Files -->
   <script src="<%=application.getContextPath() %>/resources/vendor/jquery/jquery.min.js"></script>
  <script src="<%=application.getContextPath() %>/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="<%=application.getContextPath() %>/resources/vendor/php-email-form/validate.js"></script>
  <script src="<%=application.getContextPath() %>/resources/vendor/owl.carousel/owl.carousel.min.js"></script>
  <script src="<%=application.getContextPath() %>/resources/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="<%=application.getContextPath() %>/resources/vendor/venobox/venobox.min.js"></script>
  <script src="<%=application.getContextPath() %>/resources/vendor/aos/aos.js"></script>
  <script src="<%=application.getContextPath() %>/resources/vendor/jquery.easing/jquery.easing.min.js"></script>


  
  <!-- End Footer -->

 

  <!-- Vendor JS Files -->
 
  <!-- Template Main JS File -->
  <script src="<%=application.getContextPath() %>/resources/js/main.js"></script>

</body>

</html>