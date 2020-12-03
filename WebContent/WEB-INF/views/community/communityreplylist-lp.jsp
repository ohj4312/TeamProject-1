<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


		
		
		<c:forEach var="list2" items="${comm_replylistRe}">
	
              
                <img src="<%=application.getContextPath()%>/file/member?fileName=${list2.mimage}" class="comment-img  float-left" alt="">
                <h5><a href="">${list2.cr_rmnickname}</a> <a href="#" class="reply"><i class="icofont-reply"></i> Reply</a></h5>
                <time>${list2.cr_rdate}</time>
                <p>${list2.cr_rcontent}</p>
            
        </c:forEach>



