<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<h3 class="sidebar-title" style="padding-bottom:4%;">인기글</h3>   
<c:forEach var="list" items="${comm_list}">		
              <div class="sidebar-item recent-posts">
                <div class="post-item clearfix">
                  <img src="<%=application.getContextPath() %>/community/comm_listphoto?fileName=${list.c_image}" alt="">
                  <h4><a href="blog-single.html">${list.c_title}</a></h4>
                  <time >${list.c_date}</time>
                </div>                
              </div> 
</c:forEach>
