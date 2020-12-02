
/**
* Template Name: Maxim - v2.2.0
* Template URL: https://bootstrapmade.com/maxim-free-onepage-bootstrap-theme/
* Author: BootstrapMade.com
* License: https://bootstrapmade.com/license/
*/
!(function($) {
  "use strict";

  // Smooth scroll for the navigation menu and links with .scrollto classes
  var scrolltoOffset = $('#header').outerHeight() - 1;
  $(document).on('click', '.nav-menu a, .mobile-nav a, .scrollto', function(e) {
    if (location.pathname.replace(/^\//, '') == this.pathname.replace(/^\//, '') && location.hostname == this.hostname) {
      var target = $(this.hash);
      if (target.length) {
        e.preventDefault();

        var scrollto = target.offset().top - scrolltoOffset;

        if ($(this).attr("href") == '#header') {
          scrollto = 0;
        }

        $('html, body').animate({
          scrollTop: scrollto
        }, 1500, 'easeInOutExpo');

        if ($(this).parents('.nav-menu, .mobile-nav').length) {
          $('.nav-menu .active, .mobile-nav .active').removeClass('active');
          $(this).closest('li').addClass('active');
        }

        if ($('body').hasClass('mobile-nav-active')) {
          $('body').removeClass('mobile-nav-active');
          $('.mobile-nav-toggle i').toggleClass('icofont-navigation-menu icofont-close');
          $('.mobile-nav-overly').fadeOut();
        }
        return false;
      }
    }
  });

  // Activate smooth scroll on page load with hash links in the url
  $(document).ready(function() {
    // $cloneform = $("#cloneForm").clone();

    if (window.location.hash) {
      var initial_nav = window.location.hash;
      if ($(initial_nav).length) {
        var scrollto = $(initial_nav).offset().top - scrolltoOffset;
        $('html, body').animate({
          scrollTop: scrollto
        }, 1500, 'easeInOutExpo');
      }
    }
  });

  // Mobile Navigation
  if ($('.nav-menu').length) {
    var $mobile_nav = $('.nav-menu').clone().prop({
      class: 'mobile-nav d-lg-none'
    });
    $('body').append($mobile_nav);
    $('body').prepend('<button type="button" class="mobile-nav-toggle d-lg-none"><i class="icofont-navigation-menu"></i></button>');
    $('body').append('<div class="mobile-nav-overly"></div>');

    $(document).on('click', '.mobile-nav-toggle', function(e) {
      $('body').toggleClass('mobile-nav-active');
      $('.mobile-nav-toggle i').toggleClass('icofont-navigation-menu icofont-close');
      $('.mobile-nav-overly').toggle();
    });

    $(document).on('click', '.mobile-nav .drop-down > a', function(e) {
      e.preventDefault();
      $(this).next().slideToggle(300);
      $(this).parent().toggleClass('active');
    });

    $(document).click(function(e) {
      var container = $(".mobile-nav, .mobile-nav-toggle");
      if (!container.is(e.target) && container.has(e.target).length === 0) {
        if ($('body').hasClass('mobile-nav-active')) {
          $('body').removeClass('mobile-nav-active');
          $('.mobile-nav-toggle i').toggleClass('icofont-navigation-menu icofont-close');
          $('.mobile-nav-overly').fadeOut();
        }
      }
    });
  } else if ($(".mobile-nav, .mobile-nav-toggle").length) {
    $(".mobile-nav, .mobile-nav-toggle").hide();
  }

  // Navigation active state on scroll
  var nav_sections = $('section');
  var main_nav = $('.nav-menu, .mobile-nav');

  $(window).on('scroll', function() {
    var cur_pos = $(this).scrollTop() + 200;

    nav_sections.each(function() {
      var top = $(this).offset().top,
        bottom = top + $(this).outerHeight();

      if (cur_pos >= top && cur_pos <= bottom) {
        if (cur_pos <= bottom) {
          main_nav.find('li').removeClass('active');
        }
        main_nav.find('a[href="#' + $(this).attr('id') + '"]').parent('li').addClass('active');
      }
      if (cur_pos < 300) {
        $(".nav-menu ul:first li:first").addClass('active');
      }
    });
  });

  // Back to top button
  $(window).scroll(function() {
    if ($(this).scrollTop() > 100) {
      $('.back-to-top').fadeIn('slow');
    } else {
      $('.back-to-top').fadeOut('slow');
    }
  });

  $('.back-to-top').click(function() {
    $('html, body').animate({
      scrollTop: 0
    }, 1500, 'easeInOutExpo');
    return false;
  });

  // Testimonials carousel (uses the Owl Carousel library)
  $(".testimonials-carousel").owlCarousel({
    autoplay: true,
    dots: true,
    loop: true,
    responsive: {
      0: {
        items: 1
      },
      768: {
        items: 2
      },
      900: {
        items: 3
      }
    }
  });

/*  // Porfolio isotope and filter
  $(window).on('load', function() {
    var portfolioIsotope = $('.portfolio-container').isotope({
      itemSelector: '.portfolio-item',
      layoutMode: 'fitRows'
    });

    $('#portfolio-flters li').on('click', function() {
      $("#portfolio-flters li").removeClass('filter-active');
      $(this).addClass('filter-active');

      portfolioIsotope.isotope({
        filter: $(this).data('filter')
      });
      aos_init();
    });

    // Initiate venobox (lightbox feature used in portofilo)
    $(document).ready(function() {
      $('.venobox').venobox();
    });
  });*/

  // Portfolio details carousel
  $(".portfolio-details-carousel").owlCarousel({
    autoplay: true,
    dots: true,
    loop: true,
    items: 1
  });

  // Init AOS
  function aos_init() {
    AOS.init({
      duration: 1000,
      easing: "ease-in-out",
      once: true
    });
  }
  $(window).on('load', function() {
    aos_init();
  });

})(jQuery);

//===========================노성규==============================

var $portfolioIsotope;

$(document).ready(function() {
      $portfolioIsotope = $('.portfolio-container').isotope({
			              itemSelector: '.portfolio-item',
			              layoutMode: 'fitRows',
						getSortData: {number: '.hitcount parseInt'}
			            });
	 $portfolioIsotope.isotope({
              filter: filterCon
            });
});
var filterCon = '';
var pstyle = '';
var ptype = '';
var psize = '';
var filter;
var page;
function addTag(btncon, btnid) {
	switch (btnid){
    case 'type' :
        ptype = '.'+btncon;
        break;
    case 'size' :
        psize = '.'+btncon;
        break;
    case 'style' :
        pstyle = '.'+btncon;
        break;
	case 1 :
		switch(btncon){
			case '역대 인기순':
			page = 2;
			filter = 'hit';
	
			
			break;
			
			case '최신순':
			page = 2;
			filter = 'recent';
	
		
			break;
		}
		$.ajax({
				type : 'POST',
				url:"list",
				data: {"filter":filter},
				contentType: "application/x-www-form-urlencoded; charset=UTF-8",
				success : function(data) {
						$('#12345').html(data);
						$portfolioIsotope.isotope('reloadItems');
						$portfolioIsotope.isotope({ sortBy: 'number', sortAscending: false });
		       		},
		       error:function(e){
		           if(e.status==300){
		               alert("데이터를 가져오는데 실패하였습니다.");
		           };
		       }
			});
		break;
	}

  var button = $('<button type = "button" onclick="removeTag(\''+ btnid +'\');"'+
				'id = "' + btnid + '"class = "btn btn-outline-primary btn-sm mr-2">' 
				+ btncon + '<i class="material-icons" style="font-size: x-small;">close</i></button>');
				
  var id1 = '#' + btnid;
  if ($(id1).length > 0) {
    var icon = '<i class="material-icons" style="font-size: x-small;">close</i>';
    $(id1).html(btncon + icon);
  } else {
    $("#addtag").append(button);
  }
	filterCon = pstyle+ptype+psize;
	console.log(filterCon);
        
         $portfolioIsotope.isotope({
              filter: filterCon
            });
}

function removeTag(removeID) {
	switch (removeID){
	    case 'type' :
	        ptype = '';
	        break;
	    case 'size' :
	        psize = '';
	        break;
	    case 'style' :
	        pstyle = '';
	        break;
		case '1' :
		page=2;
			$.ajax({
				type : 'POST',
				url:"list",
				data: {"filter":'recent'},
				contentType: "application/x-www-form-urlencoded; charset=UTF-8",
				success : function(data) {
						$('#12345').html(data);
						$portfolioIsotope.isotope('reloadItems');
						$portfolioIsotope.isotope({ sortBy: 'number', sortAscending: false });
		       		},
		       error:function(e){
		           if(e.status==300){
		               alert("데이터를 가져오는데 실패하였습니다.");
		           };
		       }
			});
			break;
	}
	filterCon = pstyle+ptype+psize;
	console.log(filterCon);
  	var removeID1 = '#' + removeID;
  	$(removeID1).remove();

         $portfolioIsotope.isotope({
              filter: filterCon
            });
	
}

$("input:file").on('change', function(e){
        let elem = e.target;

        var src1 = URL.createObjectURL(elem.files[0]);
        var $div = $('<img src="'+src1+'" width="100%" height="100%" />');
        // $("#srclabel").html($div);
        $(elem).next().html($div);
      });
      
function addform(){
	  var list = $('#addDiv > div[style = "display:none;"]');
	  if(list.length > 0){

		$(list[0]).attr('style', '');
	}
	
	if(list.length == 0){
		alert("사진은 10개까지만 등록 가능합니다.");
	}
}

function removeform(idnum){
	
	//숨기려는 폼의 아이디값 가져오기
	var idnum = '#'+idnum;
	
	//숨기려는 폼의 이미지 태그를 초기화 하기 위해서 해당 부분의 태그 가져오기
	var label = idnum + ' label';
	var label1 = $(label);
	
	
	
	//숨기려는 폼의 텍스트 에리어를 초기화
	var textarea = idnum + ' textarea';
	var textarea1 = $(textarea);
	
	var filevalue = $(idnum + ' input');

	//숨기려는 폼의 파일값 초기화
	$(filevalue[0]).val('');
	//초기화 하기 위한 값
	var imagetag = $('<i class="material-icons "'+
	                  'style="font-size: 7rem; position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%);">'+
	                  'photo_camera'+
	                  '</i>');

	
	//받아온 아이디로 폼 숨기기
	$(idnum).attr('style', 'display:none;');
	
	//해당 폼의 이미지를 초기화
	$(label1[0]).html(imagetag);
	$(textarea1[0]).val('');

	//숨긴 폼을 복사하여 맨마지막 요소로 추가하고 원본은 지우기
	var cloneform = $(idnum).clone();
	$(idnum).remove();
	$("#addDiv").append(cloneform);
	
	$("input:file").on('change', function(e){
        let elem = e.target;

        var src1 = URL.createObjectURL(elem.files[0]);
        var $div = $('<img src="'+src1+'" width="100%" height="100%" />');
  
        $(elem).next().html($div);
      });
	
}

  

function photoChange(aimage, acontent){
	
	var imagepath = '/teamproject/file/photo?fileName='+aimage;
	console.log(imagepath);
	console.log(acontent);
	$('#thumbnail_image').attr('src', imagepath);
	$('#acontent').html(acontent);
	
}
function updatePhoto(){
	var result = 0;
			if($('#psize').val() == '평수'){
						$('#psize').attr('style', 'border-color: red;');
					}else{
						$('#psize').attr('style', 'height: auto;');
					}

					if($('#ptype').val() == '주거형태'){
						$('#ptype').attr('style', 'border-color: red;');
					}else{
						$('#ptype').attr('style', 'height: auto;');
					}

					if($('#pstyle').val() == '스타일'){
						$('#pstyle').attr('style', 'border-color: red;');
					}else{
						$('#pstyle').attr('style', 'height: auto;');
					}


			if($('#psize').val() == '평수' || $('#ptype').val() == '주거형태' || $('#pstyle').val() == '스타일' ){


					result++;
				}


            var list = $('#addDiv > div[style = ""]');
			for(var i = 0; i < list.length; i++){
				//아이디 값 받아오기
				var idkey = '#' + $(list[i]).attr('id');
				console.log(idkey);


				//아이디 값을 이용하여 텍스트 에리어 값 가져오기
				var textarea = $(idkey + ' textarea');
				var checktxt = $(textarea[0]).val();
				console.log(checktxt);


				//아이디 값을 이용하여 이미지 소스 가져오기
				
				var filevalue = $(idkey + ' img');
				var checkfile = $(idkey + ' img').attr('src');
				console.log(checkfile);


				//아이디 값을 이용하여 공간을 잘 선택했는지 가져오기
				var selectvalue = $(idkey + ' select');
				var checkselect = $(selectvalue[0]).val();
				console.log(checkselect);


				if(checktxt.trim() == ''){
						$(textarea).attr('style', 'border-color: red;');
					}else{
						$(textarea).attr('style', '');
					}

					if(checkselect == '공간(필수)'){
						$(selectvalue).attr('style', 'border-color: red;');
					}else{
						$(selectvalue).attr('style', 'height: auto;');
					}


				if(checktxt.trim() == '' || !checkfile || checkselect == '공간(필수)'){
					console.log(checktxt.trim());
					console.log(checkselect);
					console.log(checkfile);
					result++;
				}
			}
			
			if(result > 0){
				alert("값을 제대로 입력해주세요.");
				return false;
			}
			return true;

        }

function writePhoto(){
	var result = 0;
			if($('#psize').val() == '평수'){
						$('#psize').attr('style', 'border-color: red;');
					}else{
						$('#psize').attr('style', 'height: auto;');
					}

					if($('#ptype').val() == '주거형태'){
						$('#ptype').attr('style', 'border-color: red;');
					}else{
						$('#ptype').attr('style', 'height: auto;');
					}

					if($('#pstyle').val() == '스타일'){
						$('#pstyle').attr('style', 'border-color: red;');
					}else{
						$('#pstyle').attr('style', 'height: auto;');
					}


			if($('#psize').val() == '평수' || $('#ptype').val() == '주거형태' || $('#pstyle').val() == '스타일' ){


					result++;
				}


            var list = $('#addDiv > div[style = ""]');
			for(var i = 0; i < list.length; i++){
				//아이디 값 받아오기
				var idkey = '#' + $(list[i]).attr('id');
				console.log(idkey);


				//아이디 값을 이용하여 텍스트 에리어 값 가져오기
				var textarea = $(idkey + ' textarea');
				var checktxt = $(textarea[0]).val();
				console.log(checktxt);


				//아이디 값을 이용하여 이미지 소스 가져오기
				var filevalue = $(idkey + ' input');
				var checkfile = $(filevalue[0]).val();
				console.log(checkfile);


				//아이디 값을 이용하여 공간을 잘 선택했는지 가져오기
				var selectvalue = $(idkey + ' select');
				var checkselect = $(selectvalue[0]).val();
				console.log(checkselect);


				if(checktxt.trim() == ''){
						$(textarea).attr('style', 'border-color: red;');
					}else{
						$(textarea).attr('style', '');
					}

					if(checkselect == '공간(필수)'){
						$(selectvalue).attr('style', 'border-color: red;');
					}else{
						$(selectvalue).attr('style', 'height: auto;');
					}


				if(checktxt.trim() == '' || checkfile.trim() == '' || checkselect == '공간(필수)' ){

					result++;
				}
			}

			if(result > 0){
					alert("값을 제대로 입력해주세요.");
					return false;
			}
			return true;

        }

function checkPassword(){
	if($('#mpassword1').val() == $('#mpassword2').val()){
		return true;
	}else{
		$('#alertd').attr('style', ' ');
		return false;
	}
}
		  
function getList(page){
			console.log("페이징 실행");
			$.ajax({
				type : 'POST',
				url:"listjson",
				data: {"pageNo" : page, "filter":filter},
				contentType: "application/x-www-form-urlencoded; charset=UTF-8",
				success : function(data) {	
					var list = data;
					for (var loop = 0; loop < list.length; loop++) {
						var follow;
						var bnumber;
						var likenumber;
						if(list[loop].following == null){
							follow = '<a class = "pl-2 follow font-weight-bolder btn btn-sm btn-outline-info '+list[loop].pwritersubstring+'" style = "color: #1bac91;" href="javascript:followCheck(\''+list[loop].pwriter+'\', \'/teamproject/follow/followCheck\', \''+list[loop].pwritersubstring+'\')">'+
												'팔로우'+
												'</a>';
						}else{
							follow = '<a class = "pl-2 follow font-weight-bolder btn btn-sm '+list[loop].pwritersubstring+'" style = "background-color: #1bac91; color: white;" href="javascript:followCheck(\''+list[loop].pwriter+'\', \'/teamproject/follow/followCheck\', \''+list[loop].pwritersubstring+'\')">'+
												'팔로잉'+
												'</a>';
						}
						
						if(list[loop].bnumber == 0){
							bnumber = '<i id="itag'+list[loop].pnumber+'" class="material-icons pl-4" style = " font-size: 30px;">bookmark_border</i>';
						}else{
							bnumber = '<i id="itag'+list[loop].pnumber+'" class="material-icons pl-4" style = " font-size: 30px;">bookmark</i>';
						}
						
						if(list[loop].likenumber == 0){
							likenumber='<i id="likeicon'+list[loop].pnumber+'" class="material-icons pl-4" style = "font-size: 30px;">favorite_border</i>';
						}else{
							likenumber='<i id="likeicon'+list[loop].pnumber+'" class="material-icons pl-4" style = "font-size: 30px;">favorite</i>';
						}
						$items = $('<div class="mb-4 mt-5 col-lg-4 col-md-6 portfolio-item '+list[loop].ptype+' '+list[loop].psize+' '+list[loop].pstyle+'">'+
									'<div class = "row pl-3 pr-2 mb-4">'+
										'<a href="/teamproject/member/yourhomesearch?pwriter='+ list[loop].pwriter+ '" class = "pr-3 " style="color: black;">'+
											'<img class="rounded-circle mr-2 "style="width:30px; height:30px;"  src="/teamproject/file/photo?fileName='+list[loop].mimage+'" />'+
											list[loop].mnickname+
										'</a>'+ 
										follow +
									'</div>'+
									'<a href="/teamproject/photo/detail?pnumber='+list[loop].pnumber+'">'+
									'<div class="portfolio-wrap">'+
										'<img style=" height: 280px;"'+
											'src="/teamproject/file/photo?fileName='+list[loop].first_image+'"'+
											'class="img-fluid rounded" alt="">'+
										'<div class="portfolio-info">'+
												'<h4>조회수</h4>'+
												'<p class = "hitcount">'+list[loop].phit_count+'</p>'+
										'</div>'+
									'</div>'+
									'</a>'+
									'<div div class = "login row pl-3 pr-3 mt-2">'+
										'<a id="App1BK'+list[loop].pnumber+'" class = "col-4 " href="javascript:toggleUpdate('+list[loop].pnumber+', \'/teamproject/BK/CheckBookMark\')">'+
											bnumber+
										'</a>'+
										'<a href="/teamproject/photo/detail?pnumber='+list[loop].pnumber+'" class = "col-4" title="More Details">'+
											'<i class="bx bx-link pl-4" style = "font-size: 30px;"></i>'+
										'</a>'+
										'<a id="likepush'+list[loop].pnumber+'"  class = "col-4" href="javascript:toggleUpdate('+list[loop].pnumber+', \'/teamproject/like/likePushCheck\')">'+
											likenumber+
										'</a>'+
									'</div>'+
									'<div div class = "row pl-3 pr-3 mt-2">'+
												'<a>'+list[loop].first_content+'</a>'+
									'</div>'+
								'</div>');
								
								 $portfolioIsotope.append( $items )
								    // add and lay out newly appended elements
								    .isotope( 'appended', $items);
					    }
		       		},
		       error:function(e){
		           if(e.status==300){
		               alert("데이터를 가져오는데 실패하였습니다.");
		           };
		       }
			});

			
}


//============서윤아=====================================

	 
function replyList(pnumber, pageNo){
	if(!pageNo){
		pageNo=1;
	}
	console.log("replyList:"+pnumber);
	console.log("replyList:"+pageNo);
	$.ajax({
		url:"/teamproject/reply/replyList",
		data:{pageNo:pageNo, pnumber:pnumber},
		success:function(data){
			$("#reply_result").html(data);
		}
	});
}

function replyWrite(pnumber){
	var rcontent = $("#rcontent").val().trim();
	
	if(rcontent!=""){
	
	console.log(pnumber);
	$.ajax({
		url:"/teamproject/reply/replyWrite",
		method:"post",
		data : {rcontent:rcontent, pnumber:pnumber},
		success:function(data){
			console.log("성공후 실행");
			if(data.result=="success"){
				replyList(pnumber);
			}
			$("#reply_result").html(data);
		}
	});
	}
	else{
		
	}
}

function replyDelete(rnumber, pnumber){
	$.ajax({
		url:"/teamproject/reply/replyDelete",
		data:{rnumber:rnumber, pnumber:pnumber},
		method:"post",
		success:function(data){
			if(data.result=="success"){
				console.log("여기는 삭제 창!");
				replyList(pnumber);
			}
		}
	});
}


//=====================토글 업데이트 및 체크
//토글 체크 및 업데이트
function toggleUpdate(pnumber, urlpath){
	console.log(pnumber);
	console.log(urlpath);
	console.log($("#bkcount").html());
	console.log($("#lkcount").html());
	var bkcount = $("#bkcount").html();
	var lkcount = $("#lkcount").html();
	$.ajax({
		url: urlpath,
		data: {pnumber: pnumber},
		success:function(data){ 
			
			 if(data.result == "bookmarksuccess"){
				 
				console.log("bookmarksuccess");
				$("#itag"+pnumber).html("bookmark");
				++bkcount;
				$("#bkcount").html(bkcount);
			}else if(data.result == "bookmarkfailure"){
				
				console.log("bookmarkfailure");
				$("#itag"+pnumber).html("bookmark_border");
				--bkcount;
				$("#bkcount").html(bkcount);
				
			}else if(data.result == "likesuccess"){
				
				console.log("likesuccess");
				$("#likeicon"+pnumber).html("favorite");
				++lkcount;
				$("#lkcount").html(lkcount);
		
			}else if(data.result == "likefailure"){
				
				console.log("likefailure");
				$("#likeicon"+pnumber).html("favorite_border");
				--lkcount;
				$("#lkcount").html(lkcount);
				
			}
			 
		} 
			
	});
}

//팔로워 기능
function followCheck(pwriter, urlpath, classname){
	console.log("팔로워 체크 실행")
	if(classname == null){
		console.log("detail체크");
		$.ajax({
		url: urlpath,
		data:{pwriter:pwriter},
		success:function(data) {
			if(data.result=="success"){
				console.log("해제");
				$('#follow_check').toggleClass('btn-outline-info');
				$('#follow_check').attr('style', 'color: #1bac91');
				$('#follow_check').html('팔로우');
		
			}
			if(data.result=="fail"){
				console.log("등록");
				$('#follow_check').toggleClass('btn-outline-info');
				$('#follow_check').attr('style', 'background-color: #1bac91; color: white;');
				$('#follow_check').html('팔로잉');

			}
		}
		});
	
	}else{
		$.ajax({
		url: urlpath,
		data:{pwriter:pwriter},
		success:function(data) {
			if(data.result=="success"){
				console.log("해제");
				$('.'+classname).toggleClass('btn-outline-info');
				$('.'+classname).attr('style', 'color: #1bac91');
		
			}
			if(data.result=="fail"){
				console.log("등록");
				$('.'+classname).toggleClass('btn-outline-info');
				$('.'+classname).attr('style', 'background-color: #1bac91; color: white;');

			}
		}
		});
		
	}

} 

function getfollowList(){
		$.ajax({
			url:"/teamproject/follow/followList", 
			success:function(data) {
				$("#formchange").html(data);
			}
		});
	} 
	
	function getfollowingList(){
		$.ajax({
			url:"/teamproject/follow/followingList",
			success:function(data) { 
				$("#formchange").html(data);
			}
		});
	} 
	
	  function Return(){
			
			$.ajax({  
			url : "/teamproject/member/returnMypage",
	 						
			success : function(data){
				console.log("return 스크립트 넘어옴.");
				$("#formchange").html(data);
			}
			});
		}  
	
	
	
	        				
		function GetBookMarkList(){
			console.log("리스트 불러오기");
			
			$.ajax({
				url : "/teamproject/BK/getBookMarkList",
				
				method: "get",
				success : function(data){
					console.log("함수 안에부분 실행");
					
					$("#formchange").html(data);
				}
			});
		}
		
		function getLikephotolist(){
			$.ajax({
				url:"/teamproject/like/getLikePhotolist",
				
				success:function(data){
					
					$("#formchange").html(data);
				
				}
			});
			
		}     	