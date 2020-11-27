<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8"%>

<form id="qnaWriteForm">
	<!-- <table style="width:auto" class="table table-sm table-bordered"> -->
	<div class="input-group">
		<div class="input-group-prepend"><span class="input-group-text">제목</span></div>
		<input id="qtitle" type="text" name="qtitle" class="form-control">
		<span id="qtitleError" class="error"></span>
	</div>
	
	<div class="input-group">
		<div class="input-group-prepend"><span class="input-group-text">내용</span></div>
		<textarea id="qcontent" name="qcontent" class="form-control"></textarea>
		<span id="qcontentError" class="error"></span>
	</div>
	
	<div class="input-group">
		<div class="input-group-prepend"><span class="input-group-text">별명</span></div>
		<input id="mnickname" type="text" name="mnickname" class="form-control" 
			<c:if test="${sessionmnickname!=null}">value="${sessionmnickname}"</c:if>
			<c:if test="${sessionmnickname==null}">value="fall"</c:if>
			readonly>
		<span id="qtitleError" class="error"></span>
	</div>
	<!-- //로그인이 되면 로그인된 아이디가 들어간다.값이 없으면 필수, 값이  있으면 에러가 없어서 비워두겠다. -->	
	<div>
		<a type="button" style="color: white; background-color: #1bac91; margin-bottom:10px;"
			 href="javascript:qnaWrite()">글쓰기</a>
		<script type="text/javascript">
			function qnaWrite() {
				var qtitle = $("#qtitle").val().trim();
				if(qtitle == "") { $("#qtitleError").text("필수"); }
				else { $("#qtitleError").text(""); }//입력이 되면 비워둔다.
				
				var qcontent = $("#qcontent").val().trim();
				if(qcontent == "") { $("#qcontentError").text("필수"); }
				else { $("#qcontentError").text(""); }
				
				if(qtitle == "" || qcontent == "") {
					return; //여기서 함수를 끝낸다.
				} 
				
				var mnickname = $("#mnickname").val().trim();
				//파라미터명:위에 써있는게 값
				$.ajax({
					url:"qnaWrite",
					method:"post",
					data: {qtitle:qtitle, qcontent:qcontent, mninckname:mnickname},
					success:function(data) {
						if(data.result == "success") {
							qnaList();//자바스크립트 함수 controller아니다.content.jsp에 있다.json으로 응답,success:function(data)이게 json으로 응답내용{"result":"success"}이렇게 와야 된다.
						}
					}
				});
			}
		</script>		
		
		<a class="btn btn-info" href="javascript:qnaList()">취소</a>
	</div>
</form>
