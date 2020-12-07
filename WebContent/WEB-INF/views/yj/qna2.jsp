<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>O-house</title>
<meta content="" name="descriptison">
<meta content="" name="keywords">

<!-- Favicons -->
<link href="assets/img/favicon.png" rel="icon">
<link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">
<!-- Google Fonts -->
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
<!-- Vendor CSS Files -->
<link href="<%=application.getContextPath()%>/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="<%=application.getContextPath()%>/resources/vendor/icofont/icofont.min.css" rel="stylesheet">
<link href="<%=application.getContextPath()%>/resources/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
<link href="<%=application.getContextPath()%>/resources/vendor/owl.carousel/assets/owl.carousel.min.css" rel="stylesheet">
<link href="<%=application.getContextPath()%>/resources/vendor/venobox/venobox.css" rel="stylesheet">
<link href="<%=application.getContextPath()%>/resources/vendor/aos/aos.css" rel="stylesheet">	
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<!-- Template Main CSS File -->
<link href="<%=application.getContextPath()%>/resources/css/style.css"rel="stylesheet">

<!-- =======================================================
  * Template Name: Maxim - v2.2.0
  * Template URL: https://bootstrapmade.com/maxim-free-onepage-bootstrap-theme/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
<style type="text/css">
	qna_list tr{
		border-bottom: 1px solid #999
	} 
	table{
	width: 1000px; 
	 
	margin-left: auto;  
	margin-right: auto;
	}
	tbody td{
	border-bottom: solied;
	}
	
</style>
</head>

