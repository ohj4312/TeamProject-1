<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="row">
<div class="col-sm-12" style="width:100%">
       <div class="input-group mb-3" style="width:100%; float:none; margin:0 auto">
         <h4>댓글 </h4>
         <h4 style="color:DodgerBlue; padding-left:10px">${count}</h4>
       </div>
</div>
<div class="col-sm-12" style="width:100%">
 <div class="container">
	      <div class="col-md-8" style="width:100%">
	        <div class="input-group mb-3" style="width:100%; float:none; margin:0 auto">
	          <span class="material-icons" style="font-size:45px; color:#4169E1;">
	            face
	          </span>
	          <input type="text" id="rcontent" class="form-control" placeholder="칭찬과 격려는 큰 힘이됩니다!">
	          <div class="input-group-apeend">
	          <c:if test="${member.memail != null}">
	           <a class="btn btn-outline btn-primary" href="javascript:replyWrite(${pnumber})">등록</a>
	           </c:if>
	          </div>
	        </div>
	      </div>
</div>

	

<div>
	<ul style="list-style:none;">
		<li style="font-size:14px">
			<article>
			<c:forEach var="reply" items="${list}">
				<p style="display:inline-block; width:58%">
					<a href="<%=application.getContextPath()%>/member/yourhomesearch?pwriter=${reply.rwriter}">
					<img class="rounded-circle" width="50px" height="50px" src="photodownload?fileName=${reply.rimage}">
					<span style="padding-right:5px">${reply.mnickname}</span>
					</a>
					<span>${reply.rcontent}</span>
				</p>
			<c:if test="${member.memail==reply.rwriter}">
				<div style="display:inline-block; width:10%">
					<a style="font-size:13px;" href="javascript:replyDelete(${reply.rnumber},${pnumber})">삭제</a>
				</div>
			</c:if>
			</c:forEach>
			</article>
		</li>
	</ul>
	    
	    
	     <div class="row text-center" style="width:100%">
			 <c:if test="${count>0}">
	        <div class="input-group mb-3" style="width:50%; float:none; margin:0 auto">
			
	          <ul class="pagination" style="text-align:left">
	          	<c:if test="${pager.groupNo>1}">
	            	<li class="page-item"><a class="page-link" href="javascript:replyList(${pager.startPageNo-1})">Previous</a></li>
	            </c:if>
	            
	            <c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}">
					<c:if test="${pager.pageNo==i}">
	           	 		<li class="page-item"><a class="page-link" href="javascript:replyList(${pnumber},${i})">${i}</a></li>
	            	</c:if>
	            	<c:if test="${pager.pageNo!=i}">
	            		<li class="page-item"><a class="page-link" href="javascript:replyList(${pnumber},${i})">${i}</a></li>
	            	</c:if>
	             </c:forEach>
	             <c:if test="${pager.groupNo<pager.totalGroupNo}">
	            	<li class="page-item"><a class="page-link" href="javascript:replyList(${pager.endPageNo+1})">Next</a></li>
	          	</c:if>
	          </ul>
	        </div>
	        </c:if>
	      </div>
	</div>
	</div>
</div>