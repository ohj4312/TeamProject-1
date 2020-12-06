<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<header id="header" class="fixed-top">
    <div class="container d-flex">

      <div class="logo mr-auto">
        <h1 class="text-light"><a href="<%=application.getContextPath()%>/">O-house</a></h1>
      </div>

      <nav class="nav-menu d-none d-lg-block nav-second">
        <ul>
        	
          <sec:authorize access="isAnonymous()">
          		<li><a href="<%=application.getContextPath()%>/photo/list">Photo List</a></li>
		  		<li><a href="<%=application.getContextPath()%>/selfguide/selflist">Self Guide</a></li>
          		<li><a href="<%=application.getContextPath()%>/community">Community</a></li>
                   
          		<li><a href="<%=application.getContextPath()%>/member/login">Login</a></li>
          		<li><a href="<%=application.getContextPath()%>/member/join">Register</a></li>
          		<li><a href="<%=application.getContextPath()%>/Notice/list">Notice</a></li>
          	</sec:authorize>
          	<sec:authorize access="isAuthenticated()">
          		<li class="dropdown">
          			<a href="#Photo" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
   						Photo List
 			 		</a>
          			<div id="Photo" class="dropdown-menu" aria-labelledby="dropdownMenuButton">
          				<a class="dropdown-item" style="color:black; text-align:center" href="<%=application.getContextPath()%>/photo/list">Photo List</a>
          				<a class="dropdown-item" style="color:black; text-align:center" href="<%=application.getContextPath()%>/photo/write">Photo Write</a>
          			</div>
          		</li>
          	
				<li class="dropdown">
          			<a href="#Self" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
   						Self Guide
 				 	</a>
          			<div id="Self" class="dropdown-menu" aria-labelledby="dropdownMenuButton">
          				<a class="dropdown-item" style="color:black; text-align:center" href="<%=application.getContextPath()%>/selfguide/selflist">Self Guide</a>
          				<a class="dropdown-item" style="color:black; text-align:center" href="javascript:selfWrite()">Self Guide Write</a>
          			</div>
          		</li>
  	
				<li class="dropdown">
          			<a href="#Comm" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
   						Community
 			 		</a>
          			<div id="Comm" class="dropdown-menu" aria-labelledby="dropdownMenuButton">
          				<a class="dropdown-item" style="color:black; text-align:center" href="<%=application.getContextPath()%>/community">Community</a>
          				<a class="dropdown-item" style="color:black; text-align:center" href="<%=application.getContextPath() %>/community/comm_writeFrom">Community Write</a>
          			</div>
          		</li>
          		<li><a href="<%=application.getContextPath()%>/member/mypage">Mypage</a></li>
          		<li><a href="<%=application.getContextPath()%>/logout">LogOut</a></li>
          		
          		<li class="dropdown">
          			<a href="#Custom" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
   						Help
 			 		</a>
          			<div id="Custom" class="dropdown-menu" aria-labelledby="dropdownMenuButton">
          				<a class="dropdown-item" style="color:black; text-align:center" href="<%=application.getContextPath()%>/qna/qnaindex">Q&A</a>
          				<a class="dropdown-item" style="color:black; text-align:center" href="<%=application.getContextPath()%>/Notice/list">Notice</a>
          			</div>
          		</li>
          	</sec:authorize>
        </ul>
      </nav><!-- .nav-menu -->

    </div>
  </header>
  
  <script>
  $(document).ready(function() {
	  $('.nav-menu .active, .mobile-nav .active').removeClass('active');

	  });
  </script>