<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

            <article id="community" class="entry" style="height:200px">
              <div  style="display:inline-block; padding-bottom: 3%; padding-right: 3%;">
                <img src="<%=application.getContextPath() %>/resources/assets/img/blog-1.jpg"  style="border-radius:20px; width: 40px; height: 60px">
              </div>
              

              <div style="display:inline-block; text-align:right;">
              <h5 style="font-size:0.1375em;">
                <strong><a style="color: black;" href="#">첫 자취 저렴하게 꾸미기 도와주세요</a></strong>
              </h5>
            </div>
              <div class="entry-content">
                <p style="margin: 0px">
                  		미리 보기 느낌으로 윤아야 이정도로 작아야 할꺼같은데..ㅋㅋㅋㅋㅋ괜찮??
                </p>
                <div class="read-more">
                  <a href="blog-single.html">Read More</a>
                </div>
                <div class="entry-meta">
                <ul>
                  <li class="d-flex align-items-center"><i class="icofont-user"></i> <a href="blog-single.html">John Doe</a></li>
                  <li class="d-flex align-items-center"><i class="icofont-wall-clock"></i> <a href="blog-single.html"><time datetime="2020-01-01">Jan 1, 2020</time></a></li>
                  <li class="d-flex align-items-center"><i class="icofont-comment"></i> <a href="blog-single.html">12 Comments</a></li>
                </ul>
              </div>
              </div>
              

            </article>
            <script type="text/javascript">
            function communitylist() {
            	$.ajax({
            		url: urlpath,
            		
            		success:function(data) {	
            		
            	});
				
			}

			</script>
            <!-- End blog entry -->

         