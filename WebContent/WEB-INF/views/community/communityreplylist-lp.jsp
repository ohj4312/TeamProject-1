<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


		<c:forEach var="list" items="${comm_replylist}">
              <div id="comment-re" class="comment clearfix">
                <img src="assets/img/comments-1.jpg" class="comment-img  float-left" alt="">
                <h5><a href="">${list.cr_rmnickname}</a> <a href="#" class="reply"><i class="icofont-reply"></i> Reply</a></h5>
                <time>${list.cr_rdate}</time>
                <p>${list.cr_rcontent}</p>
              </div>
         </c:forEach>



