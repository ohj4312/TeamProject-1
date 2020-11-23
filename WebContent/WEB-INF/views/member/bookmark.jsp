<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
		<title>Insert title here</title>
		<meta name="viewport" content="width=device-width, initial-scale=1">
  		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>		
		<link rel="stylesheet" href="<%=application.getContextPath()%>/resources/css/main.css">

</head>
<body>
		
		<h5>북마크 모음 페이지</h5> 
		
		<!-- member가 북마크 한    1. 게시물들   2.  -->
		<c:forEach var="bookmark" items="${list }">
			<tr>
				<td>${bookmark.pnumber }</td>
				<td>${bookmark.bnumber }</td>
				<td>${bookmark.memail }</td>
			</tr>
				
		</c:forEach>
	
</body>
</html>