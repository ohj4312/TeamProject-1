<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html; charset=UTF-8"%>

<h5><strong>사진</strong></h5>
<div id="mypagephoto" style="border:1px dashed #dbdbdb;width:100%;height: 390px;">
    <div>
    	<c:if test="${member.list == null}">
	    	<span class="material-icons ">add </span>
			<a class="post__upload" href="<%=application.getContextPath()%>/photo/write"> 첫 번째 사진을 올려보세요</a>
    	</c:if>
    	
    	<c:if test="${member.list != null}">
			<c:forEach var="like" items="${member.list}">
			<a href="<%=application.getContextPath()%>/photo/detail?pnumber=${like.pnumber}">
			<img style="margin:5px" align="left" width="100px" height="100px" src="<%=application.getContextPath()%>/like/photodownload?fileName=${like.first_image}"/>
			</a>
			</c:forEach>
    	</c:if>
    </div>
</div>

        	
     