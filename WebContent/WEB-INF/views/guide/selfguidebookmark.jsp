<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html; charset=UTF-8"%>



<h5><strong>북마크</strong></h5>
<div id="mypagephoto" style="border:1px dashed #dbdbdb;width:100%;height: 390px;">
	<c:forEach var="bookmark" items="${list }">
		<a href="<%=application.getContextPath()%>/selfguide/selfdetail?snumber=${bookmark.snumber}"><img style="margin:5px;" align="left" class="rounded" width="100px" height="100px"
		src="<%=application.getContextPath() %>/file/selfguide?fileName=${bookmark.simage}"></a>
	</c:forEach>
</div> 


    