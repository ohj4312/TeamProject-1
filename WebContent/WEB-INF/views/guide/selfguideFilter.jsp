<%@ page contentType="text/html; charset=UTF-8"%>

<style>
.jb-wrap {
	float: left;
	width: 75px;
	margin: 0 2rem;
	/* border: 1px solid #000000; */
}

.jb-wrap img {
	
	width: 75px;
	height: 55px;
	vertical-align: middle;
}

.jb-text {
	padding: 5px 10px;
	font-size: 6px;
	text-align: center;
}

.pd {
	padding: 0px;
	marigin:0px;
}

</style>


<div class="col-md-12 pd">
	<div style="width:100%;">
    	<ul class="nav" >
			<li class="nav-item col-md-2 ">
            	<a  href="<%=application.getContextPath()%>/selfguide/selflist">
                	<div class="jb-wrap">
						<div class="jb-image">
							<img src="<%=application.getContextPath() %>/resources/img/all.png" alt="전체">
						</div>
						<div class="jb-text">
							<p>전체</p>
						</div>
					</div>
				</a>
              </li>  
              

                              
              <li class="nav-item col-md-2 ">
              	<a href="javascript:checkSelfGuidFilter('비용정리')">
              		<div class="jb-wrap">
						<div class="jb-image">
							<img src="<%=application.getContextPath() %>/resources/img/cost.png" alt="비용정리">
						</div>
						<div class="jb-text">
							<p>비용정리</p>
						</div>
					</div>
				</a>   
              </li>
              
        

              <li class="nav-item col-md-2">
               <a href="javascript:checkSelfGuidFilter('공간배치')">
                <div class="jb-wrap">
					<div class="jb-image"><img src="<%=application.getContextPath() %>/resources/img/space.png" alt="공간배치"></div>
					<div class="jb-text">
					<p>공간배치</p>
					</div>
				</div>
				</a>
                
              </li>
              
               <li class="nav-item col-md-2">
               <a href="javascript:checkSelfGuidFilter('계획하기')">
                <div class="jb-wrap">
					<div class="jb-image"><img src="<%=application.getContextPath() %>/resources/img/plan.png" alt="계획하기"></div>
					<div class="jb-text">
					<p>계획하기</p>
					</div>
				</div>
				</a>
                
              </li>
              
               <li class="nav-item col-md-2">
               <a href="javascript:checkSelfGuidFilter('페인트도배')">
                <div class="jb-wrap">
					<div class="jb-image"><img src="<%=application.getContextPath() %>/resources/img/drawing.png" alt="페인트도배"></div>
					<div class="jb-text">
					<p>페인트 도배</p>
					</div>
				</div>
				</a>
                
              </li>
              
               <li class="nav-item col-md-2">
               <a href="javascript:checkSelfGuidFilter('바닥깔기')">
                <div class="jb-wrap">
					<div class="jb-image"><img src="<%=application.getContextPath() %>/resources/img/tile.png" alt="바닥깔기"></div>
					<div class="jb-text">
					<p>바닥깔기</p> 
					</div>
				</div>
				</a>
                
              </li>
			
			 
            </ul>
       
          </div>
  
</div>

