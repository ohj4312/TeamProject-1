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
	<h3 style="text-align:center; margin-bottom:50px">Q&A</h3>
		<div>
			<table class="type09" style="margin-left: auto; margin-right: auto;">
			    
			    <tbody>
			    <tr>
			        <th scope="row">번호</th>
			        <td>${qna.qnumber}</td>
			    </tr>
			
			    <tr>
			        <th scope="row">제목</th>
			        <td>${qna.qtitle}</td>
			    </tr>
			    <tr>
			        <th scope="row">사진</th>
			        <td><img class="rounded" width="70px" height="50px" src="<%=application.getContextPath()%>/file/qna?fileName=${qna.qphoto}"/></td>
			    </tr>
			    <tr>
			        <th scope="row">글쓴이</th>
			        <td>${qna.mnickname}</td>
			    </tr>
			    <tr>
			        <th scope="row">날짜</th>
			        <td><fmt:formatDate value="${qna.qdate}" pattern="yyyy-MM-dd"/></td>
			    </tr>
			    <tr>
			        <th scope="row">내용</th>
			        <td style="width:100px">${qna.qcontent}</td>
			    </tr>
			    <c:if test="${qna.answer == null}">
				    <tr>			        
				    	<th scope="row">답변내용</th>
				        <td style="width:100px; color:red;">아직 답변이 없습니다.</td>
				    </tr>
			    </c:if>
			    <c:if test="${qna.answer != null}">
				    <tr>			        
				    	<th scope="row">답변내용</th>
				        <td style="width:100px">${qna.answer}</td>
				    </tr>
				</c:if>
			    </tbody>
			  
			</table>
			
				<c:if test="${member.mnickname == qna.mnickname}">
				 	<div style="text-align: center; margin-top: 10px; margin-right:880px">
				    	 
				    	<form method="post" action="qnaDelete?qnumber=${qna.qnumber}">
				    		<input type="submit" value="삭제" class="btn btn-info" >
				    		<a class="btn btn-info" href="qnaUpdate?qnumber=${qna.qnumber}">수정</a>
				    		
				    	</form>
				    	
				    </div>
			   </c:if>
			   	
			   	<div style="text-align: center; margin-top: 10px;">
						<a class="btn btn-info" href="qnaindex">목록</a>				   
				   	<sec:authorize access="hasRole('ROLE_ADMIN')"><!-- admin이여야만 볼 수 있다. -->
						<a class="btn btn-info" href="qnaAnswer?qnumber=${qna.qnumber}">답변</a>
					</sec:authorize>
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