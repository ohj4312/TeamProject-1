<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<c:forEach var="selfguide" items="${guidelist }">
	<div class="mb-4 mt-5 col-lg-4 col-md-6 portfolio-item  ${selfguide.snumber } ${selfguide.swriter } ${selfguide.scontent}">
		<a href="<%=application.getContextPath()%>/selfguide/selfdetail?snumber=${selfguide.snumber}&swriter=${selfguide.swriter}&scontent=${selfguide.scontent}" style="color:black">
		
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

