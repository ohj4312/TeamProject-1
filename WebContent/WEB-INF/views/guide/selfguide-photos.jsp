<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<c:forEach var="selfguide" items="${guidelist }">
	<div class="mb-4 mt-5 col-lg-4 col-md-6 portfolio-item  ${selfguide.snumber } ${selfguide.swriter } ${selfguide.scontent}">
		<a href="<%=application.getContextPath()%>/selfguide/selfdetail?snumber=${selfguide.snumber}&swriter=${selfguide.swriter}&scontent=${selfguide.scontent}" style="color:black">
		

	
	<div class="row pl-3 pr-3 mt-2">
			<sec:authorize access="isAnonymous()">
				<a id="App1BK${selfguide.snumber}" class="col-4 "
					href="<%=application.getContextPath()%>/member/login"> 
					<i id="selfitag${selfguide.snumber}" class="material-icons pl-4" style="font-size: 30px;">bookmark_border</i>
				</a>
				<a href="<%=application.getContextPath()%>/selfguide/selfdetail?snumber=${selfguide.snumber}"
					class="col-4" title="More Details"> 
					<i class="bx bx-link pl-4"	style="font-size: 30px;"></i>
				</a>
				<a id="likepush${selfguide.snumber}" class="col-4"	href="<%=application.getContextPath()%>/member/login">
					<i id="likeicon${selfguide.snumber}" class="material-icons pl-4" style="font-size: 30px;">favorite_border</i>
				</a>
			</sec:authorize>

			<sec:authorize access="isAuthenticated()">
			<a id="App1BK${selfguide.snumber}" class="col-4 "
				href="javascript:selftoggleUpdate(${selfguide.snumber}, '<%=application.getContextPath()%>/selfbookmark/selfcheckBookMark')">
				<c:if test="${selfguide.bnumber == 0}">
					<i id="selfitag${selfguide.snumber}" class="material-icons pl-4"
						style="font-size: 30px;">bookmark_border</i>
				</c:if> 
				<c:if test="${selfguide.bnumber != 0}">
					<i id="selfitag${selfguide.snumber}" class="material-icons pl-4"
						style="font-size: 30px;">bookmark</i>
				</c:if>
			</a>
		
			<a id="likepush${selfguide.snumber}" class="col-4" href="javascript:selftoggleUpdate(${selfguide.snumber}, '<%=application.getContextPath()%>/selflike/selflikePushCheck')">
				<c:if test="${selfguide.likenumber == 0}">
					<i id="selflikeicon${selfguide.snumber}" class="material-icons pl-4"
						style="font-size: 30px;">favorite_border</i>
				</c:if>
				<c:if test="${selfguide.likenumber != 0}">
					<i id="selflikeicon${selfguide.snumber}" class="material-icons pl-4"
						style="font-size: 30px;">favorite</i>
				</c:if>
			</a>
		</sec:authorize>
	</div>



		<div class="mb-4 card" style="border:none">
			<img class="mx-auto" style="width:100%; height:200px;"  src="<%=application.getContextPath()%>/file/selfguide?fileName=${selfguide.simage}" />
		</div>
		</a>
		<div>
			<h5>${selfguide.stitle } </h5>
			<div>${selfguide.swriter }</div>
		</div>
		<div class="card-img-overlay ">
			<div class="card-text">조회수 ${selfguide.hit_count }</div>
		</div>
	
</div>
</c:forEach>





