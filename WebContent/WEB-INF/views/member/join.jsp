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

 

    <!-- ======= Contact Section ======= -->
    <section id="contact" class="contact mt-5" style="margin-bottom: 2.25rem">
      <div class="container mt-6">

        <div class="section-title" data-aos="fade-up">
          <h2>회원가입</h2>
          
        </div>

        <div class="row mt-5 justify-content-center" data-aos="fade-up">
          <div class="col-lg-5 col-md-7">
            <form action="<%=application.getContextPath()%>/member/join" method="post" role="form" class="php-email-form">
              <div class="form-group">
                <label>이메일 주소</label> 
                <input type="email" class="form-control" name="memail" id="memail" placeholder="Your Email" data-rule="email" data-msg="이메일을 입력하지 않았습니다." />
                  <div class="validate"></div>
              </div>
              <div class="form-group">
                <label>비밀번호</label> 
                <input type="password" class="form-control" name="mpassword" id="mpassword" placeholder="Your Password" data-rule="minlen:8" data-msg="최소 8자 이상 입력해주세요." />
                  <div class="validate"></div>
              </div>
              <div class="form-group">
                <label>비밀번호 확인</label> 
                <input type="password" class="form-control" name="checkingpassword" id="checkingpassword" placeholder="Your Password" data-rule="minlen:8" data-msg="최소 8자 이상 입력해주세요." />
                  <div class="validate"></div>
              </div>
              <div class="form-group">
                <label>별명</label> 
                <input type="text" class="form-control" name="mnickname" id="mnickname" placeholder="Your NickName" data-rule="minlen:4" data-msg="별명은 최소 3자 이상 입력해주세요." />
                <div class="validate"></div>
              </div>
              <div class="mb-3">
                <div class="loading">Loading</div>
                <div class="error-message"></div>
                <div class="sent-message">Your message has been sent. Thank you!</div>
              </div>
              <div class="text-center"><button type="submit">Send Message</button></div>
            </form>
          </div>

        </div>

      </div>
    </section><!-- End Contact Section -->
  </main><!-- End #main -->

  <jsp:include page="/WEB-INF/views/include/footer.jsp"/>

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