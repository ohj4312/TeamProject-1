<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div>
<section class="post post--cards">
<h5><strong>팔로잉</strong></h5>
<div id="mypagephoto" style="border:1px dashed #dbdbdb; width:100%;  text-align: center; ">
	<br/>
	<c:forEach var="following" items="${follows}">
		
		<a href="#">
		   <img class="rounded-circle" style="margin:5px" width="30px" height="30px" 
		  src="<%=application.getContextPath() %>/follow/photodownload?fileName=${following.mimage}"/>
		  ${following.memail}
		</a>
		 <hr/>
		
	</c:forEach>
	</div>
	</section>
</div>