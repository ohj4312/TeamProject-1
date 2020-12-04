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
<style media="screen">
   .scroll{
     
     height:800px;
	 overflow-x:hidden; 
	 overflow-y:auto; 
   }
   
 </style>
</head>

<body>

  <jsp:include page="/WEB-INF/views/include/Header.jsp"/>

   <main id="main">

    <section id="contact" class="contact mt-3">
      <div class="container-fluid mt-5">

        <div class="section-title" data-aos="fade-up">
          <h2>My Page</h2>
        <div class="row no-gutters justify-content-center" style="display: flex;" data-aos="fade-up">
		
          <div class="col-md-2 mr-lg-4">
        		<section>
        		<div class="user-profile mt-4" style="border:1px solid #dadce0; ">
        		
        			<div class="user-profile__container"> 
        				<div class="user-profile__profile-image" style="text-align: center;">
        					<form action="updateImage" method="post" role="form" enctype="multipart/form-data">
		                  	<input type="file" id="aimage" name = "aimageAttach" style="display: none"> 
			                <label id = "srclabel" for="aimage" style="width: 100%; height: 100%;"> 
			                  <img class="rounded-circle mt-3" width="100px" height="100px" src="<%=application.getContextPath() %>/file/member?fileName=${member.mimage}">
			                </label>
			                <button id="update" class = "btn btn-sm btn-link" disabled>사진 수정</button>
			                </form>
        					<div class="profile-info__name mt-2">
        					<h4 class="font-weight-bold mt-4">${member.mnickname}</h4>
        						<div>
	        						<p class="font-weight-normal mb-2">
	        							<strong>
	        								<a class = "text-secondary" href="javascript:getfollowList()">팔로워</a>
	        							</strong> 
	        							<small>${member.followingCount }</small> | <strong>
	        							<a class = "text-secondary"  href="javascript:getfollowingList()">팔로잉</a>
	        							</strong> 
	        							<small>${member.followerCount }</small>
	        						</p>
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
       						<a href="javascript:Return()">
       							<div><span class="material-icons">sentiment_satisfied_alt</span></div>
       							<div><small>사진</small></div>
       						</a>
        				</div>
        			
        			</div>
        			<br/>
        			
        		</div>
        		<div class ="row" style="padding: 16px;">
        		<a href = "updatePassword" class = "btn btn-sm btn-light mr-1 ">비밀번호 변경</a>
        		<a href = "deleteMember" class = "btn btn-sm btn-light">회원탈퇴</a>
        		</div>
        		</section>
        		
          </div>

          <div class="col-md-7 ml-lg-4">
        		<section id="photoList" class="contents">
        			<div id="formchange" class="post post--cards pd">
        				<jsp:include page="/WEB-INF/views/member/returnmypage.jsp"/>
                	</div>
        		</section>
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
	$("input:file").on('change', function(e){
        let elem = e.target;

        var src1 = URL.createObjectURL(elem.files[0]);
        var $div = $('<img class="rounded-circle mt-3" width="100px" height="100px" src="'+src1+'">');
        //$('<img src="'+src1+'" width="100%" height="100%" />');
        // $("#srclabel").html($div);
        $(elem).next().html($div);
        $('#update').prop("disabled", false);
      });
	
	$(document).ready(function(){
		  $('[data-toggle="popover"]').popover();   
		});
 </script>
</body>

</html>