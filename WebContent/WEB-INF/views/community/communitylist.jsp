<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<jsp:useBean id="nowtime" class="java.util.Date" />
<fmt:parseNumber var="nowtimeD" value="${nowtime.time /(1000*60*60*24)}" integerOnly="true" />


<c:forEach var="list" items="${comm_list}">
<fmt:parseNumber var="cdateD" value="${list.c_date.time /(1000*60*60*24)}" integerOnly="true" />
	
	<article class="entry" style="height: 200px">
		<div
			style="display: inline-block; padding-bottom: 3%; padding-right: 3%;">
			<img
				src="<%=application.getContextPath() %>/community/comm_listphoto?fileName=${list.c_image}"
				style="border-radius: 20px; width: 60px; height: 60px">
		</div>
		<div style="display: inline-block; text-align: right;">
			<h5>
				<strong><a style="color: black; font-size: 16px" href="#">${list.c_title}</a></strong>
			</h5>
		</div>
		<div class="entry-content">
			<p style="margin: 0px; font-size: 13px">${list.c_content}</p>
			<div class="read-more">
				<a href="blog-single.html">Read More</a>
			</div>
			<div class="entry-meta">
				<ul>
					<li class="d-flex align-items-center"><i class="icofont-user"></i>
						<a href="<%=application.getContextPath()%>/community/comm_detail?c_number=${list.c_number}">${list.c_mnickname}</a></li>
					<li class="d-flex align-items-center"><i
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
					<li class="d-flex align-items-center"><i
						class="icofont-comment"></i> <a href="blog-single.html">12
							Comments</a></li>
				</ul>
			</div>
		</div>
	</article>
</c:forEach>
