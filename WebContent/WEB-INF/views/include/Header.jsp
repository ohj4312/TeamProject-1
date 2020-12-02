<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<header id="header" class="fixed-top">
    <div class="container d-flex">

      <div class="logo mr-auto">
        <h1 class="text-light"><a href="<%=application.getContextPath()%>/">Ohouse</a></h1>
      </div>

      <nav class="nav-menu d-none d-lg-block">
        <ul>
        	
          <li><a href="<%=application.getContextPath()%>/">Home</a></li>
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
  </header>