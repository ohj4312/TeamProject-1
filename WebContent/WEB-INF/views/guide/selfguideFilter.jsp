<%@ page contentType="text/html; charset=UTF-8"%>

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

