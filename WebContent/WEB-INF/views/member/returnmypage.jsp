<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html; charset=UTF-8"%>

<section id="formchange" class="post post--cards pd">	
<h5><strong>사진</strong></h5>
<div id="mypagephoto" style="border:1px dashed #dbdbdb;width:100%;height: 320px;">
    <div>
    	<c:if test="${member.list == null}">
	    	<span class="material-icons ">add </span>
			<a class="post__upload" href="<%=application.getContextPath()%>/photo/write"> 첫 번째 사진을 올려보세요</a>
    	</c:if>
    	
    	<c:if test="${member.list != null}">
			<c:forEach var="like" items="${member.list}">
			<a href="<%=application.getContextPath()%>/photo/detail?pnumber=${like.pnumber}">
			<img style="margin:5px" align="left" width="100px" height="100px" src="<%=application.getContextPath()%>/file/photo?fileName=${like.first_image}"/>
			</a>
			</c:forEach>
    	</c:if>
    </div>
</div>
</section>
<section id="formchange2" class="post post--cards pd">	
<h5><strong>Self Guide</strong></h5>
<div id="mypagephoto2" style="border:1px dashed #dbdbdb;width:100%;height: 320px;">
    <div>
    	<c:if test="${selfguide == null}">
	    	<span class="material-icons ">add </span>
			<a class="post__upload" href="<%=application.getContextPath()%>/selfguide/selfguide-write"> 첫 번째 가이드를 올려보세요</a>
    	</c:if>
    	
    	<c:if test="${selfguide != null}">
			<div class="scroll col-lg-8 h-25" style="width:100%">
		 			<c:forEach var="selfguide" items="${selfguide}">
          				<a href="javascript:otherselfguidephoto('${selfguide.simage}', '${selfguide.scontent}','${selfguide.stitle }','${selfguide.stype }')"><img src="<%=application.getContextPath() %>/selfguide/photodownload?fileName=${selfguide.simage}" class= "w-25 h-25"></a>
					</c:forEach>
			</div>
    	</c:if>
    </div>
</div>
</section>
        	
     