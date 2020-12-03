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
#write-btn{
	font-size:20px;
	font-weight:700;
	color:white;
	position:relative;
	height:40px;
	background-color: #d2d2d2;
	width:100px;
}

</style>
	<body> 
	 
	 <jsp:include page="/WEB-INF/views/include/Header.jsp"/>
	 
	 <main id="main">

  
 	 
    <!-- ======= Blog Section ======= -->
    <section id="blog" class="blog" style="padding-top:7%;">
      <div class="container">
      
        <div class="row">
          <div class="col-lg-8 entries">
            <div class="sidebar">
              <h3 class="sidebar-title">Search</h3>
              <div class="sidebar-item search-form">
                <form action="javascript:communitylist(1)">
                  <input type="text" id="search" name="search">
                  <button type="submit"><i class="icofont-search"></i></button>
                </form>
              </div>
              <div style="width:100%; height:45px; text-align:right;">
              <a href="<%=application.getContextPath() %>/community/comm_writeFrom" class="btn btn-sm" id="write-btn">
						Write
              </a>
              </div>
              <hr>
              <br>
            <div id="comm_list">           
                  
            </div>
		</div>
        </div>
       <!-- 조회수 상위 10개? 5개? --> 
      <div class="col-lg-4">
            <div id="comm_hitsList" class="sidebar">                          
                
            </div>
          </div>
          <!-- 사이드 바 조회수 순  -->
	</div>
      </div>
    </section><!-- End Blog Section -->

  </main><!-- End #main -->
  <script type="text/javascript">
      	/* 검색 or 전체리스트 or 상위 조회수 리스트  */
            function communitylist(check,pageNo){            
            	var search=$("#search").val();             	
            	$.ajax({
    				url:"<%=application.getContextPath() %>/community/comm_list",
    				data: {check:check,search:search,pageNo:pageNo},
    				success:function(data){    					
    					$("#comm_list").html(data);
    				
    				}
    			});
            	$.ajax({
    				url:"<%=application.getContextPath() %>/community/comm_list",
    				data: {check:2,search:search,pageNo:pageNo},
    				success:function(data){    					
    					$("#comm_hitsList").html(data);
    					console.log("실행");
    				
    				}
    			});
    			
    		
      	}     
			</script>
			
			


  <a href="#" class="back-to-top"><i class="icofont-simple-up"></i></a>
  
  <!-- ======= Footer ======= -->
  <jsp:include page="/WEB-INF/views/include/footer.jsp"/>
  
  <a href="#" class="back-to-top"><i class="icofont-simple-up"></i></a>

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
	$(function(){
		communitylist(0);
		  
	});
	
	</script>
  
  
		
	</body>
</html>