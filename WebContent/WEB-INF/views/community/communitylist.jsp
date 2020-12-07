<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<jsp:useBean id="nowtime" class="java.util.Date" />
<fmt:parseNumber var="nowtimeD" value="${nowtime.time /(1000*60*60*24)}" integerOnly="true" />


<c:forEach var="list" items="${comm_list}">
<fmt:parseNumber var="cdateD" value="${list.c_date.time /(1000*60*60*24)}" integerOnly="true" />
	
	<article class="entry">
		<div
			style="display: inline-block; padding-bottom: 3%; padding-right: 3%;">
			<img
				src="<%=application.getContextPath() %>/file/community?fileName=${list.c_image}"
				style="border-radius: 20px; width: 60px; height: 60px">
		</div>
		<div style="display: inline-block; text-align: right;">
			<h5>
				<strong><a style="color: black; font-size: 16px" href="<%=application.getContextPath()%>/community/comm_detail?cnumber=${list.c_number}&cmnickname=${list.c_mnickname}">${list.c_title}</a></strong>
			</h5>
		</div>	
		<div class="entry-content">
			<p style="margin: 0px; font-size: 13px">						
			${fn:substring(list.c_content,0,43)}
			</p>
			<div class="read-more col-xs-12" style="padding-bottom:3%;">
				<a href="<%=application.getContextPath()%>/community/comm_detail?cnumber=${list.c_number}&cmnickname=${list.c_mnickname}" style="background-color:#F08282">Read More</a>
			</div>
			<div class="entry-meta row">
				<ul>
					<li class="d-flex align-items-center col-3.5"><i class="icofont-user"></i>
						<a href="<%=application.getContextPath()%>/community/comm_detail?cnumber=${list.c_number}&cmnickname=${list.c_mnickname}">${list.c_mnickname}</a></li>
					<li class="d-flex align-items-center col-3.5"><i
						class="icofont-wall-clock"></i> <a href="blog-single.html"><time
								>
								
								<c:choose>								    							
    								<c:when test="${(nowtimeD*24)-(cdateD*24)<1}">
        								<fmt:parseNumber var="startTime_N" value="${nowtime.time}" integerOnly="true" />
        								<fmt:parseNumber var="endTime_N" value="${list.c_date.time}" integerOnly="true"/>
											<c:if test="${((startTime_N/(1000*60))-(endTime_N/(1000*60)))<60}">
												
												<c:if test="${((startTime_N/(1000*60))-(endTime_N/(1000*60)))<1}">
													방금전
												</c:if>
												
												<c:if test="${((startTime_N/(1000*60))-(endTime_N/(1000*60)))>=1}">
													<fmt:formatNumber type="number"  pattern="0" value="${(startTime_N/(1000*60))-(endTime_N/(1000*60))}"/>분전
												</c:if>
											</c:if>								
										<c:if test="${((startTime_N/(1000*60))-(endTime_N/(1000*60)))>60}">
											<fmt:formatNumber type="number"  pattern="0" value="${(startTime_N/(1000*60*60))-(endTime_N/(1000*60*60))}"/> 
    											시간전   
										</c:if>								 						    				      						    						          						       						       					   							    							   							    							   							    													    							 							    							    							    							
    								</c:when>    							   							    							   							
    								<c:when test="${(nowtimeD)-(cdateD)<7}">
        								${(nowtimeD)-(cdateD)}일전
   								 	</c:when>
   								 	<c:when test="${((nowtimeD/7)-(cdateD/7))-((nowtimeD%7)-(cdateD%7))<4}">
        								 <fmt:formatNumber type="number"  pattern="0" value="${(nowtimeD/7)-(cdateD/7)} "/>       					
        									${number}주일전
   								 	</c:when> 								   								 
   								 	<c:when test="${(nowtimeD/30)-(cdateD/30)<12}">
        								<fmt:formatNumber type="number"  pattern="0" value="${(nowtimeD/30)-(cdateD/30)} " />
        									${number}달전
   								 	</c:when>  															
   									<c:otherwise>
   										<fmt:formatNumber type="number"  pattern="0" value="${(nowtimeD/(30*12))-(cdateD/(30*12))} " />
        									${number}년전
    								</c:otherwise>
								</c:choose>								
								</time></a></li>
					<li class="d-flex align-items-center col-1">
					<i	class="icofont-comment"></i> 
						<a href="<%=application.getContextPath()%>/community/comm_detail?cnumber=${list.c_number}&cmnickname=${list.c_mnickname}">${list.replyCount}</a></li>
						<li class="col-3.5" style="color:#a1a1a1; font-size:14px; display:inline-block; line-height:1;">조회수 ${list.c_count}</li>
						
				</ul>
			</div>
		</div>
	</article>
</c:forEach>
 <!-- 패이징 -->
 
 			<div class="row">
			
	        <div class="input-group mb-3 mx-auto">
			
	          <ul class="pagination mx-auto">
	          	<c:if test="${pager.groupNo>1}">
	            	<li class="page-item"><a class="page-link" href="javascript:communitylist(${pager.startPageNo-1})">Previous</a></li>
	            </c:if>
	            
	            <c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}">
					<c:if test="${pager.pageNo==i}">
	           	 		<li class="page-item"><a class="page-link"  href="javascript:communitylist(0,${i})">${i}</a></li>
	            	</c:if>
	            	<c:if test="${pager.pageNo!=i}">
	            		<li class="page-item"><a class="page-link" href="javascript:communitylist(0,${i})">${i}</a></li>
	            	</c:if>
	             </c:forEach>
	             <c:if test="${pager.groupNo<pager.totalGroupNo}">
	            	<li class="page-item"><a class="page-link" href="javascript:communitylist(${pager.endPageNo+1})">Next</a></li>
	          	</c:if>
	          </ul>
	        </div>
	        
	      </div>



