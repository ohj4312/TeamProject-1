<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div>
	<h1>팔로잉</h1>
	<c:forEach var="following" items="${follows}">
		<a href="#">
		   <img class="rounded-circle" style="margin:5px" width="30px" height="30px" 
		  src="<%=application.getContextPath() %>/practjce/photodownload?fileName=${following.mimage}"/>
		  ${following.memail}
		</a>
		 <br/>
		 <hr/>
		
	</c:forEach>
	
</div>