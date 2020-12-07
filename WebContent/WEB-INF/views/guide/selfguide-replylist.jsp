<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<div class="">
   <div class="col-sm-12">
      <div class="input-group mb-3"
         style="width: 100%; float: none; margin: 0 auto">
         <h4><strong>댓글</strong></h4>
         <h4 style="color: #1bac91; padding-left: 10px"><strong>${count }</strong></h4>
         
      </div>

   </div>

   <div class="col-12">
      <div class="col-md-10 p-0">
          <div class="input-group mb-3">
          
			<c:if test="${member.memail != null}">
  				<input type="text" id="rcontent2" class="form-control" placeholder="칭찬과 격려는 큰 힘이됩니다!" >
  			</c:if>
  			<c:if test="${member.memail == null}">
  				<input type="text" id="rcontent2" class="form-control" placeholder="칭찬과 격려는 큰 힘이됩니다!" disabled="disabled">
  			</c:if>
             <div class="input-group-append">
                <c:if test="${member.memail != null}">
                   <a class="btn btn-outline" style="background-color:#1bac91; color:white"
                      href="javascript:selfreplyWrite(${snumber})">등록</a>
                </c:if>
             </div>
          </div>
          <!-- 여기에 댓글 리스트 들어갈 예정 -->
          <c:forEach var="reply" items="${list}">
            <div>
               <a href="<%=application.getContextPath()%>/member/yourhomesearch?pwriter=${reply.rwriter}">
               		<img class="rounded-circle" width="50px" height="50px" src="<%=application.getContextPath() %>/file/member?fileName=${reply.mimage}">
               		<span style="padding-right:5px">${reply.mnickname}</span>
               </a>
               <span>${reply.rcontent}</span>
               <c:if test="${member.memail==reply.rwriter}">
	            <div style="display:inline-block;float:right;">
	               <a style="font-size:13px;" href="javascript:selfreplyDelete(${reply.rnumber},${snumber})">삭제</a>
	            </div>
	         </c:if>
            </div>
         </c:forEach>
         

         <div class = "mt-3">
          <c:if test="${count>0}">
           <div class="input-group">
             <ul class="pagination mx-auto">
                <c:if test="${pager.groupNo>1}">
                  <li class="page-item"><a class="page-link" href="javascript:selfreplyList(${pager.startPageNo-1})">Previous</a></li>
               </c:if>
               
               <c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}">
               <c:if test="${pager.pageNo==i}">
                        <li class="page-item"><a class="page-link" href="javascript:selfreplyList(${snumber},${i})">${i}</a></li>
                  </c:if>
                  <c:if test="${pager.pageNo!=i}">
                     <li class="page-item"><a class="page-link" href="javascript:selfreplyList(${snumber},${i})">${i}</a></li>
                  </c:if>
                </c:forEach>
                <c:if test="${pager.groupNo < pager.totalGroupNo}">
                  <li class="page-item"><a class="page-link" href="javascript:selfreplyList(${pager.endPageNo+1})">Next</a></li>
                </c:if>
             </ul>
           </div>
           </c:if>
         </div>
        </div>
        
         
   </div>
<div>
  
       
       
        <%-- <div class="row text-center" style="width:100%">
          <c:if test="${count>0}">
           <div class="input-group mb-3" style="width:50%; float:none; margin:0 auto">
         
             <ul class="pagination" style="text-align:left">
                <c:if test="${pager.groupNo>1}">
                  <li class="page-item"><a class="page-link" href="javascript:selfreplyList(${pager.startPageNo-1})">Previous</a></li>
               </c:if>
               
               <c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}">
               <c:if test="${pager.pageNo==i}">
                        <li class="page-item"><a class="page-link" href="javascript:selfreplyList(${snumber},${i})">${i}</a></li>
                  </c:if>
                  <c:if test="${pager.pageNo!=i}">
                     <li class="page-item"><a class="page-link" href="javascript:selfreplyList(${snumber},${i})">${i}</a></li>
                  </c:if>
                </c:forEach>
                <c:if test="${pager.groupNo < pager.totalGroupNo}">
                  <li class="page-item"><a class="page-link" href="javascript:selfreplyList(${pager.endPageNo+1})">Next</a></li>
                </c:if>
             </ul>
           </div>
           </c:if>
         </div> --%>
   </div>
   
  
   </div>
