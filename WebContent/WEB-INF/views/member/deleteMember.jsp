<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>OHOUSE</title>
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
        <form action="deleteMember" method="post" role="form" onsubmit="return checkDeleteMember()" enctype="multipart/form-data">
				<div class=" mt-5 mb-5">
					<div class="col">
						<h2>회원탈퇴</h2>
					</div>
				</div>
				<div class=" col mb-3">
					<h5><strong>회원 탈퇴 신청에 앞서 아래 내용을 반드시 확인해 주세요.</strong></h5>
				</div>
				<div class=" col">
					<div class = "border" style = "width: -webkit-fill-available;">
						<div style="margin: 2%;">
							<dl style = "width: -webkit-fill-available;">
							    <dt>회원탈퇴 시 게시물 관리</dt>
							    <dd class = "mr-1 ml-1"> 회원탈퇴 후 Ohouse 서비스에 입력한 게시물 및 댓글은 삭제되지 않으며, 회원정보 삭제로 인해 작성자 본인을 확인할 수 없으므로 게시물 편집 및 삭제 처리가 원천적으로 불가능 합니다. 게시물 삭제를 원하시는 경우에는 먼저 해당 게시물을 삭제 하신 후, 탈퇴를 신청하시기 바랍니다.
								</dd>
						    </dl>
					    </div>
				    </div>
				</div>
				
				<div class="form-check mt-3 mb-5">
				  <label class="form-check-label">
				    <input id = "necessary" type="checkbox" class="" value=""><strong>위 내용을 모두 확인하였습니다.<label class="text-danger"> 필수</label></strong>
				  </label>
				</div>
				
				<div class=" col mb-3">
					<h5><strong>Ohouse 회원에서 탈퇴하려는 이유가 무엇인가요? (복수선택 가능) <label class="text-danger"> 필수</label></strong></h5>
				</div>
				<div class=" col">
					<div class = "border" style = "width: -webkit-fill-available;">
						<div style="margin: 2%;">
							<div class = "mt-2 mb-2" style = "width: -webkit-fill-available;">
								<div class="form-check-inline col-4">
								  <label class="form-check-label">
								    <input type="checkbox" class="form-check-input" value="">이용빈도 낮음
								  </label>
								</div>
								<div class="form-check-inline col-4">
								  <label class="form-check-label">
								    <input type="checkbox" class="form-check-input" value="">재가입
								  </label>
								</div>
								<div class="form-check-inline col-3">
								  <label class="form-check-label">
								    <input type="checkbox" class="form-check-input" value="">콘텐츠/제품정보/상품 부족
								  </label>
								</div>
							</div>
	
							<div class = "mb-2" style = "width: -webkit-fill-available;">
								<div class="form-check-inline col-4">
								  <label class="form-check-label">
								    <input type="checkbox" class="form-check-input" value="">개인정보보호
								  </label>
								</div>
								<div class="form-check-inline col-4">
								  <label class="form-check-label">
								    <input type="checkbox" class="form-check-input" value="">회원특혜/쇼핑혜택 부족
								  </label>
								</div>
								<div class="form-check-inline col-3">
								  <label class="form-check-label">
								    <input type="checkbox" class="form-check-input" value="">기타
								  </label>
								</div>
						    </div>
					    </div>
				    </div>
				</div>
				
				<div class="col mt-5">
					<div class = "border" style="width: -webkit-fill-available;">
						<div style="margin: 2%;">
							<h5><strong>개인정보보호에 대한 안내</strong></h5>
							<p>고객님께 개인정보보호에 대한 안내드립니다.</p>
							<p>오늘의집에서는 고객 여러분의 개인 정보를 개인정보보호 방침에 따라 안전하게 관리하고 있습니다.</p>
							<p>또한 최근 언론을 통해 보도된 개인정보유출 사고는 오늘의집과 관련이 없음을 안내해 드리며, 고객님께서 안전하게 이용하실 수 있도록 보안에 더욱 힘쓰겠습니다. 감사합니다.</p>
						</div>
					</div>
				</div>
				
				<div class ="col mt-3 mb-3">
					<div class = "mx-auto">
						<button type="submit" class="btn" style = "color: white; background-color: #1bac91;">회원탈퇴</button>
						<a href = "mypage" class="btn ml-2 btn-info" style = "color: white;">취소하기</a>
					</div>
				</div>
      		</form>
		</div>
	</section><!-- End Contact Section -->
  </main><!-- End #main -->

  <a href="#" class="back-to-top"><i class="icofont-simple-up"></i></a>

  <!-- Vendor JS Files -->
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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