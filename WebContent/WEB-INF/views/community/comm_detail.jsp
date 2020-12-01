<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet">

<!-- Vendor CSS Files -->
<link
	href="<%=application.getContextPath()%>/resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="<%=application.getContextPath()%>/resources/vendor/icofont/icofont.min.css"
	rel="stylesheet">
<link
	href="<%=application.getContextPath()%>/resources/vendor/boxicons/css/boxicons.min.css"
	rel="stylesheet">
<link
	href="<%=application.getContextPath()%>/resources/vendor/owl.carousel/assets/owl.carousel.min.css"
	rel="stylesheet">
<link
	href="<%=application.getContextPath()%>/resources/vendor/venobox/venobox.css"
	rel="stylesheet">
<link
	href="<%=application.getContextPath()%>/resources/vendor/aos/aos.css"
	rel="stylesheet">

<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">

<!-- Template Main CSS File -->
<link href="<%=application.getContextPath()%>/resources/css/style.css"
	rel="stylesheet">

<!-- =======================================================
  * Template Name: Maxim - v2.2.0
  * Template URL: https://bootstrapmade.com/maxim-free-onepage-bootstrap-theme/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>
<style>
.follow-btn{
	padding:4px 10px;
	font-size:13px;
	line-height:20px;
	font-weight:700;
	background-color:#f5f5f5;
	border-color:#f5f5f5;
	color:#757575;
	margin:0;
	box-sizing:border-box;
	border:1px solid transparent;
	border-radius:4px;
}
</style>
<body>
	<% pageContext.setAttribute("br", "<br/>");
	   pageContext.setAttribute("cn", "\n"); %>
	<jsp:include page="/WEB-INF/views/include/Header.jsp" />

	<main id="main">
		<!-- ======= Breadcrumbs ======= -->
		<section id="breadcrumbs" class="breadcrumbs">
			
		</section>
		<!-- End Breadcrumbs -->

		<!-- ======= Blog Section ======= -->
		<section id="blog" class="blog">
			
			<div class="container">

				<div class="row">

					<div class="col-lg-8 entries">

						<article class="entry entry-single" >


							<h3 class="entry-title" style="text-align:left">${list.c_title}</h3>

							<div class="entry-meta">
								<ul>
									<li class="d-flex align-items-center">
									<i class="icofont-user"></i> 
										<a href="<%=application.getContextPath()%>/member/yourhomesearch?pwriter=${list.memail}">
											${list.c_mnickname}</a></li>
									<li class="d-flex align-items-center" ><i
										class="icofont-wall-clock"></i> <a href="blog-single.html"><time
												>  ${list.c_date}</time></a></li>
								</ul>
							</div>

							<div class="entry-content">
								<p>${fn:replace(list.c_content, cn, br)}</p>

								<img src="<%=application.getContextPath() %>/community/comm_listphoto?fileName=${list.c_image}"
									style="height:100%; width:100%">

							</div>

							<div class="entry-footer clearfix">
								<div class="float-left">
									<i class="icofont-folder"></i>
									<ul class="cats">
										<li><a href="#">Business</a></li>
									</ul>

									<i class="icofont-tags"></i>
									<ul class="tags">
										<li><a href="#">Creative</a></li>
										<li><a href="#">Tips</a></li>
										<li><a href="#">Marketing</a></li>
									</ul>
								</div>

								<div class="float-right share">
									<a href="" title="Share on Twitter"><i
										class="icofont-twitter"></i></a> <a href=""
										title="Share on Facebook"><i class="icofont-facebook"></i></a>
									<a href="" title="Share on Instagram"><i
										class="icofont-instagram"></i></a>
								</div>
							</div>
						</article>
					</div>
					<!-- End blog entry -->
						
						<div class="col-lg-4">
							<div class="sidebar">
								<div class="detail_container_sidebar_content">
									<div class="detail-left" style="display:inline-block;">
									<ul>
										<li class="d-flex align-items-center">
											<img src="<%=application.getContextPath()%>/photo/photodownload?fileName=${list.mimage}" style="width:60px; height:60px; border-radius: 100%;">
										</li>
										<li class="d-flex align-items-center">
											<a href="<%=application.getContextPath()%>/member/yourhomesearch?pwriter=${list.memail}">${list.c_mnickname}</a>
										</li>
									</ul>
									</div>
									<div class="detail-right" style="display:inline-block; padding-left:5%;">
									<a class="follow-btn">팔로우</a>
									</div>
									<div id="comm_hitsList">
									<script>
										function communitylist(check){            
								            	$.ajax({
								    				url:"<%=application.getContextPath() %>/community/comm_list",
								    				data: {check:check, search:search},
								    				success:function(data){    					
								    					$("#comm_hitsList").html(data);
								    					console.log("실행");
								    				
								    				}
								    			});	
								      		}     
										</script>
									</div>
								</div>
							</div>
						</div>
						
						<!-- End blog author bio -->
					
						<div class="blog-comments col-lg-8">

							<h4 class="comments-count">1 Comments</h4>

							<div id="comment-1" class="comment clearfix">
								<img src="<%=application.getContextPath()%>/resources/img/person_1.jpg"
									class="comment-img  float-left" alt="">
								<h5>
									<a href="">Georgia Reader</a> <a href="#" class="reply"><i
										class="icofont-reply"></i> Reply</a>
								</h5>
								<time datetime="2020-01-01">01 Jan, 2020</time>
								<p>Et rerum totam nisi. Molestiae vel quam dolorum vel
									voluptatem et et. Est ad aut sapiente quis molestiae est qui
									cum soluta. Vero aut rerum vel. Rerum quos laboriosam placeat
									ex qui. Sint qui facilis et.</p>

							</div>
							
					
							<input type="text" id="rcontent" class="form-control" placeholder="댓글을 남겨보세요!" style="display:inline-block; width:91%;">
							<a class="btn btn-outline" style="display:inline-block; background-color:#1bac91; color:white" href="javascript:commreplyWrite(${list.c_number})">등록</a>
							
							<div id="reply_result">
							
							
							</div>
							
						</div>
						<!-- End blog comments -->

					</div>
					<!-- End blog entries list -->


			</div>
			<!-- End Container -->
			
		</section>
		<!-- End Blog Section -->
	</main>
	<!-- End #main -->
	
	<a href="#" class="back-to-top"><i class="icofont-simple-up"></i></a>

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

	<a href="#" class="back-to-top"><i class="icofont-simple-up"></i></a>

	<!-- Vendor JS Files -->
	<script
		src="<%=application.getContextPath()%>/resources/vendor/jquery/jquery.min.js"></script>
	<script
		src="<%=application.getContextPath()%>/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
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
	<script
		src="<%=application.getContextPath()%>/resources/vendor/jquery.easing/jquery.easing.min.js"></script>

	<!-- Template Main JS File -->
	<script src="<%=application.getContextPath()%>/resources/js/main.js"></script>

	<script>
		$(function(){
			communitylist(2);  
		});
		
		function commreplyWrite(c_number){
			var rcontent = $("#rcontent").val().trim();
			
			if(rcontent!=""){
				console.log("댓글 실행");
				$.ajax({
					url : "/teamproject/community/comm_replyWrite",
					method : "post",
					data : {rcontent:rcontent, c_number: c_number},
					success:function(data){
						console.log("댓글 진짜 성공이야");
						if(data.result=="success"){
							/* commreplyList(c_number); */
						}
						$("#reply_result").html(data);
					}
				});
			}
		}
		
		/* function commreplyList(cnumber, pageNo){
			if(!pageNo){
				pageNo=1;
			}
			$.ajax({
				url:"/teamproject/community/comm_replyList",
				data:{pageNo:pageNo, cnumber:cnumber},
				success:function(data){
					$("#reply_result").html(data);
				}
			});
		} */
	</script>



</body>
</html>