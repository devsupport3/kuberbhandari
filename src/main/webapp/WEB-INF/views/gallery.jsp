<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html ng-app="kuberbhandari">
<head>

<!-- Basic -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Gallery</title>

<meta name="keywords"
	content="All Inclusive Holidays, Holiday Tours And Travel, Family Vacations All Inclusive, Escorted Tours, Family Vacation Deals, Escorted Tours Holiday , Air Tours Holidays Photo Gallery, Africa Tour Packages, Asia Tour Packages, America Tour Packages, Tours With Indian Meals, Tours With Indian Tour Manager, Brochure 2018 for Holiday Packages, Special Offer Holiday Packages" />
<meta name="description"
	content="We Are Most Popular Tours And Travel Operators In USA For Offering Various Inclusive Holiday Tour Packages For Various Tour Destinations In America, Europe, Africa, Asia & Australia.">
<meta name="author" content="UltraInfotech.net">

<!-- Favicon -->
<link rel="shortcut icon" href="resources/front/img/favicon.ico"
	type="image/x-icon" />
<link rel="apple-touch-icon"
	href="resources/front/img/apple-touch-icon.png">

<!-- Mobile Metas -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1.0, shrink-to-fit=no">

<!-- Web Fonts  -->
<link id="googleFonts"
	href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800%7CShadows+Into+Light&display=swap"
	rel="stylesheet" type="text/css">

<!-- Vendor CSS -->
<link rel="stylesheet"
	href="resources/front/vendor/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="resources/front/vendor/fontawesome-free/css/all.min.css">
<link rel="stylesheet"
	href="resources/front/vendor/animate/animate.compat.css">
<link rel="stylesheet"
	href="resources/front/vendor/simple-line-icons/css/simple-line-icons.min.css">
<link rel="stylesheet"
	href="resources/front/vendor/owl.carousel/assets/owl.carousel.min.css">
<link rel="stylesheet"
	href="resources/front/vendor/owl.carousel/assets/owl.theme.default.min.css">
<link rel="stylesheet"
	href="resources/front/vendor/magnific-popup/magnific-popup.min.css">

<!-- Theme CSS -->
<link rel="stylesheet" href="resources/front/css/theme.css">
<link rel="stylesheet" href="resources/front/css/theme-elements.css">
<link rel="stylesheet" href="resources/front/css/theme-blog.css">
<link rel="stylesheet" href="resources/front/css/theme-shop.css">

<!-- Revolution Slider CSS -->
<link rel="stylesheet"
	href="resources/front/vendor/rs-plugin/css/settings.css">
<link rel="stylesheet"
	href="resources/front/vendor/rs-plugin/css/layers.css">
<link rel="stylesheet"
	href="resources/front/vendor/rs-plugin/css/navigation.css">

<!-- Skin CSS -->
<link id="skinCSS" rel="stylesheet"
	href="resources/front/css/skins/skin-medical.css">
<!-- <link id="skinCSS" rel="stylesheet" href="css/skins/skin-business-consulting-3.css"> -->

<!-- Theme Custom CSS -->
<link rel="stylesheet" href="resources/front/css/custom.css">

<!-- Head Libs -->
<script src="vendor/modernizr/modernizr.min.js"></script>
<script type="text/javascript">
	//Created / Generates the captcha function
	function DrawCaptcha() {
		var a = Math.ceil(Math.random() * 10) + '';
		var b = Math.ceil(Math.random() * 10) + '';
		var c = Math.ceil(Math.random() * 10) + '';
		var d = Math.ceil(Math.random() * 10) + '';
		var e = Math.ceil(Math.random() * 10) + '';
		var f = Math.ceil(Math.random() * 10) + '';
		var g = Math.ceil(Math.random() * 10) + '';
		var code = a + ' ' + b + ' ' + ' ' + c + ' ' + d + ' ' + e + ' ' + f
				+ ' ' + g;
		document.getElementById("txtCaptcha").value = code
	}

	// Validate the Entered input aganist the generated security code function
	function ValidCaptcha() {
		var str1 = removeSpaces(document.getElementById('txtCaptcha').value);
		var str2 = removeSpaces(document.getElementById('txtInput').value);

		if (document.getElementById('form_name').value == "") {
			alert('Please enter Firstname');
			return false;
		} else if (document.getElementById('form_phone').value == "") {
			alert('Please enter Phonenumber');
			return false;
		}

		else if (str1 == str2) {
			return true;
		} else {
			alert('Please enter valid code');
			return false;
		}
	}

	// Remove the spaces from the entered and generated code
	function removeSpaces(string) {
		return string.split(' ').join('');
	}
