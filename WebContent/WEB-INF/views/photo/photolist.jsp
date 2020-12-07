<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

  <!-- =======================================================
  * Template Name: Maxim - v2.2.0
  * Template URL: https://bootstrapmade.com/maxim-free-onepage-bootstrap-theme/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>
<style>
/* .nav{
	display:flex;
	text-align:center;
}
.bar{
	width:100%;
	text-align:center;
} */
#btn111{
	font-size:15px;
	border-radius:4px;
	background-color:#f5f5f5;
	border-color:#f5f5f5;
	color:#757575;
	display:inline-block;
	margin:0;
	box-sizing:border-box;
	border:1px solid transparent;
	text-align:center;
	height:50%;
}
</style>

<body>

  <jsp:include page="/WEB-INF/views/include/Header.jsp"/>

  
  
  <section id="portfolio" class="portfolio">
      <div id = "listappend" class="container mt-5">
      	<jsp:include page="/WEB-INF/views/include/photoFilter.jsp"/>
        <div id="addtag" class="row col-md-12 col-lg-6 mb-4" >

        </div>

      <div id = "12345" class="row portfolio-container abcd" data-aos="fade-up">
        <jsp:include page="/WEB-INF/views/include/photos.jsp"/>
       </div>
        
        <div style="height: 100px;">
        </div>

      </div>
    </section>

    
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

	<script type="text/javascript">
			//리스트 페이징 처리
			//var page = 2;
			var page = ${initcount};
			 $(function(){
				 console.log("aaaa");
				 if('${member.memail}' == ''){

	        		  $('.login a').attr('href', '/teamproject/member/login');
	        		  $('.follow').attr('href', '/teamproject/member/login');
	        	  }
				 
				 $(window).scroll(function(){
					 if('${member.memail}' == ''){
		        		  $('.login a').attr('href', '/teamproject/member/login');
		        		  $('.follow').attr('href', '/teamproject/member/login');
		        	  }
					 
					 console.log($(window).scrollTop()+'|'+$(document).height()+'|'+$(window).height());
				if ($(window).scrollTop() >= $(document).height() - $(window).height()){
						 console.log(page);
			        	  getList(page);
			        	   page++;
			          }
			          
			      /*     var max_height = $(document).height();

			  		var now_height = $(window).scrollTop() + $(window).height();
				
				if(max_height <= now_height + 400){
					console.log(page);
		        	  getList(page);
		        	   page++;
				} */
				 });
			 });
	</script>

 
</body>

</html>