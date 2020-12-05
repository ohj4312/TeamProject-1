<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

  <style type="text/css">
	@media screen and (max-width: 1000px){
		#noticeList{
			width: 100%;
			margin-left:auto;
			margin-right: auto;
		}
		
		
		#writeButton{
			margin-right: 10px;
		}
		
	}
	
	@media screen and (min-width: 1000px) {
		#noticeList{
			width: 1000px;
			margin-left: auto; 
			margin-right: auto;
		}
	}
  </style>

</head>

<body>
	
	<jsp:include page="/WEB-INF/views/include/Header.jsp" />
	<section id="services" class="section-bg mb-2" style="background-color: #ffffff; padding-bottom:1rem">
	
<%-- ########################################################################### --%>
		
		
<div>
	<section style="padding-bottom:2.55rem" class="mb-0">
	<h3 style="text-align:center; margin-top:40px;">Notice</h3>
	</section>

	<div id="noticeList">
		<div style="text-align:right; margin-bottom: 10px;">
			<sec:authorize access="hasRole('ROLE_ADMIN')">
				<a id="writeButton" type="button" class="btn btn" href="noticeWrite" style="background-color:#17a2b8; color:#ffffff">글작성</a>		
			</sec:authorize>
		</div>
		
		<table class="table table-lg table-bordered fade-up">
			<thead style="background-color: #CDE4E1">
				<tr>
					<th style="width:70px; font-weight: bold; text-align:center;">번호</th>
					<th style= "text-align:center; font-weight: bold; padding-right:80px">제목</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="notice" items="${list}">
					<tr >
						<td style="text-align:center; height:70px;">${notice.nnumber}</td>
						<td  style="height: 70px;"><a style="color:black;" href="noticeDetail?nnumber=${notice.nnumber}">${notice.ntitle}</a></td>
						
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
		<div class="row text-center">
			<ul class="pagination mx-auto"  >
				<c:if test="${pager.groupNo>1}">
					<li class="page-item"><a class="page-link" href="list?pageNo=${pager.startPageNo-1}">Previous</a></li>					
				</c:if>
				
				<c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}">
					<c:if test="${pager.pageNo==i}">
						<li class="page-item"><a style="color:#17a2b8" class="page-link" href="list?pageNo=${i}">${i}</a></li>
					</c:if>
					<c:if test="${pager.pageNo!=i}">
						<li class="page-item"><a style="color:#17a2b8" class="page-link" href="list?pageNo=${i}">${i}</a></li>
					</c:if>
				</c:forEach>
				<c:if test="${pager.groupNo<pager.totalGroupNo}">
					<li class="page-item"><a class="page-link" href="list?pageNo=${pager.endPageNo+1}">Next</a></li>
				</c:if>
			</ul>
		</div>
		
	</div>
	</section>
	
</div>
<section style="padding-bottom: 0.9rem"></section>		
	

<%-- ########################################################################### --%>	
 <jsp:include page="/WEB-INF/views/include/footer.jsp"/>

  <!-- Vendor JS Files -->
   <script src="<%=application.getContextPath() %>/resources/vendor/jquery/jquery.min.js"></script>
  <script src="<%=application.getContextPath() %>/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="<%=application.getContextPath() %>/resources/vendor/php-email-form/validate.js"></script>
  <script src="<%=application.getContextPath() %>/resources/vendor/owl.carousel/owl.carousel.min.js"></script>
  <script src="<%=application.getContextPath() %>/resources/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="<%=application.getContextPath() %>/resources/vendor/venobox/venobox.min.js"></script>
  <script src="<%=application.getContextPath() %>/resources/vendor/aos/aos.js"></script>
  <script src="<%=application.getContextPath() %>/resources/vendor/jquery.easing/jquery.easing.min.js"></script>
  

  <!-- Template Main JS File -->
  <script src="<%=application.getContextPath() %>/resources/js/main.js"></script>
		
</body>
</html>