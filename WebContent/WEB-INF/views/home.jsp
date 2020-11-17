<%@ page contentType="text/html; charset=UTF-8"%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<link rel="stylesheet"	href="<%=application.getContextPath() %>/resources/css/main.css">
<!-- bootstrap 사용하려면 여기 삭제 해야함. -->
</head>

<body>


	<div class="wrap container-fluid">
		<!-- 전체를 하나로 포장하겠다 -->
		<!-- 이런 wrap이나 mainCenter들의 main.css에 저장되어있다. -->

		<jsp:include page="/WEB-INF/views/include/Header.jsp" />
		<!-- 브라우저의 윗 부분.  -->
		<!-- 이렇게하는 경우  다른jsp 에서도 저 부분을 쓸 수가 있어서. -->

		<div class="mainCenter row">
			<!-- 브라우저의 가운데 왼쪽 부분 -->

			<div class="col-md-4">

				<jsp:include page="/WEB-INF/views/include/menu.jsp" />
				<!--가운데 왼쪽 부분. 메뉴를 클릭했을때 나오는 내용이 아래 list들 -->
			</div>

			<div class="content col-md-8">

				
			</div>
		</div>


	</div>

</body>
</html>