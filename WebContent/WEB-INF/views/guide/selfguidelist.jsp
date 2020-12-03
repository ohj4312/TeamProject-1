<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html >

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Self Guide </title>
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
  <link href="<%=application.getContextPath() %>/resources/vendor/animate.css/animate.min.css" rel="stylesheet">

  <link href="<%=application.getContextPath() %>/resources/vendor/owl.carousel/assets/owl.carousel.min.css" rel="stylesheet">
  <link href="<%=application.getContextPath() %>/resources/vendor/venobox/venobox.css" rel="stylesheet">
	<link href="<%=application.getContextPath() %>/resources/vendor/aos/aos.css" rel="stylesheet">

 	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
  <!-- Template Main CSS File -->
  <link href="<%=application.getContextPath() %>/resources/css/style.css" rel="stylesheet">

  <!-- =======================================================
  * Template Name: Eterna - v2.1.0
  * Template URL: https://bootstrapmade.com/eterna-free-multipurpose-bootstrap-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>

<body>
	
<jsp:include page="/WEB-INF/views/include/Header.jsp"/>
  <main id="main">
  <section id="portfolio" class="portfolio pb-1">
      <div id = "listappend" class="container mt-5">
      		
      		<h2 style="float:left">셀프 인테리어 가이드북 </h2>
      		<sec:authorize access="isAuthenticated()">
      			<span style="float:right" class="btn btn-info btn-lg" onClick="selfWrite()">글쓰기</span>
      		</sec:authorize>
      		<div class="mb-4" style="clear:both;"></div>
      		<jsp:include page="/WEB-INF/views/guide/selfguide-order.jsp"/>
      		<!-- <img style="width:100%; height:200px;"src="https://image.ohou.se/i/bucketplace-v2-development/uploads/advices/guides/self_interior/pc_banner_image.v3.png?gif=1&w=1280&webp=1"/> -->
      		
        <div id="addtag" style="width:100%; padding:0; margin:0" class="row col-md-12 mb-4 mt-4">
			<jsp:include page="/WEB-INF/views/guide/selfguideFilter.jsp"/>
        </div>
		<div style="clear:both"></div>
      <div id = "12345" class="row portfolio-container abcd" data-aos="fade-up">
        <jsp:include page="/WEB-INF/views/guide/selfguide-photos.jsp"/>
       </div>
        

      </div>
      
   <div class="row text-center">

   	<ul class="pagination mx-auto ">
	          	<c:if test="${pager.groupNo>1}">
	            	<li class="page-item"><a class="page-link" href="javascript:selfguidephotolist(${pager.startPageNo-1})">Pre</a></li>
	            </c:if>
	            
	            <c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}">
					<c:if test="${pager.pageNo==i}">
	           	 		<li class="page-item"><a class="page-link" href="javascript:selfguidephotolist(${i})">${i}</a></li>
	            	</c:if>
	            	<c:if test="${pager.pageNo!=i}">
	            		<li class="page-item"><a class="page-link" href="javascript:selfguidephotolist(${i})">${i}</a></li>
	            	</c:if>
	             </c:forEach>
	             <c:if test="${pager.groupNo<pager.totalGroupNo}">
	            	<li class="page-item"><a class="page-link" href="javascript:selfguidephotolist(${pager.endPageNo+1})">Next</a></li>
	          	</c:if>
	          </ul>
	</div> 

    </section>
   
  </main><!-- End #main -->

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

  <!-- Vendor JS Files -->
 
  <!-- Template Main JS File -->
  <script src="<%=application.getContextPath() %>/resources/js/main.js"></script>
	<script type="text/javascript">
	$(function(){
		//selfguidephotolist(0);
		  
	});
	
	
	function pagingList(){
	  $.ajax({
			url : "<%=application.getContextPath()%>/selfguide/selflist",
			method: "get",
			success:function(data){
				location.href="<%=application.getContextPath()%>/selfguide/selflist";
			}
		});
	}
	
	function checkSelfGuidFilter(filterString){

		$.ajax({
				url : "<%=application.getContextPath()%>/selfguide/selfguideFilter",
				data:{filterString:filterString},
				success:function(data){
					 $("#12345").html(data);
					
				}
			});
		
		<%-- $.ajax({
			url : "<%="application.getContextPath()%>/selfguide/selflist",
			data : {filterString:filterString, pageNo:pageNo},
			success:function(data) {
				$("#12345").html(data);
			}
		
		}); --%>
						
	}
	
	function selfWrite(){
		location.href="<%=application.getContextPath()%>/selfguide/selfguide-write";
	}
	
	function selfguidephotolist(pageNo){
		console.log("페이징 실행");
		$.ajax({
			url :"<%=application.getContextPath()%>/selfguide/selflist",
			data: {pageNo:pageNo},
			success:function(data){
				
			}
		})
		
		$.ajax({
			url : "<%=application.getContextPath()%>/selfguide/selflist",
			data : {pageNo : pageNo , firstcount:1},
			success : function (data){
				$("#12345").html(data);
			}
		});
		
		

	}	
	
	
	</script>
</body>

</html>