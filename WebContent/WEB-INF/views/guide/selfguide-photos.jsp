<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<c:forEach var="selfguide" items="${guidelist }">
		<div class="mb-4 mt-5 col-lg-4 col-md-6 portfolio-item  ${selfguide.snumber } ${selfguide.swriter } ${selfguide.scontent}">
			<a href="<%=application.getContextPath()%>/selfguide/selfdetail?snumber=${selfguide.snumber}&swriter=${selfguide.swriter}&scontent=${selfguide.scontent}">
			
			<div class="row pl-3 pr-2 mb-4">
				<img class="rounded mr-2 "style="width:350px; height:200px;"  src="<%=application.getContextPath()%>/file/selfguide?fileName=${selfguide.simage}" />
			</div>
			<div>${selfguide.stitle } <div><h5>${selfguide.swriter }</h5></div></div>
			
			<h5>조회수</h5>
			<p>${selfguide.hit_count }</p>
			</a>
			
		

	<%-- <div>
		<sec:authorize access="isAuthenticated()">
			<a id="App1BK${photo.pnumber}" class="col-4 "
				href="javascript:toggleUpdate(${photo.pnumber}, '<%=application.getContextPath()%>/BK/CheckBookMark')">
				<c:if test="${photo.bnumber == 0}">
					<i id="itag${photo.pnumber}" class="material-icons pl-4"
						style="font-size: 30px;">bookmark_border</i>
				</c:if> <c:if test="${photo.bnumber != 0}">
					<i id="itag${photo.pnumber}" class="material-icons pl-4"
						style="font-size: 30px;">bookmark</i>
				</c:if>
			</a>
			<a
				href="<%=application.getContextPath()%>/photo/detail?pnumber=${photo.pnumber}"
				class="col-4" title="More Details"> <i class="bx bx-link pl-4"
				style="font-size: 30px;"></i>
			</a>
			<a id="likepush${photo.pnumber}" class="col-4"
				href="javascript:toggleUpdate(${photo.pnumber}, '<%=application.getContextPath()%>/like/likePushCheck')">
				<c:if test="${photo.likenumber == 0}">
					<i id="likeicon${photo.pnumber}" class="material-icons pl-4"
						style="font-size: 30px;">favorite_border</i>
				</c:if> <c:if test="${photo.likenumber != 0}">
					<i id="likeicon${photo.pnumber}" class="material-icons pl-4"
						style="font-size: 30px;">favorite</i>
				</c:if>
			</a>
		</sec:authorize>
	</div> --%>

</div>
</c:forEach>

