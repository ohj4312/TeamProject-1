<%@ page contentType="text/html; charset=UTF-8"%>
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
</head>

<body>

  <jsp:include page="/WEB-INF/views/include/Header.jsp"/>


 

  <main id="main">

    <section id="contact" class="contact mt-3">
      <div class="container" id="firstForm">
        <form action="forms/contact.php" method="post" role="form">
				<div class="row">
					<div class="col">
						<h2>사진 올리기</h2>
					</div>
				</div>
				<div class="row">
					<div class="form-group form-inline">
							<select id="home_select1" name="home_select1" class="form-control mr-2 ml-2"
								style="height: auto;">
								<option selected>평수</option>
								<option value="0">10평 미만</option>
								<option value="1">10평대</option>
								<option value="2">20평대</option>
								<option value="3">30평대</option>
								<option value="4">40평대</option>
								<option value="5">50평 이상</option>
							</select>
							<select id="home_select2" name="home_select2" class="form-control mr-2 ml-2"
								style="height: auto;">
								<option selected>주거형태</option>
								<option value="0">원룸&오피스텔</option>
								<option value="1">아파트</option>
								<option value="2">빌라&연립</option>
								<option value="3">단독주택</option>
								<option value="4">사무공간</option>
								<option value="5">상업공간</option>
								<option value="6">기타</option>
							</select>
							<select id="home_select3" name="home_select3" class="form-control mr-2 ml-2"
								style="height: auto;">
								<option selected>스타일</option>
								<option value="0">모던</option>
								<option value="1">북유럽</option>
								<option value="2">빈티지</option>
								<option value="3">내츄럴</option>
								<option value="4">프로방스&로맨틱</option>
								<option value="5">한국&아시아</option>
								<option value="6">유니크</option>
								<option value="7">기타</option>
              </select>
          

                <button type="submit" class="btn btn-info">글등록</button>
              
              
					</div>
				</div>
				<div id = "addForm">
				<div id = "cloneForm" class="row align-self-center" >
					<div class="col-lg-6 text-center mb-4 fancybox" style=" position: relative; height: 300px;">
						<div style="background-color:lightslategray;">

							<a href="javascript:addPhoto();" class="item-wrap">
								<i type="File" class="material-icons" 
									style="font-size: 7rem;     position: absolute;
										top: 50%;
										left: 50%;
										transform: translate(-50%, -50%);">photo_camera</i>
							</a>
						</div>
						<script>


						</script>
					</div>

					<div class="col-lg-6">

						<select id="homespace" name="homespace" style="height: auto;" class="form-control mb-3">
							<option selected>공간(필수)</option>
							<option value="0">원룸</option>
							<option value="1">거실</option>
							<option value="2">침실</option>
							<option value="3">주방</option>
							<option value="4">욕실</option>
							<option value="5">아이방</option>
							<option value="6">드레스룸</option>
							<option value="7">베란다</option>
							<option value="7">사무공간</option>
							<option value="7">상업공간</option>
							<option value="7">가구&소품</option>
							<option value="7">현관</option>
							<option value="7">외관&기타</option>
							<option value="7">제품리뷰</option>
						</select>

						<div>
							<div class="form-group">
								<textarea class="form-control" rows="10" id="comment" name="text"
									placeholder="사진에 대한 설명을 작성해주세요."></textarea>
							</div>
						</div>
					</div>
        </div> 

        
        
        
      </div>
      
      </form>
			</div>
			</div>
			</div>
			
	
    </section><!-- End Contact Section -->

    <div class="container">
			<!-- 추가하기 버튼 구현 -->

			<div style="height: 50px;"></div>
			<button type="button" class="btn btn-lg btn-light btn-block" onClick="addform()">추가하기</button>

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

</body>

</html>