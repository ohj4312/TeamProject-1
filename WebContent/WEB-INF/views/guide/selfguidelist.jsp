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


</head>
<style>
.btn{
	box-sizing:border-box; 
	text-align:center; 
	border-style:solid; 
	border-radius:4px; 
	float: right;
	height:40px; 
	font-size:15px;
	background-color:#ffffff;
	border-color:#e2e2e2;
	float:right;
}
.shadow{
	box-sizing:border-box; 
	border-style:solid; 
	border-radius:4px; 
	border-color:#ffffff;
	margin-left:3%;
}

</style>
<body>
	
<jsp:include page="/WEB-INF/views/include/Header.jsp"/>
  <main id="main">
  <section id="portfolio" class="portfolio pb-1">
      <div id = "listappend" class="container mt-5">
      		<div class="mb-4 mt-5" style="clear:both;"></div>
      		<jsp:include page="/WEB-INF/views/guide/selfguide-order.jsp"/>
        <div id="addtag" style="width:100%; padding:0; margin:0" class="row col-md-12 mb-4 mt-4">
			<jsp:include page="/WEB-INF/views/guide/selfguideFilter.jsp"/>
        </div>
        
        <div class = "m-0 clearfix mb-1" >
        <sec:authorize access="isAuthenticated()">
  			<a class="btn float-right" href="javascript:selfWrite();"><strong style="vertical-align: -2px;">글쓰기</strong></a>
  			</sec:authorize>
        </div>
        
  		
  		
		
      <div id = "12345" class = "border border-right-0 border-bottom-0 border-left-0" >
        <jsp:include page="/WEB-INF/views/guide/selfguide-photos.jsp"/>

       </div>
        

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
	
</body>

</html>