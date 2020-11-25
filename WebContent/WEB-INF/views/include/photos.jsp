<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="row portfolio-container" data-aos="fade-up">
<c:forEach var="photo" items="${list}">
				<div class="col-lg-4 col-md-6 portfolio-item ${photo.ptype} ${photo.psize} ${photo.pstyle}">
					<div class="portfolio-wrap" onmouseenter="javascript:likepushCheckIcons(${photo.pnumber})">
						<img
							src="photodownload?fileName=${photo.first_image}"
							class="img-fluid" alt="">
						<div class="portfolio-info">
							<h4>조회수</h4>
							<p>${photo.phit_count}</p>
							<div class="portfolio-links">
								<a
									href="#"
									data-gall="portfolioGallery" class="venobox" title="App 1">
									<i class="material-icons">bookmark_border</i>
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
			
			
			</div>