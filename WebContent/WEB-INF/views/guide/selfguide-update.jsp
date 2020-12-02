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
	</script>

  <!-- ======= script ======= -->
 

  <main id="main">
	<div class="mt-5 mb-5 row">    </div>
    <!-- ======= Breadcrumbs ======= -->
    <section id="portfolio" class="portfolio_section">
    	<div id = "listappend" class="container">
      		<p><h2 style="font-size:3vw">셀프 인테리어 가이드북 </h2></p>
			<h5>나만의 노하우 올리기 </h5>
			<hr/>
			<br/>
      </div>
      <div class="container">
		<form action="<%=application.getContextPath()%>/selfguide/selfwrite" method="post" role="form" onsubmit="return selfWriteForm()" enctype="multipart/form-data">	
			<div class="row">
				<div class="col-12 mb-4 input-group-lg">
					<input id="stitle" name="stitle" type="text" class="form-control align-center" placeholder="Title">
					<div id="stitleError" class="error"></div>
				</div>
			</div>
			
			<div class="row">
				<div class="form-group col-12">
						<select id="stype" name="stype" class="form-control"
							style="height: auto;">
							<option selected>category</option>
							<option value="비용정리">비용정리</option>
							<option value="공간배치">공간배치</option>
							<option value="계획하기">계획하기</option>
							<option value="페인트도배">페인트 도배</option>
							<option value="바닥깔기">바닥깔기</option>
						</select>
						<span id="stypeError" class="error"></span>
				</div>
			</div>
			<div class="row col-sm-12 align-self-center">
				<div class="col-12 text-center mb-4 fancybox" style="position: relative; height: 300px;" style="border:1px solid gold">		
					<input type="file" id="simageAttach" name ="simageAttach" style="display:none;"> 
					<label id = "srclabel" for="simageAttach" style="width: 100%; height: 100%;"> 
	                	<i class="material-icons" 
							 style="font-size: 7rem; position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%);">photo_camera</i>
	               		<span id="simageError" class="error"></span>
	                </label> 
						
				</div>
				
			</div>
			<div class="row col-sm-12 align-self-center">
				<div class="col-12">
					<div>
						<div class="form-group">
							<textarea class="form-control" rows="10" id="scontent"
								name="scontent" placeholder="사진에 대한 설명을 작성해주세요."></textarea>
							<span id="scontentError" class="error"></span>
						</div>
					</div>
				</div>
			</div>
			<div style="height: 50px;"></div>
			<button type="submit" class="btn btn-lg btn-light btn-block" onClick="javascript:selfWriteForm()">등록하기</button>
		</form>
      </div>
      
      <div class="container">

			
			<script type="text/javascript">
				function selfWriteForm(){
					var stitle = $("#stitle").val().trim();
					if(stitle == "") { 
						$("#stitleError").text("*제목을 반드시 입력해야 합니다.");
						$("#stitleError").css('color','red');
					}else { 
						$("#stitleError").text("");
					}
					console.log("111111111");
					var scontent = $("#scontent").val().trim();
					if(scontent == "") {
						$("#scontentError").text("*내용을 반드시 입력해야 합니다."); 
						$("#scontentError").css('color','red');
					}else {
						$("#scontentError").text(""); 
					}
				 	var stype = $("#stype").val().trim();
					if(stype == "category") {
						$("#stypeError").text("*카테고리를 반드시 선택해야 합니다."); 
						$("#stypeError").css('color','red');
					}else {
						$("#stypeError").text(""); 
					}
					
					var simageAttach = $("#simageAttach").val();
					if(!simageAttach) {
						$("#simageError").text("*대표사진을 반드시 첨부해야 합니다."); 
						$("#simageError").css('color','red');
					}else {
						$("#simageError").text(""); 
					}
					
					var result;
					if(stitle == "" || scontent == "" || stype=="category" || !simageAttach ) {
						result=false;
						return result;	
					}else{
						result=true;
						return result;
					} 
				}
				
				 
			</script>
			

		</div>
    </section>


    <!-- ======= Portfolio Section ======= -->
    <section id="portfolio" class="portfolio">
      

    </section><!-- End Portfolio Section -->

   
  </main><!-- End #main -->

  <!-- ======= Footer ======= -->
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