<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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
<style type="text/css">
#a {
	background-position: left;
}

#menu {
	margin-left: 250px;
}

td a {
	text-decoration: none;
	color: inherit;
}
</style>
</head>

<body>

	<jsp:include page="/WEB-INF/views/include/Header.jsp" />
	<section id="services" class="section-bg mt-4" style="background-color: #ffffff;">
	
<%-- ########################################################################### --%>
<div class="container">
<div class="row">
	<div style="width: 1000px; margin-left: auto; margin-right: auto;" >
	<section style="padding-bottom:2rem" class="mb-1">
		<h3 style="margin-bottom:50px; padding-left: 15px;">Q&A 질문 작성</h3>
		</section>
		<section>
		<div class="col-sm">
		<form id="qnaUpdateForm" method="post" action="qnaUpdate" enctype="multipart/form-data"><!-- input type="file사용할때 enctype="multipart/form-data" 사용하기  -->
			<!-- <table style="width:auto" class="table table-sm table-bordered"> -->
			<input type="hidden" id="qnumber" name="qnumber" value="${qna.qnumber}">
			
			<div class="input-group">
				<div class="input-group-prepend"><span class="input-group-text"
					 style="background-color: #CDE4E1; font-weight: bold; ">제목</span></div>
				<input id="qtitle" type="text" name="qtitle" class="form-control" value="${qna.qtitle}">
			
				<span id="qtitleError" class="error"></span>
			</div>
			
			<div class="input-group">
				<div class="input-group-prepend"><span class="input-group-text"
					 style="background-color: #CDE4E1; font-weight: bold; ">내용</span></div>
				<textarea id="qcontent" name="qcontent" class="form-control" rows="10">${qna.qcontent}</textarea>
				<span id="qcontentError" class="error"></span>
			</div>
			
			
			<div class="input-group">
				<div class="input-group-prepend"><span class="input-group-text"
					 style="background-color: #CDE4E1; font-weight: bold; ">사진</span></div>
				<input type="file" name="attach" class="form-control">
			</div> 
			
			<div class="input-group">
				<div class="input-group-prepend"><span class="input-group-text"
					 style="background-color: #CDE4E1; font-weight: bold; ">별명</span></div>
				<input id="mnickname" type="text" name="mnickname" class="form-control" value="${member.mnickname}" 
						style="background-color: #ffffff;"readonly>
				<span id="qtitleError" class="error"></span>
			</div>
			<!-- //로그인이 되면 로그인된 아이디가 들어간다.값이 없으면 필수, 값이  있으면 에러가 없어서 비워두겠다. -->	
			<div style="text-align: center; margin-top: 10px;">
				<input type="submit" class="btn btn" value="글수정" style="color: #007bff; border: 1px solid #dee2e6;"/>
				<a class="btn btn" href="qnaindex" style="color: #007bff; border: 1px solid #dee2e6;">취소</a>	
			</div>
		</form>
		</div>
		</section>
	</div>
	</div>
</div>	
</section>
<%-- ########################################################################### --%>	
	
	<jsp:include page="/WEB-INF/views/include/footer.jsp"/>

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