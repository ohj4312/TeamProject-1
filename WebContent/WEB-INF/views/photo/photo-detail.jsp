<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Maxim Bootstrap Template - Index</title>
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

  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="<%=application.getContextPath() %>/resources/css/style.css" rel="stylesheet">

  <!-- =======================================================
  * Template Name: Maxim - v2.2.0
  * Template URL: https://bootstrapmade.com/maxim-free-onepage-bootstrap-theme/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
  
   <style media="screen">
   .scroll{
     width: 1000px;
     height: 300px;
     overflow-x: scroll;
     white-space:nowrap
   }
   .scroll img{
       width:300px;
       height:100%;
   }
 </style>
</head>

<body>

  <!-- ======= Header ======= -->
  <jsp:include page="/WEB-INF/views/include/Header.jsp"/>

  <main id="main">

    <!-- ======= Breadcrumbs Section ======= -->
    <section class="section mt-3">
      <div class="container mt-5">
        <div class="row">
          <div class="col-md-8" data-aos="fade-up">
            <h2>${photo.psize} | ${photo.ptype} | ${photo.pstyle}</h2>
            
          </div>
        </div>
      </div>



      <div class="container">
        <div class="row">
         <div id = "owl-carousel"class="owl-carousel portfolio-details-carousel col-md-8">
          	<c:forEach var="photo" items="${photo.list}">
          		<img src="photodownload?fileName=${photo.aimage}" class="img-fluid" alt="">
			</c:forEach>
          </div>

          <div id="head" class="col-md-4">



            <button id="likepush" type="button" class="btn btn-light" style="width:120px; box-shadow:none;" onclick="">
              <span id="likepush"class="material-icons">favorite_border</span></button>        
				
            <a id="RegBookMark" class="btn btn-light" style="width:120px; box-shadow:none;" onclick="javascript:RegBookMark()">
				<span id="RegBookMark"class="material-icons">bookmark_border</span>
			</a>
				


            
            <div class="card-detail-sidebar__content">
              <div class="card-detail-writer">
                <div class="card-detail-writer__user mt-3">
                  <a class="card-detail-writer__link" href="#">
                    <img class="rounded-circle" style="width:60px; height:60px;" src="resources/images/photo7.jpg" />
                    <span class="card-detail-writer__name">${photo.mnickname}</span>
                  </a>
                  <a href="#" class="btn btn-info btn-sm" role="button">팔로우</a>
                </div>
              </div>
              
            </div>

          </div>
        </div>
      </div>

		</section>

    <div class="container">



      <div class="col-md-8" style="width:100%">

        <div class="input-group mb-3" style="width:100%; float:none; margin:0 auto">
          <h4>댓글 </h4>
          <h4 style="color:DodgerBlue">&nbsp;#개</h4>
        </div>
      </div>
      <div class="col-md-8" style="width:100%">

        <div class="input-group mb-3" style="width:100%; float:none; margin:0 auto">
          <span class="material-icons" style="font-size:45px; color:#4169E1;">
            face
          </span>
          <input type="text" class="form-control" placeholder="칭찬과 격려는 큰 힘이됩니다!">
          <div class="input-group-apeend">
            <button class="btn btn-outline btn-primary" type="submit">등록</button>
          </div>
        </div>
      </div>
    </div>


    <div class="container">
      <div>
        <h5 style="text-align:left;">댓글들이 나오는 부분</h5>
      </div>

      <div class="row text-center" style="width:100%">

        <div class="input-group mb-3" style="width:50%; float:none; margin:0 auto">

          <ul class="pagination" style="text-align:left">
            <li class="page-item"><a class="page-link" href="#">Previous</a></li>
            <li class="page-item"><a class="page-link" href="#">1</a></li>
            <li class="page-item"><a class="page-link" href="#">2</a></li>
            <li class="page-item"><a class="page-link" href="#">3</a></li>
            <li class="page-item"><a class="page-link" href="#">4</a></li>
            <li class="page-item"><a class="page-link" href="#">Next</a></li>
          </ul>
        </div>
      </div>
    </div>


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
        <!-- All the links in the footer should remain intact. -->
        <!-- You can delete the links only if you purchased the pro version. -->
        <!-- Licensing information: https://bootstrapmade.com/license/ -->
        <!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/maxim-free-onepage-bootstrap-theme/ -->
        Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
      </div>
    </div>
  </footer><!-- End Footer -->

  <a href="#" class="back-to-top"><i class="icofont-simple-up"></i></a>

  <!-- Vendor JS Files -->
   <script src="<%=application.getContextPath() %>/resources/vendor/jquery/jquery.min.js"></script>
  <script src="<%=application.getContextPath() %>/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="<%=application.getContextPath() %>/resources/vendor/jquery.easing/jquery.easing.min.js"></script>
  <script src="<%=application.getContextPath() %>/resources/vendor/php-email-form/validate.js"></script>
  <script src="<%=application.getContextPath() %>/resources/vendor/owl.carousel/owl.carousel.min.js"></script>
  <script src="<%=application.getContextPath() %>/resources/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="<%=application.getContextPath() %>/resources/vendor/venobox/venobox.min.js"></script>
  <script src="<%=application.getContextPath() %>/resources/vendor/aos/aos.js"></script>

  <!-- Template Main JS File -->
  <script src="<%=application.getContextPath() %>/resources/js/main.js"></script>
  <script type="text/javascript">
				
				function likepushCheck(){
					var pnumber = ${photo.pnumber}
					
						 $.ajax({
							 
							 		url:"<%=application.getContextPath()%>/like/likePushCheck",
									method : "get",
									data : {pnumber:pnumber},
									success : function(data) {
										
								if (data.result == "success") {							
									$("#likepush").attr("class", "btn btn-light");
									$("#likepush").attr("onclick","likePush()");
				
								} else {									
									$("#likepush").attr("class", "btn btn-danger");
									$("#likepush").attr("onclick","likePushcancel()");
								}
				
							}
						}); 
				
					}
				
				function likePushcancel(){		
							
					var pnumber = ${photo.pnumber}
							
				             	$.ajax({
									url:"<%=application.getContextPath()%>/like/likePushCancel",
									method : "get",
									data : {pnumber:pnumber},
									success : function(data) {
										if (data.result == "success") {
											likepushCheck();												
												}				
											}
										});
									}
				
				function likePush() {				            								
					var pnumber = ${photo.pnumber}	
					$.ajax({
						url:"<%=application.getContextPath()%>/like/likePush",
						method : "get",
						data : {pnumber:pnumber},
						success : function(data) {
							if (data.result == "success") {
								likepushCheck();												
									}				
								}
							});
						} 
										
				</script>
				 <script type="text/javascript">
              	function CheckBookMark(){
              		console.log("check로 넘어간 후");
              		var pnumber = ${photo.pnumber}
              		$.ajax({
              			url: "<%=application.getContextPath()%>/BK/CheckBookMark",
              			data : {pnumber:pnumber},
              			method: "get",
              			success: function(data){
              				
              				if(data.result== "success"){
              					$("#RegBookMark").attr("class","btn btn-light");
              					$("#RegBookMark").attr("onclick","RegBookMark()");
              				}else{
              					$("#RegBookMark").attr("class","btn btn-primary");
              					$("#RegBookMark").attr("onclick","CancelBookMark()");
              				}
              			}
              		});
              	}
              
            	function RegBookMark(){
            		console.log("실행");
            		var pnumber = ${photo.pnumber}
            		
            		$.ajax({
            			url : "<%=application.getContextPath()%>/BK/regBookMark",
            			data: {pnumber: pnumber },
                		method:"get",
                		success:function(data){
                			if(data.result=="success"){
                				console.log("check 넘어가기 전");
                				CheckBookMark();
                			}
                		}
            		});		
            	}
            
            	function CancelBookMark(){
            		console.log("Cancel로 넘어옴");
            		var pnumber = ${photo.pnumber}
            		$.ajax({
                		url:"<%=application.getContextPath()%>/BK/CancelBookMark",
                		data :{pnumber:pnumber},
                		method:"get",
                		success:function(data){
                			if(data.result == "success"){
                				CheckBookMark();
                			}
                		}
            		});	
            	}
            	
            </script>
				
   <script type="text/javascript">
  $(function(){
		 likepushCheck();	
		 CheckBookMark();
	 			});
  
  </script>
</body>

</html>