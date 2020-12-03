<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<h5><strong>좋아요</strong></h5>
<div id="mypagephoto" class = "mb-4 scroll" style="border:1px dashed #dbdbdb;width:100%;height: 320px;">
    <div class = "row">
    	<c:forEach var="like" items="${likelist}">
			<a class = "col-4 mb-2" href="<%=application.getContextPath()%>/photo/detail?pnumber=${like.pnumber}">
			<img class="img-fluid" height="150px;" src="<%=application.getContextPath()%>/file/photo?fileName=${like.first_image}"/>
			</a>
		</c:forEach>
    </div>
</div>

<h5><strong>Self Guide</strong></h5>
<div id="mypagephoto2" class = "scroll" style="border:1px dashed #dbdbdb;width:100%;height: 320px;">
    	<c:forEach var="selfguide" items="${selfguide}">
   				<a class = "col-4 mb-2" href="<%=application.getContextPath()%>/selfguide/selfdetail?snumber=${selfguide.snumber}&swriter=${selfguide.swriter}">
   					<img class="img-fluid" height="150px;" src="<%=application.getContextPath()%>/file/selfguide?fileName=${selfguide.simage}">
   				</a>
		</c:forEach>
</div>