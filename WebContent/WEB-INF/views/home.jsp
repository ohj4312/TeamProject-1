<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>O-house</title>
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
.testimonial-img{
	width:90px;
	height:90px;
}
</style>
<body>

  <!-- ======= Header ======= -->
  <header id="header" class="fixed-top">
    <div class="container d-flex">

      <div class="logo mr-auto">
        <h1 class="text-light"><a href="<%=application.getContextPath()%>/">O-house</a></h1>
        <!-- Uncomment below if you prefer to use an image logo -->
        <!-- <a href="index.html"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->
      </div>

      <nav class="nav-menu d-none d-lg-block">
        <ul>
        	<li class="active"><a href="<%=application.getContextPath()%>/">Home</a></li>
          	<li><a href="#services">Services</a></li>
          	<li><a href="<%=application.getContextPath()%>/photo/list">Photo List</a></li>
        	<li><a href="<%=application.getContextPath()%>/selfguide/selflist">Self Guide</a></li>

        	<li><a href="<%=application.getContextPath()%>/community">Community</a></li>
			
        	<sec:authorize access="isAnonymous()">
          		<li><a href="<%=application.getContextPath()%>/member/login">Login</a></li>
          		<li><a href="<%=application.getContextPath()%>/member/join">Register</a></li>
          		<li><a href="<%=application.getContextPath()%>/Notice/list">Notice</a></li>
          	</sec:authorize>
          	<sec:authorize access="isAuthenticated()">
          		<li><a href="<%=application.getContextPath()%>/member/mypage">Mypage</a></li>
          		<li><a href="<%=application.getContextPath()%>/photo/write">Photo Write</a></li>
          		<li><a href="<%=application.getContextPath()%>/logout">LogOut</a></li>
          		<li><a href="<%=application.getContextPath()%>/qna/qnaindex">Q&A</a></li>
          		<li><a href="<%=application.getContextPath()%>/Notice/list">Notice</a></li>
          	</sec:authorize>
        </ul>
      </nav><!-- .nav-menu -->

    </div>
  </header><!-- End Header -->

  <!-- ======= Hero Section ======= -->
  <section id="hero" class="d-flex flex-column justify-content-center align-items-center">
    <div class="container text-center text-md-left" data-aos="fade-up">
      <h1>Welcome to O-house</h1>
      <h2>HyungMo Ahn, HyunJi Oh, SungGyu Noh, WooJin Kim, YoonAh Seo, YoonJung Moon</h2>
      <a href="#services" class="btn-get-started scrollto">Get Started</a>
    </div>
  </section><!-- End Hero -->

  <main id="main">

    

    

    <!-- ======= Services Section ======= -->
    <section id="services" class="services section-bg">
      <div class="container">

        <div class="section-title" data-aos="fade-up">
          <h2>Services</h2>
          <p>Motive Today House , Korea interior platform & Community site O-house.<br/>
          made by team2 </p>
        </div>

        <div class="row">
          <div class="col-md-6 col-lg-3 d-flex align-items-stretch mb-5 mb-lg-0" data-aos="fade-up">
            <div class="icon-box icon-box-pink">
              <div class="icon"><i class="bx bxl-dribbble"></i></div>
              <h4 class="title"><a href="">요구사항 분석 및 설계</a></h4>
              <p class="description"> 국내 1위 인테리어 플랫폼 오늘의 집을 모티브로 하여 홈페이지를 분류, 분석하여 
              	장점을 파악하고 단점을 보완하는 페이지를 구상. 요청, 처리, 응답 기능을 mvc 개발패턴을 이용하여 제작.</p>
            </div>
          </div>

          <div class="col-md-6 col-lg-3 d-flex align-items-stretch mb-5 mb-lg-0" data-aos="fade-up" data-aos-delay="100">
            <div class="icon-box icon-box-cyan">
              <div class="icon"><i class="bx bx-file"></i></div>
              <h4 class="title"><a href=""><strong>Bootstrap</strong>을 활용한 <br> 디자인</a></h4>
              <p class="description">HTML, CSS, JavaScript 뿐만 아니라 bootstrap, jQuery, Ajax를 이용한 디자인 구현, 사용자에게 편리한
              	최적화된 UI를 구현. 요청을 받고 처리하기 위한 view 페이지 제작.</p>
            </div>
          </div>

          <div class="col-md-6 col-lg-3 d-flex align-items-stretch mb-5 mb-lg-0" data-aos="fade-up" data-aos-delay="200">
            <div class="icon-box icon-box-green">
              <div class="icon"><i class="bx bx-tachometer"></i></div>
              <h4 class="title"><a href="">DB설계 & 스키마구현</a></h4>
              <p class="description">Star UML을 이용해 UseDiagram 설계, 구현기능을 분석하여 usecase로 작성.
              DBMS로 Oracle DB를 사용하고 sqldeveloper를 이용해 제 3정규화 상태로  논리적 설계 & 물리적 설계 구현.</p>
            </div>
          </div>

          <div class="col-md-6 col-lg-3 d-flex align-items-stretch mb-5 mb-lg-0" data-aos="fade-up" data-aos-delay="300">
            <div class="icon-box icon-box-blue">
              <div class="icon"><i class="bx bx-world"></i></div>
              <h4 class="title"><a href=""><strong>Springframework</strong>를 <br> 이용한 기능 구현</a></h4>
              <p class="description">Spring framework를 사용해 mvc 개발 패턴 구현과 페이지의 흐름 파악.
              DTO 객체를 이용하여 데이터 저장 및 전달. Spring 라이브러리를 적극활용한 효과적인 기능 구현 & DB 연동 설정</p>
            </div>
          </div>

        </div>

      </div>
    </section><!-- End Services Section -->

    <!-- ======= Testimonials Section ======= -->
    <section id="testimonials" class="testimonials">
      <div class="container">

        <div class="section-title" data-aos="fade-up">
          <h2>TEAM2</h2>
          <p>저희는 한국소프트웨어산업협회에서 교육받은 IT개발자 입니다. 저희는 JAVA, JSP/Servlet, Spring Framework등을 배우며
          Eclipse,Vscode,Sql-develper,Git 등을 이용해 개발하였습니다. 저희는 프론트 엔드 및 백엔드 프로그래밍 기술을 사용하여 프로젝트를 구축했습니다.</p>
        </div>

        <div class="owl-carousel testimonials-carousel" data-aos="fade-up">

          <div class="testimonial-item">
            <p>
              <i class="bx bxs-quote-alt-left quote-icon-left"></i>
				Community와 Photo Reply을 담당하였습니다. Back-end & Front-end 담당하여 전체적인 흐름을 파악하였습니다.
              <i class="bx bxs-quote-alt-right quote-icon-right"></i>
            </p>
            <img src="<%=application.getContextPath() %>/resources/img/yoonah.jpg" class="testimonial-img" >
            <h3>YoonAh Seo</h3>
            <h4>Team-Member</h4>
          </div>

          <div class="testimonial-item">
            <p>
              <i class="bx bxs-quote-alt-left quote-icon-left"></i>
				Photo List와 Register를 담당하였습니다. Back-end & Front-end 담당하여 전체적인 흐름을 파악하였습니다.
              <i class="bx bxs-quote-alt-right quote-icon-right"></i>
            </p>
            <img src="<%=application.getContextPath() %>/resources/img/sungkyu.jpg" class="testimonial-img">
            <h3>SungGyu Noh</h3>
            <h4>Team-Member</h4>
          </div>

          <div class="testimonial-item">
            <p>
              <i class="bx bxs-quote-alt-left quote-icon-left"></i>
				Q&A와 Customer Center를 담당하였습니다. Back-end & Front-end 담당하여 전체적인 흐름을 파악하였습니다.
              <i class="bx bxs-quote-alt-right quote-icon-right"></i>
            </p>
            <img src="<%=application.getContextPath() %>/resources/img/yoonjung.jpg" class="testimonial-img">
            <h3>YoonJung Moon</h3>
            <h4>Team-Member</h4>
          </div>

          <div class="testimonial-item">
            <p>
              <i class="bx bxs-quote-alt-left quote-icon-left"></i>
               Self Guide와 Follow를 담당하였습니다. Back-end & Front-end 담당하여 전체적인 흐름을 파악하였습니다.
              <i class="bx bxs-quote-alt-right quote-icon-right"></i>
            </p>
            <img src="<%=application.getContextPath() %>/resources/img/hina.jpg" class="testimonial-img" >
            <h3> HyunJi Oh</h3>
            <h4>Team-Member</h4>
          </div>

          <div class="testimonial-item">
            <p>
              <i class="bx bxs-quote-alt-left quote-icon-left"></i>
              	Book Mark와 Self Guide를 담당하였습니다. Back-end & Front-end 담당하여 전체적인 흐름을 파악하였습니다.
              <i class="bx bxs-quote-alt-right quote-icon-right"></i>
            </p>
            <img src="<%=application.getContextPath() %>/resources/img/baby.jpg" class="testimonial-img">
            <h3>WooJin Kim</h3>
            <h4>Team-Leader</h4>
          </div>
          
           <div class="testimonial-item">
            <p>
              <i class="bx bxs-quote-alt-left quote-icon-left"></i>
              	Community와 좋아요를 담당하였습니다. Back-end & Front-end 담당하여 전체적인 흐름을 파악하였습니다.
              <i class="bx bxs-quote-alt-right quote-icon-right"></i>
            </p>
            <img src="<%=application.getContextPath() %>/resources/img/hyungmo.jpg" class="testimonial-img">
            <h3>HyungMo Ahn</h3>
            <h4>Team-Member</h4>
          </div>

        </div>

      </div>
    </section><!-- End Testimonials Section -->

   


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

</body>

</html>