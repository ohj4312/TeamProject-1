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

 
	<main>
    <!-- ======= Contact Section ======= -->
    <section id="contact" class="contact mt-5">
      <div class="container mt-6">

        <div class="section-title" data-aos="fade-up">
          <h2>로그인 </h2>
        </div>

        

        <div class="row mt-5 justify-content-center" data-aos="fade-up">
          <div class="col-lg-5 col-md-5">
            <form action="<%=application.getContextPath()%>/login" method="post" class="php-email-form">
              <div class="form-group">
                <input type="email" class="form-control" name="memail" id="memail" placeholder="Your Email" data-rule="email"  value="" data-msg="이메일을 입력하지 않았습니다." />
                  <div class="validate"></div>
              </div>
              <div class="form-group">
                <input type="password" class="form-control" name="mpassword" id="mpassword" placeholder="Your Password" data-rule="minlen:8" data-msg="최소 8자 이상 입력해주세요." />
                  <div class="validate"></div>
              </div>
              <c:if test="${failed != null}">
	              <div class="alert alert-danger">
				    <strong>아이디 혹은 비밀번호</strong>를 다시 입력해주세요.
				  </div>
              </c:if>
              <div class="text-center"><button type="submit">Login</button></div>
              
            </form>
          </div>

        </div>

      </div>
    </section><!-- End Contact Section -->
    <section class="mb-3"></section>
    <section class="mb-4" style="padding-bottom: 5rem"></section>
    

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