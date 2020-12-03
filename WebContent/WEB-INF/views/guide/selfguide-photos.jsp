<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    

<c:forEach var="selfguide" items="${guidelist }">
		<div class="mb-4 mt-5 col-lg-4 col-md-6 portfolio-item  ${selfguide.snumber } ${selfguide.swriter } ${selfguide.scontent}">
			<a href="<%=application.getContextPath()%>/selfguide/selfdetail?snumber=${selfguide.snumber}&swriter=${selfguide.swriter}&scontent=${selfguide.scontent}" style="color:black">
			
			<div class="row mb-4 card" style="border:none">
				<img class="rounded mr-2 card-img-top" style="width:350px; height:200px;"  src="<%=application.getContextPath()%>/file/selfguide?fileName=${selfguide.simage}" />
			</div>
			<div>
				<h5>${selfguide.stitle } </h5>
				<div>${selfguide.swriter }</div>
			</div>
			<div class="card-img-overlay ">
				<div class="card-text">조회수 ${selfguide.hit_count }</div>
			</div>
			</a>
			
		</div> 
		
		
</c:forEach>