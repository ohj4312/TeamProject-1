<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

  

  <!-- ======= script ======= -->
	
<!-- 	<script type="text/javascript">
	var page = 2;
	  $(function(){
	      $(window).scroll(function(){
	          var $window = $(this);
	          var scrollTop = $window.scrollTop();
	          var windowHeight = $window.height();
	          var documentHeight = $(document).height();
	          
	          //console.log("documentHeight:" + documentHeight + " | scrollTop:" + scrollTop + " | windowHeight: " + windowHeight );
	          
	          if( scrollTop + windowHeight + 1000 > documentHeight ){
	        	  getList(page);
	        	  
		           page++; 
					console.log(page);
	
	            }   
	          
	   });
			    
	});
	</script>
 -->
  <!-- ======= script ======= -->
 

  <main id="main">
	<div class="mt-5 mb-5 row">    </div>
    <!-- ======= Breadcrumbs ======= -->
    <section id="portfolio" class="portfolio_section">
    	<div id = "listappend" class="container">
      		<p><h2">셀프 인테리어 가이드북 </h2></p>
			<h5>나만의 노하우 올리기 </h5>
			<hr/>
			<br/>
      </div>
      <div class="container">
		<form action="<%=application.getContextPath()%>/selfguide/selfupdate?snumber=${sg.snumber}" method="post" role="form" onsubmit="return selfUpdateForm()" enctype="multipart/form-data">	
			<div class="row">
				<div class="col-12 mb-4 input-group-lg">
					<input id="stitle" name="stitle" type="text" class="form-control align-center" placeholder="Title">
					<div id="stitleError" class="error"></div>
				</div>
			</div>
			
			<div class="row">
				<div class="form-group col-12">
						<select id="stype" name="stype" class="form-control"
							style="height: auto;">
							<option selected>category</option>
							<option value="비용정리">비용정리</option>
							<option value="공간배치">공간배치</option>
							<option value="계획하기">계획하기</option>
							<option value="페인트도배">페인트 도배</option>
							<option value="바닥깔기">바닥깔기</option>
						</select>
						<span id="stypeError" class="error"></span>
				</div>
			</div>
			<div class="row col-sm-12 align-self-center p-0 m-0">
				<div class="col-12 text-center mb-4 fancybox p-0" style="position: relative; height: 300px;" style="border:1px solid gold">		
					<input type="file" id="simageAttach" name ="simageAttach" style="display:none;"> 
					<label id = "srclabel" for="simageAttach" style="width: 100%; height: 100%;"> 
	                	<img src="<%=application.getContextPath()%>/file/selfguide?fileName=${sg.simage}" max-width="100%" height="100%">
	                </label> 
	                <input type = "hidden" name = "simage" value = "${sg.simage}"/>
						
				</div>
				
			</div>
			<div class="row col-sm-12 align-self-center">
				<div class="col-12">
					<div>
						<div class="form-group">
							<textarea class="form-control" rows="10" id="scontent" 
								name="scontent"></textarea>
							<span id="scontentError" class="error"></span>
						</div>
					</div>
				</div>
			</div>
			<div style="height: 50px;"></div>
			<button type="submit" class="btn btn-lg btn-info btn-block" onClick="javascript:selfUpdateForm()">수정하기</button>
		</form>
      </div>
      
      <div class="container">
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


  
  <!-- End Footer -->

 

  <!-- Vendor JS Files -->
 
  <!-- Template Main JS File -->
  <script src="<%=application.getContextPath() %>/resources/js/main.js"></script>
  
  <script>
  $(document).ready(function(){
	  console.log('${sg.stitle}');
	  $('#stitle').val('${sg.stitle}');
	  var stype = '${sg.stype}';
	  $('#stype').val(stype).prop("selected",true);
	  $('#scontent').val('${sg.scontent}');

	}); 
  </script>
			

</body>


</html>