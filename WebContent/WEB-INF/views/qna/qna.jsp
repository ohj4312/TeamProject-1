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

  <style type="text/css">
	@media screen and (max-width: 1000px) {
		#qnaList {
			width: 100%;
			margin-left: auto; 
			margin-right: auto;
			
		}
		
		.mobile {
			display: none;
			
		}
		
		#writeButton {
			margin-right: 10px;
			
		}
	}
	
	@media screen and (min-width: 1000px) {
		#qnaList {
			width: 1000px;
			margin-left: auto; 
			margin-right: auto;
		}
		
		.mobile {
			
			text-align:center;
		}
	}	
  </style>

</head>

<body>

	<jsp:include page="/WEB-INF/views/include/Header.jsp" />
	
	<section id="services" class="section-bg mb-0" style="background-color: #ffffff;">
	
<%-- ########################################################################### --%>

	<div>
	<section style="padding-bottom:2.2rem" class="mb-0">
		<h3 style="text-align:center; margin-bottom:50px">Q&A</h3>
		</section>
		<div id="qnaList">
			<div style="text-align: right; margin-bottom: 10px; ">
				<a id="writeButton" type="button" class="btn btn-info" href="qnaWrite">글작성</a>
			</div>
		
		
			<table class="table table-lg table-bordered fade-up">
				<thead style="background-color: #CDE4E1 "><!-- class="thead-light " -->
					<tr>
						<th id="th1" class="mobile" style="width: 70px; font-weight: bold;">번호</th>
						<th id="th2" style="font-weight: bold; text-align:center; ">제목</th>
						<th id="th3" class="mobile" style="width: 100px; font-weight: bold;  ">사진</th>
						<th id="th4" class="mobile" style="width: 100px; font-weight: bold;">작성자</th>
						<th id="th5" class="mobile" style="width: 120px; font-weight: bold;">날짜</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="qna" items="${list}">
						<tr >
							<td class="mobile" style="text-align:center;">${qna.qnumber}</td>
							<td ><a style="color:black;" href="qnaDetail?qnumber=${qna.qnumber}">${qna.qtitle}</a></td>
							<td class="mobile" ><img class="rounded" width="70px" height="50px" src="<%=application.getContextPath()%>/file/qna?fileName=${qna.qphoto}"/></td>
							<td class="mobile">${qna.mnickname}</td>
							<td class="mobile"><fmt:formatDate value="${qna.qdate}" pattern="yyyy-MM-dd"/></td>
						</tr>
					</c:forEach>
	
					<!-- 컬럼 합침 -->
					<tr class="row text-center" style="width:1000%" >
						<%-- <td colspan="5" style="text-align: center; "><!-- <a
							class="btn btn-outline-none btn-sm"
							href="qnaindex?pageNo(1)" style=" border: 2px solid #e7e7e7;">&lt;</a> --> <c:if
								test="${pager.groupNo > 1}">
								 <a class="btn btn-outline-none btn-sm"
									href="qnaindex?pageNo=${pager.startPageNo-1}">이전</a> 
							</c:if> <c:forEach var="i" begin="${pager.startPageNo}"
								end="${pager.endPageNo}">
								<c:if test="${pager.pageNo == i }">
									<a class="btn  btn-sm" 
										href="qnaindex?pageNo=${i}">${i}</a>
								</c:if>
								<c:if test="${pager.pageNo != i }">
									<a class="btn  btn-sm" 
										href="qnaindex?pageNo=${i}">${i}</a>
								</c:if>
							</c:forEach> <c:if test="${pager.groupNo < pager.totalGroupNo}">
								 <a class="btn btn-outline-none btn-sm"
									href="qnaindex?pageNo=${pager.endPageNo+1}">다음</a> 
							</c:if>  <a class="btn btn-outline-none btn-sm"
							 href="qnaindex?pageNo=${pager.totalPageNo}" style=" border: 2px solid #e7e7e7;">&gt;</a></td> --%>
	
					</tr>
				</tbody>
			</table>
			
			<div class="input-group mb-3" style="width:10%; float:none; margin:0 auto">
								
	          <ul class="pagination" style="text-align:left">
	          	<c:if test="${pager.groupNo>1}">
	            	<li class="page-item"><a class="page-link" href="qnaindex?pageNo=${pager.startPageNo-1}">Previous</a></li>
	            </c:if>
	            
	            <c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}">
					<c:if test="${pager.pageNo==i}">
	           	 		<li class="page-item"><a style="color:#17a2b8" class="page-link"  href="qnaindex?pageNo=${i}">${i}</a></li>
	            	</c:if>
	            	<c:if test="${pager.pageNo!=i}">
	            		<li class="page-item"><a style="color:#17a2b8" class="page-link" href="qnaindex?pageNo=${i}">${i}</a></li>
	            	</c:if>
	             </c:forEach>
	             <c:if test="${pager.groupNo<pager.totalGroupNo}">
	            	<li class="page-item"><a class="page-link" href="qnaindex?pageNo=${pager.endPageNo+1}">Next</a></li>
	          	</c:if>
	          </ul>
	        </div>
		</div>
	</div>
</section>		


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