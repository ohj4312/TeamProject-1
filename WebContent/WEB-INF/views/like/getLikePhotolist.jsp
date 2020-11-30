<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<%-- <section class="post post--cards">
        				<h5><strong>좋아요</strong></h5>
                <div id="mypagephoto" style="border:1px dashed #dbdbdb; width:100%;">
                    <div>
                       <c:forEach var="like" items="${likelist}">
                       <a href="<%=application.getContextPath()%>/photo/detail?pnumber=${like.pnumber}">
                       <img style="margin:5px" align="left" width="100px" height="100px" src="<%=application.getContextPath() %>/like/photodownload?fileName=${like.first_image}"/>
                       </a>
                       </c:forEach>
                    </div>
                </div>  
</section> --%>

<h5><strong>사진</strong></h5>
<div id="mypagephoto" style="border:1px dashed #dbdbdb;width:100%;height: 390px;">
    <div>
       <c:forEach var="like" items="${likelist}">
       <a href="<%=application.getContextPath()%>/photo/detail?pnumber=${like.pnumber}">
       <img style="margin:5px" align="left" width="100px" height="100px" src="<%=application.getContextPath() %>/like/photodownload?fileName=${like.first_image}"/>
       </a>
       </c:forEach>
    </div>
</div> 