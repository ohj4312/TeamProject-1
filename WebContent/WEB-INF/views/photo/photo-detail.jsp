<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>OHOUSE</title>
  <meta content="" name="descriptison">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="assets/img/favicon.png" rel="icon">
  <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
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
     
     overflow-x: scroll;
     white-space:nowrap
   }
   .scroll img{
   }
 </style>
</head>

<body>

  <!-- ======= Header ======= -->
  <jsp:include page="/WEB-INF/views/include/Header.jsp"/>
  	<% pageContext.setAttribute("br", "<br/>");
	   pageContext.setAttribute("cn", "\n"); %>
  <main id="main">

    <!-- ======= Breadcrumbs Section ======= -->
    <section class="section mt-3">
      <div class="container mt-5">
        <div class="row">
          <div class="col-md-8" data-aos="fade-up">
            <h2>${photo.psize} | ${photo.ptype} | ${photo.pstyle}</h2>
            
          </div>
        </div>
      </div>



      <div class="container">
        <div class="row">
         <div class="col-md-8 mb-3">
          	<img id = "thumbnail_image" src="/teamproject/file/photo?fileName=${photo.first_image}" class="img-fluid" alt="">
          </div>

          <div id="head" class="col-md-4 container">
				<div class = "row col-9 mx-auto" style="align-content: center; text-align: center;">
		            <div id="RegBookMark" class="pl-5 mr-2 p-0">
						<button  type="button" class="btn btn-light w-100" onclick="toggleUpdate(${photo.pnumber}, '<%=application.getContextPath()%>/BK/CheckBookMark')">
							<c:if test="${photo.bnumber == 0}">
								<i id="itag${photo.pnumber}" class="material-icons align-middle" style = " font-size: 30px; color:#1bac91;">bookmark_border</i>
								<span id = "bkcount" class = "align-middle">${photo.bookcount}</span>
							</c:if>
							<c:if test="${photo.bnumber != 0}">
								<i id="itag${photo.pnumber}" class="material-icons align-middle" style = " font-size: 30px; color:#1bac91;">bookmark</i>
								<span id = "bkcount" class = "align-middle">${photo.bookcount}</span>
							</c:if>
						</button>
					</div>
					<div id="likepush" class="col-4 p-0">
						
	              		<button  type="button" class="btn btn-light w-100" onclick="toggleUpdate(${photo.pnumber}, '<%=application.getContextPath()%>/like/likePushCheck')">
		            		<c:if test="${photo.likenumber == 0}">
								<i id="likeicon${photo.pnumber}" class="material-icons align-middle" style = "font-size: 30px; color:red;">favorite_border</i>
								<span id = "lkcount" class = "align-middle">${photo.likecount}</span>
							</c:if>
							<c:if test="${photo.likenumber != 0}">
								<i id="likeicon${photo.pnumber}" class="material-icons align-middle" style = "font-size: 30px; color:red;">favorite</i>
								<span id = "lkcount" class = "align-middle">${photo.likecount}</span>
							</c:if>
	              		</button>
	              	</div>
	              	
	              	<c:if test="${updatecheck != 0}">
	              		<div class="dropdown col-1 p-0">
						  <a type="button" class="dropdown-toggle" data-toggle="dropdown">
						    <i class="material-icons mt-2">
								more_vert
							</i>
						  </a>
						  <div class="dropdown-menu">
						    <a class="dropdown-item" href="<%=application.getContextPath()%>/photo/update?pnumber=${photo.pnumber}">수정</a>
						    <a class="dropdown-item" href="<%=application.getContextPath()%>/photo/delete?pnumber=${photo.pnumber}">삭제</a>
						  </div>
						</div>
	              	</c:if>
				</div>
				
				<div class="row mx-auto mt-5">
					<a class="col-6" href="<%=application.getContextPath()%>/member/yourhomesearch?pwriter=${photo.pwriter}">
		            	<img class="rounded-circle" style="width:50px; height:50px;" src="/teamproject/file/member?fileName=${photo.mimage}" />
		            	<span class="card-detail-writer__name">${photo.mnickname}</span>
		            </a>
		            <div class = "col-3"></div>
						<c:if test="${photo.follownumber == 0}">
								<a id="follow_check" href="javascript:followCheck('${photo.pwriter}', '<%=application.getContextPath()%>/follow/followCheck')" style = "color: #1bac91;"  class="col-3 h-50 mt-2 font-weight-bolder btn btn-sm btn-outline-info" role="button">
								팔로우
								</a>
						</c:if>
						<c:if test="${photo.follownumber != 0}">
								<a id="follow_check" href="javascript:followCheck('${photo.pwriter}', '<%=application.getContextPath()%>/follow/followCheck')" style = "background-color: #1bac91; color: white;" class="col-3 font-weight-bolder btn btn-sm h-50 mt-2" role="button">
								팔로잉
								</a>
						</c:if>	
				</div>
				<div id = "acontent"class="row mx-auto mt-5">
					${fn:replace(photo.first_content, cn, br)}
				</div>
          </div>
        </div>
      </div>
      
      

		</section>

    <div class="container">
		<div class="scroll col-md-8 h-25" style="width:100%">
		 	<c:forEach var="photo" items="${photo.list}">
          		<a href="javascript:photoChange('${photo.aimage}', '${fn:replace(photo.acontent, cn, br)}')"><img src="/teamproject/file/photo?fileName=${photo.aimage}" class= "w-25 h-25"></a>
			</c:forEach>
		 </div>
		 <div id="reply_result" style="margin-top:30px">
     
      	</div>
	</div>
	

	
	

    <div class="container">
      <div id="reply_result" style="margin-top:30px">
     
      </div>
    </div>


  </main><!-- End #main -->

 <jsp:include page="/WEB-INF/views/include/footer.jsp"/>

  <!-- Vendor JS Files -->
  
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <script src="<%=application.getContextPath() %>/resources/vendor/jquery.easing/jquery.easing.min.js"></script>
  <script src="<%=application.getContextPath() %>/resources/vendor/php-email-form/validate.js"></script>
  <script src="<%=application.getContextPath() %>/resources/vendor/owl.carousel/owl.carousel.min.js"></script>
  <script src="<%=application.getContextPath() %>/resources/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="<%=application.getContextPath() %>/resources/vendor/venobox/venobox.min.js"></script>
  <script src="<%=application.getContextPath() %>/resources/vendor/aos/aos.js"></script>

  <!-- Template Main JS File -->
  <script src="<%=application.getContextPath() %>/resources/js/main.js"></script>

<script>
$(document).ready(function(){
	var pnumber = ${photo.pnumber};
	replyList(pnumber);
});
</script>
  
</body>

</html>