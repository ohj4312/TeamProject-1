<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


		
		
		<c:forEach var="list2" items="${comm_replylistRe}">
	<fmt:formatDate var="cr_rdate" value="${list2.cr_rdate}" pattern="yyyy-MM-dd HH:mm" />
              
                <img src="<%=application.getContextPath()%>/file/member?fileName=${list2.mimage}" class="comment-img  float-left" alt="" style="border-radius: 70%; width:50px; height:50px;">
                <h5><a href="<%=application.getContextPath()%>/member/yourhomesearch?pwriter=${list2.memail}" style="color:#1bac91; font-size:14px;">${list2.cr_rmnickname}</a> 
                <c:if test="${member.mnickname==list2.cr_rmnickname}">	
  					<a style="font-size:5px; display:inline-block; width:10%; margin-left: 10px;color: gray" href="javascript:comm_replyDelete(${list2.cr_rnumber})">삭제</a>			     
				</c:if>
					</h5>
                <time>${cr_rdate}</time>
                <p>${list2.cr_rcontent}</p>
    				
            
        </c:forEach>



