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

  <!-- ======= Header ======= -->
  <header id="header" class="fixed-top">
    <div class="container d-flex">

      <div class="logo mr-auto">
        <h1 class="text-light"><a href="index.html">Maxim</a></h1>
        <!-- Uncomment below if you prefer to use an image logo -->
        <!-- <a href="index.html"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->
      </div>

      <nav class="nav-menu d-none d-lg-block">
        <ul>
          <li class="active"><a href="index.html">Home</a></li>
          <li><a href="#services">Services</a></li>
          <li><a href="#portfolio">Photo List</a></li>
          <li><a href="#team">Team</a></li>
          <li><a href="login.html">Login</a></li>
          <li><a href="join.html">Register</a></li>

        </ul>
      </nav><!-- .nav-menu -->

    </div>
  </header><!-- End Header -->

  <!-- ======= Hero Section ======= -->
 

  <main id="main">

    

    

    <!-- ======= Team Section ======= -->
    
    <!-- ======= Contact Section ======= -->
    <section id="contact" class="contact mt-3">
      <div class="container" id="firstForm">
				<div class="row">
					<div class="col">
						<h2>ì¬ì§ ì¬ë¦¬ê¸°</h2>
					</div>
				</div>
				<div class="row">
					<div>
						<form id="selectform" action="#" class="form-group form-inline">
							<select id="home_select1" name="home_select1" class="form-control mr-2 ml-2"
								style="height: auto;">
								<option selected>íì</option>
								<option value="0">10í ë¯¸ë§</option>
								<option value="1">10íë</option>
								<option value="2">20íë</option>
								<option value="3">30íë</option>
								<option value="4">40íë</option>
								<option value="5">50í ì´ì</option>
							</select>
							<select id="home_select2" name="home_select2" class="form-control mr-2 ml-2"
								style="height: auto;">
								<option selected>ì£¼ê±°íí</option>
								<option value="0">ìë£¸&ì¤í¼ì¤í</option>
								<option value="1">ìíí¸</option>
								<option value="2">ë¹ë¼&ì°ë¦½</option>
								<option value="3">ë¨ëì£¼í</option>
								<option value="4">ì¬ë¬´ê³µê°</option>
								<option value="5">ììê³µê°</option>
								<option value="6">ê¸°í</option>
							</select>
							<select id="home_select3" name="home_select3" class="form-control mr-2 ml-2"
								style="height: auto;">
								<option selected>ì¤íì¼</option>
								<option value="0">ëª¨ë</option>
								<option value="1">ë¶ì ë½</option>
								<option value="2">ë¹í°ì§</option>
								<option value="3">ë´ì¸ë´</option>
								<option value="4">íë¡ë°©ì¤&ë¡ë§¨í±</option>
								<option value="5">íêµ­&ììì</option>
								<option value="6">ì ëí¬</option>
								<option value="7">ê¸°í</option>
							</select>

						</form>
					</div>
				</div>
				<div id = "addForm">
				<div id = "cloneForm" class="row align-self-center d-none" >
					<div class="col-lg-6 text-center mb-4 fancybox" style=" position: relative; height: 300px;">
						<div style="background-color:lightslategray;">

							<a href="javascript:addPhoto();" class="item-wrap">
								<i type="File" class="material-icons" 
									style="font-size: 7rem;     position: absolute;
										top: 50%;
										left: 50%;
										transform: translate(-50%, -50%);">photo_camera</i>
							</a>
						</div>
						<script>


						</script>
					</div>

					<div class="col-lg-6">

						<select id="homespace" name="homespace" style="height: auto;" class="form-control mb-3">
							<option selected>ê³µê°(íì)</option>
							<option value="0">ìë£¸</option>
							<option value="1">ê±°ì¤</option>
							<option value="2">ì¹¨ì¤</option>
							<option value="3">ì£¼ë°©</option>
							<option value="4">ìì¤</option>
							<option value="5">ìì´ë°©</option>
							<option value="6">ëë ì¤ë£¸</option>
							<option value="7">ë² ëë¤</option>
							<option value="7">ì¬ë¬´ê³µê°</option>
							<option value="7">ììê³µê°</option>
							<option value="7">ê°êµ¬&ìí</option>
							<option value="7">íê´</option>
							<option value="7">ì¸ê´&ê¸°í</option>
							<option value="7">ì íë¦¬ë·°</option>
						</select>

						<div>
							<div class="form-group">
								<textarea class="form-control" rows="10" id="comment" name="text"
									placeholder="ì¬ì§ì ëí ì¤ëªì ìì±í´ì£¼ì¸ì."></textarea>
							</div>
						</div>
					</div>
        </div>

        
        
        
      </div>
      
      
			</div>
			</div>
			</div>
			
	
    </section><!-- End Contact Section -->

    <div class="container">
			<!-- ì¶ê°íê¸° ë²í¼ êµ¬í -->

			<div style="height: 50px;"></div>
			<button type="button" class="btn btn-lg btn-light btn-block" onClick="addform()">ì¶ê°íê¸°</button>

		</div>

  </main><!-- End #main -->
  <script>
    var $cloneform;
  
  
    function addform(){
      console.log($cloneform);
      $("#addForm").append($cloneform);
      //$("#addingForm") .attr('id',"addForm");/*$("#addingForm") .attr('id',"addingForm"+i);  */
      //i++;
    }
  </script>
  <!-- ======= Footer ======= -->
  <footer id="footer">
    <div class="footer-top">
      <div class="container">
        <div class="row">

          <div class="col-lg-3 col-md-6">
            <div class="footer-info">
              <h3>Maxim</h3>
              <p>
                A108 Adam Street <br>
                NY 535022, USA<br><br>
                <strong>Phone:</strong> +1 5589 55488 55<br>
                <strong>Email:</strong> info@example.com<br>
              </p>
              <div class="social-links mt-3">
                <a href="#" class="twitter"><i class="bx bxl-twitter"></i></a>
                <a href="#" class="facebook"><i class="bx bxl-facebook"></i></a>
                <a href="#" class="instagram"><i class="bx bxl-instagram"></i></a>
                <a href="#" class="google-plus"><i class="bx bxl-skype"></i></a>
                <a href="#" class="linkedin"><i class="bx bxl-linkedin"></i></a>
              </div>
            </div>
          </div>

          <div class="col-lg-2 col-md-6 footer-links">
            <h4>Useful Links</h4>
            <ul>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Home</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">About us</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Services</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Terms of service</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Privacy policy</a></li>
            </ul>
          </div>

          <div class="col-lg-3 col-md-6 footer-links">
            <h4>Our Services</h4>
            <ul>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Web Design</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Web Development</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Product Management</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Marketing</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Graphic Design</a></li>
            </ul>
          </div>

          <div class="col-lg-4 col-md-6 footer-newsletter">
            <h4>Our Newsletter</h4>
            <p>Tamen quem nulla quae legam multos aute sint culpa legam noster magna</p>
            <form action="" method="post">
              <input type="email" name="email"><input type="submit" value="Subscribe">
            </form>

          </div>

        </div>
      </div>
    </div>

    <div class="container">
      <div class="copyright">
        &copy; Copyright <strong><span>Maxim</span></strong>. All Rights Reserved
      </div>
      <div class="credits">
        <!-- All the links in the footer should remain intact. -->
        <!-- You can delete the links only if you purchased the pro version. -->
        <!-- Licensing information: https://bootstrapmade.com/license/ -->
        <!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/maxim-free-onepage-bootstrap-theme/ -->
        Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
      </div>
    </div>
  </footer><!-- End Footer -->

  <a href="#" class="back-to-top"><i class="icofont-simple-up"></i></a>

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