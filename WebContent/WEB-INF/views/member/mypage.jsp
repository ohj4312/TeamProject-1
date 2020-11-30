<%@ page contentType="text/html; charset=UTF-8"%>
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
          <h2>My Page</h2>
        <div class="row no-gutters justify-content-center" style="display: flex;" data-aos="fade-up">

          <div class="col-lg-5 mr-3">
        		<div class="user-profile mt-5" style="border:1px solid #dadce0; ">
        			<div class="user-profile__container"> 
        				<div class="user-profile__profile-image" style="text-align: center;">
                  <a href="javascript:Return()"><img class="rounded-circle mt-3" width="53%" height="53%" src="<%=application.getContextPath()%>/resources/img/person_1.jpg"></a>
        					<div class="profile-info__name mt-2">
        						<span>${member.mnickname}</span>
        						<div>
        						 <a class="btn btn-info btn-sm" href="javascript:getfollowList()">팔로워</a>
        						 <a class="btn btn-info btn-sm" href="javascript:getfollowingList()">팔로잉</a>
        						</div>
        						<hr/>
        					</div>
        				</div>
        			</div>
        		<div class="row" style="text-align:center">
        				<div class="col-4">
       						<a href="javascript:GetBookMarkList()">
								<div><span class="material-icons">bookmark_border</span></div>
								<div><small>스크랩북</small></div>
       						</a>
        				</div>

        				<div class="col-4">
       						<a href="javascript:getLikephotolist()">
								<div><span class="material-icons">favorite_border</span></div>
								<div><small>좋아요</small></div>
       						</a>
        				</div>
        				<div class="col-4">
       						<a href="#">
       							<div><span class="material-icons">sentiment_satisfied_alt</span></div>
       							<div><small>설정</small></div>
       						</a>
        				</div>
        			
        			</div>
        			<br/>
        			
        		</div>
          </div>

          <div class="col-lg-5 mr-3">
        		<div id="photoList" class="contents">
        			<section id="formchange" class="post post--cards">
        				<jsp:include page="/WEB-INF/views/member/returnmypage.jsp"/>
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
				$("#formchange").html(data);
			}
		});
	} 
	
	function getfollowingList(){
		$.ajax({
			url:"<%=application.getContextPath()%>/follow/followingList",
			success:function(data) { 
				$("#formchange").html(data);
			}
		});
	} 
	
	  function Return(){
			
			$.ajax({  
			url : "<%=application.getContextPath()%>/member/returnMypage",
	 						
			success : function(data){
				console.log("return 스크립트 넘어옴.");
				$("#formchange").html(data);
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
					
					$("#formchange").html(data);
				}
			});
		}
		
		function getLikephotolist(){
			$.ajax({
				url:"<%=application.getContextPath() %>/like/getLikePhotolist",
				
				success:function(data){
					
					$("#formchange").html(data);
				
				}
			});
			
		}     			
 </script>
</body>

</html>