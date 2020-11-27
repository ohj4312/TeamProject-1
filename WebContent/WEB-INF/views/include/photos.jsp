<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:forEach var="photo" items="${list}">
				<div class="col-lg-4 col-md-6 portfolio-item ${photo.ptype} ${photo.psize} ${photo.pstyle}">
					<div class = "row pl-3 pr-2 mb-2">
						<img class="rounded-circle"style="width:30px; height:30px;"  src="photodownload?fileName=${photo.mimage}" />
						${photo.mnickname}  <a style = "color: #1bac91;">팔로우</a>
					</div>
					<div class="portfolio-wrap"  onmouseenter="javascript:likepushCheckIcons(${photo.pnumber}),App1BK_CheckBookMark(${photo.pnumber })">
						<img
							src="photodownload?fileName=${photo.first_image}"
							class="img-fluid" alt="">
						<div class="portfolio-info">
							<h4>조회수</h4>
							<p class = "hitcount">${photo.phit_count}</p>
							<div class="portfolio-links">
								<a id="App1BK${photo.pnumber}" href="javascript:App1BK_CheckBookMark2(${photo.pnumber })"
									style="" title="App 1">
									<i id="itag${photo.pnumber}" class="material-icons">bookmark_border</i>
								</a>
								<a href="<%=application.getContextPath()%>/photo/detail?pnumber=${photo.pnumber}" title="More Details">
									<i class="bx bx-link"></i>
								</a>
								<a id="likepush${photo.pnumber}" href="" title="More Details" style="">
									<i id="likeicon${photo.pnumber}" class="material-icons">favorite_border</i>
								</a>
							</div>
						</div>
					</div>
				</div>
</c:forEach>
			
			

			
			

