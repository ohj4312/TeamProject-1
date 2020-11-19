<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<section id="portfolio" class="portfolio section-bg">
      <div class="container mt-5">
      	<jsp:include page="/WEB-INF/views/include/photoFilter.jsp"/>
        <div id="addtag" class="row col-md-12 col-lg-6 mb-4">

        </div>

        

        <div class="row portfolio-container" data-aos="fade-up">

			<c:forEach var="i" begin="1" end="6">
				<div class="col-lg-4 col-md-6 portfolio-item filter-app">
					<div class="portfolio-wrap">
						<img
							src="<%=application.getContextPath()%>/resources/img/portfolio/portfolio-${i}.jpg"
							class="img-fluid" alt="">
						<div class="portfolio-info">
							<h4>App 1</h4>
							<p>App</p>
							<div class="portfolio-links">
								<a
									href="<%=application.getContextPath()%>/resources/img/portfolio/portfolio-${i}.jpg"
									data-gall="portfolioGallery" class="venobox" title="App 1">
									<i class="bx bx-plus"></i>
								</a>
								<a href="<%=application.getContextPath()%>/photo/detail" title="More Details">
									<i class="bx bx-link"></i>
								</a>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
        </div>

      </div>
    </section>