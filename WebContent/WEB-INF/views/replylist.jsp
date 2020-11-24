<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div>
	<ul style="list-style:none;">
        	<li>
        		
       			<c:forEach var="reply" items="${list}">
       			<p>
	       			<a href="#">
	       				<img class="rounded-circle" width="50px" height="50px" src="resources/images/photo7.jpg">
	       				<span>${reply.mnickname}</span>
	       			</a>
	       			<span>${reply.rcontent}</span>
       			</p>
       			</c:forEach>
        		
        	</li>
    </ul>
    
    
     <div class="row text-center" style="width:100%">

        <div class="input-group mb-3" style="width:50%; float:none; margin:0 auto">

          <ul class="pagination" style="text-align:left">
          	<c:if test="${pager.groupNo>1}">
            	<li class="page-item"><a class="page-link" href="javascript:replyList(${pager.startPageNo-1})">Previous</a></li>
            </c:if>
            
            <c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}">
				<c:if test="${pager.pageNo==i}">
           	 		<li class="page-item"><a class="page-link" href="javascript:replyList(${i})">${i}</a></li>
            	</c:if>
            	<c:if test="${pager.pageNo!=i}">
            		<li class="page-item"><a class="page-link" href="javascript:replyList(${i})">${i}</a></li>
            	</c:if>
             </c:forEach>
             
             <c:if test="${pager.groupNo<pager.totalGroupNo}">
            	<li class="page-item"><a class="page-link" href="javascript:replyList(${pager.endPageNo+1})">Next</a></li>
          	</c:if>
          </ul>
        </div>
      </div>
</div>