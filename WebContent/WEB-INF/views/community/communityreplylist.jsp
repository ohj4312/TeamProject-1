<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


	<h4 class="comments-count">${pager.totalRows} 
		<strong style="vertical-align: -2px;">Comments</strong>
	</h4>
	
	<div class="row m-1">

		<input type="text" id="rcontent" class="form-control col-lg-10" placeholder="댓글을 남겨보세요!" style="width:100%;">
		<a class="btn btn-outline" style="background-color:#1bac91; color:white;" href="javascript:commreplyWrite(${pager.c_number})">등록</a>
	</div>
	
	<c:forEach var="list" items="${comm_replylist}">
		<div  class="comment clearfix">
			<img src="<%=application.getContextPath()%>/file/member?fileName=${list.mimage}" class="comment-img  float-left" alt="">
			<h5><a href="">${list.cr_rmnickname}</a> 
			<a href="javascript:InputRe('${list.cr_rnumber}')" class="reply"><i class="icofont-reply"></i>답글</a></h5>	
			<time >${list.cr_rdate}</time>	
			<p>${list.cr_rcontent}</p>	
		</div>
	<form method="post" action="<%=application.getContextPath()%>/community/comm_replyListReWrite">	
	<input type="text" id="rcontent${list.cr_rnumber}" class="lt form-control" placeholder="댓글을 남겨보세요!" style="display: none; width:91%;" name="rcontent">
	<input type="hidden" id="cr_rnumber" name="cr_rnumber" value="${list.cr_rnumber}">
	<input type="hidden" id="c_number" name="c_number" value="${pager.c_number}">
	<input type="hidden" id="c_mnickname" name="c_mnickname" value="${c_mnickname}">
	<button id="Arcontent${list.cr_rnumber}" class="lt btn btn-outline" style="display: none; background-color:#1bac91; color:white" onclick="submit">등록
	</button>
	</form >	
	<div id="comment-re${list.cr_rnumber}" class="comment clearfix">
	
	
	</div>	
</c:forEach>

	<div class="row text-center" style="width:100%;">
			
		<c:if test="${pager.totalRows>0}">
	       
	        <div class="input-group mb-12" style="width:10%; margin:0 auto; text-align:center">
			
	          <ul class="pagination" style="text-align:center">
	          	<c:if test="${pager.groupNo>1}">
	            	<li class="page-item"><a class="page-link" href="javascript:commreplyList(${pager.startPageNo-1})">Previous</a></li>
	            </c:if>
	            
	            <c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}">
					<c:if test="${pager.pageNo==i}">
	           	 		<li class="page-item" style="text-align:center"><a class="page-link" href="javascript:commreplyList(${i})">${i}</a></li>
	            	</c:if>
	            	<c:if test="${pager.pageNo!=i}">
	            		<li class="page-item" style="text-align:center"><a class="page-link" href="javascript:commreplyList(${i})">${i}</a></li>
	            	</c:if>
	             </c:forEach>
	             <c:if test="${pager.groupNo<pager.totalGroupNo}">
	            	<li class="page-item" style="text-align:center"><a class="page-link" href="javascript:commreplyList(${pager.endPageNo+1})">Next</a></li>
	          	</c:if>
	          </ul>
	        </div>
	     </c:if>	     	        
 	</div>
 	
 	<script type="text/javascript">
	
	function InputRe(cr_rnumber,check){
		
		$(".lt").attr("style","display: none");
		$(".lt").attr("style","display: none");
		$("#Arcontent"+cr_rnumber).attr("style","display: line-block; background-color:#1bac91; color:white");
		$("#rcontent"+cr_rnumber).attr("style","display: line-block;");	
		
	}
	
	 function commreplyListre(cr_rnumber){
			$.ajax({
				url:"/teamproject/community/comm_replyListRe",
				data:{cr_rnumber:cr_rnumber},
				success:function(data){
					$("#comment-re"+cr_rnumber).html(data);
				}
			});
			
		} 
	
	$(function () {
		commreplyListre('${list.cr_rnumber}');
	});
	
	<script type="text/javascript">
	
	function InputRe(cr_rnumber,check){
		
		$(".lt").attr("style","display: none");
		$(".lt").attr("style","display: none");
		$("#Arcontent"+cr_rnumber).attr("style","display: line-block; background-color:#1bac91; color:white");
		$("#rcontent"+cr_rnumber).attr("style","display: line-block;");	
		
	}
	
	 function commreplyListre(cr_rnumber){
			$.ajax({
				url:"/teamproject/community/comm_replyListRe",
				data:{cr_rnumber:cr_rnumber},
				success:function(data){
					$("#comment-re"+cr_rnumber).html(data);
				}
			});
			
		} 
	
	$(function () {
		commreplyListre('${list.cr_rnumber}');
	});
	
	</script>
	
	</script>
 
 

 
 




