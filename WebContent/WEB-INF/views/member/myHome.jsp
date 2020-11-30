<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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

<body>

  <jsp:include page="/WEB-INF/views/include/Header.jsp"/>

   <main id="main">

    <section id="contact" class="contact mt-3">
      <div class="container mt-5">

        <div class="section-title" data-aos="fade-up">
          <h2>My Home</h2>
        <div class="row no-gutters justify-content-center" style="display: flex;" data-aos="fade-up">

          <div class="col-lg-3 mr-5">
          	<div class="user-profile mt-5 mr-3" style="border:1px solid #dadce0; ">
          		<img class="rounded-circle mt-3 img-fluid" width="150" height="150" src="<%=application.getContextPath()%>/photo/photodownload?fileName=${member.mimage}">
          		<h3 class="font-weight-bold mt-4">${member.mnickname}</h3>
          		<p class="font-weight-normal mb-2"><strong>팔로워</strong> <small>${member.followerCount}</small> | <strong>팔로잉</strong> <small>${member.followingCount}</small></p>
          		<%-- <a id="follow_check" href="javascript:followCheck('${photo.pwriter}', '<%=application.getContextPath()%>/follow/followCheck')" style = "color: #1bac91;"  class="col-3 h-50 mt-2 mb-2 col-5 font-weight-bolder btn btn-sm btn-outline-info" role="button">
					팔로우 
				</a> --%>
          		<c:if test="${member.followCheking == 0}">
					<a id="follow_check" href="javascript:followCheck('${member.memail}', '<%=application.getContextPath()%>/follow/followCheck')" style = "color: #1bac91;"  class="col-3 h-50 mt-2 mb-2 font-weight-bolder btn btn-sm btn-outline-info" role="button">
					팔로우
					</a>
				</c:if>
				<c:if test="${member.followCheking != 0}">
					<a id="follow_check" href="javascript:followCheck('${member.memail}', '<%=application.getContextPath()%>/follow/followCheck')" style = "background-color: #1bac91; color: white;" class="col-3 mb-2 font-weight-bolder btn btn-sm h-50 mt-2" role="button">
					팔로잉
					</a>
				</c:if>
          	</div>
          </div>

          <div class="col-lg-6 mr-3 ml-5">
        		<div id="photoList" class="contents">
        			<section class="post post--cards">
        				<h5><strong>사진</strong></h5>
		                <div id="mypagephoto" style="border:1px dashed #dbdbdb; width:100%;">
		                    <div>
		                       <c:forEach var="like" items="${member.list}">
		                       <a href="<%=application.getContextPath()%>/photo/detail?pnumber=${like.pnumber}">
		                       <img style="margin:5px" align="left" width="100px" height="100px" src="<%=application.getContextPath() %>/like/photodownload?fileName=${like.first_image}"/>
		                       </a>
		                       </c:forEach>
		                    </div>
		                </div>
                	</section>
        			
        		</div>
        		
        		
        		
        	</div> 
        	
        </div>

      </div>
      </div>
    </section><!-- End Contact Section -->

  </main><!-- End #main -->

  <jsp:include page="/WEB-INF/views/include/footer.jsp"/>

  <!-- Vendor JS Files -->
   <script src="<%=application.getContextPath() %>/resources/vendor/jquery/jquery.min.js"></script>
  <script src="<%=application.getContextPath() %>/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="<%=application.getContextPath() %>/resources/vendor/jquery.easing/jquery.easing.min.js"></script>
  <script src="<%=application.getContextPath() %>/resources/vendor/php-email-form/validate.js"></script>
  <script src="<%=application.getContextPath() %>/resources/vendor/owl.carousel/owl.carousel.min.js"></script>
  <script src="<%=application.getContextPath() %>/resources/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="<%=application.getContextPath() %>/resources/vendor/venobox/venobox.min.js"></script>
  <script src="<%=application.getContextPath() %>/resources/vendor/aos/aos.js"></script>

  <!-- Template Main JS File -->
  <script src="<%=application.getContextPath() %>/resources/js/main.js"></script>

<script>
	function getfollowList(){
		$.ajax({
			url:"<%=application.getContextPath()%>/follow/followList", 
			success:function(data) {
				$("#photoList").html(data);
			}
		});
	} 
	
	function getfollowingList(){
		$.ajax({
			url:"<%=application.getContextPath()%>/follow/followingList",
			success:function(data) { 
				$("#photoList").html(data);
			}
		});
	} 
	
	  function Return(){
			
			$.ajax({  
			url : "<%=application.getContextPath()%>/BK/returnmypage",
	 						
			success : function(data){
				console.log("return 스크립트 넘어옴.");
				$("#photoList").html(data);
			}
			});
		}  
	
	
	
	        				
		function GetBookMarkList(){
			console.log("리스트 불러오기");
			
			$.ajax({
				url : "<%=application.getContextPath()%>/BK/getBookMarkList",
				
				method: "get",
				success : function(data){
					console.log("함수 안에부분 실행");
					
					$("#photoList").html(data);
				}
			});
		}
		
		function getLikephotolist(){
			$.ajax({
				url:"<%=application.getContextPath() %>/like/getLikePhotolist",
				
				success:function(data){
					
					$("#photoList").html(data);
				
				}
			});
			
		}     			
 </script>
</body>

</html>