</script>

<!-- AngularJS -->
<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.8.2/angular.min.js"></script>

<script
	src="<%=request.getContextPath()%>/resources/admin/js/confAdmin.js"></script>

<style>
.hvr:hover {
	color: red !important;
}

.sticky-note {
	position: fixed;
	top: 50%;
	right: 10px;
	transform: translateY(-50%);
	padding: 5px;
	width: 50px;
	z-index: 9999;
}

.sticky-notes {
	position: fixed;
	top: 60%;
	right: 120px;
	transform: translateY(-50%);
	padding: 5px;
	width: 50px;
	z-index: 9999;
}
</style>
<script async
	src="https://www.googletagmanager.com/gtag/js?id=G-4GPVW5TV8B"></script>
<script>
	window.dataLayer = window.dataLayer || [];
	function gtag() {
		dataLayer.push(arguments);
	}
	gtag('js', new Date());

	gtag('config', 'G-4GPVW5TV8B');
</script>
<script src="https://code.jquery.com/jquery-3.3.1.js"
	integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
	crossorigin="anonymous">
	
</script>
<script>
	/* $(function() {
		$(".header").load("header.html");
		$("#footer").load("footer.html");
	}); */

	window.onscroll = function() {
		myFunction()
	};

	var header = document.getElementById("myHeader");
	var sticky = header.offsetTop;

	function myFunction() {
		if (window.pageYOffset > sticky) {
			header.classList.add("sticky");
		} else {
			header.classList.remove("sticky");
		}
	}
</script>
</head>

