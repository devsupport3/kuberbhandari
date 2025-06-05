/*
Name: 			Wedding
Written by: 	Okler Themes - (http://www.okler.net)
Theme Version:	9.9.0
*/

(function( $ ) {

	'use strict';

	/*
	Slider
	*/
	$('#revolutionSlider').revolution({
		sliderType: 'standard',
		sliderLayout: 'fullwidth',
		delay: 9000,
		responsiveLevels: [1920, 1200, 992, 500],
		gridwidth: [1920, 1200, 992, 500],
		gridheight: 780,
		disableProgressBar: 'on',
		spinner: 'spinner3',
		parallax: {
			type: "mouse",
			origo: "slidercenter",
			speed: 2000,
			levels: [2, 3, 4, 5, 6, 7, 12, 16, 10, 50],
		},
		navigation: {
			arrows: {
				style: "hades",
				enable: false,
				hide_onmobile: false,
				hide_onleave: false,
				tmp: '<div class="tp-arr-allwrapper"><div class="tp-arr-imgholder"></div></div>',
				left: {
					h_align: "left",
					v_align: "center",
					h_offset: 10,
					v_offset: 0
				},
				right: {
					h_align: "right",
					v_align: "center",
					h_offset: 10,
					v_offset: 0
				}
			}
		}
	});

	$('#revolutionSlider2').revolution({
		sliderType: 'standard',
		sliderLayout: 'fullwidth',
		delay: 9000,
		responsiveLevels: [1920, 1200, 992, 500],
		gridwidth: [1920, 1200, 992, 500],
		gridheight: 575,
		disableProgressBar: 'on',
		spinner: 'spinner3',
		parallax: {
			type: "mouse",
			origo: "slidercenter",
			speed: 2000,
			levels: [2, 3, 4, 5, 6, 7, 12, 16, 10, 50],
		},
		navigation: {
			arrows: {
				style: "hades",
				enable: false,
				hide_onmobile: false,
				hide_onleave: false,
				tmp: '<div class="tp-arr-allwrapper"><div class="tp-arr-imgholder"></div></div>',
				left: {
					h_align: "left",
					v_align: "center",
					h_offset: 10,
					v_offset: 0
				},
				right: {
					h_align: "right",
					v_align: "center",
					h_offset: 10,
					v_offset: 0
				}
			}
		}
	});

	// Our History Gallery
	var clickedItem1,
		removeShowThumbsTimeout1,
		portfolioLightboxOptions1 = {
		type: 'inline',

		fixedContentPos: true,
		fixedBgPos: true,

		overflowY: 'hidden',

		closeBtnInside: true,
		preloader: false,

		midClick: true,
		removalDelay: 300,
		mainClass1: 'wedding-portfolio-gallery1',

		mainClass1: {
			open: function(){
				$('#thumbGalleryDetail4').owlCarousel().trigger('refresh.owl.carousel');
				$('#thumbGalleryDetail4').owlCarousel().trigger('to.owl.carousel', [clickedItem1, 0]);

				$('#thumbGalleryThumbs4').owlCarousel('refresh');

				removeShowThumbsTimeout1 = setTimeout(function(){
					$('#thumbGalleryThumbs4').removeClass('show-thumbs1');
				}, 3000);

				$(document).on('keydown', function( event ) {
				    if(event.keyCode == 37) {
				        $('#thumbGalleryDetail4').trigger('prev.owl')
				    }
				    if(event.keyCode == 39) {
				        $('#thumbGalleryDetail4').trigger('next.owl')
				    }
				});

				
			},
			close: function(){
				clearTimeout(removeShowThumbsTimeout1);
				$('#thumbGalleryThumbs4').addClass('show-thumbs1');
				$(document).off('keydown');
			}
		}
	}

	var clickedItem1 = '';
	if( $('a[href="#ourHistoryLightbox4"]').length ) {
		$('a[href="#ourHistoryLightbox4"]').on('click', function(){
			clickedItem1 = $(this).parent().index();
		});

		$('a[href="#ourHistoryLightbox4"]').magnificPopup(portfolioLightboxOptions1);
	}

	/*
	Thumb Gallery
	*/
	if( $('#ourHistoryLightbox4').get(0) ) {
		var $thumbGalleryDetail1 = $('#thumbGalleryDetail4'),
			$thumbGalleryThumbs1 = $('#thumbGalleryThumbs4'),
			flag = false,
			duration = 300;

		$thumbGalleryDetail1
			.owlCarousel({
				items: 1,
				margin: 10,
				nav: true,
				dots: false,
				loop: false,
				navText: [],
				rtl: (($('html[dir="rtl"]').get(0)) ? true : false),
				onRefreshed: function(e){
					setTimeout(function(){
						$('.mfp-wrap.wedding-portfolio-gallery1').css('opacity',1);
					}, 300);
				}
			})
			.on('changed.owl.carousel', function(e) {
				if (!flag) {
					flag = true;
					$thumbGalleryThumbs1.trigger('to.owl.carousel', [e.item.index-1, duration, true]);

					// add class to active thumb
					$thumbGalleryThumbs1.find('.owl-item').removeClass('active-thumb');
					$thumbGalleryThumbs1.find('.owl-item:eq('+ e.item.index +')').addClass('active-thumb');

					flag = false;
				}
			});

		$thumbGalleryThumbs1
			.owlCarousel({
				margin: 15,
				items: 15,
				nav: false,
				center: false,
				dots: false,
				pagination: false,
				rtl: (($('html[dir="rtl"]').get(0)) ? true : false)
			})
			.on('click', '.owl-item', function() {
				$thumbGalleryDetail1.trigger('to.owl.carousel', [$(this).index(), duration, true]);

				// add class to active thumb
				$thumbGalleryThumbs1.find('.owl-item').removeClass('active-thumb');
				$(this).addClass('active-thumb');
			});

		// Set first item with active-thumb
		$thumbGalleryThumbs1.find('.owl-item:eq(0)').addClass('active-thumb');

	}

}).apply( this, [ jQuery ]);