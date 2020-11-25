
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

    // console.log("실행");
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

  // Porfolio isotope and filter
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
  });

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
var filterCon;
function addTag(btncon, btnid) {
  var button = $('<button type = "button" onclick="removeTag(' + btnid + ');"'+
				'id = "' + btnid + '"class = "btn btn-outline-primary btn-sm mr-2">' 
				+ btncon + '<i class="material-icons" style="font-size: x-small;">close</i></button>');
				
  var id1 = '#' + btnid;
  if ($(id1).length > 0) {
    var icon = '<i class="material-icons" style="font-size: x-small;">close</i>';
    $(id1).html(btncon + icon);
  } else {
    $("#addtag").append(button);
  }
	filterCon += btncon;
	console.log(filterCon);
}

function removeTag(removeID) {
  var removeID1 = '#' + removeID;
  $(removeID1).remove();
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

  var page = 2;
  $(function(){
      $(window).scroll(function(){
          var $window = $(this);
          var scrollTop = $window.scrollTop();
          var windowHeight = $window.height();
          var documentHeight = $(document).height();
          
          //console.log("documentHeight:" + documentHeight + " | scrollTop:" + scrollTop + " | windowHeight: " + windowHeight );
          
          if( scrollTop + windowHeight + 1000 > documentHeight ){
        	  getList(page);
	           page++; 
            }
          
          var portfolioIsotope = $('.portfolio-container').isotope({
              itemSelector: '.portfolio-item',
              layoutMode: 'fitRows'
            });
          
          portfolioIsotope.isotope({
              filter: '*'
            }); 
          
          
   })
		    
})


/*function photoChange(aimage, acontent){
	
	var imagepath = 'photodownload?fileName='+aimage;
	console.log(imagepath);
	console.log(acontent);
	$('#thumbnail_image').attr('src', imagepath);
	$('#acontent').html(acontent);
	
}
*/


  // Porfolio isotope and filter
  $(window).on('load', function() {
    var portfolioIsotope = $('.portfolio-container').isotope({
      itemSelector: '.portfolio-item',
      layoutMode: 'fitRows'
    });

    /*$('#portfolio-flters li').on('click', function() {
      $("#portfolio-flters li").removeClass('filter-active');
      $(this).addClass('filter-active');

      portfolioIsotope.isotope({
        filter: '.30평대'
      });
      aos_init();
    });*/

		portfolioIsotope.isotope({
        filter: '*'
      });

    // Initiate venobox (lightbox feature used in portofilo)
    $(document).ready(function() {
      $('.venobox').venobox();
    });
  });




//============서윤아=====================================
 $(document).ready(function(){
	replyList();
});
	 
function replyList(pageNo){
	if(!pageNo){
		pageNo=1;
	}
	$.ajax({
		url:"/teamproject/reply/replyList",
		data:{pageNo:pageNo},
		success:function(data){
			$("#reply_result").html(data);
		}
	});
}

function replyWrite(pnumber){
	var rcontent = $("#rcontent").val().trim();
	
	console.log(pnumber);
	$.ajax({
		url:"/teamproject/reply/replyWrite",
		method:"post",
		data : {rcontent:rcontent, pnumber:pnumber},
		success:function(data){
			console.log("성공후 실행");
			if(data.result=="success"){
				
				replyList();
			}
			$("#reply_result").html(data);
		}
	});
}

function replyDelete(rnumber){
	$.ajax({
		url:"/teamproject/reply/replyDelete",
		data:{rnumber:rnumber},
		method:"post",
		success:function(data){
			if(data.result=="success"){
				replyList();
			}
		}
	});
}