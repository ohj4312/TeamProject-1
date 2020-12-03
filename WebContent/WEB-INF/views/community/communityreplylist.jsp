<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


	<h4 class="comments-count">${pager.totalRows} <strong style="vertical-align: -3px;">Comments</strong></h4>
	<input type="text" id="rcontent" class="form-control" placeholder="댓글을 남겨보세요!" style="display:inline-block; width:91%;">
	<a class="btn btn-outline" style="display:inline-block; background-color:#1bac91; color:white" href="javascript:commreplyWrite(${pager.c_number})">등록</a>
	<c:forEach var="list" items="${comm_replylist}">
	<div  class="comment clearfix">
	<img src="<%=application.getContextPath()%>/file/member?fileName=${list.mimage}" class="comment-img  float-left" alt="">
	<h5><a href="">${list.cr_rmnickname}</a> 
	<a href="#" class="reply"><i class="icofont-reply"></i>답글</a></h5>	
	<time >${list.cr_rdate}</time>	
	<p>${list.cr_rcontent}</p>
	
	</div>
</c:forEach>

<div class="row text-center" style="width:100%">
			<c:if test="${pager.totalRows>0}">
	        <div class="input-group mb-3" style="width:50%; float:none; margin:0 auto">
			
	          <ul class="pagination" style="text-align:left">
	          	<c:if test="${pager.groupNo>1}">
	            	<li class="page-item"><a class="page-link" href="javascript:commreplyList(${pager.startPageNo-1})">Previous</a></li>
	            </c:if>
	            
	            <c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}">
					<c:if test="${pager.pageNo==i}">
	           	 		<li class="page-item"><a class="page-link" href="javascript:commreplyList(${i})">${i}</a></li>
	            	</c:if>
	            	<c:if test="${pager.pageNo!=i}">
	            		<li class="page-item"><a class="page-link" href="javascript:commreplyList(${i})">${i}</a></li>
	            	</c:if>
	             </c:forEach>
	             <c:if test="${pager.groupNo<pager.totalGroupNo}">
	            	<li class="page-item"><a class="page-link" href="javascript:commreplyList(${pager.endPageNo+1})">Next</a></li>
	          	</c:if>
	          </ul>
	        </div>
	        </c:if>
	     
	        
 </div>



