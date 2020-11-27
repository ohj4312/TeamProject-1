<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:forEach var="photo" items="${list}">
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
					<div div class = "row pl-3 pr-3 mt-2">
						<a id="App1BK${photo.pnumber}" class = "col-4 " href="javascript:toggleUpdate(${photo.pnumber}, '<%=application.getContextPath()%>/BK/CheckBookMark')">
							<c:if test="${photo.bnumber == 0}">
								<i id="itag${photo.pnumber}" class="material-icons pl-4" style = " font-size: 30px;">bookmark_border</i>
							</c:if>
							<c:if test="${photo.bnumber != 0}">
								<i id="itag${photo.pnumber}" class="material-icons pl-4" style = " font-size: 30px;">bookmark</i>
							</c:if>
						</a>
						<a href="<%=application.getContextPath()%>/photo/detail?pnumber=${photo.pnumber}" class = "col-4" title="More Details">
							<i class="bx bx-link pl-4" style = "font-size: 30px;"></i>
						</a>
						<a id="likepush${photo.pnumber}"  class = "col-4" href="javascript:toggleUpdate(${photo.pnumber}, '<%=application.getContextPath()%>/like/likePushCheck')">
							<c:if test="${photo.likenumber == 0}">
								<i id="likeicon${photo.pnumber}" class="material-icons pl-4" style = "font-size: 30px;">favorite_border</i>
							</c:if>
							<c:if test="${photo.likenumber != 0}">
								<i id="likeicon${photo.pnumber}" class="material-icons pl-4" style = "font-size: 30px;">favorite</i>
							</c:if>
						</a>
					</div>
					<div div class = "row pl-3 pr-3 mt-2">
								<a>${photo.first_content}</a>
					</div>
				</div>
</c:forEach>
			
			

			
			

