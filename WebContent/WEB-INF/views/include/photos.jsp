<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<c:forEach var="photo" items="${list}">
				<div class="mb-4 mt-5 col-lg-4 col-md-6 portfolio-item ${photo.ptype} ${photo.psize} ${photo.pstyle}">
					<div class = "row pl-3 pr-2 mb-4">
						<a href="<%=application.getContextPath()%>/member/yourhomesearch?pwriter=${photo.pwriter}" class = "pr-3 " style="color: black;">
							<img class="rounded-circle mr-2 "style="width:30px; height:30px;"  src="<%=application.getContextPath()%>/file/photo?fileName=${photo.mimage}" />
							${photo.mnickname}
						</a>
						<sec:authorize access="isAnonymous()">
							<a class = "pl-2 font-weight-bolder btn btn-sm btn-outline-info" style = "color: #1bac91;" href="<%=application.getContextPath()%>/member/login">
								팔로우
							</a>
						</sec:authorize>
						<sec:authorize access="isAuthenticated()">
							<c:if test="${photo.following == null}">
								<a class = "pl-2 font-weight-bolder btn btn-sm btn-outline-info ${fn:substring(photo.pwriter,0,fn:indexOf(photo.pwriter,'@'))}" style = "color: #1bac91;" href="javascript:followCheck('${photo.pwriter}', '<%=application.getContextPath()%>/follow/followCheck', '${fn:substring(photo.pwriter,0,fn:indexOf(photo.pwriter,'@'))}')">
								팔로우
								</a>
							</c:if>
							<c:if test="${photo.following != null}">
									<a class = "pl-2 font-weight-bolder btn btn-sm ${fn:substring(photo.pwriter,0,fn:indexOf(photo.pwriter,'@'))}" style = "background-color: #1bac91; color: white;" href="javascript:followCheck('${photo.following}', '<%=application.getContextPath()%>/follow/followCheck','${fn:substring(photo.pwriter,0,fn:indexOf(photo.pwriter,'@'))}')">
									팔로잉
									</a>
							</c:if> 
						</sec:authorize>
					</div>
					
					<a href="<%=application.getContextPath()%>/photo/detail?pnumber=${photo.pnumber}">
					<div class="portfolio-wrap">
						<img style=" height: 280px;"
							src="<%=application.getContextPath()%>/file/photo?fileName=${photo.first_image}"
							class="img-fluid rounded" alt="">
						<div class="portfolio-info">
								<h4>조회수</h4>
								<p class = "hitcount">${photo.phit_count}</p>
						</div>
					</div>
					</a>
					
					<div class = "row pl-3 pr-3 mt-2">
						<sec:authorize access="isAnonymous()">
							<a id="App1BK${photo.pnumber}" class = "col-4 " href="<%=application.getContextPath()%>/member/login">
								<i id="itag${photo.pnumber}" class="material-icons pl-4" style = " font-size: 30px;">bookmark_border</i>
							</a>
							<a href="<%=application.getContextPath()%>/photo/detail?pnumber=${photo.pnumber}" class = "col-4" title="More Details">
								<i class="bx bx-link pl-4" style = "font-size: 30px;"></i>
							</a>
							<a id="likepush${photo.pnumber}"  class = "col-4" href="<%=application.getContextPath()%>/member/login">
								<i id="likeicon${photo.pnumber}" class="material-icons pl-4" style = "font-size: 30px;">favorite_border</i>
							</a>
						</sec:authorize>
						<sec:authorize access="isAuthenticated()">
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
						</sec:authorize>
					</div>
					<div class = "row pl-3 pr-3 mt-2">
								<a>${photo.first_content}</a>
					</div>
				</div>
</c:forEach>
			
			

			
			

