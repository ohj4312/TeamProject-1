<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

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

table.type09 {
    border-collapse: collapse;
    text-align: left;
    line-height: 2.0;
    border: 1px solid #ccc;

}
table.type09 thead th {
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    color: #369;
    border-bottom: 3px solid #036;
}
table.type09 tbody th {
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
    background: #f3f6f7;
}
table.type09 td {
    padding: 10px;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
}
</style>

	<style type="text/css">
		@media screen and (max-width: 1000px) {
			th {
				width: 30px;
			}
			
			td {
				width: 70%;
			}
		}
		
		@media screen and (min-width: 1000px) {
			th {
				width: 200px;
			}
			
			td {
				width: 800px;
			}
		}	
	</style>

</head>

<body>

	<jsp:include page="/WEB-INF/views/include/Header.jsp" />
	<section id="services" class="section-bg mt-5" style="background-color: #ffffff;">
	
<%-- ########################################################################### --%>

	<div>
		<h3 style="text-align:center; margin-bottom: 50px;">Notice</h3>
			<div>
				<table class="type09" style="margin-left:auto; margin-right:auto;">
					
					<tbody>
						<tr>
							<th scope="row">번호</th>
							<td>${notice.nnumber}</td>
						</tr>
						<tr>
							<th scope="row">제목</th>
							<td >${notice.ntitle}</td>
							
						</tr>
						<tr>
							<th scope="row">내용</th>
							<td >${notice.ncontent}</td>
							
						</tr>
					</tbody>
				</table>
				<div style="text-align: center; margin-top:10px">
				<sec:authorize access="hasRole('ROLE_ADMIN')">
					<form  method="post" action="noticeDelete?nnumber=${notice.nnumber}">
						<input type="submit" value="삭제" class="btn btn" style="color: #007bff; border: 1px solid #dee2e6;">
						<a class="btn btn btn" href="noticeUpdate?nnumber=${notice.nnumber}" style="color: #007bff; border: 1px solid #dee2e6;">수정</a>
					</form>
				</sec:authorize>
				<a class="btn btn btn" href="list" style="color:#007bff; border: 1px solid #dee2e6;">목록</a>
				</div>
			</div>
	</div>




		
<%-- ########################################################################### --%>	
	</section>
	
	<!-- ======= Footer ======= -->
	 <jsp:include page="/WEB-INF/views/include/footer.jsp"/>
	<!-- End Footer -->

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