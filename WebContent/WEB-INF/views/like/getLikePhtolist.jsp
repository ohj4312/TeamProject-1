<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<section class="post post--cards">
        				<h5><strong>좋아요</strong></h5>
                <div id="mypagephoto" style="border:1px dashed #dbdbdb; width:100%;  text-align: center; ">
                    <div class="row justify-content-center " style="margin-top: 30%;">
                          
                          <c:forEach var="board" items="${list}">
                          
                          <img class="rounded-circle" width="50px" height="50px" src="photodwnload?fileName=${board.mphoto}"/>
                          
                          </c:forEach>
                          
                    </div>
                </div>  
</section>