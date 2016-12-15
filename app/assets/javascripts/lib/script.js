/*-----------------------------------------------------------------------------------

 	Script - All Custom frontend $ scripts & functions

-----------------------------------------------------------------------------------*/
(function(){
'use strict';

/* do animations if element is visible
------------------------------------------------*/
function animateOnScroll(pagestart) {

	// /* portfolio animations */
	// if ($('.portfolio-animation').length > 0) {
	// 	$('.portfolio-container.portfolio-animation .portfolio-item').not('.animated')
	// 	.filter(function(i, d) {
	// 		return  $(d).visible(true);
	// 	}).each(function(i) {
	// 		var thisItem = $(this);
	// 		//if (this)
	// 		if ($(window).width() > 1024 && !thisItem.hasClass( "animated" )) {
	// 			var delay = i*150 + 100;  // + 100 is to add a small delay
	// 			if (pagestart && thisItem.data('startposition')) { delay = parseInt(thisItem.data('startposition')) * 200; }
	// 			thisItem.delay(delay).queue(function(){thisItem.addClass('animated'); });
	// 		}
	// 	});
	// }

	/* hero-animation  */
	// $('#hero.hero-animation').not('.animated').addClass('animated');

	// /* text-animations  */
	// if ($('.text-animation').length > 0) {
	// 	$('.text-animation').not('.animated')
	// 	.filter(function(i, d) {
	// 		return  $(d).visible(true);
	// 	}).each(function(i) {
	// 		var thisItem = $(this);
	// 		if ($(window).width() > 1024 && !thisItem.hasClass( "animated" )) {
	// 			var delay = i*100;
	// 			thisItem.delay(delay).queue(function(){thisItem.addClass('animated');});
	// 		}
	// 	});
	// }

	// /* text-animations  */
	// if ($("[class*='do-anim']").length > 0) {
	// 	$("[class*='do-anim']").not('.animated')
	// 	.filter(function(i, d) {
	// 		return  $(d).visible(true);
	// 	}).each(function(i) {
	// 		var thisItem = $(this);
	// 		var delay = i*200 + 100;  // + 150 is to add a small delay
	// 		thisItem.delay(delay).queue(function(){thisItem.addClass('animated');});
	// 	});
	// }


	// /* infinite Load for isotope  */
	// if( $().isotope ) {
	// 	$(".load-isotope:not(.loading):not(.disabled) > a[data-method='infiniteload']")
	// 	.filter(function(i, d) {
	// 		return  $(d).visible(false);
	// 	}).each(function() {
	// 		console.log("visible");
	// 		$(this).trigger( "click" );
	// 	});
	// }

}


/* header Features ()
------------------------------------------------*/
function headerFeatures() {

	/* Add small-header class if scrolled */
	if ($(window).scrollTop() > 50) { $("header:not(.not-sticky):not(.transparent):not(.small-header)").addClass("small-header");
	} else { $("header.small-header:not(.not-sticky):not(.transparent)").removeClass("small-header"); }

	/* Add hero-invisible as soon as it's out of the viewport */
	if ($( window ).scrollTop() + 70 > $("#hero").height()) { $('header:not(.not-sticky)').addClass("hero-invisible");
	} else { $('header').removeClass("hero-invisible"); }

	/* Show Hide backj to top arrow */
	if ($(window).scrollTop() > $(window).height()) { $( '#backtotop' ).addClass("visible");
	} else { $( '#backtotop' ).removeClass("visible"); }

}


/* misc features which need to be regenerated on resize
------------------------------------------------*/
function resizeAdapt() {

	/* - Hero / Pagetitle (if pagetitle is taller than hero) - */
	if ($(".hero-full #page-title").length > 0 || $(".hero-big #page-title").length > 0) {
		var hero = $("#hero");
		var pageTitle = $("#hero #page-title");
		var headerHeight = 0;
		if ($("header").hasClass("transparent")) { headerHeight = $("header").height(); }
		var pageTitleHeight = pageTitle.outerHeight() + parseInt(pageTitle.css('marginTop'),10);
		if (pageTitleHeight+(headerHeight/2) > hero.outerHeight()) {
			var addHeight = headerHeight/2;
			if (pageTitle.hasClass("title-top")) { addHeight = 0; }
			hero.css('height',pageTitleHeight+addHeight-2+'px'); // -2 is for prevend jumping
			pageTitle.addClass('push-bottom');
		} else  {
			hero.css('height','auto');
			pageTitle.removeClass('push-bottom');
		}
	}

	/* detach sticky col  */
	// if($().stick_in_parent && $(window).width() < 769) {
	// 	$(".col-sticky").trigger("sticky_kit:detach");
	// }
}

// /* isotope load more function
// ------------------------------------------------*/
// function isotopeLoadMore(grid,el,url,datas) {
//
// 	el.parent(".load-isotope").addClass('loading');
//
// 	if (url == '#' || !url) { url = srvars.ajaxurl }
// 	var addData = ''; if (datas) { addData = { action:'sr_load_more', o:datas }; }
// 	$.ajax({
// 			type:'POST',			// this might lead to issues for html template
// 			url:url,
// 			data: addData,
// 			dataType:"html",
// 			error: function () {
// 				el.parent(".load-isotope").addClass("disabled");
// 			},
// 			success: function(response) {
// 				//console.log(response);
// 				if (response) {
// 					setTimeout(function(){
// 						var items = $( $(response).find('#'+grid.attr('id')).html());
// 						items.imagesLoaded(function(){
// 							grid.append( items ).isotope( 'appended', items);
// 							animateOnScroll(false);
// 						});
// 						el.parent(".load-isotope").removeClass('loading');
// 					},500);
// 				} else {
// 					el.parent(".load-isotope").addClass("disabled");
// 				}
// 			}
// 	});
//
// }

$(document).on('turbolinks:load', function() {
// 	/*----------------------------------------------
// 				S M O O T H   S H O W    (pageloader)
// 	------------------------------------------------*/
// 	$("body").addClass("loaded");
// 	setTimeout(function(){
// 		$("body").addClass("loading-end");
// 		animateOnScroll(true);
// 		headerFeatures();
//
// 		/* trigger filter if hashtag is active
// 		------------------------------------------------*/
// 		if(window.location.hash) {
// 		  	var filter = window.location.hash.substr(1);
// 			if ( $('.filter li a[data-slug='+filter+']').length > 0) {
// 				/*setTimeout(function(){ */$('.filter li a[data-slug='+filter+']').trigger( "click" );/* }, 500);*/
// 			}
// 		}
//
// 	}, 1500);


	/*----------------------------------------------
				   S M A R T   S C R O L L
	------------------------------------------------*/
	if($().smartscroll) {
		$(".smartscroll-grid").smartscroll({
			offsettop: "#pseudo-header"
		});
	}


	/*----------------------------------------------
			   R E S P O N S I V E   N A V
	------------------------------------------------*/
	$('header').on("click", ".menu-toggle", function() {
		// slider burger if position to far away
		if ($(window).width() > 1024 && (!$("header").hasClass("menu-full-center") && !$("header").hasClass("menu-full-columns"))) {
			if ($(window).width() - $(this).offset().left > 345) {
				var offset = $(window).width() - $(this).offset().left - 340;
				$(this).css('transform', 'translateX('+offset+'px)');
			} else {
				$(this).css('transform', 'translateX(0px)');
			}
		}
		if ($('#header').hasClass('menu-is-open')) { $('#main-nav ul.sub-menu').delay(300).slideUp(200, "easeInOutCubic"); }
		$('#header').toggleClass('menu-is-open');
		return false;
	});

	$('#main-nav').on("click", "li > a", function() {
		var thisItem = $(this);
		var thisParent = $(this).parent('li');
		if (thisItem.siblings('ul').length > 0 && thisItem.siblings('ul').css('display') === 'none') {
			thisItem.siblings('ul').slideDown(400, "easeInOutCubic");
			thisParent.siblings('li').children('ul').slideUp(400, "easeInOutCubic");
			return false;
		}
	});



	/*----------------------------------------------
				 	L A Z Y   L O A D
	------------------------------------------------*/
	// if($().unveil && $("img.lazy").length > 0) {
	// 	$("img.lazy").unveil(400);
	// }


	/*----------------------------------------------
			I S O T O P E  /  M A S O N R Y
	------------------------------------------------*/
	// if( $().isotope ) {
  //
	// 	/* Call Isotope
	// 	------------------------------------------------*/
	// 	$('.isotope-grid').each(function(){
	// 		var $container = $(this);
	// 		var layout = "masonry";
	// 		if ($container.hasClass("fitrows")) { layout = "fitRows"; }
	// 		$container.imagesLoaded( function(){
	// 			$container.isotope({
	// 				layoutMode: layout,
	// 				itemSelector : '.isotope-item',
	// 			});
	// 		});
  //
	// 		setTimeout(function() { $container.isotope( 'layout' ); }, 500);
	// 	});
  //
  //
	// 	/* Filter isotope
	// 	------------------------------------------------*/
	// 	$('.filter').on("click", "li a", function() {
	// 		var thisItem = $(this);
	// 		var parentul = thisItem.parents('ul.filter').data('related-grid');
	// 		if (!parentul) {
	// 			alert('Please specify the dala-related-grid');
	// 		} else {
	// 			thisItem.parents('ul.filter').find('li').removeClass('active');
	// 			thisItem.parent('li').addClass('active');
	// 			var selector = thisItem.attr('data-filter');
	// 			$('#'+parentul).isotope({ filter: selector });
	// 			$('#'+parentul+' .isotope-item').not(selector).removeClass("animated");
	// 			$('#'+parentul+' .isotope-item'+selector).addClass("animated");
  //
	// 			// adding slug hashtag to url
	// 			var slug = thisItem.data('slug');
	// 			if (slug) {
	// 				window.location.hash = slug; }
	// 			else {
	// 				history.pushState("", document.title, window.location.pathname);
	// 			}
	// 		}
	// 		return false;
	// 	});
  //
  //
	// 	/* Load More isotope
	// 	------------------------------------------------*/
	// 	var loadMore = $('.load-isotope:not(.disabled) a');
  //
	// 	loadMore.click(function(){
	// 		var el = $(this);
	// 		if(el.data("loadpage") === undefined) { el.data("loadpage","2"); }
	// 		else { el.data("loadpage", parseInt(el.data("loadpage"),10)+1); }
	// 		var 	related = el.data('related-grid');
	// 		var 	href = el.attr('href').replace("2", el.data("loadpage"));
	// 		var datas = '';
	// 		if(el.data("options") !== undefined && el.data("options")) { datas = el.data('options').replace("paged=2", "paged="+el.data("loadpage")); }
	// 		isotopeLoadMore($('#'+related),el,href,datas);
	// 		return false;
	// 	});
  //
	// }




	/*----------------------------------------------
				   	L I G H T C A S E
	------------------------------------------------*/
	// if($().lightcase) {
	// 	$('a[data-rel^=lightcase]').lightcase({
	// 		showSequenceInfo: false,
	// 		swipe: true,
	// 		showCaption:false,
	// 		overlayOpacity:0.95,
	// 		maxWidth: 1300,
	// 		maxHeight: 1100,
	// 		shrinkFactor: 1,
	// 		liveResize: true,
	// 		fullScreenModeForMobile: true,
	// 		video: {
	// 			width : 854,
	// 			height : 480
	// 			},
	// 		iframe:{
	// 			width:854,
	// 			height:480,
	// 			allowfullscreen: 1
	// 			}
	// 	});
  //
	// 	$('a[data-rel^="lightcase:"]').each(function(index) {
	// 		var el = $(this);
	// 		if(!el.hasClass('lc-trigger')) {
	// 		var rel = el.data('rel');
  //           var href = el.attr('href');
	// 		var count = $('a[href="'+href+'"][data-rel="'+rel+'"]').length;
	// 			if(count > 1) {
	// 				$('a[href="'+href+'"][data-rel="'+rel+'"]').not(this).addClass('lc-trigger').attr('data-trigger',index).attr('data-rel','');
	// 				el.addClass('lc-trigger-'+index);
	// 			}
	// 		}
  //       });
  //
	// 	$('a.lc-trigger').on("click", function() {
	// 		$( ".lc-trigger-"+$(this).data('trigger') ).trigger( "click" );
	// 		return false;
	// 	});
  //
	// }


	/*----------------------------------------------
			    I N L I N E   V I D E O
	------------------------------------------------*/
	// $('body').on("click", ".inline-video", function() {
	// 	var el = $(this);
	// 	var type = el.data('type');
	// 	var video = el.data('videoid');
  //
	// 	if (type === 'youtube') {
	// 	var iframe='<iframe src="http://www.youtube.com/embed/'+video+'?autoplay=1" width="100%" height="100%" frameborder="0" allowfullscreen ></iframe>';
	// 	} else if (type === 'vimeo') {
	// 	var iframe='<iframe src="https://player.vimeo.com/video/'+video+'?autoplay=1" width="100%" height="100%" frameborder="0" allowfullscreen></iframe>';
	// 	}
  //
	// 	el.append('<div class="inline-iframe-container"></div>');
	// 	el.find(".inline-iframe-container").html(iframe+'<div class="close-inline-video"></div>');
  //
	// 	setTimeout(function() {
	// 		el.addClass('active');
	// 	}, 1000);
  //
	// 	return false;
	// });
  //
	// $('body').on("click", ".close-inline-video", function() {
	// 	var thisItem = $(this);
	// 	thisItem.parents( ".inline-video" ).removeClass('active');
	// 	thisItem.parent( ".inline-iframe-container" ).remove();
	// 	return false;
	// });

	/*----------------------------------------------
			R E V O L U T I O N   S L I D E R
	------------------------------------------------*/
	// if($().revolution) {
	// 	$("#hero .revolution-slider").revolution({
	// 		sliderType:"standard",
	// 		sliderLayout:"fullscreen",
	// 		fullScreenAutoWidth:"on",
	// 		fullScreenOffsetContainer:"#pseudo-header",
	// 		delay:9000,
	// 		disableProgressBar:'on',
	// 		navigation: {
	// 			arrows:{
	// 				enable:true,
	// 				style:"dani-nav",
	// 				left:{ h_offset: 25 },
	// 				right:{  h_offset: 25 }
	// 			},
	// 			bullets:{
	// 				enable:false,
	// 				style:"dani-bullets",
	// 				h_align:"center",
	// 				v_align:"bottom",
	// 				h_offset:0,
	// 				v_offset:25,
	// 				space:7,
	// 			},
	// 			touch:{
	// 			 	touchenabled:"on",
	// 			 	swipe_treshold : 75,
	// 			 	swipe_min_touches : 1,
	// 			 	drag_block_vertical:false,
	// 			 	swipe_direction:"horizontal"
	// 			}
	// 		},
	// 		responsiveLevels:[2048,1360,1100,780],
	// 		gridwidth:[1100,880,680,400],
	// 		gridheight:[700,550,550,450],
	// 		lazyType: 'smart'
	// 	});
  //
	// 	$("#hero .revolution-slider").bind("revolution.slide.onchange",function (e,data) {
	// 		if (data.currentslide.hasClass('text-light')) {
	// 			$("#header.transparent").addClass("text-light");
	// 			$("#hero .revolution-slider .dani-nav").addClass("dani-light").removeClass("dani-dark");
	// 			$("#hero .revolution-slider .dani-bullets").addClass("dani-light").removeClass("dani-dark");
	// 		} else {
	// 			$("#header.transparent").removeClass("text-light");
	// 			$("#hero .revolution-slider .dani-nav").addClass("dani-dark").removeClass("dani-light");
	// 			$("#hero .revolution-slider .dani-bullets").addClass("dani-dark").removeClass("dani-light");
	// 		}
	// 	});
  //
	// }



	/*----------------------------------------------
		O W L   S L I D E R & C A R O U S E L
	------------------------------------------------*/
	// if($().owlCarousel) {
  //
	// 	$(".owl-slider").owlCarousel({
	// 		items:1,
	// 		stopOnHover : true,
	// 		nav: false,
	// 		navText:false,
	// 		dots: true,
	// 		smartSpeed : 600,
	// 		singleItem : true,
	// 		autoHeight : true,
	// 		loop: false,
	// 		autoplay: false,
	// 		navRewind: false
	// 	});
  //
	// 	$(".owl-carousel").owlCarousel({
	// 		items : 4,
	// 		itemsDesktop:false,
	// 		responsive: { //shop related items
	// 		  480: { items: 1 },
	// 		  768: { items: 2 },
	// 		  },
	// 		autoplay: false,
	// 		autoHeight : true,
	// 		nav: true,
	// 		navText:false,
	// 		dots: true,
	// 		loop: false
	// 	});
  //
	// }



	/*----------------------------------------------
		P R E P A R E   T E X T   A N I M A T I O N
	------------------------------------------------*/
	// if($().lettering) {
	// 	$(".text-animation").lettering('lines');
	// }



	/*----------------------------------------------
				   	 P A R A L L A X
	------------------------------------------------*/
	if($().parallax) {
		$('.parallax-section').parallax({speed:0.6});
	}


	/*----------------------------------------------
				   F I T   V I D E O S
	------------------------------------------------*/
	if($().fitVids) {
		$("body").fitVids();
	}


	/*----------------------------------------------
				   	 V I D E O   B G
	------------------------------------------------*/
	// if($().phatVideoBg) {
	// 	$('.videobg-section').phatVideoBg();
	// }


	/*----------------------------------------------
	 S E L F H O S T E D   A U D I O   +   V I D E O
	------------------------------------------------*/
	// if($().mediaelementplayer) {
	// 	$('audio,video:not(.video-background)').mediaelementplayer();
	// }


	/*----------------------------------------------
				S T I C K Y   C O L U M N     (portfolio)
	------------------------------------------------*/
	// if($().stick_in_parent) {
	// 	setTimeout(function() {
	// 		var stickyOffset = $("header").height() + 50;
	// 		if ($("header").hasClass("not-sticky") && !$("header").hasClass("transparent")) { stickyOffset = $("header").height() + 25; }
	// 		else if ($("header").hasClass("wrapper") && $("header").hasClass("transparent")) { stickyOffset = $("header").height(); }
  //
	// 		$(".col-sticky").stick_in_parent({offset_top:stickyOffset});
	// 		if ($(window).width() < 769) { $(".col-sticky").trigger("sticky_kit:detach"); }
	// 	}, 400 );
	// }


	/*----------------------------------------------
				        T A B S
	------------------------------------------------*/
	// $(".tabs").each(function() {
	// 	var thisItem = $(this);
	// 	thisItem.find('.tab-content').removeClass('active').css('display','none');
	// 	var rel = thisItem.find('.active a').attr('href');
	// 	thisItem.find('.'+rel).addClass('active');
	// });
  //
	// $(".tab-nav").on("click", "a", function() {
	// 	var thisItem = $(this);
	// 	var parentdiv = thisItem.parents('li').parent('ul').parent('div');
	// 	var rel = thisItem.attr('href');
  //
	// 	$(parentdiv).find(".tab-nav li").removeClass("active");
	// 	thisItem.parents('li').addClass("active");
  //
	// 	$(parentdiv).find(".tab-container .tab-content").hide().removeClass('active');
	// 	$(parentdiv).find(".tab-container ."+rel).fadeIn(500).addClass('active');
  //
	// 	return false;
	// });



	// /*----------------------------------------------
	// 		T O G G L E  &  A C C O R D I O N
	// ------------------------------------------------*/
	// $(".toggle-item").each(function() {
	// 	if (!$(this).find('.toggle-active').length) { $(this).find('.toggle-inner').slideUp(300); }
	// 	$(this).find('.toggle-active').parent(".toggle-item").siblings('.toggle-item').find('.toggle-inner').slideUp(300);
	// 	$(this).find('.toggle-active').siblings('.toggle-inner').slideDown(300);
	// });
  //
	// $(".toggle-item").on("click", ".toggle-title", function() {
	// 	var thisItem = $(this);
	// 	var parentdiv = thisItem.parent('div').parent('div');
	// 	var active = thisItem.parent('div').find('.toggle-inner').css('display');
  //
	// 	if ($(parentdiv).attr('class') === 'accordion') {
	// 		if (active !== 'none' ) {
	// 			$(parentdiv).find('.toggle-item .toggle-inner').slideUp(300);
	// 			thisItem.toggleClass('toggle-active');
	// 		} else {
	// 			$(parentdiv).find('.toggle-item .toggle-inner').slideUp(300);
	// 			$(parentdiv).find('.toggle-item .toggle-title').removeClass('toggle-active');
  //
	// 			thisItem.toggleClass('toggle-active');
	// 			thisItem.siblings('.toggle-inner').slideDown(300);
	// 		}
	// 	} else {
	// 		thisItem.toggleClass('toggle-active');
	// 		thisItem.siblings('.toggle-inner').slideToggle(300);
	// 	}
  //
	// 	return false;
	// });



	/*----------------------------------------------
				   S C R O L L   T O (back to top, scroll down, scroll to section)
	------------------------------------------------*/
	$('body').on('click', '#backtotop', function() {
		$('html,body').animate({ scrollTop: 0}, 1000, 'easeInOutQuart');
		return false;
	});


	resizeAdapt();
});

$(window).scroll(function() {
	animateOnScroll(false);
	headerFeatures();
});

$(window).resize(function() {
	resizeAdapt();
});

})($);
