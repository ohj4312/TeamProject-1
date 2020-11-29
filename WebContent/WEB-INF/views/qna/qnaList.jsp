<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div>
	<!-- <a class="btn btn-info" style="margin-bottom:10px" 
		href="javascript:qnaWrite()">글쓰기</a>
		
		<script type="text/javascript">
			function qnaWrite(){
				$.ajax({
					url:"qnaWrite",
					success:function(data){
						$("#services").html(data);
					}
				});
			}
		</script> -->
		
		<div>
			<table style="width:auto" class="table table-lg table-bordered">
				<tr>
					<th style="width:50px">번호</th>
					<th style="width:50px">제목</th>
					<th style="width:50px">작성자</th>
					<th style="width:50px">날짜</th>
				</tr>
				
				<c:forEach var="board" items="${list}">
					<tr>
						<td>${qna.qnumber}</td>
						<td><a href="javascript:qnaDetail(${qna.qnumber})">${qna.qtitle}</a></td>
						<td>${qna.mnickname}</td>
						<td><fmt:formatDate value="${qna.qdate}" pattern="yyyy-MM-dd"/></td>
					</tr>
				</c:forEach>
				
				<tr>
					<td colspan="4" style="text-align: center">
						<a class="btn btn-outline-primary btn-sm" href="javascript:qnaList(1)">처음</a>
						
						<c:if test="${pager.groupNo > 1}">
						<a class="btn btn-outline-primary btn-sm" href="javascript:qnaList(${pager.startPageNo-1})">이전</a>
						</c:if>
						
						<c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}">
							<c:if test="${pager.pageNo == i }">
								<a class="btn btn-danger btn-sm" href="javascript:qnaList(${i})">${i}</a>
							</c:if>
							<c:if test="${pager.pageNo != i }">
								<a class="btn btn-outline-success btn-sm" href="javascript:qnaList(${i})">${i}</a>
							</c:if>
						</c:forEach>
						
						<c:if test="${pager.groupNo < pager.totalGroupNo}">
							<a class="btn btn-outline-info btn-sm" href="javascript:qnaList(${pager.endPageNo+1})">다음</a>
						</c:if>
						<a class="btn btn-outline-primary btn-sm" href="javascript:qnaList(${pager.totalPageNo})">맨끝</a>
					</td>
				</tr>
			</table>
		</div>
</div>