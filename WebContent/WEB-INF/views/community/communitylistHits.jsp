<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<h3 class="sidebar-title" style="padding-bottom:4%;">인기글</h3>   
<c:forEach var="list" items="${comm_list}">
<fmt:formatDate var="c_date" value="${list.c_date}" pattern="yyyy-MM-dd HH:mm" />		
              <div class="sidebar-item recent-posts">
                <div class="post-item clearfix">
                  <img style="height: 100px" src="<%=application.getContextPath() %>/file/community?fileName=${list.c_image}" alt="">
                  <h4><a href="<%=application.getContextPath() %>/community/comm_detail?cnumber=${list.c_number}&cmnickname=${list.c_mnickname}">${list.c_title}</a></h4>
                  <time >${c_date}</time>
                </div>                
              </div> 
</c:forEach>