<body>
	<div class="sticky-note">
		<div class="sticky-note-content">
			<a href="tel:+91-9824332016"
				class="text-4 text-color-light text-color-hover-primary font-weight-light mb-0">
				<img src="resources/front/images/whtpp.svg" height="40px"
				width="40px" alt="">
			</a>
		</div>
	</div>
	<div class="sticky-notes">
		<div class="sticky-note-contents">

			<div id="google_translate_element"></div>
		</div>
	</div>

	<%@include file="header.jsp"%>

	<section
		class="page-header page-header-modern  bg-tertiary border-0 my-0 "
		style="background-color: #ffad28 !important;">
		<div class="container my-3">
			<div class="row p-4">
				<div
					class="col-md-12 align-self-center p-static order-2 text-center">
					<h1 class="font-weight-bold text-10">Gallery</h1>
				</div>
				<div class="col-md-12 align-self-center order-1">
					<ul class="breadcrumb breadcrumb-light d-block text-center">
						<li><a href="index.html">Home</a></li>
						<li class="active">Gallery</li>
					</ul>
				</div>
			</div>
		</div>
	</section>


	<div class="body " ng-controller="FrontGalleryController">

		<!-- Photos start here (Dynamic Lightboxes) -->
		<div ng-repeat="gallery in getAllActiveGallery">
			<div id="ourHistoryLightbox{{ $index + 1 }}" class="gallery-lightbox mfp-hide">
				<div class="thumb-gallery">
					<div class="owl-carousel owl-theme manual thumb-gallery-detail"
						id="thumbGalleryDetail{{ $index + 1 }}">
						<div ng-repeat="img in gallery.galleryImages">
							<span class="img-thumbnail d-block"> <img alt=""
								ng-src="<%=request.getContextPath()%>/resources/front/images/gallery/{{ img.image }}" class="img-fluid">
							</span>
						</div>
					</div>

					<!-- Thumbnails -->
					<div
						class="owl-carousel owl-theme manual thumb-gallery-thumbs gallery-thumbs show-thumbs mt"
						id="thumbGalleryThumbs{{ $index + 1 }}">
						<div ng-repeat="img in gallery.galleryImages	">
							<span class="img-thumbnail d-block cur-pointer"> <img
								alt="" ng-src="<%=request.getContextPath()%>/resources/front/images/gallery/{{ img.image }}" class="img-fluid">
							</span>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- Gallery Preview Section -->
		<section
			class="section bg-transparent border-0 pb-0 mb-0 p-relative overflow-hidden"
			id="photos">
			<div class="container pt-2 pb-5 mb-3">
				<div class="row justify-content-center">
					<div class="col-lg-9 text-center">
						<p class="text-3-5 font-weight-light appear-animation"
							data-appear-animation="fadeInUpShorterPlus"
							data-appear-animation-delay="400">Many festivals are being
							celebrated at Shree Kubereshwar Mahadev. Here are some of the
							glimpses of such celenrations like Amas, Maha Shivrati, Palkhi
							Yatra, Havan and many more.</p>
					</div>
				</div>
			</div>
		</section>

		<section
			class="section bg-transparent border-0 pb-0 mb-0 p-relative overflow-hidden"
			style="padding-top: 0px !important; margin-top: 0px !important"
			id="photos">
			<div class="container pt-2 pb-5 mb-3">
				<div class="row pt-3 appear-animation"
					data-appear-animation="fadeInUpShorterPlus"
					data-appear-animation-delay="600">

					<!-- 	<div class="col-md-6 mb-4 mb-lg-0"> -->
					<div 
						ng-repeat="gallery in getAllActiveGallery" ng-class="classList[$index % classList.length]">
						<a ng-attr-href="#ourHistoryLightbox{{ $index + 1 }}" ng-click="openPopup($index + 1)"> <span
							class="thumb-info custom-thumb-info-style-1 thumb-info-no-borders thumb-info-no-borders-rounded">
								<span class="thumb-info-wrapper"> 
									<img
									ng-src="<%=request.getContextPath()%>/resources/front/images/gallery/{{ gallery.galleryImages[0].image }}" alt="" class="img-fluid img-thumbnail" style="max-height: 350px; object-fit: cover;">
									<span class="thumb-info-action"> <span
										class="thumb-info-action-icon border-radius-0"><i
											class="fas fa-plus"></i></span>
								</span>
							</span>
						</span>
						</a>
						<p
							class="d-block positive-ls-3 text-uppercase text-2 pt-3 mb-0 line-height-4">{{
							gallery.albumTitle }}, {{ gallery.albumDate }}</p>
						<p
							class="d-block positive-ls-3 text-uppercase text-1 mb-0 opacity-5">{{
							gallery.galleryImages.length }} Photos</p>
					</div>

				</div>
			</div>
		</section>
	</div>

	<!-- Photos ends here -->

	<%@include file="footer.jsp"%>

	<!-- Vendor -->
	<script src="resources/front/vendor/plugins/js/plugins.min.js"></script>
	<script
		src="resources/front/vendor/jquery.countdown/jquery.countdown.min.js"></script>

	<!-- Theme Base, Components and Settings -->
	<script src="resources/front/js/theme.js"></script>


	<!-- Revolution Slider Scripts -->
	<script
		src="resources/front/vendor/rs-plugin/js/jquery.themepunch.tools.min.js"></script>
	<script
		src="resources/front/vendor/rs-plugin/js/jquery.themepunch.revolution.min.js"></script>

	<!-- Current Page Vendor and Views -->
	<script src="resources/front/js/views/view.contact.js"></script>

	<!-- Theme Custom -->
	<script src="resources/front/js/custom.js"></script>

	<!-- Theme Initialization Files -->
	<script src="resources/front/js/theme.init.js"></script>

	<script src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY"></script>
</body>
</html>