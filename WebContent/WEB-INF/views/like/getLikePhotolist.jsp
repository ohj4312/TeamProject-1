<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<h5><strong>좋아요</strong></h5>
<div id="mypagephoto" class = "mb-4 scroll" style="border:1px dashed #dbdbdb;width:100%;height: 320px;">
    <div class = "row">
    	<c:forEach var="like" items="${likelist}">
			<a class = "col-4 mb-2" href="<%=application.getContextPath()%>/photo/detail?pnumber=${like.pnumber}">
			<img class="img-fluid" style="height: 180px;" src="<%=application.getContextPath()%>/file/photo?fileName=${like.first_image}"/>
			</a>
		</c:forEach>
    </div>
</div>

<h5><strong>Self Guide Like</strong></h5>
<div id="mypagephoto" class = "scroll" style="border:1px dashed #dbdbdb;width:100%;height: 320px;">
    <div class = "row">
    	<c:forEach var="like" items="${selflikelist}">
			<a class = "col-4 mb-2" href="<%=application.getContextPath()%>/selfguide/selfdetail?snumber=${like.snumber}&swriter=${like.swriter}">
			<img class="img-fluid" style="height: 180px;" src="<%=application.getContextPath()%>/file/selfguide?fileName=${like.simage}"/>
			</a>
		</c:forEach>
    </div>
</div> 