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
	<style type="text/css">
#question_title{
  width:100%;
  font-size:15px; 
  margin-bottom: 2px;
  border-radius:4px;
  border:solid 1px #dbdbdb;
  background-color:#ffffff;
  color:#424242;
  box-sizing:border-box;
  display: block;
}
#question_content{
  padding-left:2%;
  padding-top:1%;
  margin-bottom:3%;
  font-size:15px;
  line-height: 1.5;
  border-radius:4px;
  border:solid 1px #dbdbdb;
  background-color:#ffffff;
  color:#424242;
  box-sizing:border-box;
  display: block;
  width:100%; 
  height:300px;
}
#question-form{
  margin: 0;
  padding: 0;
}
.container{
  box-sizing: border-box;
  min-height: 1px;
}
.question-form{
  width:100%;
  max-width: 720px;
  padding: 0 15px;
  margin:60px auto;
}
.container{
  box-sizing:border-box;
  min-height: 1px;
}
.question-from__body__content__wrap{
  position: relative;
  width: 100%;
  box-sizing: border-box;
  border: 1px solid darkgray;
  
}
.question-form__body__content_form-group{
  display: block;
  width: 100%;
  color:#bdbdbd;
  min-height: 300px;
  box-sizing: border-box;
  font-size: 15px;
  line-height: 1.87;
}
.question-from__meta{
  margin: 0;
  padding: 0;
}
.btn-priority{
  background-color: #17a2b8;
  border-color: #17a2b8;
  color:#ffffff;
}
.btn-lg{
  line-height: 1;
  height: 70px;
  padding:26px 0;
  font-size:18px;
}
.btn{
  display:inline-block;
  border-width: 1px;
  border-style: solid;
  text-align: center;
  border-radius:4px;
  font-weight:bold;
}
.photo-add{
 	position: absolute;
	left: 35%;
	transform: translate(-35%, -35%);
	font-size:13px;
}
.question-photo{
  font-size:15px;
  line-height: 1.5;
  margin:auto auto;
  border-radius:4px;
  border:solid 1px #dbdbdb;
  background-color:#ffffff;
  color:#424242;
  box-sizing:border-box;
  display: block;
}

/* 이미디드롭 */
.content{
    outline: 2px dashed #92b0b3 ;
    outline-offset:-10px;  
    margin: 0 auto 0 auto;
    text-align: center;
    transition: all .15s ease-in-out;
    width: 300px;
    height: 300px;
    background-color: gray;
}
</style>
	<body>
		<jsp:include page="/WEB-INF/views/include/Header.jsp"/>
		 
<main id="main">

    <div class="question-form container">
      <form id="question-form" action="<%=application.getContextPath()%>/community/comm_write" enctype="multipart/form-data" onsubmit="return comm_write()" method="post">
        
        <header class="question-form_header" style="padding-bottom:3%; padding-top:10%">
          <h2 style="color:black; font-size:20px; font-weight:bold">질문하기</h2>
          <div>
            <input placeholder="제목을 적어주세요." class="form-control"  type="text" id="c_title" name="c_title" >
          </div>
        </header>
		
			
         
        <div class="question-from__meta">
            <textarea id="question_content" placeholder="내용을 적어주세요." name="c_content"></textarea>
			
			<div class="question-photo">
			<input id="cimage" type="file" name="cimage" multiple="multiple" class="addFile"/>			
	         <div class="content" >
	         	<h2 style="color:black; font-size:20px; font-weight:bold">사진을 넣어주세요</h2>
			</div> 
	         <label id = "srclabel" for="c_image">	         
	         </label> 
	           
	        </div>
      	</div>
      	
      	<div class="floating-bar__Content">
          <input type="submit"  class="btn btn-lg btn-priority col-6 offset-3"></input>
        </div>
      </form>   
    </div>
         
  </main><!-- End #main -->
    
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
	function comm_write(){
		var result = true;		
		var c_title = $("#c_title").val().trim();
		if(c_title==""){ 			
			console.log("실행");
			result = false;	
		}
		
		var c_content= $("#question_content").val().trim();
		if(c_content==""){					
			
			console.log("실행");
			result = false;	
		} 
		
		return result;
	} 
	
	/* 이미지 드롭 */
	$('.content')
	  .on("dragover", dragOver)
	  .on("dragleave", dragOver)
	  .on("drop", uploadFiles);

	function dragOver(e){
	  e.stopPropagation();
	  e.preventDefault();
	  if (e.type == "dragover") {
	    $(e.target).css({
	      "background-color": "black",
	      
	      "outline-offset": "-20px"
	    });
	  } else {
	      $(e.target).css({
	      "background-color": "gray",
	      "outline-offset": "-10px"
	    	 
	    });
	      $(e.target).html("");
	    }
	}

	
	function uploadFiles(e) {
	    e.stopPropagation();
	    e.preventDefault();
	    dragOver(e);
	  
	    e.dataTransfer = e.originalEvent.dataTransfer;
	    var files = e.target.files || e.dataTransfer.files;
	    if (files.length > 1) {
	        alert('하나만 올려라.');
	        return;
	    }
	    if (files[0].type.match(/image.*/)) {
	                $(e.target).css({
	            "background-image": "url(" + window.URL.createObjectURL(files[0]) + ")",
	            "outline": "none",
	            "background-size": "100% 100%"
	        });
	    }
	    addFileFromLastInput(files);
	
	}
	
	/* 인풋객체에 추가  */
	function addFileFromLastInput(file){

	    var a = $('input#cimage.addFile');
	    a[a.length-1].files = file;

	   

	   
	}
	
	
	</script>	
		
		
	</body>
</html>