<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html >

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
  * Template Name: Eterna - v2.1.0
  * Template URL: https://bootstrapmade.com/eterna-free-multipurpose-bootstrap-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
  
   <style media="screen">
   .scroll{
     
     overflow-x: scroll;
     white-space:nowrap
   }
   .scroll img{
   }
 </style>
</head>

<body>
    <jsp:include page="/WEB-INF/views/include/Header.jsp"/>
  <!-- ======= Header ======= -->
  	
  	

  <main id="main">

    <!-- ======= Breadcrumbs ======= -->
    <section class="section mt-3">
      <div class="container mt-5">
        <div class="row">
          <div class="col-lg-10" data-aos="fade-up">
           <pre> <h3 id="title">${sg.stitle}</h3></pre>
          	<h2 id="type">${sg.stype} </h2>
          	
            	<img id="self_image" style="width:100%; height:400px;" src="<%=application.getContextPath() %>/selfguide/photodownload?fileName=${sg.simage}"/>
          		 <div><h2>${sg.swriter } </h2>
          		 <a href="#"><i id="itag" class="material-icons align-middle" style = "float:right; font-size: 30px; color:#1bac91;">bookmark_border</i></a>
          		<a href="#"><i id="likeicon" class="material-icons align-middle" style = "float:right; font-size: 30px; color:red;">favorite_border</i></a>
          		</div> 
          </div> 
        </div>
      </div>
      </section>
      <!-- ======= Blog Section ======= --> 
    <section id="blog" class="blog">
      <div class="container">  

        <div class="row">

          <div class="col-lg-10 entries">

            <article class="entry entry-single">

              <%-- <div class="entry-img">
                <img style="width:100%; height:120px;"src="<%=application.getContextPath() %>/resources/img/apple-touch-icon.png" alt="" class="img-fluid">
              </div> --%>

              <h2 class="entry-title">
                <a href="blog-single.html">소제목</a>
              </h2>

              <div class="entry-meta">
                <ul>
                  <li class="d-flex align-items-center"><i class="icofont-user"></i> <a href="blog-single.html">John Doe</a></li>
                  <li class="d-flex align-items-center"><i class="icofont-wall-clock"></i> <a href="blog-single.html"><time datetime="2020-01-01">Jan 1, 2020</time></a></li>
                  <li class="d-flex align-items-center"><i class="icofont-comment"></i> <a href="blog-single.html">12 Comments</a></li>
                </ul>
              </div>

              <div class="entry-content">
              
               
               		<div id="sg">${sg.scontent }</div>
                	
                	<div id="rcontent"></div>
                
				</div>
				</article>
              </div>

             

            <!-- End blog entry -->

            <div class="blog-author clearfix">
              <article>
				<div class="scroll col-lg-8 h-25" style="width:100%">
		 			<c:forEach var="selfguide" items="${list}">
          				<a href="javascript:otherselfguidephoto('${selfguide.simage}', '${selfguide.scontent}','${selfguide.stitle }','${selfguide.stype }')"><img src="<%=application.getContextPath() %>/selfguide/photodownload?fileName=${selfguide.simage}" class= "w-25 h-25"></a>
					</c:forEach>
				 </div>
			</article>
           </div>
           <script type="text/javascript">
          	 	function otherselfguidephoto(simage, scontent,stitle,stype){
        		
        		var imagepath = '<%=application.getContextPath() %>/selfguide/photodownload?fileName='+simage;
        		console.log(imagepath);
        		console.log(scontent);
        		$("#self_image").attr("src", imagepath);
        		$("#sg").hide();
        		$("#rcontent").html(scontent);
        		$("#title").html(stitle);
        		$("#type").html(stype);
        		
        	} 
          	 	
          	function selfreplyWrite(snumber){
          	 	var rcontent = $("#rcontent").val().trim();
          	 		
          	 	if(rcontent!=""){
          	 		
          	 	console.log(snumber);
          	 	$.ajax({
          	 		url:"/teamproject/selfguide/replyWrite",
          	 		method:"post",
          	 		data : {rcontent:rcontent, snumber:snumber},
          	 		success:function(data){
          	 			console.log("성공후 실행");
          	 			if(data.result=="success"){
          	 				selfreplyList(snumber);
          	 			}
          	 			$("#reply_result").html(data);
          	 		}
          	 	});
          	}
          	}
          	
          	function selfreplyList(snumber, pageNo){
          		if(!pageNo){
          			pageNo=1;
          		}
          		console.log("selfreplyList snum:"+snumber);
          		console.log("selfreplyList pageno:"+pageNo);
          		$.ajax({
          			url:"/teamproject/selfguide/replyList",
          			data:{ snumber:snumber,pageNo:pageNo},
          			success:function(data){
          				$("#reply_result2").html(data);
          			}
          		});
          	}
          	

          	function selfreplyDelete(rnumber, snumber){
          		$.ajax({
          			url:"/teamproject/selfguide/replyDelete",
          			data:{rnumber:rnumber, snumber:snumber},
          			method:"post",
          			success:function(data){
          				if(data.result=="success"){
          					console.log("여기는 삭제 창!");
          					selfreplyList(snumber);
          				}
          			}
          		});
          	}

           </script>
             
            </div><!-- End blog author bio -->

		<div class="container">
     	 	<div id="reply_result2" style="margin-top:30px">
     	 	</div>
    	</div>
		
		
