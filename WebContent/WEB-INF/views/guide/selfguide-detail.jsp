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
  	
  	
	
  <main id="main" data-aos="fade-up" style="margin-top:2rem">

    <!-- ======= Breadcrumbs ======= -->

      
      <!-- ======= Blog Section ======= --> 
		
		<!-- ======= Blog Section ======= --> 
    <section id="blog" class="blog">
      <div class="container">  

        <div class="row">

          <div class="col-lg-9 mx-auto entries">

            <article class="entry entry-single">
				
				  <h2 class="entry-title">${sg.stitle} </h2>
              <img id="self_image" style="width:100%; height:400px;" src="<%=application.getContextPath()%>/file/selfguide?fileName=${sg.simage}"/>

            

              <div class="entry-meta mt-4">
                <ul>
                  <li class="d-flex align-items-center"><i class="icofont-user"></i> <a href="<%=application.getContextPath()%>/member/mypage">${sg.swriter }</a></li>
            	  <li class="d-flex align-items-center"><i class="icofont-card"></i> <a href="<%=application.getContextPath()%>/member/mypage">${sg.stype }</a></li>
                </ul>
              </div>

              <div class="entry-content">
              
               
               		<div id="sg" class="p-3">${sg.scontent }</div>
								<div class="container mt-5">
									<div class="row">
										<div class="col-lg-12 p-0">
											<h4 id="type">
												<a id="deleteSelfGuideDetail"
													href="<%=application.getContextPath() %>/selfguide/deleteSelfguide?snumber=${sg.snumber}"
													class="btn btn-light"
													style="float: right; font-weight: bold">삭제하기</a> <a
													id="updateSelfGuideDetail"
													href="<%=application.getContextPath() %>/selfguide/updateSelfguide?snumber=${sg.snumber}"
													class="btn btn-light mr-1"
													style="float: right; font-weight: bold">수정하기</a>
											</h4>
											<div>
												<a
													href="javascript:selftoggleUpdate(${sg.snumber}, '<%=application.getContextPath()%>/selfbookmark/selfcheckBookMark')">
													<c:if test="${sg.bnumber == 0}">
														<span id="selfbkcount" class="align-middle mr-3" style="float: right">${sg.bookcount}</span>
														<i id="selfitag${sg.snumber}"
															class="material-icons align-middle mr-1"
															style="float: right; font-size: 30px; color: #1bac91;">bookmark_border</i>
													</c:if> <c:if test="${sg.bnumber != 0}">
														<span id="selfbkcount" class="align-middle mr-3" style="float: right">${sg.bookcount}</span>
														<i id="selfitag${sg.snumber}"
															class="material-icons align-middle mr-1"
															style="float: right; font-size: 30px; color: #1bac91;">bookmark</i>
													</c:if>
												</a> <a
													href="javascript:selftoggleUpdate(${sg.snumber}, '<%=application.getContextPath()%>/selflike/selflikePushCheck')">
													<c:if test="${sg.likenumber == 0}">
														<span id="selflkcount" class="align-middle mr-1" style="float: right">${sg.likecount}</span>
														<i id="selflikeicon${sg.snumber}"
															class="material-icons align-middle mr-1"
															style="float: right; font-size: 30px; color: red;">favorite_border</i>
													</c:if> <c:if test="${sg.likenumber != 0}">
														<span id="selflkcount" class="align-middle mr-1" style="float: right">${sg.likecount}</span>
														<i id="selflikeicon${sg.snumber}"
															class="material-icons align-middle mr-1"
															style="float: right; font-size: 30px; color: red;">favorite</i>
														
													</c:if>
												</a>
											</div>
										</div>
									</div>
								</div>
								<div id="rcontent"></div>
                
				</div>
				</article>
				
				<article>
					<div class="scroll h-25" style="width:100%">
			 			<c:forEach var="selfguide" items="${list}">
	          				<a href="javascript:otherselfguidephoto('${selfguide.simage}', '${selfguide.scontent}','${selfguide.stitle }','${selfguide.stype }',${selfguide.snumber })"><img src="<%=application.getContextPath()%>/file/selfguide?fileName=${selfguide.simage}" class= "w-25 h-25"></a>
						</c:forEach>
					 </div>
				</article>
				<div id="reply_result2" style="margin-top:30px">
     	 		</div>
              </div>
             
            </div><!-- End blog author bio -->

<div>
	
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

  <!-- Template Main JS File -->
  <script src="<%=application.getContextPath() %>/resources/js/main.js"></script>
<script type="text/javascript">
$(function(){
	chechId('${sg.swriter}','${member.memail}'); 
	selfreplyList('${sg.snumber}'); 
});
	 

	 	function otherselfguidephoto(simage, scontent,stitle,stype,snumber){
location.href="<%=application.getContextPath()%>/selfguide/selfdetail?snumber="+snumber;
} 
 	 	
 	function selfreplyWrite(snumber) {
 	 	var rcontent = $("#rcontent2").val().trim();
 	 	if(rcontent!=""){
  	 	console.log(snumber);
  	 	$.ajax({
  	 		url:"<%=application.getContextPath()%>/selfguide/replyWrite",
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
				selfreplyList(snumber);
			}
		}
	});
}


function chechId(swriter,memail){
	if(swriter!=memail){
			$("#deleteSelfGuideDetail").css('display','none');
			$("#updateSelfGuideDetail").css('display','none');
	} 
}
          	
           </script>
</body>

</html>