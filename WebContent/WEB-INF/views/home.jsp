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
          		<li><a href="<%=application.getContextPath()%>/customer/list">Customer Center</a></li>
          	</sec:authorize>
          	<sec:authorize access="isAuthenticated()">
          		<li><a href="<%=application.getContextPath()%>/member/mypage">Mypage</a></li>
          		<li><a href="<%=application.getContextPath()%>/photo/write">Photo Write</a></li>
          		<li><a href="<%=application.getContextPath()%>/logout">LogOut</a></li>
          		<li><a href="<%=application.getContextPath()%>/qna/qnaindex">Q&A</a></li>
          		<li><a href="<%=application.getContextPath()%>/customer/list">Customer Center</a></li>
          	</sec:authorize>
        </ul>
      </nav><!-- .nav-menu -->

    </div>
  </header><!-- End Header -->

  <!-- ======= Hero Section ======= -->
  <section id="hero" class="d-flex flex-column justify-content-center align-items-center">
    <div class="container text-center text-md-left" data-aos="fade-up">
      <h1>Welcome to O-house</h1>
      <h2>Kim Woo Jin, Ahn Hyung Mo, Noh Sung Gyu, Moon Yoon Jung, Oh Hyun Ji, Seo yoon-Ah</h2>
      <a href="#services" class="btn-get-started scrollto">Get Started</a>
    </div>
  </section><!-- End Hero -->

  <main id="main">

    

    

    <!-- ======= Services Section ======= -->
    <section id="services" class="services section-bg">
      <div class="container">

        <div class="section-title" data-aos="fade-up">
          <h2>Services</h2>
          <p>Motive Today House , Korea interior platform & comunity site O-house.<br/>
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
          <p> We are IT developer trained by Korea Software Industry Association. We learend Java , 
          JSP/Servlet , Spring framework etc. And We develope with Eclipse, vscode, sqldeveloper, Git etc. We can use our front-end & back-end prograiming skills to build a project well. </p>
        </div>

        <div class="owl-carousel testimonials-carousel" data-aos="fade-up">

          <div class="testimonial-item">
            <p>
              <i class="bx bxs-quote-alt-left quote-icon-left"></i>
              Proin iaculis purus consequat sem cure digni ssim donec porttitora entum suscipit rhoncus. Accusantium quam, ultricies eget id, aliquam eget nibh et. Maecen aliquam, risus at semper.
              <i class="bx bxs-quote-alt-right quote-icon-right"></i>
            </p>
            <img src="<%=application.getContextPath() %>/resources/img/yoonah.jpg" class="testimonial-img" alt="" style="width: 100px; height: 100px;">
            <h3>Saul Goodman</h3>
            <h4>Ceo &amp; Founder</h4>
          </div>

          <div class="testimonial-item">
            <p>
              <i class="bx bxs-quote-alt-left quote-icon-left"></i>
              Export tempor illum tamen malis malis eram quae irure esse labore quem cillum quid cillum eram malis quorum velit fore eram velit sunt aliqua noster fugiat irure amet legam anim culpa.
              <i class="bx bxs-quote-alt-right quote-icon-right"></i>
            </p>
            <img src="<%=application.getContextPath() %>/resources/img/sungkyu.jpg" class="testimonial-img" alt="" style="width: 100px; height: 100px;">
            <h3>Sara Wilsson</h3>
            <h4>Designer</h4>
          </div>

          <div class="testimonial-item">
            <p>
              <i class="bx bxs-quote-alt-left quote-icon-left"></i>
              Enim nisi quem export duis labore cillum quae magna enim sint quorum nulla quem veniam duis minim tempor labore quem eram duis noster aute amet eram fore quis sint minim.
              <i class="bx bxs-quote-alt-right quote-icon-right"></i>
            </p>
            <img src="<%=application.getContextPath() %>/resources/img/yoonjung.jpg" class="testimonial-img" alt="">
            <h3>Jena Karlis</h3>
            <h4>Store Owner</h4>
          </div>

          <div class="testimonial-item">
            <p>
              <i class="bx bxs-quote-alt-left quote-icon-left"></i>
              Fugiat enim eram quae cillum dolore dolor amet nulla culpa multos export minim fugiat minim velit minim dolor enim duis veniam ipsum anim magna sunt elit fore quem dolore labore illum veniam.
              <i class="bx bxs-quote-alt-right quote-icon-right"></i>
            </p>
            <img src="<%=application.getContextPath() %>/resources/img/hina.jpg" class="testimonial-img" alt="">
            <h3>Matt Brandon</h3>
            <h4>Freelancer</h4>
          </div>

          <div class="testimonial-item">
            <p>
              <i class="bx bxs-quote-alt-left quote-icon-left"></i>
              Quis quorum aliqua sint quem legam fore sunt eram irure aliqua veniam tempor noster veniam enim culpa labore duis sunt culpa nulla illum cillum fugiat legam esse veniam culpa fore nisi cillum quid.
              <i class="bx bxs-quote-alt-right quote-icon-right"></i>
            </p>
            <img src="<%=application.getContextPath() %>/resources/img/baby.jpg" class="testimonial-img">
            <h3>John Larson</h3>
            <h4>Entrepreneur</h4>
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