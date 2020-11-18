<%@ page contentType="text/html; charset=UTF-8"%>

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
          <li><a href="<%=application.getContextPath()%>/member/login">Login</a></li>
          <li><a href="<%=application.getContextPath()%>/member/join">Register</a></li>

        </ul>
      </nav><!-- .nav-menu -->

    </div>
  </header>