<body>

	<jsp:include page="/WEB-INF/views/include/Header.jsp" />

	<main id="main">

		<!-- ======= Services Section ======= -->
	<section id="services" class="section-bg mt-5">
		<div class="sector">
			<div>
				<div id="menu" class="container">
				  <h2>고객센터</h2>
					  <p></p>
						  <div class=" btn-group-vertical">
						    <button type="button" class="btn btn-white">공지사항</button>
						    <button type="button" class="btn btn-white">Q&A</button>
						    <button type="button" class="btn btn-white">의견제시하기</button>
						  </div>
					</div>
				</div>
			<div class="qna_list_wrap">
				<table class="qna_list ">
				
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>날짜</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>1</td>
							<td><a href="#">오늘</a></td>
							<td>관리자</td>
							<td>2020-11-27</td>
						</tr>
						<tr>
							<td>2</td>
							<td><a href="#">하루</a></td>
							<td>관리자</td>
							<td>2020-11-27</td>
						</tr>
						<tr>
							<td>3</td>
							<td><a href="#">종일</a></td>
							<td>관리자</td>
							<td>2020-11-27</td>
						</tr>
						<tr>
							<td>4</td>
							<td><a href="#">공부</a></td>
							<td>관리자</td>
							<td>2020-11-27</td>
						</tr>
						<tr>
							<td>5</td>
							<td><a href="#">ㄱㄱ</a></td>
							<td>관리자</td>
							<td>2020-11-27</td>
						</tr>
						<tr>
							<td>6</td>
							<td><a href="#">ㄱㄱ</a></td>
							<td>관리자</td>
							<td>2020-11-27</td>
						</tr>
						<tr>
							<td>7</td>
							<td><a href="#">ㄱㄱ</a></td>
							<td>관리자</td>
							<td>2020-11-27</td>
						</tr>
						<tr>
							<td>8</td>
							<td><a href="#">ㄱㄱ</a></td>
							<td>관리자</td>
							<td>2020-11-27</td>
						</tr>
					</tbody>
				</table>
			</div>
			</div>
		</section>
	</main>



	<!-- ======= Footer ======= -->
	<footer id="footer">
		<div class="footer-top">
			<div class="container">
				<div class="row">

					<div class="col-lg-3 col-md-6">
						<div class="footer-info">
							<h3>Maxim</h3>
							<p>
								A108 Adam Street <br> NY 535022, USA<br>
								<br> <strong>Phone:</strong> +1 5589 55488 55<br> <strong>Email:</strong>
								info@example.com<br>
							</p>
							<div class="social-links mt-3">
								<a href="#" class="twitter"><i class="bx bxl-twitter"></i></a> <a
									href="#" class="facebook"><i class="bx bxl-facebook"></i></a> <a
									href="#" class="instagram"><i class="bx bxl-instagram"></i></a>
								<a href="#" class="google-plus"><i class="bx bxl-skype"></i></a>
								<a href="#" class="linkedin"><i class="bx bxl-linkedin"></i></a>
							</div>
						</div>
					</div>

					<div class="col-lg-2 col-md-6 footer-links">
						<h4>Useful Links</h4>
						<ul>
							<li><i class="bx bx-chevron-right"></i> <a href="#">Home</a></li>
							<li><i class="bx bx-chevron-right"></i> <a href="#">About
									us</a></li>
							<li><i class="bx bx-chevron-right"></i> <a href="#">Services</a></li>
							<li><i class="bx bx-chevron-right"></i> <a href="#">Terms
									of service</a></li>
							<li><i class="bx bx-chevron-right"></i> <a href="#">Privacy
									policy</a></li>
						</ul>
					</div>

					<div class="col-lg-3 col-md-6 footer-links">
						<h4>Our Services</h4>
						<ul>
							<li><i class="bx bx-chevron-right"></i> <a href="#">Web
									Design</a></li>
							<li><i class="bx bx-chevron-right"></i> <a href="#">Web
									Development</a></li>
							<li><i class="bx bx-chevron-right"></i> <a href="#">Product
									Management</a></li>
							<li><i class="bx bx-chevron-right"></i> <a href="#">Marketing</a></li>
							<li><i class="bx bx-chevron-right"></i> <a href="#">Graphic
									Design</a></li>
						</ul>
					</div>

					<div class="col-lg-4 col-md-6 footer-newsletter">
						<h4>Our Newsletter</h4>
						<p>Tamen quem nulla quae legam multos aute sint culpa legam
							noster magna</p>
						<form action="" method="post">
							<input type="email" name="email"><input type="submit"
								value="Subscribe">
						</form>

					</div>

				</div>
			</div>
		</div>

		<div class="container">
			<div class="copyright">
				&copy; Copyright <strong><span>Maxim</span></strong>. All Rights
				Reserved
			</div>
			<div class="credits">
				All the links in the footer should remain intact. You can delete the
				links only if you purchased the pro version. Licensing information:
				https://bootstrapmade.com/license/ Purchase the pro version with
				working PHP/AJAX contact form:
				https://bootstrapmade.com/maxim-free-onepage-bootstrap-theme/
				Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
			</div>
		</div>
	</footer>
	<!-- End Footer -->

	<a href="#" class="back-to-top"><i class="icofont-simple-up"></i></a>

	<!-- Vendor JS Files -->
	<script
		src="<%=application.getContextPath()%>/resources/vendor/jquery/jquery.min.js"></script>
	<script
		src="<%=application.getContextPath()%>/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script
		src="<%=application.getContextPath()%>/resources/vendor/jquery.easing/jquery.easing.min.js"></script>
	<script
		src="<%=application.getContextPath()%>/resources/vendor/php-email-form/validate.js"></script>
	<script
		src="<%=application.getContextPath()%>/resources/vendor/owl.carousel/owl.carousel.min.js"></script>
	<script
		src="<%=application.getContextPath()%>/resources/vendor/isotope-layout/isotope.pkgd.min.js"></script>
	<script
		src="<%=application.getContextPath()%>/resources/vendor/venobox/venobox.min.js"></script>
	<script
		src="<%=application.getContextPath()%>/resources/vendor/aos/aos.js"></script>

	<!-- Template Main JS File -->
	<script src="<%=application.getContextPath()%>/resources/js/main.js"></script>


</body>

</html>