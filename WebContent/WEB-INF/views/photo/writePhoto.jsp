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

<body>

  <jsp:include page="/WEB-INF/views/include/Header.jsp"/>


 

  <main id="main">

    <section id="contact" class="contact mt-3">
      <div class="container" id="firstForm">
        <form action="<%=application.getContextPath()%>/photo/write" method="post" role="form" onsubmit="return writePhoto()" enctype="multipart/form-data">
				<div class="row mt-5 mb-3">
					<div class="col">
						<h2>사진 올리기</h2>
					</div>
				</div>
				<div class="row">
					<div class="form-group form-inline">
							<select id="psize" name="psize" class="form-control mr-2 ml-2"
								style="height: auto;">
								<option selected>평수</option>
								<option value="10평미만">10평 미만</option>
								<option value="10평대">10평대</option>
								<option value="20평대">20평대</option>
								<option value="30평대">30평대</option>
								<option value="40평대">40평대</option>
								<option value="50평이상">50평 이상</option>
							</select>
							<select id="ptype" name="ptype" class="form-control mr-2 ml-2"
								style="height: auto;">
								<option selected>주거형태</option>
								<option value="원룸">원룸</option>
								<option value="아파트">아파트</option>
								<option value="빌라">빌라</option>
								<option value="단독주택">단독주택</option>
								<option value="사무공간">사무공간</option>
								<option value="상업공간">상업공간</option>
								<option value="기타">기타</option>
							</select>
							<select id="pstyle" name="pstyle" class="form-control mr-2 ml-2"
								style="height: auto;">
								<option selected>스타일</option>
								<option value="모던">모던</option>
								<option value="북유럽">북유럽</option>
								<option value="빈티지">빈티지</option>
								<option value="내츄럴">내츄럴</option>
								<option value="프로방스/로맨틱">프로방스/로맨틱</option>
								<option value="한국/아시아">한국/아시아</option>
								<option value="유니크">유니크</option>
								<option value="기타">기타</option>
              				</select>
				 			
				</div>
				</div>
				<div id = "addDiv">
				<div id = "cloneForm" class="row align-self-center border pt-3" style = "">
          			<div class="col-lg-6 text-center mb-4 fancybox" style=" position: relative; height: 300px; color: #1bac91;">
            
             
	                <input type="file" id="list[0].aimageAttach" name = "list[0].aimageAttach" style="display: none"> 
	                <label id = "srclabel" for="list[0].aimageAttach" style="width: 100%; height: 100%;"> 
	                  <i class="material-icons "
	                  style="font-size: 7rem; position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%);">
	                  photo_camera
	                  </i>
	                </label> 
            
					</div>

					<div class="col-lg-6">

						<select id="list[0].alocation" name="list[0].alocation" style="height: auto;" class="form-control mb-3">
							<option selected>공간(필수)</option>
							<option value="원룸">원룸</option>
							<option value="거실">거실</option>
							<option value="침실">침실</option>
							<option value="주방">주방</option>
							<option value="욕실">욕실</option>
							<option value="아이방">아이방</option>
							<option value="드레스룸">드레스룸</option>
							<option value="베란다">베란다</option>
							<option value="사무공간">사무공간</option>
							<option value="상업공간">상업공간</option>
							<option value="가구">가구</option>
							<option value="현관">현관</option>
							<option value="외관/기타">외관/기타</option>
							<option value="제품리뷰">제품리뷰</option>
						</select>

						<div>
							<div class="form-group">
								<textarea class="form-control" rows="10" id="list[0].acontent" name="list[0].acontent"
									placeholder="사진에 대한 설명을 작성해주세요."></textarea>
							</div>
						</div>
					</div>
        		</div> 
				<c:forEach var="i" begin="1" end="9">
					<div id = "cloneForm${i }" class="row align-self-center border pt-3 mt-3" style = "display:none;">
          			<div class="col-lg-6 text-center mb-4 fancybox" style=" position: relative; height: 300px; color: #1bac91;">
            
             
	                <input type="file" id="list[${i }].aimageAttach" name = "list[${i }].aimageAttach" style="display: none"> 
	                <label id = "srclabel" for="list[${i }].aimageAttach" style="width: 100%; height: 100%;"> 
	                  <i class="material-icons "
	                  style="font-size: 7rem; position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%);">
	                  photo_camera
	                  </i>
	                </label> 
            
					</div>

					<div class="col-lg-6">
						
						<div class = "row mb-3 ml-1 mr-1">
						<select id="list[${i }].alocation" name="list[${i }].alocation" style="height: auto;" class="col form-control">
							<option selected>공간(필수)</option>
							<option value="원룸">원룸</option>
							<option value="거실">거실</option>
							<option value="침실">침실</option>
							<option value="주방">주방</option>
							<option value="욕실">욕실</option>
							<option value="아이방">아이방</option>
							<option value="드레스룸">드레스룸</option>
							<option value="베란다">베란다</option>
							<option value="사무공간">사무공간</option>
							<option value="상업공간">상업공간</option>
							<option value="가구">가구</option>
							<option value="현관">현관</option>
							<option value="외관/기타">외관/기타</option>
							<option value="제품리뷰">제품리뷰</option>
						</select>
						
						<a type="button" class="btn btn-sm btn-light ml-3" href="javascript:removeform('cloneForm${i}');" style="color: red;">삭제</a>
						</div>

						<div>
							<div class="form-group">
								<textarea class="form-control" rows="10" id="list[${i }].acontent" name="list[${i }].acontent"
									placeholder="사진에 대한 설명을 작성해주세요."></textarea>
							</div>
						</div>
					</div>
        		</div> 
				</c:forEach>
		
      </div>
      
		<div class ="row mb-3 fixed-bottom clearfix">
			<div class = "mx-auto">
				<button type="button" class="btn" style = "color: white; background-color: #1bac91;" onClick="addform()">추가하기</button>
				<button type="submit" class="btn ml-2 btn-info">글등록</button>
			</div>
		</div>
      
      </form>
			</div>
			</div>
			</div>
	</section><!-- End Contact Section -->
  </main><!-- End #main -->

  <a href="#" class="back-to-top"><i class="icofont-simple-up"></i></a>

  <!-- Vendor JS Files -->
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="<%=application.getContextPath() %>/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="<%=application.getContextPath() %>/resources/vendor/jquery.easing/jquery.easing.min.js"></script>
  <script src="<%=application.getContextPath() %>/resources/vendor/php-email-form/validate.js"></script>
  <script src="<%=application.getContextPath() %>/resources/vendor/owl.carousel/owl.carousel.min.js"></script>
  <script src="<%=application.getContextPath() %>/resources/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="<%=application.getContextPath() %>/resources/vendor/venobox/venobox.min.js"></script>
  <script src="<%=application.getContextPath() %>/resources/vendor/aos/aos.js"></script>
	
  <!-- Template Main JS File -->
  <script src="<%=application.getContextPath() %>/resources/js/main.js"></script>

</body>

</html>