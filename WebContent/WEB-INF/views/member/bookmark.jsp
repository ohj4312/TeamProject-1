<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html; charset=UTF-8"%>


<h5>북마크 모음 페이지</h5>

<!-- member가 북마크 한    1. 게시물들   2.  -->
<c:forEach var="bookmark" items="${list }">
	<img class="rounded-circle" width="100px" height="100px"
		src="<%=application.getContextPath() %>/BK/photodownload?fileName=${bookmark.first_image}">
</c:forEach>
