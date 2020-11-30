<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<jsp:useBean id="nowtime" class="java.util.Date" />
<fmt:formatDate value="${now}" pattern="yyyyMMddHHmmss" var="today" />
<fmt:parseNumber var="nowtime" value="${now.time /(1000)}" integerOnly="true" />



<c:forEach var="list" items="${comm_list}">
<fmt:parseNumber var="cdate" value="${list.c_date.time /(1000)}" integerOnly="true" /> 

	
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
						<a href="blog-single.html">${list.c_mnickname}</a></li>
					<li class="d-flex align-items-center"><i
						class="icofont-wall-clock"></i> <a href="blog-single.html"><time
								>${nowtime-cdate}초전;																	
								</time></a></li>
					<li class="d-flex align-items-center"><i
						class="icofont-comment"></i> <a href="blog-single.html">12
							Comments</a></li>
				</ul>
			</div>
		</div>
	</article>
</c:forEach>

<!-- End blog entry -->

