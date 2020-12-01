<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    
<%-- <c:forEach var="photo" items="${list}">
		<div class="mb-4 mt-5 col-lg-4 col-md-6 portfolio-item ${photo.ptype} ${photo.psize} ${photo.pstyle}">
			<div class = "row pl-3 pr-2 mb-4">
				<a href = "#" class = "pr-3 " style="color: black;">
					<img class="rounded-circle mr-2 "style="width:30px; height:30px;"  src="photodownload?fileName=${photo.mimage}" />
						${photo.mnickname} 
					</a> 
					<a class="font-weight-bolder" class = "pl-2" href = "#"style = "color: #1bac91;">팔로우</a>
			</div>
				<a href="<%=application.getContextPath()%>/photo/detail?pnumber=${photo.pnumber}" title="More Details">
				<div class="portfolio-wrap">
					<img style=" height: 280px;"
						src="photodownload?fileName=${photo.first_image}"
						class="img-fluid" alt="">
					<div class="portfolio-info">
						<h4>조회수</h4>
						<p class = "hitcount">${photo.phit_count}</p>
					</div>
				</div>
				</a>  
			</div>
</c:forEach> --%>
<c:forEach var="selfguide" items="${guidelist }">
		<div class="mb-4 mt-5 col-lg-4 col-md-6 portfolio-item  ${selfguide.snumber } ${selfguide.swriter } ${selfguide.scontent}">
			<a href="<%=application.getContextPath()%>/selfguide/selfdetail?snumber=${selfguide.snumber}&swriter=${selfguide.swriter}&scontent=${selfguide.scontent}&hit_count=${selfguide.hit_count}">
			
			<div class="row pl-3 pr-2 mb-4">
				<img class="rounded mr-2 "style="width:350px; height:200px;"  src="<%=application.getContextPath() %>/selfguide/photodownload?fileName=${selfguide.simage}" />
			</div>
			<div>${selfguide.stitle } <div><h5>${selfguide.swriter }</h5></div></div>
			
			<h5>조회수</h5>
			<p class = "hitcount">${selfguide.hit_count}</p>
			</a>
			
		</div> 
		
		
</c:forEach>