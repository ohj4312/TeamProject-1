<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>



<div class="row portfolio-container abcd" data-aos="fade-up">

	<c:forEach var="selfguide" items="${guidelist }">
		<div class=" mb-4 mt-5 col-lg-4 col-md-6 portfolio-item  ${selfguide.snumber } ${selfguide.swriter } ${selfguide.scontent}">
			<div class="shadow m-0">
				<div class="portfolio-wrap" OnClick="location.href ='<%=application.getContextPath()%>/selfguide/selfdetail?snumber=${selfguide.snumber}'" style="border:none; cursor:pointer;">
					<img class="mx-auto" style="width:100%; height:200px;"  src="<%=application.getContextPath()%>/file/selfguide?fileName=${selfguide.simage}" />
					<div class="portfolio-info">
						<h4>조회수</h4>
						<p class = "hitcount">${selfguide.hit_count }</p>
					</div>
					<div class = "bg-white pt-2 pb-1">
						<h5 style="text-align:center">${selfguide.stitle } </h5>
						<div style="text-align:center">${selfguide.swriter }</div>
					</div>
				</div>
			<div class="bg-white m-0 clearfix">
					<sec:authorize access="isAnonymous()">
						<div class="col-3 p-0 float-right">
							<a id="App1BK${selfguide.snumber}" href="<%=application.getContextPath()%>/member/login"> 
								<i id="selfitag${selfguide.snumber}"  class="material-icons" style="font-size: 30px;">bookmark_border</i>
							</a>
							<a id="likepush${selfguide.snumber}" href="<%=application.getContextPath()%>/member/login">
								<i id="likeicon${selfguide.snumber}" class="material-icons" style="font-size: 30px; color: red;">favorite_border</i>
							</a>
						</div>
					</sec:authorize>
					
					<sec:authorize access="isAuthenticated()">
						<div class="col-3 p-0 float-right">
							<a id="App1BK${selfguide.snumber}" href="javascript:selftoggleUpdate(${selfguide.snumber}, '<%=application.getContextPath()%>/selfbookmark/selfcheckBookMark')">
								<c:if test="${selfguide.bnumber == 0}">
									<i id="selfitag${selfguide.snumber}" class="material-icons"
									style="font-size: 30px;">bookmark_border</i>
								</c:if> 
								<c:if test="${selfguide.bnumber != 0}">
									<i id="selfitag${selfguide.snumber}" class="material-icons"
									style="font-size: 30px;">bookmark</i>
								</c:if>
							</a>
							<a id="likepush${selfguide.snumber}" href="javascript:selftoggleUpdate(${selfguide.snumber}, '<%=application.getContextPath()%>/selflike/selflikePushCheck')">
								<c:if test="${selfguide.likenumber == 0}">
									<i id="selflikeicon${selfguide.snumber}" class="material-icons"
									style="font-size: 30px; color: red;">favorite_border</i>
								</c:if>
								<c:if test="${selfguide.likenumber != 0}">
									<i id="selflikeicon${selfguide.snumber}" class="material-icons"
									style="font-size: 30px; color: red;">favorite</i>
								</c:if>
							</a>
						</div>
					</sec:authorize>
				</div>
				</div>
		</div>
</c:forEach>
</div>

<div class="row text-center">
	<ul class="pagination mx-auto ">
		<c:if test="${pager.groupNo>1}">
			<li class="page-item"><a class="page-link" href="javascript:checkSelfGuidFilter('${stype}', 1, ${pager.startPageNo-1})">Pre</a></li>
		</c:if>
	
	<c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}">
		<c:if test="${pager.pageNo==i}">
			<li class="page-item"><a class="page-link" href="javascript:checkSelfGuidFilter('${stype}', 1, ${i})">${i}</a></li>
		</c:if>
		<c:if test="${pager.pageNo!=i}">
			<li class="page-item"><a class="page-link" href="javascript:checkSelfGuidFilter('${stype}', 1, ${i})">${i}</a></li>
		</c:if>
	</c:forEach>
	<c:if test="${pager.groupNo<pager.totalGroupNo}">
		<li class="page-item"><a class="page-link" href="javascript:checkSelfGuidFilter('${stype}', 1, ${pager.endPageNo+1})">Next</a></li>
	</c:if>
	</ul>
</div> 