<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<div class="col-lg-8 col-sm-12 mx-auto">
	<ul class="nav" >
		<li class="nav-item col-2 p-1 px-sm-3">
			<a  href="<%=application.getContextPath()%>/selfguide/selflist">
              	<div>
					<div>
						<img class="img-fluid" src="<%=application.getContextPath() %>/resources/img/all.png" alt="전체">
					</div>
					<div>
						<p class = "small text-center">전체</p>
					</div>
				</div>
			</a>
		</li>                      
		<li class="nav-item col-2 p-1 px-sm-3">
			<a href="javascript:checkSelfGuidFilter('비용정리')">
	             <div>
					<div>
						<img class="img-fluid" src="<%=application.getContextPath() %>/resources/img/cost.png" alt="비용정리">
					</div>
					<div>
						<p class = "small text-center">비용<br/>정리</p>
					</div>
				</div>
			</a>
		</li>
		<li class="nav-item col-2 p-1 px-sm-3">
			<a href="javascript:checkSelfGuidFilter('공간배치')">
	             <div>
					<div>
						<img class="img-fluid" src="<%=application.getContextPath() %>/resources/img/space.png" alt="공간배치">
					</div>
					<div>
						<p class = "small text-center">공간<br/>배치</p>
					</div>
				</div>
			</a>
		</li>
		<li class="nav-item col-2 p-1 px-sm-3">
			<a href="javascript:checkSelfGuidFilter('계획하기')">
              	<div>
					<div>
						<img class="img-fluid" src="<%=application.getContextPath() %>/resources/img/plan.png" alt="계획하기">
					</div>
					<div>
						<p class = "small text-center">계획<br/>하기</p>
					</div>
				</div>
			</a>
		</li>
		<li class="nav-item col-2 p-1 px-sm-3">
			<a href="javascript:checkSelfGuidFilter('페인트도배')">
              	<div>
					<div>
						<img class="img-fluid" src="<%=application.getContextPath() %>/resources/img/drawing.png" alt="페인트도배">
					</div>
					<div>
						<p class = "small text-center">페인트<br/>도배</p>
					</div>
				</div>
			</a>
		</li>
		<li class="nav-item col-2 p-1 px-sm-3">
			<a href="javascript:checkSelfGuidFilter('바닥깔기')">
              	<div>
					<div>
						<img class="img-fluid" src="<%=application.getContextPath() %>/resources/img/tile.png" alt="바닥깔기">
					</div>
					<div>
						<p class = "small text-center">바닥<br/>깔기</p>
					</div>
				</div>
			</a>
		</li>
	</ul>
</div>

<div class="row text-center">

   	<ul class="pagination mx-auto ">
	          	<c:if test="${pager.groupNo>1}">
	            	<li class="page-item"><a class="page-link" href="javascript:selfguidephotolist(${pager.startPageNo-1})">Pre</a></li>
	            </c:if>
	            
	            <c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}">
					<c:if test="${pager.pageNo==i}">
	           	 		<li class="page-item"><a class="page-link" href="javascript:selfguidephotolist(${i})">${i}</a></li>
	            	</c:if>
	            	<c:if test="${pager.pageNo!=i}">
	            		<li class="page-item"><a class="page-link" href="javascript:selfguidephotolist(${i})">${i}</a></li>
	            	</c:if>
	             </c:forEach>
	             <c:if test="${pager.groupNo<pager.totalGroupNo}">
	            	<li class="page-item"><a class="page-link" href="javascript:selfguidephotolist(${pager.endPageNo+1})">Next</a></li>
	          	</c:if>
	          </ul>
	</div> 