<div>
	
	</div>
		
		
        </div>

     

       

        

     
    </section>

  </main><!-- End #main -->
	
  
	
	
	
  <!-- ======= Footer 수  정 ======= -->
  <footer id="footer">
    <div class="footer-top">
      <div class="container">
        <div class="row">

          <div class="col-lg-3 col-md-6">
            <div class="footer-info">
              <h3>Maxim</h3>
              <p>
                A108 Adam Street <br>
                NY 535022, USA<br><br>
                <strong>Phone:</strong> +1 5589 55488 55<br>
                <strong>Email:</strong> info@example.com<br>
              </p>
              <div class="social-links mt-3">
                <a href="#" class="twitter"><i class="bx bxl-twitter"></i></a>
                <a href="#" class="facebook"><i class="bx bxl-facebook"></i></a>
                <a href="#" class="instagram"><i class="bx bxl-instagram"></i></a>
                <a href="#" class="google-plus"><i class="bx bxl-skype"></i></a>
                <a href="#" class="linkedin"><i class="bx bxl-linkedin"></i></a>
              </div>
            </div>
          </div>

          <div class="col-lg-2 col-md-6 footer-links">
            <h4>Useful Links</h4>
            <ul>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Home</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">About us</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Services</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Terms of service</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Privacy policy</a></li>
            </ul>
          </div>

          <div class="col-lg-3 col-md-6 footer-links">
            <h4>Our Services</h4>
            <ul>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Web Design</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Web Development</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Product Management</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Marketing</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Graphic Design</a></li>
            </ul>
          </div>

          <div class="col-lg-4 col-md-6 footer-newsletter">
            <h4>Our Newsletter</h4>
            <p>Tamen quem nulla quae legam multos aute sint culpa legam noster magna</p>
            <form action="" method="post">
              <input type="email" name="email"><input type="submit" value="Subscribe">
            </form>

          </div>

        </div>
      </div>
    </div>

    <div class="container">
      <div class="copyright">
        &copy; Copyright <strong><span>Maxim</span></strong>. All Rights Reserved
      </div>
      <div class="credits">
        All the links in the footer should remain intact.
        You can delete the links only if you purchased the pro version.
        Licensing information: https://bootstrapmade.com/license/
        Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/maxim-free-onepage-bootstrap-theme/
        Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
      </div>
    </div>
  </footer> <!-- End Footer -->

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
$(document).ready(function(){
	 
	selfreplyList(${sg.snumber}); 
});
</script>
</body>

</html>