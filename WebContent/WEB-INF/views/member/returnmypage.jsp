<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html; charset=UTF-8"%>


<h5><strong>사진</strong></h5>
<div id="mypagephoto" class = "mb-4 scroll" style="border:1px dashed #dbdbdb;width:100%;height: 320px;">
    <div class = "row">
    	<c:if test="${member.list == null}">
	    	<span class="material-icons ">add </span>
			<a class="post__upload" href="<%=application.getContextPath()%>/photo/write"> 첫 번째 사진을 올려보세요</a>
    	</c:if>
    	
    	<c:if test="${member.list != null}">
			<c:forEach var="like" items="${member.list}">
				<a class = "col-4 mb-2" href="<%=application.getContextPath()%>/photo/detail?pnumber=${like.pnumber}">
					<img class="img-fluid" style="height: 180px;" src="<%=application.getContextPath()%>/file/photo?fileName=${like.first_image}"/>
				</a>
			</c:forEach>
    	</c:if>
    </div>
</div>

<h5><strong>Self Guide</strong></h5>
<div id="mypagephoto2" class = "mb-4 scroll" style="border:1px dashed #dbdbdb;width:100%;height: 320px;">
	<div class = "row">
    	<c:if test="${selfguide == null}">
	    	<span class="material-icons ">add </span>
			<a class="post__upload" href="<%=application.getContextPath()%>/selfguide/selfguide-write"> 첫 번째 가이드를 올려보세요</a>
    	</c:if>
    	
    	<c:if test="${selfguide != null}">
			<c:forEach var="selfguide" items="${selfguide}">
   				<a class = "col-4 mb-2" href="<%=application.getContextPath()%>/selfguide/selfdetail?snumber=${selfguide.snumber}&swriter=${selfguide.swriter}">
   					<img class="img-fluid" style="height: 180px;" src="<%=application.getContextPath()%>/file/selfguide?fileName=${selfguide.simage}">
   				</a>
			</c:forEach>
    	</c:if>
    </div>
</div>