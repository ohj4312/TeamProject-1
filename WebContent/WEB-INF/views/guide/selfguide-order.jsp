<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div id="demo" class="carousel slide mt-4 mb-4" data-ride="carousel">

  <!-- Indicators -->
  <ul class="carousel-indicators">
    <li data-target="#demo" data-slide-to="0" class="active"></li>
    <li data-target="#demo" data-slide-to="1"></li>
    <li data-target="#demo" data-slide-to="2"></li>
  </ul>
  
  <!-- The slideshow -->
  <div class="carousel-inner p-2" style="padding:1em">
	<!-- foreach로 세개 가져오기, 가져온거 첫번째면 active 주기 조건문 설정 -->
	<c:forEach var="selforder" items="${order}" varStatus="status">
		<c:if test="${status.first}">
			<div class="carousel-item active bg-warning">
				<div class = "row">
	     	 		<img class = "col-md-5" src="<%=application.getContextPath()%>/file/selfguide?fileName=${selforder.simage}" alt="${selforder.stitle}" width="auto" height="300">
	    			<div class = "col-md-7 ">
    					<div class=" col-12 text-center">
    						<p class="card-text p-0"><h2>${selforder.stitle}</h2></p>
	    					<p class="card-text p-0">${fn:substring(selforder.scontent,0,300)}</p>
    					</div>
	    			</div>
	    		</div>
    		</div>
		</c:if>
		<c:if test="${!status.first}">
			<div class="carousel-item bg-warning">
				<div class = "row">
     	 			<img class = "col-md-5" src="<%=application.getContextPath()%>/file/selfguide?fileName=${selforder.simage}" alt="${selforder.stitle}" width="auto" height="300">
    				
    				<div class = "col-md-7">
    					<div class=" col-12 text-center">
    						<p class="card-text p-0"><h2>${selforder.stitle}</h2></p>
	    					<p class="card-text p-0">${fn:substring(selforder.scontent,0,300)}</p>
    					</div>
	    			</div>
	    		</div>
    		</div>
		</c:if>
    	
    </c:forEach>
  </div>
  
  <!-- Left and right controls -->
  <a class="carousel-control-prev" href="#demo" data-slide="prev">
    <span class="carousel-control-prev-icon"></span>
  </a>
  <a class="carousel-control-next" href="#demo" data-slide="next">
    <span class="carousel-control-next-icon"></span>
  </a>
</div>