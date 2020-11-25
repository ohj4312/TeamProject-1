<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html; charset=UTF-8"%>




<!-- member가 북마크 한    1. 게시물들   2.  -->

<section class="post post--cards">
        				<h5><strong>북마크</strong></h5>
                <div id="mypagephoto" style="border:1px dashed #dbdbdb; width:100%;  ">
                    
                    <c:forEach var="bookmark" items="${list }">
						<img style="margin:5px;" align="left" class="rounded" width="75px" height="75px"
						src="<%=application.getContextPath() %>/BK/photodownload?fileName=${bookmark.first_image}">
					</c:forEach>
                          
                   
                </div>  
</section>

