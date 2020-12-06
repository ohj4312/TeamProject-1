<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

	<div class="input-group mb-3" style="padding-top:2%;">
		<h4><strong>댓글</strong> </h4>
		<h4 style="color:#1bac91; padding-left:10px"><strong>${pager.totalRows}</strong></h4>
	</div>
	
	
	<div class="row m-1">
	<c:if test="${member.memail != null}">
			<input type="text" id="rcontent" class="form-control col-lg-10" placeholder="댓글을 남겨보세요!" style="width:100%;">
	</c:if>
	<c:if test="${member.memail == null}">
			<input type="text" id="rcontent" class="form-control col-lg-10" placeholder="댓글을 남겨보세요!" style="width:100%; "disabled="disabled">
	</c:if>
		
	<c:if test="${member.memail != null}">
		<a class="btn btn-outline" style="background-color:#1bac91; color:white;" href="javascript:commreplyWrite(${pager.c_number})">등록</a>
	</c:if>  
	</div>
	<c:forEach var="list" items="${comm_replylist}">
	<fmt:formatDate var="cr_rdate" value="${list.cr_rdate}" pattern="yyyy-MM-dd HH:mm" />
	<div  class="comment clearfix">
		<img src="<%=application.getContextPath()%>/file/member?fileName=${list.mimage}" class="comment-img  float-left" alt="" style="border-radius:70%;">
		<h5><a href="">${list.cr_rmnickname}</a> 
		
		<c:if test="${member.memail != null}"> 
		<a href="javascript:InputRe('${list.cr_rnumber}')" class="reply"><i class="icofont-reply"></i>답글</a>
		</c:if>
		<c:if test="${member.mnickname==list.cr_rmnickname}">			
				<a style="font-size:5px;display:inline-block;width:10%;margin-left: 10px;color: gray"  href="javascript:comm_replyDelete(${list.cr_rnumber})">삭제</a>			
		</c:if>
		</h5>	
		<time >${cr_rdate}</time>
		<p>${list.cr_rcontent}</p>	
		
	</div>
	<form method="post" action="<%=application.getContextPath()%>/community/comm_replyListReWrite" style="width:100%; padding-left:10%;">	
	<div class="row">
	<input type="text" id="rcontent${list.cr_rnumber}" class="lt form-control col-8" placeholder="댓글을 남겨보세요!" style="width:100%; display: none;" name="rcontent">
	<button id="Arcontent${list.cr_rnumber}" class="lt btn btn-outline col-1.8" style="display: none; background-color:#1bac91; color:white;" onclick="submit">등록
	</button>
	</div>
	<input type="hidden" id="cr_rnumber" name="cr_rnumber" value="${list.cr_rnumber}">
	<input type="hidden" id="c_number" name="c_number" value="${pager.c_number}">
	<input type="hidden" id="c_mnickname" name="c_mnickname" value="${c_mnickname}">
	
	</form >
		
	
	<div id="comment-re${list.cr_rnumber}" class="comment clearfix" style="padding-left:10%;">
	
	
	</div>
<script>
	 $(function () {
			commreplyListre('${list.cr_rnumber}');
		});
</script>	
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
 
 
 
 
 

 
 




