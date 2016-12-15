/*-----------------------------------------------------------------------------------

 	Script - All Custom frontend $ scripts & functions

-----------------------------------------------------------------------------------*/
(function(){
  'use strict';

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

  }

  $(document).on('turbolinks:load', function() {

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
  				   	 P A R A L L A X
  	------------------------------------------------*/
  	if($().parallax) {
  		$('.parallax-section').parallax({speed:0.6});
  	}

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
