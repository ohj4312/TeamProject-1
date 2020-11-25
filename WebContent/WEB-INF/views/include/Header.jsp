<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<header id="header" class="fixed-top">
    <div class="container d-flex">

      <div class="logo mr-auto">
        <h1 class="text-light"><a href="<%=application.getContextPath()%>/">Maxim</a></h1>
        <!-- Uncomment below if you prefer to use an image logo -->
        <!-- <a href="index.html"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->
      </div>

      <nav class="nav-menu d-none d-lg-block">
        <ul>
        	
          <li><a href="<%=application.getContextPath()%>/">Home</a></li>
          <li><a href="<%=application.getContextPath()%>/photo/list">Photo List</a></li>
          
          <c:if test="${member == null}">
          	<li><a href="<%=application.getContextPath()%>/member/login">Login</a></li>
          	<li><a href="<%=application.getContextPath()%>/member/join">Register</a></li>
          </c:if>
          <c:if test="${member != null}">
          	<li><a href="<%=application.getContextPath()%>/member/mypage">Mypage</a></li>
          	<li><a href="<%=application.getContextPath()%>/photo/write">Photo Write</a></li>
          	<li><a href="<%=application.getContextPath()%>/member/logout">LogOut</a></li>
          </c:if>
          	<li><a href="<%=application.getContextPath()%>/qna/qnaindex">Q&A</a></li>

        </ul>
      </nav><!-- .nav-menu -->

    </div>
  </header>