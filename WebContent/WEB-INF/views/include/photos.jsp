<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<section id="portfolio" class="portfolio section-bg">
      <div class="container mt-5">
      	<jsp:include page="/WEB-INF/views/include/photoFilter.jsp"/>
        <div id="addtag" class="row col-md-12 col-lg-6 mb-4">

        </div>

        

        <div class="row portfolio-container" data-aos="fade-up">

			<c:forEach var="photo" items="${list}">
				<div class="col-lg-4 col-md-6 portfolio-item filter-app">
					<div class="portfolio-wrap">
						<img
							src="photodownload?fileName=${photo.first_image}"
							class="img-fluid" alt="">
						<div class="portfolio-info">
							<h4>App 1</h4>
							<p>App</p>
							<div class="portfolio-links">
								<a
									href="#"
									data-gall="portfolioGallery" class="venobox" title="App 1">
									<i class="material-icons">bookmark_border</i>
								</a>
								<a href="<%=application.getContextPath()%>/photo/detail" title="More Details">
									<i class="bx bx-link"></i>
								</a>
								<a href="#" title="More Details">
									<i class="material-icons">favorite_border</i>
								</a>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
        </div>

      </div>
    </section>