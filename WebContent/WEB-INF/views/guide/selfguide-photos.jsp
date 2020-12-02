<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    

<c:forEach var="selfguide" items="${guidelist }">
		<div class="mb-4 mt-5 col-lg-4 col-md-6 portfolio-item  ${selfguide.snumber } ${selfguide.swriter } ${selfguide.scontent}">
			<a href="<%=application.getContextPath()%>/selfguide/selfdetail?snumber=${selfguide.snumber}&swriter=${selfguide.swriter}&scontent=${selfguide.scontent}">
			
			<div class="row pl-3 pr-2 mb-4">
				<img class="rounded mr-2 "style="width:350px; height:200px;"  src="<%=application.getContextPath() %>/selfguide/photodownload?fileName=${selfguide.simage}" />
			</div>
			<div>${selfguide.stitle } <div><h5>${selfguide.swriter }</h5></div></div>
			
			<h5>조회수</h5>
			<p>${selfguide.hit_count }</p>
			</a>
			
		</div> 
		
		
</c:forEach>