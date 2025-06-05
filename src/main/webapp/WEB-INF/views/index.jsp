<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html ng-app="kuberbhandari">
<head>
<!-- Basic -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Kuber Bhandari - Shree Kubereshwar Mahadev, Karnali,
	Dist. Vadodara, Gujarat, India</title>

<meta name="keywords"
	content="Kuber Bhandari, Kuber, God's Treasurer, God of Wealth, Shree Kubereshwar Mahadev, Shree Kuber Bhandari, Karnali, Shree Someshwwar Mahadev" />
<meta name="description"
	content="Shree Kubereshwar Mahadev popularly known as Kuber Bhandari on the bank of holy river Narmada, Shree Kuber Bhandari, Karnali, Shree Someshwwar Mahadev">
<meta name="author" content="www.AstarTechnologies.net">
<meta property="og:image"
	content="https://shreekuberbhandarikarnali.org/resources/front/img/logos/logo-ShreeKubereshwarMahadev-3.png">

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
	href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700%7CPlayfair+Display:400,700,900&display=swap"
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

<!-- Demo CSS -->
<link rel="stylesheet"
	href="resources/front/css/demos/demo-startup-agency.css">

<!-- Skin CSS -->
<link id="skinCSS" rel="stylesheet"
	href="resources/front/css/skins/skin-startup-agency.css">

<!-- Theme Custom CSS -->
<link rel="stylesheet" href="resources/front/css/custom.css">

<!-- Head Libs -->
<script src="resources/front/vendor/modernizr/modernizr.min.js"></script>
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
		} else if (str1 == str2) {
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

<!-- AOS for scroll animations -->
<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>


<style>
@media only screen and (max-width: 600px) {
	section.rsphght {
		height: 242px !important;
	}
	section.rspsec {
		padding: 59px 0px 750px 28px !important;
	}
	.modal-content {
		width: 100% !important;
	}
}

body {
	margin: 0;
	padding: 0;
}

.hvrbck:hover {
	background-color: #fdbf14ee !important;
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

.hvrbckclr:hover {
	background-color: #FD7E14 !important;
}

.modal {
	display: none;
	position: fixed;
	z-index: 100;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	overflow: auto;
	background-color: rgba(0, 0, 0, 0.4);
}

.modal-content {
	background-color: #fefefe;
	margin: 15% auto;
	padding: 20px;
	border: 1px solid #888;
	width: 65%;
}

.close {
	color: #aaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: black;
	text-decoration: none;
	cursor: pointer;
}

.title {
	font-size: 33px;
	font-weight: bold;
	margin-bottom: 22px;
	margin-top: 71px;
	text-align: center;
	color: black;
}

.image-gallery {
	display: flex;
	justify-content: center;
	/*  flex-wrap: wrap;*/
	gap: 15px;
}

.image-gallery img {
	width: 275px;
	height: 615px;
	object-fit: cover;
	/* border-radius: 10px; */
	box-shadow: 2px 2px 10px rgba(0, 0, 0, 0.3);
}

.slider-wrapper {
	display: flex;
	align-items: center;
	position: relative;
}

.slider {
	display: flex;
	transition: transform 0.5s ease-in-out;
	width: max-content;
}

.slider img {
	width: 275px;
	height: 615px;
	object-fit: cover;
	margin: 0 5px;
	/* border-radius: 10px; */
}

.btn1 {
	position: absolute;
	top: 50%;
	transform: translateY(-50%);
	color: white;
	border: none;
	padding: 10px 15px;
	cursor: pointer;
	font-size: 18px;
	border-radius: 5px;
	z-index: 10;
}

.btn-left {
	left: 0;
}

.btn-right {
	right: 0;
}

.container1 {
	position: relative;
	width: 1140px; /* 285px * 4 = 1140 */
	margin: auto;
	overflow: hidden;
}

.title {
	font-size: 33px;
	font-weight: bold;
	margin-bottom: 22px;
	margin-top: 71px;
	text-align: center;
	color: black;
}
/*Seva*/
.seva-section {
	padding: 60px 20px;
	background-color: #fff;
	text-align: center;
}

.container2 {
	max-width: 1200px;
	margin: auto;
}

.section-title {
	font-size: 18px;
	color: #8c8c8c;
	text-transform: uppercase;
	letter-spacing: 1px;
	margin-bottom: 10px;
}

.sub-title {
	font-size: 32px;
	font-weight: bold;
	margin-bottom: 10px;
}

.section-desc {
	font-size: 16px;
	color: #666;
	margin-bottom: 40px;
}

.cards {
	display: flex;
	justify-content: space-between;
	gap: 20px;
	flex-wrap: nowrap; /* prevent wrapping */
}

.card1 {
	background-color: #fff;
	padding: 25px 20px;
	border-radius: 10px;
	box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
	width: 32%;
	transition: transform 0.3s;
}

.card1:hover {
	transform: translateY(-5px);
}

.card1 h4 {
	font-size: 22px;
	font-weight: bold;
	margin-bottom: 15px;
}

.card1 p {
	font-size: 15px;
	color: #444;
	line-height: 1.6;
}

.card1 a {
	color: #007bff;
	text-decoration: none;
	font-weight: 500;
}

.fade-in {
	opacity: 0;
	animation: fadeInEffect 1s forwards;
}

@
keyframes fadeInEffect {to { opacity:1;
	
}

}
.delay-1 {
	animation-delay: 0.5s;
}

.delay-2 {
	animation-delay: 1s;
}

.delay-3 {
	animation-delay: 1.5s;
}

.delay-4 {
	animation-delay: 2s;
}
/**/
.festival-card {
	background: linear-gradient(135deg, #fdfbfb 0%, #ebedee 100%);
	border-radius: 20px;
	box-shadow: 0 6px 20px rgba(0, 0, 0, 0.1);
	transition: transform 0.3s ease, box-shadow 0.3s ease;
	cursor: pointer;
}

.festival-card:hover {
	transform: translateY(-6px);
	box-shadow: 0 12px 28px rgba(0, 0, 0, 0.15);
}

.festival-name {
	font-size: 1.8rem;
	font-weight: 700;
	color: #2c3e50;
	text-transform: capitalize;
	border-bottom: 2px solid #3498db;
	display: inline-block;
	padding-bottom: 6px;
}

.festival-info {
	font-size: 1.2rem;
	color: #555;
	min-height: 30px;
}

.rotating-text {
	display: inline-block;
	animation: fadeInUp 0.6s ease-in-out;
	font-weight: 600;
	/* color: #16a085; */
}

@
keyframes fadeInUp {from { opacity:0;
	transform: translateY(10px);
}

to {
	opacity: 1;
	transform: translateY(0);
}

}
@media ( max-width : 767px) {
	.festival-name {
		font-size: 1.4rem;
	}
	.festival-info {
		font-size: 1rem;
	}
}
/**/
.section-title {
	text-align: center;
	font-size: 2.5em;
	font-weight: 700;
	margin: 40px 0 30px;
	color: #212121;
}

.card-container {
	display: flex;
	flex-wrap: wrap;
	justify-content: center;
	gap: 30px;
	padding: 0 20px 60px;
}

.card {
	background: #fff;
	width: 230px;
	padding: 25px 20px;
	text-align: center;
	border-radius: 20px;
	box-shadow: 0 10px 25px rgba(0, 0, 0, 0.15);
	transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.card:hover {
	transform: translateY(-8px);
	box-shadow: 0 15px 30px rgba(0, 0, 0, 0.2);
}

.card img {
	width: 70px;
	height: 70px;
	margin-bottom: 20px;
}

.card h3 {
	margin: 10px 0 8px;
	font-size: 1.3em;
	color: #1e1e1e;
	font-weight: 700;
	letter-spacing: 1px;
}

.card p {
	font-size: 1.1em;
	margin: 0;
	color: #666;
}

@media ( max-width : 600px) {
	.card {
		width: 90%;
	}
}
</style>
<!-- Google tag (gtag.js) -->
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
<script type="text/javascript">
	function googleTranslateElementInit() {
		new google.translate.TranslateElement({
			pageLanguage : 'en',
			includedLanguages : 'en,hi,gu,mr',
			layout : google.translate.TranslateElement.InlineLayout.SIMPLE
		}, 'google_translate_element');
	}
</script>
<script type="text/javascript"
	src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>
<!-- JavaScript to Handle Language Change -->
<script>
	// Function to handle language change
	function handleLanguageChange(event) {
		// Store selected language preference in local storage
		const selectedLanguage = event.target.value;
		localStorage.setItem('preferredLanguage', selectedLanguage);
	}
	// Function to apply language preference
	function applyLanguagePreference() {
		// Retrieve stored language preference from local storage
		const preferredLanguage = localStorage.getItem('preferredLanguage')
				|| 'en';
		// Apply language preference to Google Translate plugin
		const googleTranslateElement = document.querySelector('.goog-te-combo');
		if (googleTranslateElement) {
			googleTranslateElement.value = preferredLanguage;
			googleTranslateElement.dispatchEvent(new Event('change'));
		}
	}
	// Listen for language change event
	document.addEventListener('googleTranslateChange', handleLanguageChange);
	// Apply language preference on page load
	applyLanguagePreference();
</script>
</head>
<body data-plugin-scroll-spy data-plugin-options="{'target': '#header'}"
	onload="">

	<div class="body">
		<header id="header" class="header-effect-shrink header-transparent"
			data-plugin-options="{'stickyEnabled': true, 'stickyEffect': 'shrink', 'stickyEnableOnBoxed': true, 'stickyEnableOnMobile': false, 'stickyChangeLogo': true, 'stickyStartAt': 30, 'stickyHeaderContainerHeight': 70}">
			<div class="header-body">
				<div class="header-container container"
					style="max-width: 1245px !important;">
					<div class="header-row">
						<div class="header-column">
							<div class="header-row">
								<div class="header-logo">
									<a href="<%=request.getContextPath()%>/"> <img
										src="resources/front/img/logos/logo-ShreeKubereshwarMahadev-3.png"
										class="img-fluid" width="210" alt="" />
									</a>
								</div>
							</div>
						</div>
						<div class="header-column justify-content-end">
							<div class="header-row">
								<div class="header-nav pt-1">
									<div
										class="header-nav-main header-nav-main-effect-1 header-nav-main-sub-effect-1">
										<nav id="mainNavCollapse"  class="collapse">
											<ul class="nav nav-pills" id="mainNav">
												<li class="dropdown"><a
													class="dropdown-item dropdown-toggle  "
													href="<%=request.getContextPath()%>/kuber-bhandari">
														Kuber Bhandari </a>
													<ul class="dropdown-menu" style="padding: 0px !important">
														<li style="background-color: #FD7E14"><a
															class="dropdown-item hvrbck" style="color: white"
															href="<%=request.getContextPath()%>/kuber-bhandari">
																Kuber Bhandari History </a></li>
														<li style="background-color: #FD7E14"><a
															class="dropdown-item hvrbck" style="color: white"
															href="<%=request.getContextPath()%>/kuber-bhandari-campus">
																Kuber Bhandari Campus</a></li>
														<li style="background-color: #FD7E14;"><a
															class="dropdown-item hvrbck" style="color: white"
															href="<%=request.getContextPath()%>/pujaris"> The
																Pujaris </a></li>
														<li style="background-color: #FD7E14;"><a
															class="dropdown-item hvrbck" style="color: white"
															href="<%=request.getContextPath()%>/trust"> The
																Trust </a></li>
													</ul></li>
												<li><a class="dropdown-item hvrbckclr"
													href="<%=request.getContextPath()%>/darshan"> Darshan </a></li>
												<li><a class="dropdown-item hvrbckclr"
													href="<%=request.getContextPath()%>/prabhu-seva">Prabhu
														Seva </a></li>
												<li><a class="dropdown-item hvrbckclr"
													href="<%=request.getContextPath()%>/events"> Events </a></li>
												<li><a class="dropdown-item hvrbckclr"
													href="<%=request.getContextPath()%>/important-dates">
														Dates </a></li>
												<li><a class="dropdown-item hvrbckclr"
													href="<%=request.getContextPath()%>/gallery"> Gallery </a></li>
												<li><a class="dropdown-item hvrbckclr"
													href="<%=request.getContextPath()%>/"> Jan Seva </a></li>
												<li><a class="dropdown-item hvrbckclr"
													href="<%=request.getContextPath()%>/sampark"> Contact
														Us </a></li>
											</ul>
										</nav>
									</div>

									<!-- Social & Other Icons -->
									<div class="d-flex align-items-center" ng-controller="cartCtrl">
										<%
										String username = (String) session.getAttribute("userName");
										%>
										<!-- If user is logged in, display their name and dropdown menu -->
										<%
										if (username != null) {
										%>
										<div class="dropdown">
											<a href="#" class="d-flex align-items-center"
												id="userDropdown" role="button" data-bs-toggle="dropdown"
												aria-expanded="false"
												style="color: #444; text-decoration: none;"> <i
												class="fas fa-user me-2"
												style="font-size: 1.5rem; transition: all 0.3s ease;"></i> <span><%=username%></span>
												<!-- Display username -->
											</a>

											<ul class="dropdown-menu" aria-labelledby="userDropdown">
												<li><a class="dropdown-item"
													href="<%=request.getContextPath()%>/userChangePassword">Change
														Password</a></li>
												<li><a class="dropdown-item"
													href="<%=request.getContextPath()%>/manage-address">Manage
														Address</a></li>
												<li><a class="dropdown-item"
													href="<%=request.getContextPath()%>/order-history">Order
														History</a></li>
												<li><a class="dropdown-item"
													href="<%=request.getContextPath()%>/logout">Logout</a></li>
											</ul>
										</div>
										<%
										} else {
										%>
										<!-- If user is not logged in, show login link -->
										<a href="<%=request.getContextPath()%>/login-register"
											class="d-flex align-items-center ms-3"
											style="color: #444; text-decoration: none;"> <i
											class="fas fa-user me-2"
											style="font-size: 1.5rem; transition: all 0.3s ease;"></i>
										</a>
										<%
										}
										%>

										<!-- Booking Cart Link -->
										<%-- <a href="<%=request.getContextPath()%>/cart" class="d-flex align-items-center ms-3"
											style="color: #444;"> <i
											class="fas fa-shopping-cart me-2"
											style="font-size: 1.5rem; transition: all 0.3s ease;"></i>
										</a> --%>
										<%
										Integer CartLength = (Integer) session.getAttribute("CartLength");
										%>
										<a href="<%=request.getContextPath()%>/cart"
											class="ms-3 position-relative text-dark"> <i
											class="fas fa-shopping-cart fa-lg"></i> <span
											class="badge bg-danger rounded-circle position-absolute translate-middle p-1"
											style="top: 0; font-size: 0.75rem; min-width: 18px; height: 18px;">
												{{cartCount}} </span>
										</a>
									</div>
								</div>
								<button class="btn header-btn-collapse-nav"
									data-bs-toggle="collapse" data-bs-target="#mainNavCollapse">
									<i class="fas fa-bars"></i>
								</button>
							</div>
						</div>
					</div>
				</div>
			</div>
	</div>
	</header>
	<div role="main" class="main">
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
		<section id="home"
			class="section section-with-shape-divider custom-bg-color-1 border-0 pt-0 m-0 rsphght"
			style="height: 680px;">
			<video autoplay muted loop id="myVideo"
				style="width: -webkit-fill-available;">
				<source src="resources/front/video/Video-1-KubereshwarMahadev.mp4"
					type="video/mp4">
			</video>
			<div class="shape-divider shape-divider-bottom"
				style="height: 243px;">
				<svg version="1.1" xmlns="http://www.w3.org/2000/svg" x="0px"
					y="0px" viewBox="0 0 2000 245" preserveAspectRatio="xMinYMin">
				<path fill="#FFF" opacity="0.5"
						d="M2028.47,246.15v-39.09C1945.6,199.68,1869.96,195.8,1803,194c-71.99-1.93-137.53-4.37-225,1
									  c-88.04,5.4-120.19,13.36-233,19c-55.14,2.76-102.19,5-165,3c-37.5-1.2-102.55-4.6-200-19c-89.42-13.21-145.61-26.73-276-57
									  C520.19,98.33,428.29,76.99,402,72C243.75,41.93,118.41,28.67,37,22c-26.77-2.19-49.49-3.73-66.33-4.77v229.03h2057.82
									  C2028.48,246.22,2028.47,246.19,2028.47,246.15z" />
				<path fill="#FFF"
						d="M1816,212c-58.78-4.11-116.63-8.07-195-9c-43.43-0.51-105.81-1.13-187,4c-33.73,2.13-29.27,2.64-127,10
									  c-86.52,6.52-110.13,7.64-137,8c-11.31,0.15-53.81,0.58-110-3c-54.49-3.47-108.08-9.83-185-23c-69.21-11.85-114.89-21.96-202-41
									  c-262.93-57.46-291.75-62.62-318-67C229.24,70,155.97,65.58,121,64C60.05,61.24,8.67,62.27-28.77,63.95v187.41H2028V232
								  C1943.49,221.98,1871.42,215.88,1816,212z" />
			  </svg>
			</div>
			<div class="spacer mb-5 pb-5 pb-xl-0 mb-xl-0"></div>
		</section>
		<div class="container pb-xl-5">
			<div id="aboutus" class="row align-items-center pt-4 pb-lg-5 my-5"
				data-spy-offset="15">
				<div class="col-lg-6 pb-sm-5 pb-lg-0 mb-5 mb-lg-0">
					<div class="custom-svg-wrapper-1 px-5">
						<svg version="1.1" xmlns="http://www.w3.org/2000/svg"
							xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
							viewBox="0 0 687 673" data-plugin-float-element-svg="true">
					<g class="d-none d-md-block" data-plugin-float-element
								data-plugin-options="{'startPos': 'top', 'speed': 0.2, 'isInsideSVG': true, 'transition': true, 'transitionDuration': 2000}">
					  <circle class="custom-svg-fill-color-secondary" fill="#4F4BFC"
								cx="589" cy="216" r="27" />
					  <circle fill="#FFF" fill="#FFFFFF" cx="588.5" cy="216.5" r="24.5" />
					</g>
					<g class="d-none d-lg-block" data-plugin-float-element
								data-plugin-options="{'startPos': 'bottom', 'speed': 0.3, 'isInsideSVG': true, 'transition': true, 'transitionDuration': 2000}">
					  <circle class="custom-svg-fill-color-secondary" fill="#4F4BFC"
								cx="128" cy="609" r="17" />
					  <circle fill="#FFF" cx="127.69" cy="609.31" r="15.43" />
					</g>
					<g opacity="0.7" data-plugin-float-element
								data-plugin-options="{'startPos': 'bottom', 'speed': 0.3, 'isInsideSVG': true, 'transition': true, 'transitionDuration': 2000}">
					  <circle class="custom-svg-fill-color-primary" fill="#0088CC"
								cx="148" cy="64.5" r="14.5" />
					  <circle fill="#FFF" cx="148.27" cy="64.77" r="13.16" />
					</g>
					<linearGradient id="SVGID_1_" class="custom-svg-linear-gradient"
								gradientUnits="userSpaceOnUse" x1="507.8588" y1="461.6467"
								x2="171.5928" y2="125.3807">
					  <stop offset="0" style="stop-color:#FD7E14" />
					  <stop offset="1" style="stop-color:#FFC107" />
					</linearGradient>
					<g class="appear-animation" data-appear-animation="fadeInUpShorter"
								data-appear-animation-delay="700">
					  <g data-plugin-float-element
								data-plugin-options="{'startPos': 'top', 'speed': 0.2, 'isInsideSVG': true, 'transition': true, 'transitionDuration': 2000}">
						<path fill="url(#SVGID_1_)" opacity="0.2"
								d="M252,64c26.24-11.75,48.83-15.22,67-18c14.48-2.22,21.72-3.33,32-3c9.04,0.29,37.99,1.59,66,21
													  c9.9,6.86,16.05,13.46,24,22c4.57,4.91,15.33,16.93,30,41c5.64,9.25,18.4,31.03,31,62c12.24,30.1,18.27,53.97,22,69
													  c7.74,31.18,12.66,51,13,79c0.36,29.73-4.65,52.49-7,62c-4.51,18.26-9.8,39.64-25,62c-21.92,32.23-51.17,46.98-77,60
													  c-16.86,8.5-34.6,17.24-60,20c-22.47,2.44-40.04-0.98-50-3c-10.59-2.15-35.39-8.17-62-25c-30.2-19.1-46.48-41.85-62-64
													  c-33.11-47.26-45.37-92.3-50-113c-8.73-39.06-8.09-71.09-7-88c1.52-23.61,4.05-57.78,23-96c5.29-10.68,14.58-29.02,33-48
													  C215.85,80.47,239.52,69.59,252,64z" />
					  </g>
					</g>
					<linearGradient id="SVGID_2_" class="custom-svg-linear-gradient"
								gradientUnits="userSpaceOnUse" x1="492.229" y1="463.2329"
								x2="145.1594" y2="116.1633">
					  <stop offset="0" style="stop-color:#FD7E14" />
					  <stop offset="1" style="stop-color:#FFC107" />
					</linearGradient>
					<g class="appear-animation" data-appear-animation="fadeInUpShorter"
								data-appear-animation-delay="900">
					  <g data-plugin-float-element
								data-plugin-options="{'startPos': 'top', 'speed': 0.3, 'isInsideSVG': true, 'transition': true, 'transitionDuration': 2000}">
						<path fill="url(#SVGID_2_)" opacity="0.5"
								d="M111,154c25.18-37.35,61.01-52.15,80-60c33.83-13.98,62.35-15.1,85-16c49.05-1.94,87.48,8.19,106,14
													  c26.65,8.35,77.28,24.9,122,72c13.61,14.34,44.32,47.47,58,100c6.27,24.07,5.51,48.05,4,96c-0.2,6.4-0.68,16.99-6,29
													  c-5.8,13.09-14.47,21.33-21,27c-37.42,32.48-75,48-75,48c-50.83,20.99-94.45,24.86-121,27c-40.5,3.27-78.77,5.96-122-10
													  c-30.74-11.35-47.68-26.12-53-31c-4.3-3.94-13.34-12.73-31-40c-20.04-30.95-30.38-46.93-39-71c-14.81-41.38-14.11-77.61-13-94
													  C86.73,219.43,88.95,186.71,111,154z" />
					  </g>
					</g>
					<g data-plugin-float-element
								data-plugin-options="{'startPos': 'bottom', 'speed': 0.3, 'isInsideSVG': true, 'transition': true, 'transitionDuration': 2000}">
					  <circle class="custom-svg-fill-color-secondary" fill="#5349FF"
								cx="523" cy="103" r="6" />
					</g>
					<g data-plugin-float-element
								data-plugin-options="{'startPos': 'top', 'speed': 0.2, 'isInsideSVG': true, 'transition': true, 'transitionDuration': 2000}">
					  <circle fill="#DFDFDB" cx="195.5" cy="519.5" r="11.5" />
					</g>
				  </svg>
						<div data-plugin-float-element
							data-plugin-options="{'startPos': 'top', 'speed': 0.1, 'isInsideSVG': true, 'transition': true, 'transitionDuration': 2000}">
							<img src="resources/front/img/KubereshwarMahadev-Shikhar.jpg"
								class="img-fluid position-relative z-index-1 appear-animation"
								data-appear-animation="fadeInUpShorter"
								data-appear-animation-delay="1100" alt="" />
						</div>
					</div>
				</div>
				<div class="col-lg-6">
					<span
						class="text-color-grey positive-ls-2 font-weight-medium custom-font-size-2 appear-animation"
						data-appear-animation="fadeInUpShorter"
						data-appear-animation-delay="200">Shree Kuber Mantra</span>
					<h2 class="font-weight-normal text-10 appear-animation"
						data-appear-animation="fadeInUpShorter"
						data-appear-animation-delay="400">Shree Kuber Bhandari,
						Karnali</h2>
					<p
						class="font-weight-bold custom-font-size-1 line-height-6 mb-4 pb-2 pe-lg-5 appear-animation"
						data-appear-animation="fadeInUpShorter"
						data-appear-animation-delay="600">
						ॐ यक्षाय कुबेराय वैश्रवणाय धनधान्याधिपतये, <br>
						धनधान्यसमृद्धिं मे देहि दापय स्वाहा॥
					</p>
					<p
						class="font-weight-bold custom-font-size-2 pb-2 mb-4 appear-animation"
						data-appear-animation="fadeInUpShorter"
						data-appear-animation-delay="800">“હું યક્ષોના રાજા અને
						વિશ્રવાના પુત્રનું ધ્યાન ધરું છું, જે વિશ્વની તમામ સંપત્તિના માલિક
						છે, મને સંપત્તિ અને સફળતાનાં આશીર્વાદ આપવા માટે”</p>
					<p
						class="font-weight-bold custom-font-size-2 font-weight-light pb-2 mb-4 appear-animation"
						data-appear-animation="fadeInUpShorter"
						data-appear-animation-delay="800">“मैं यक्षों के राजा और
						विश्रवा के पुत्र का ध्यान करता हूं, जो दुनिया की सारी संपत्ति के
						मालिक हैं, मुझे धन और सफलता का आशीर्वाद देने के लिए”</p>
					<p
						class="font-weight-bold custom-font-size-2 font-weight-light pb-2 mb-4 appear-animation"
						data-appear-animation="fadeInUpShorter"
						data-appear-animation-delay="800">“I meditate upon the king of
						Yakshas and son of Vishrava, who owns all the riches of the world,
						to bless me with wealth and success”</p>
					<a href="<%=request.getContextPath()%>/Kuber-bhandari" data-hash
						data-hash-offset="0" data-hash-offset-lg="70"
						class="btn btn-gradient text-3 font-weight-bold px-5 py-3 appear-animation"
						data-appear-animation="fadeInUpShorter"
						data-appear-animation-delay="1000">Read More</a>
					<audio controls autoplay loop>
						<source
							src="resources/front/music/Mantra-KubereshwarMahadev-Karnali.mp3"
							hidden="false">
						<p>If you are reading this, it is because your browser does
							not support the audio element.</p>
					</audio>
				</div>
			</div>
		</div>
		<!-- ************************************************DAILY DARSHAN SECTION ************************************************************* -->

		<section id="team" style="height: 686px;"
			class="section section-with-shape-divider custom-bg-color-1 border-0  rspsec">
			<div class="shape-divider" style="height: 385px;">
				<svg version="1.1" xmlns="http://www.w3.org/2000/svg"
					xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
					viewBox="0 0 2000 385" preserveAspectRatio="xMinYMin">
				<circle class="custom-svg-fill-color-secondary" fill="#9DA3F6"
						opacity="0.2" cx="57" cy="181" r="161" />
				<circle class="custom-svg-fill-color-secondary" fill="#5349FF"
						opacity="0.3" cx="75.5" cy="158.5" r="169.5" />
				<path fill="#FFFFFF" opacity="0.5"
						d="M-35,226c17.66,1.2,43.63,2.44,75,2c83.48-1.18,144.86-13.49,188-22c224.54-44.3,165.12-27.27,310-59
									  c133.16-29.16,128.14-31.45,223-52c206.26-44.68,317.22-68.72,460-68c97.61,0.49,73.58,11.86,293,25c164.22,9.83,250.54,7.83,279,7
									  c102.76-2.99,187.96-12.01,248-20c0-24.69,0-49.37,0-74.06c-694.67,0-1389.33,0-2084,0C-40.33,51.96-37.67,138.98-35,226z" />
				<path fill="#FFFFFF"
						d="M-37,185c17.21,1.44,42.06,3.17,72,4c81.96,2.26,170.2-3.07,325-30c54.07-9.4,98.99-18.41,221-45
									  c255.1-55.59,223.26-53.86,287-64c57.13-9.09,228.37-36.32,423-18c36.66,3.45,96.62,10.63,187,14c16.19,0.6,75.77,2.66,156,1
									  c90.18-1.87,157.94-7.44,248-15c46.95-3.94,99.2-8.84,156-15c0-12.82,0-25.65,0-38.47c-692.67,0-1385.33,0-2078,0
									  C-39,47.35-38,116.18-37,185z" />
			  </svg>
			</div>
			<!-- Dates Starts -->
			<div
				class="container position-relative z-index-3 pt-md-5 pb-1 pb-sm-5 my-5"
				style="height: 788px;">

				<!-- Section Heading -->
				<span
					class="text-color-grey positive-ls-2 font-weight-medium custom-font-size-2 d-block mb-1 appear-animation"
					data-appear-animation="fadeInUpShorter"
					data-appear-animation-delay="200" style="text-align: center;">
					Online Presence </span>

				<h2 class="font-weight-bold text-7 mb-3 appear-animation"
					data-appear-animation="fadeInUpShorter"
					data-appear-animation-delay="400" style="text-align: center;">
					Upcoming Shivratri & Amas</h2>

				<div class="card-container" ng-controller="DateController"
					style="margin-top: 37px">
					<div class="card"
						ng-repeat="date in getAllActiveImportantDates | limitTo:4">
						<!-- <img src="https://cdn-icons-png.flaticon.com/512/2503/2503319.png" alt="Shiv Icon"> -->
						<h3 style="text-decoration: underline;">{{date.festivalName}}</h3>
						<p>{{date.englishDay}}</p>
						<p style="font-weight: bold; font-size: 18px;">{{date.englishDate|
							dateFormat1}}</p>
						<p>{{date.hinduMonthName}}</p>
						<p>{{date.pakshName}} {{date.tithiNumber}}</p>
						<p>{{date.tithiName}}</p>
					</div>
				</div>

				<!-- "All Important Dates" Button -->
				<center>
					<div>
						<a href="<%=request.getContextPath()%>/important-dates" data-hash
							data-hash-offset="0" data-hash-offset-lg="70"
							class="btn btn-gradient text-3 font-weight-bold px-5 py-3 mt-5 appear-animation"
							data-appear-animation="fadeInUpShorter"
							data-appear-animation-delay="1000" style="width: 237px;"> All
							Important Dates </a>
					</div>
				</center>
			</div>
			<!-- Dates Ends -->
	</div>
	<div class="shape-divider shape-divider-bottom z-index-0 "
		style="height: 100px;">
		<svg version="1.1" xmlns="http://www.w3.org/2000/svg"
			xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
			viewBox="0 0 2000 260" preserveAspectRatio="xMinYMin">
			<!-- <circle class="custom-svg-fill-color-secondary" fill="#504BFD" opacity="0.2" cx="2007.7" cy="208.3" r="140.7"/><circle class="custom-svg-fill-color-secondary" fill="#5349FF" opacity="0.2" cx="1975.78" cy="247.18" r="148.13"/><path fill="#FFFFFF" d="M-42,42c21.03-0.71,49.03-1.3,82-1c10.06,0.09,73,0.78,147,7c95.4,8.01,191.25,23.7,278,40 c188.62,35.43,247.14,57.2,353,79c102.08,21.02,252.74,44.36,445,46c0,22.68,0,45.35,0,68.03c-433.33,0-866.67,0-1300,0 C-38.67,201.35-40.33,121.68-42,42z"/> -->
			<path class="custom-svg-fill-color-secondary " fill="#504BFD"
				d="M-39,233c18.45-5.57,45.76-13.68,79-23c65.89-18.48,100.28-28.12,140-36c64.67-12.83,115.09-15.35,151-17
									  c72.37-3.33,126.81,0.97,200,7c21.78,1.79,35.05,3.15,147,16c185.79,21.33,205.66,24.08,252,27c85.5,5.38,150.46,4.35,168,4
									  c48.7-0.96,73.47-3.33,246-19c174.43-15.84,185.89-16.75,211-18c76.46-3.81,133.48-3.48,217-3c83.26,0.48,125.58,2.59,166,6
									  c37.33,3.15,68.3,7,90,10c0,28.67,0,57.35,0,86.02c-688.33,0-1376.67,0-2065,0C-37.67,259.68-38.33,246.34-39,233z" />
		  </svg>
	</div>
	</section>
	</div>
	<!-- new section starts -->
	<div class="container mt-4 mb-5 mt-5"
		ng-controller="FrontDarshanController"
		ng-init="getTodayActiveDailyDarshan()">

		<div id="pricing" class="row justify-content-center">
			<div class="col-lg-10 text-center">
				<span
					class="text-color-grey positive-ls-2 font-weight-medium custom-font-size-2 d-block appear-animation"
					data-appear-animation="fadeInUpShorter"
					data-appear-animation-delay="200">online</span>
				<h2 class="font-weight-bold text-10 mb-4 appear-animation"
					data-appear-animation="fadeInUpShorter"
					data-appear-animation-delay="400">DAILY DARSHAN</h2>

				<!-- Move ng-repeat to a wrapper div -->
				<div ng-if="getTodayActiveDailyDarshan"
					ng-repeat="dailyDarshan in (getTodayActiveDailyDarshan | orderBy:'-dailyDarshanDate | dateFormat1' | limitTo:1)">
					<p>{{ dailyDarshan.dailyDarshanTitle }}, {{
						dailyDarshan.dailyDarshanDay }}, {{ dailyDarshan.dailyDarshanDate
						| dateFormat1 }}</p>

					<div class="container1" style="margin-left: -80px;">
						<div class="slider-wrapper">
							<button class="btn1 btn-left" ng-click="moveSlide($index, -1)"
								style="background: rgba(0, 0, 0, 0.5); color: white;">&#10094;</button>
							<!-- Previous Button -->
							<div class="slider" id="slider-{{$index}}">
								<img ng-repeat="image in dailyDarshan.dailyDarshanImages"
									ng-src="<%=request.getContextPath()%>/resources/front/img/DailyDarshan/{{image.dailyDarshanImages}}"
									alt="Darshan Image">
							</div>
							<button class="btn1 btn-right" ng-click="moveSlide($index, 1)"
								style="background: rgba(0, 0, 0, 0.5); color: white;">&#10095;</button>
							<!-- Next Button -->
						</div>
					</div>
					<!-- Daily Darshan Ends -->
				</div>
				<div ng-if="!getTodayActiveDailyDarshan" style="color: red;">
					Today's Daily Darshan is not available.</div>
			</div>
		</div>
		<div class="col-lg-12 text-center" style="margin-top: 31px;">
			<a href="<%=request.getContextPath()%>/darshan" data-hash
				data-hash-offset="0" data-hash-offset-lg="70"
				class="btn btn-gradient text-3 font-weight-bold px-5 py-3 appear-animation"
				data-appear-animation="fadeInUpShorter"
				data-appear-animation-delay="1000">All Daily Darshan Pictures</a>
		</div>
	</div>
	<!-- new section ends -->

	<div
		class="shape-divider shape-divider-bottom shape-divider-reverse-y z-index-0">
		<svg version="1.1" xmlns="http://www.w3.org/2000/svg"
			xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
			viewBox="0 0 2000 260" preserveAspectRatio="xMinYMin">
			<path fill="#FFFFFF"
				d="M-42,42c21.03-0.71,49.03-1.3,82-1c10.06,0.09,73,0.78,147,7c95.4,8.01,191.25,23.7,278,40
								  c188.62,35.43,247.14,57.2,353,79c102.08,21.02,252.74,44.36,445,46c0,22.68,0,45.35,0,68.03c-433.33,0-866.67,0-1300,0
								  C-38.67,201.35-40.33,121.68-42,42z" />
			<path fill="#fdca4b"
				d="M-39,233c18.45-5.57,45.76-13.68,79-23c65.89-18.48,100.28-28.12,140-36c64.67-12.83,115.09-15.35,151-17
								  c72.37-3.33,126.81,0.97,200,7c21.78,1.79,35.05,3.15,147,16c185.79,21.33,205.66,24.08,252,27c85.5,5.38,150.46,4.35,168,4
								  c48.7-0.96,73.47-3.33,246-19c174.43-15.84,185.89-16.75,211-18c76.46-3.81,133.48-3.48,217-3c83.26,0.48,125.58,2.59,166,6
								  c37.33,3.15,68.3,7,90,10c0,28.67,0,57.35,0,86.02c-688.33,0-1376.67,0-2065,0C-37.67,259.68-38.33,246.34-39,233z" />
		  </svg>
	</div>
	<section id="works"
		class="section section-with-shape-divider bg-secondary border-0 m-0">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-lg-10 text-center">
					<span
						class="d-block text-color-grey positive-ls-2 font-weight-normal custom-font-size-2 text-color-light opacity-6 mb-1">EVENTS</span>
					<h2 class="font-weight-bold text-color-light text-10 mb-4">FESTIVAL
						CELEBRATIONS</h2>
					<p
						class="custom-font-size-2 font-weight-light text-color-light mb-4 pb-3">Celebrations
						of Shivratri, Maha Shivratri, Palkhi Yatra, Diwali and more at
						Shree Kubereshwar Mahadev.</p>
				</div>
			</div>
		</div>
		<div class="container-fluid px-0 pb-5 mb-5">
			<div class="row">
				<div class="col">
					<div
						class="owl-carousel custom-carousel-backward-shape custom-dots-style-1 custom-dots-style-1-light"
						data-plugin-options="{'responsive': {'0': {'items': 1, 'stagePadding': 100}, '479': {'items': 1, 'stagePadding': 100}, '768': {'items': 3, 'stagePadding': 100}, '992': {'items': 3, 'stagePadding': 100}, '1200': {'items': 4}}, 'autoplay': true, 'autoplayTimeout': 5000, 'autoplayHoverPause': true, 'dots': true, 'nav': false, 'center': true, 'loop': true, 'margin': 25}">
						<div class="my-5">
							<a href="#">
								<div
									class="thumb-info thumb-info-hide-wrapper-bg custom-thumb-info-hover-1 box-shadow-4 rounded-0 my-3">
									<div class="thumb-info-wrapper rounded-0">
										<img
											src="resources/front/img/festivals/PalkhiYatra-15Nov24-1.jpg"
											class="img-fluid rounded-0"
											alt="Maha Shivratri 01 March 2022" />
									</div>
								</div>
							</a>
						</div>
						<div class="my-5">
							<a href="#">
								<div
									class="thumb-info thumb-info-hide-wrapper-bg custom-thumb-info-hover-1 box-shadow-4 rounded-0 my-3">
									<div class="thumb-info-wrapper rounded-0">
										<img
											src="resources/front/img/festivals/PalkhiYatra-15Nov24-2.jpg"
											class="img-fluid rounded-0"
											alt="Maha Shivratri 01 March 2022" />
									</div>
								</div>
							</a>
						</div>
						<div class="my-5">
							<a href="#">
								<div
									class="thumb-info thumb-info-hide-wrapper-bg custom-thumb-info-hover-1 box-shadow-4 rounded-0 my-3">
									<div class="thumb-info-wrapper rounded-0">
										<img
											src="resources/front/img/festivals/PalkhiYatra-15Nov24-3.jpg"
											class="img-fluid rounded-0"
											alt="Maha Shivratri 01 March 2022" />
									</div>
								</div>
							</a>
						</div>
						<div class="my-5">
							<a href="#">
								<div
									class="thumb-info thumb-info-hide-wrapper-bg custom-thumb-info-hover-1 box-shadow-4 rounded-0 my-3">
									<div class="thumb-info-wrapper rounded-0">
										<img
											src="resources/front/img/festivals/Dhan-Teras-2024-KuberBhandari-Karnali-1.jpg"
											class="img-fluid rounded-0"
											alt="Maha Shivratri 01 March 2022" />
									</div>
								</div>
							</a>
						</div>
						<div class="my-5">
							<a href="#">
								<div
									class="thumb-info thumb-info-hide-wrapper-bg custom-thumb-info-hover-1 box-shadow-4 rounded-0 my-3">
									<div class="thumb-info-wrapper rounded-0">
										<img
											src="resources/front/img/festivals/Dhan-Teras-2024-KuberBhandari-Karnali-2.jpg"
											class="img-fluid rounded-0"
											alt="Maha Shivratri 01 March 2022" />
									</div>
								</div>
							</a>
						</div>
						<div class="my-5">
							<a href="#">
								<div
									class="thumb-info thumb-info-hide-wrapper-bg custom-thumb-info-hover-1 box-shadow-4 rounded-0 my-3">
									<div class="thumb-info-wrapper rounded-0">
										<img
											src="resources/front/img/festivals/Dhan-Teras-2024-KuberBhandari-Karnali-3.jpg"
											class="img-fluid rounded-0"
											alt="Maha Shivratri 01 March 2022" />
									</div>
								</div>
							</a>
						</div>
						<div class="my-5">
							<a href="#">
								<div
									class="thumb-info thumb-info-hide-wrapper-bg custom-thumb-info-hover-1 box-shadow-4 rounded-0 my-3">
									<div class="thumb-info-wrapper rounded-0">
										<img
											src="resources/front/img/festivals/Amas-KubereshwarMahadev-11Jan24-3.jpg"
											class="img-fluid rounded-0"
											alt="Maha Shivratri 01 March 2022" />
									</div>
								</div>
							</a>
						</div>
						<div class="my-5">
							<a href="#">
								<div
									class="thumb-info thumb-info-hide-wrapper-bg custom-thumb-info-hover-1 box-shadow-4 rounded-0 my-3">
									<div class="thumb-info-wrapper rounded-0">
										<img
											src="resources/front/img/festivals/MahaShivratri-KubereshwarMahadev-01Mar22-22.jpg"
											class="img-fluid rounded-0"
											alt="Maha Shivratri 01 March 2022" />
									</div>
								</div>
							</a>
						</div>
						<div class="my-5">
							<a href="#">
								<div
									class="thumb-info thumb-info-hide-wrapper-bg custom-thumb-info-hover-1 box-shadow-4 rounded-0 my-3">
									<div class="thumb-info-wrapper rounded-0">
										<img
											src="resources/front/img/festivals/MahaShivratri-KubereshwarMahadev-01Mar22-1.jpg"
											class="img-fluid rounded-0" alt="Work 3" />
									</div>
								</div>
							</a>
						</div>
						<div class="my-5">
							<a href="#">
								<div
									class="thumb-info thumb-info-hide-wrapper-bg custom-thumb-info-hover-1 box-shadow-4 rounded-0 my-3">
									<div class="thumb-info-wrapper rounded-0">
										<img
											src="resources/front/img/festivals/Amas-KubereshwarMahadev-11Jan24-1.jpg"
											class="img-fluid rounded-0" alt="Work 4" />
									</div>
								</div>
							</a>
						</div>
						<div class="my-5">
							<a href="#">
								<div
									class="thumb-info thumb-info-hide-wrapper-bg custom-thumb-info-hover-1 box-shadow-4 rounded-0 my-3">
									<div class="thumb-info-wrapper rounded-0">
										<img
											src="resources/front/img/festivals/Amas-KubereshwarMahadev-11Jan24-2.jpg"
											class="img-fluid rounded-0" alt="Work 5" />
									</div>
								</div>
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="shape-divider shape-divider-bottom" style="height: 109px;">
			<svg version="1.1" xmlns="http://www.w3.org/2000/svg"
				xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
				viewBox="0 0 2000 109" preserveAspectRatio="xMinYMin">
			  <path fill="#FFFFFF"
					d="M-29,0c16.91,7.69,40.41,17.74,69,28c24.89,8.93,114.79,39.95,247,52c89.7,8.18,157.69,3.87,215,0
									  c81.39-5.5,81.96-11.49,233-29c82.16-9.52,140.49-16.18,220-20c40.62-1.95,100.38-4.7,178-2c45.11,1.57,62.48,3.8,212,18
									  c122.78,11.66,184.77,17.53,214,19c80.47,4.06,142.71,3.13,219,2c68.63-1.02,116.48,0.48,182-6c32.74-3.24,59.69-7.11,78-10
									  c0,24.39,0,48.78,0,73.17c-691.67,0-1383.33,0-2075,0C-34.33,83.45-31.67,41.72-29,0z" />
			</svg>
		</div>
	</section>
	<%-- 	<div class="container mt-4 mb-5" ng-controller="FrontSevaController">
		<div id="pricing" class="row justify-content-center">
			<div class="col-lg-10 text-center">
				<span
					class="text-color-grey positive-ls-2 font-weight-medium custom-font-size-2 d-block appear-animation"
					data-appear-animation="fadeInUpShorter"
					data-appear-animation-delay="200">Vidhi Seva Offerings</span>
				<h2 class="font-weight-bold text-10 mb-4 appear-animation"
					data-appear-animation="fadeInUpShorter"
					data-appear-animation-delay="400">Shree Kubereshwar Mahadev,
					Karnali</h2>
				<p
					class="custom-font-size-2 font-weight-light mb-4 pb-3 appear-animation"
					data-appear-animation="fadeInUpShorter"
					data-appear-animation-delay="600">Here is the list of vidhi,
					seva and offerings which can be made to Shree Kubereshwar Mahadev
					for various purposes.</p>
			</div>
		</div>
		<div class="custom-svg-wrapper-3">
			<svg version="1.1" xmlns="http://www.w3.org/2000/svg"
				xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
				viewBox="0 0 1677 357" data-plugin-float-element-svg="true">
			  <g data-plugin-float-element
					data-plugin-options="{'startPos': 'top', 'speed': 0.3, 'isInsideSVG': true, 'transition': true, 'transitionDuration': 2000}">
				<circle class="custom-svg-fill-color-secondary" fill="#4F4BFC"
					cx="36" cy="317" r="17" />
				<circle fill="#FFFFFF" cx="35.69" cy="317.31" r="15.43" />
			  </g>
			  <g data-plugin-float-element
					data-plugin-options="{'startPos': 'bottom', 'speed': 0.2, 'isInsideSVG': true, 'transition': true, 'transitionDuration': 2000}">
				<circle fill="#DFDFDB" cx="103.5" cy="224.5" r="9.5" />
			  </g>
			  <g data-plugin-float-element
					data-plugin-options="{'startPos': 'top', 'speed': 0.3, 'isInsideSVG': true, 'transition': true, 'transitionDuration': 2000}">
				<circle class="custom-svg-fill-color-secondary" fill="#5349FF"
					cx="1561" cy="31" r="6" />
			  </g>
			  <g data-plugin-float-element
					data-plugin-options="{'startPos': 'bottom', 'speed': 0.2, 'isInsideSVG': true, 'transition': true, 'transitionDuration': 2000}">
				<circle class="custom-svg-fill-color-secondary" fill="#4F4BFC"
					cx="1628" cy="145.5" r="25" />
				<circle fill="#FFFFFF" cx="1628.46" cy="145.96" r="22.69" />
			  </g>
			</svg>
			<!-- Carousel Starts -->
			<div class="row mb-5 pb-3">
				<div
					class="col-md-6 col-lg-4 mb-5 mb-lg-0 appear-animation d-flex justify-content-center"
					ng-repeat="seva in getAllActiveSeva.slice(-3)"
					data-appear-animation="fadeInUpShorter"
					data-appear-animation-delay="200">

					<div class="card text-center rounded-0 p-3 shadow small-card">
						<div class="card-body">
							<h2 class="font-weight-bold">{{seva.sevaTitle}}</h2>
							<p class="mb-0">
								<span
									ng-bind-html="seva.sevaDescription | cut:true:250:' ' | to_trusted"></span>
								<a href="<%=request.getContextPath()%>/prabhu-seva"> Read
									More.. </a>
							</p>
						</div>
					</div>
				</div>
			</div>


			<!-- <div
					class="col-md-6 col-lg-4 mb-5 mb-lg-0 appear-animation d-flex justify-content-center"
					data-appear-animation="fadeInUpShorter"
					data-appear-animation-delay="200">
					<div class="card text-center rounded-0 p-3 shadow small-card">
						<div class="card-body">
							<h2 class="font-weight-bold">Vastra Daan</h2>
							<p class="mb-0">Vastras like Dhoti, Saree, Khes and others
								can be offered to Lord Kubereshwar Mahadev on various
								occassions...</p>
						</div>
					</div>
				</div> -->
		</div>
	</div> --%>
	<section class="seva-section">
		<div class="container2" ng-controller="FrontSevaController">
			<h2 class="section-title">Vidhi Seva Offerings</h2>
			<h3 class="sub-title">Shree Kubershwar Mahadev, Karnali</h3>
			<p class="section-desc">Here is the list of vidhi, seva and
				offerings which can be made to Shree Kubershwar Mahadev for various
				purposes.</p>

			<div class="cards">
				<div class="card1" ng-repeat="seva in getAllActiveSeva.slice(-3)">
					<!-- Display image -->
					<img
						ng-src="<%=request.getContextPath()%>/resources/front/demo-images/imgseva/{{seva.sevaImages[0].sevaImages}}"
						alt="image" style="width: 150px; height: auto;" class="seva-image" />
					<h4 style="margin-top: 10px;">{{seva.sevaTitle}}</h4>
					<p class="mb-0">
						<span
							ng-bind-html="seva.sevaDescription | cut:true:250:' ' | to_trusted"></span>
						<a href="<%=request.getContextPath()%>/prabhu-seva"> Read
							More.. </a>
					</p>
				</div>
			</div>
			<%-- <div class="cards">
				<div class="card1" ng-repeat="seva in getAllActiveSeva.slice(-3)"
					ng-style="{'background-image': 'url(<%=request.getContextPath()%>/resources/front/demo-images/imgseva/' + seva.sevaImages[0].sevaImages + ')'}">
					<h4 class="text-white">{{seva.sevaTitle}}</h4>
					<p class="mb-0 text-white bg-overlay">
						<span
							ng-bind-html="seva.sevaDescription | cut:true:250:' ' | to_trusted"></span>
						<a href="<%=request.getContextPath()%>/prabhu-seva"
							class="text-light">Read More..</a>
					</p>
				</div>
			</div> --%>
		</div>
	</section>
	<div class="row mt-5 ">
		<p class="font-weight-normal text-color-grey "
			style="text-align: center">Many other seva and offerings can be
			made to Shree Kubereshwar Mahadev, Karnali.</p>
		<!-- <a href="seva.html" class="btn btn-modern btn-rounded btn-warning mb-2">Click Here for All Seva</a> -->
	</div>
	<div class="container">
		<div class=" mt-1" style="width: 50%; margin-left: 40%;">
			<!-- <a href="seva.html" class="button"><input type="button" style="border-radius:15px;background-color:#fd7e14 ;color:white;border-color:#fd7e14 ;" value="Click Here for All Seva"></a>	 -->
			<a href="<%=request.getContextPath()%>/prabhu-seva" data-hash
				data-hash-offset="0" data-hash-offset-lg="70"
				class="btn btn-gradient text-3 font-weight-bold px-5 py-3 appear-animation"
				data-appear-animation="fadeInUpShorter"
				data-appear-animation-delay="1000">CLick Here for All Seva</a>
		</div>
	</div>
	<!-- Carousel Ends -->
	<!-- How to Reach and Nearby Locations Starts -->
	<!-- How to Reach and Nearby Locations Ends -->
	<section id="blog"
		class="section section-with-shape-divider custom-bg-color-1 border-0 m-0">
		<div class="shape-divider shape-divider-reverse-y"
			style="height: 385px;">
			<svg version="1.1" xmlns="http://www.w3.org/2000/svg"
				xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
				viewBox="0 0 2000 385" preserveAspectRatio="xMinYMin">
			  <circle fill="#9DA3F6" cx="57" cy="181" r="161" />
			  <circle class="custom-svg-fill-color-secondary" fill="#5349FF"
					opacity="0.3" cx="75.5" cy="158.5" r="169.5" />
			  <path fill="#FFFFFF" opacity="0.5"
					d="M-35,226c17.66,1.2,43.63,2.44,75,2c83.48-1.18,144.86-13.49,188-22c224.54-44.3,165.12-27.27,310-59
									  c133.16-29.16,128.14-31.45,223-52c206.26-44.68,317.22-68.72,460-68c97.61,0.49,73.58,11.86,293,25c164.22,9.83,250.54,7.83,279,7
									  c102.76-2.99,187.96-12.01,248-20c0-24.69,0-49.37,0-74.06c-694.67,0-1389.33,0-2084,0C-40.33,51.96-37.67,138.98-35,226z" />
			  <path fill="#FFFFFF"
					d="M-37,185c17.21,1.44,42.06,3.17,72,4c81.96,2.26,170.2-3.07,325-30c54.07-9.4,98.99-18.41,221-45
									  c255.1-55.59,223.26-53.86,287-64c57.13-9.09,228.37-36.32,423-18c36.66,3.45,96.62,10.63,187,14c16.19,0.6,75.77,2.66,156,1
									  c90.18-1.87,157.94-7.44,248-15c46.95-3.94,99.2-8.84,156-15c0-12.82,0-25.65,0-38.47c-692.67,0-1385.33,0-2078,0
									  C-39,47.35-38,116.18-37,185z" />
			</svg>
		</div>
		<div
			class="container position-relative z-index-3 pt-2 pt-md-5 pb-1 pb-md-5 mt-5 mb-5 mb-lg-0 mb-xl-5">
			<!-- Facilities start -->
			<div class="row justify-content-center pt-5">
				<div class="col-lg-10 text-center">
					<span
						class="text-color-grey positive-ls-2 font-weight-medium custom-font-size-2 d-block mb-1 appear-animation"
						data-appear-animation="fadeInUpShorter"
						data-appear-animation-delay="200">AVAILABLE FACILITIES</span>
					<h2 class="font-weight-bold text-10 mb-4 appear-animation"
						data-appear-animation="fadeInUpShorter"
						data-appear-animation-delay="400">Facilities for pilgrims</h2>
					<p class="custom-font-size-2 font-weight-light appear-animation"
						data-appear-animation="fadeInUpShorter"
						data-appear-animation-delay="600">Shree Kubereshwar Someshwar
						Sanyukt Sansthan manages various facilities and amenities for
						pilgrims.</p>
				</div>
			</div>
			<div class="row mb-5 mb-lg-0">
				<div class="col">
					<div class="custom-svg-wrapper-2">
						<svg version="1.1" xmlns="http://www.w3.org/2000/svg"
							xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
							viewBox="0 0 1736 315" data-plugin-float-element-svg="true">
					<g data-plugin-float-element
								data-plugin-options="{'startPos': 'top', 'speed': 0.2, 'isInsideSVG': true, 'transition': true, 'transitionDuration': 2000}">
					  <circle fill="#DFDFDB" cx="145.5" cy="31.5" r="9.5" />
					</g>
					<g data-plugin-float-element
								data-plugin-options="{'startPos': 'bottom', 'speed': 0.3, 'isInsideSVG': true, 'transition': true, 'transitionDuration': 2000}">
					  <circle class="custom-svg-fill-color-secondary" fill="#4F4BFC"
								cx="75" cy="128" r="17" />
					  <circle fill="#eff1f3" cx="74.69" cy="128.31" r="15.43" />
					</g>
					<g data-plugin-float-element
								data-plugin-options="{'startPos': 'bottom', 'speed': 0.2, 'isInsideSVG': true, 'transition': true, 'transitionDuration': 2000}">
					  <circle class="custom-svg-fill-color-secondary" fill="#4F4BFC"
								cx="1693" cy="201.5" r="17" />
					  <circle fill="#eff1f3" cx="1693.31" cy="201.81" r="15.43" />
					</g>
					<g data-plugin-float-element
								data-plugin-options="{'startPos': 'top', 'speed': 0.3, 'isInsideSVG': true, 'transition': true, 'transitionDuration': 2000}">
					  <circle fill="#DFDFDB" cx="1620.5" cy="295.5" r="9.5" />
					</g>
				  </svg>
						<div class="appear-animation"
							data-appear-animation="fadeInUpShorter"
							data-appear-animation-delay="800">
							<div class="owl-carousel custom-dots-style-1"
								data-plugin-options="{'responsive': {'0': {'items': 1}, '476': {'items': 2}, '768': {'items': 3}, '992': {'items': 3}, '1200': {'items': 4}}, 'autoplay': false, 'autoplayTimeout': 5000, 'autoplayHoverPause': true, 'dots': true, 'nav': false, 'loop': true, 'margin': 30, 'stagePadding': 15}">
								<div>
									<a href="#" class="text-decoration-none">
										<div class="card custom-card-style-1 box-shadow-4 my-3">
											<div class="card-body p-3">
												<div class="thumb-info thumb-info-hide-wrapper-bg mb-3 pb-2">
													<div class="thumb-info-wrapper">
														<img
															src="resources/front/img/facilities/dharmashala-2.jpg"
															class="img-fluid" alt="Dharmashala" />
													</div>
												</div>
												<h3
													class="text-center font-weight-bold text-capitalize line-height-1 text-5 text-color-hover-primary mb-0">
													Dharmashala</h3>
												<p class="text-center text-color-grey text-3 mb-2">Rooms
													& Dormatory</p>
											</div>
										</div>
									</a>
								</div>
								<div>
									<a href="#" class="text-decoration-none">
										<div class="card custom-card-style-1 box-shadow-4 my-3">
											<div class="card-body p-3">
												<div class="thumb-info thumb-info-hide-wrapper-bg mb-3 pb-2">
													<div class="thumb-info-wrapper">
														<img src="resources/front/img/facilities/parking.jpg"
															class="img-fluid" alt="Car Parking" />
													</div>
												</div>
												<h3
													class="text-center font-weight-bold text-capitalize line-height-1 text-5 text-color-hover-primary mb-0">
													Car Parking</h3>
												<p class="text-center text-color-grey text-3 mb-2">Huge
													Parking Lots</p>
											</div>
										</div>
									</a>
								</div>
								<div>
									<a href="#" class="text-decoration-none">
										<div class="card custom-card-style-1 box-shadow-4 my-3">
											<div class="card-body p-3">
												<div class="thumb-info thumb-info-hide-wrapper-bg mb-3 pb-2">
													<div class="thumb-info-wrapper">
														<img
															src="resources/front/img/facilities/AnnaKshetra-2.jpg"
															class="img-fluid" alt="Annakshetra" />
													</div>
												</div>
												<h3
													class="text-center font-weight-bold text-capitalize line-height-1 text-5 text-color-hover-primary mb-0">
													Annakshetra</h3>
												<p class="text-center text-color-grey text-3 mb-2">Free
													Breakfast, Lunch & Dinner</p>
											</div>
										</div>
									</a>
								</div>
								<div>
									<a href="#" class="text-decoration-none">
										<div class="card custom-card-style-1 box-shadow-4 my-3">
											<div class="card-body p-3">
												<div class="thumb-info thumb-info-hide-wrapper-bg mb-3 pb-2">
													<div class="thumb-info-wrapper">
														<img src="resources/front/img/facilities/YagnaShala-2.jpg"
															class="img-fluid" alt="Yagna Shala" />
													</div>
												</div>
												<h3
													class="text-center font-weight-bold text-capitalize line-height-1 text-5 text-color-hover-primary mb-0">
													Yagna Shala</h3>
												<p class="text-center text-color-grey text-3 mb-2">Huge
													space for Yagna</p>
											</div>
										</div>
									</a>
								</div>
								<div>
									<a href="#" class="text-decoration-none">
										<div class="card custom-card-style-1 box-shadow-4 my-3">
											<div class="card-body p-3">
												<div class="thumb-info thumb-info-hide-wrapper-bg mb-3 pb-2">
													<div class="thumb-info-wrapper">
														<img
															src="resources/front/img/facilities/public-toilet.png"
															class="img-fluid" alt="Public Toilets" />
													</div>
												</div>
												<h3
													class="text-center font-weight-bold text-capitalize line-height-1 text-5 text-color-hover-primary mb-0">
													Public Toilets</h3>
												<p class="text-center text-color-grey text-3 mb-2">with
													high level of hygeine</p>
											</div>
										</div>
									</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="shape-divider shape-divider-bottom z-index-0"
			style="height: 260px;">
			<svg version="1.1" xmlns="http://www.w3.org/2000/svg"
				xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
				viewBox="0 0 2000 212" preserveAspectRatio="xMinYMin">
			  <circle class="custom-svg-fill-color-secondary" fill="#504BFD"
					opacity="0.2" cx="2007.7" cy="208.3" r="140.7" />
			  <circle class="custom-svg-fill-color-secondary" fill="#5349FF"
					opacity="0.2" cx="1975.78" cy="247.18" r="148.13" />
			  <path fill="#FFFFFF"
					d="M-42,42c21.03-0.71,49.03-1.3,82-1c10.06,0.09,73,0.78,147,7c95.4,8.01,191.25,23.7,278,40
									  c188.62,35.43,247.14,57.2,353,79c102.08,21.02,252.74,44.36,445,46c0,22.68,0,45.35,0,68.03c-433.33,0-866.67,0-1300,0
									  C-38.67,201.35-40.33,121.68-42,42z" />
			</svg>
		</div>
	</section>
	<!-- How to reach 2 starts -->
	<div class="container mt-4 mb-5">
		<div id="pricing" class="row justify-content-center">
			<div class="col-lg-10 text-center">
				<span
					class="text-color-grey positive-ls-2 font-weight-medium custom-font-size-2 d-block appear-animation"
					data-appear-animation="fadeInUpShorter"
					data-appear-animation-delay="200">Useful Information</span>
				<h2 class="font-weight-bold text-10 mb-4 appear-animation"
					data-appear-animation="fadeInUpShorter"
					data-appear-animation-delay="400">Shree Kubereshwar Mahadev,
					Karnali</h2>
				<p
					class="custom-font-size-2 font-weight-light mb-4 pb-3 appear-animation"
					data-appear-animation="fadeInUpShorter"
					data-appear-animation-delay="600">Vestibulum auctor felis eget
					orci semper vestibulum. Pellentesque ultricies nibh gravida,
					accumsan libero luctus, molestie nunc. In nibh ipsum, blandit id
					faucibus ac, finibus vitae dui.</p>
			</div>
		</div>
		<div class="custom-svg-wrapper-3">
			<svg version="1.1" xmlns="http://www.w3.org/2000/svg"
				xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
				viewBox="0 0 1677 357" data-plugin-float-element-svg="true">
			  <g data-plugin-float-element
					data-plugin-options="{'startPos': 'top', 'speed': 0.3, 'isInsideSVG': true, 'transition': true, 'transitionDuration': 2000}">
				<circle class="custom-svg-fill-color-secondary" fill="#4F4BFC"
					cx="36" cy="317" r="17" />
				<circle fill="#FFFFFF" cx="35.69" cy="317.31" r="15.43" />
			  </g>
			  <g data-plugin-float-element
					data-plugin-options="{'startPos': 'bottom', 'speed': 0.2, 'isInsideSVG': true, 'transition': true, 'transitionDuration': 2000}">
				<circle fill="#DFDFDB" cx="103.5" cy="224.5" r="9.5" />
			  </g>
			  <g data-plugin-float-element
					data-plugin-options="{'startPos': 'top', 'speed': 0.3, 'isInsideSVG': true, 'transition': true, 'transitionDuration': 2000}">
				<circle class="custom-svg-fill-color-secondary" fill="#5349FF"
					cx="1561" cy="31" r="6" />
			  </g>
			  <g data-plugin-float-element
					data-plugin-options="{'startPos': 'bottom', 'speed': 0.2, 'isInsideSVG': true, 'transition': true, 'transitionDuration': 2000}">
				<circle class="custom-svg-fill-color-secondary" fill="#4F4BFC"
					cx="1628" cy="145.5" r="25" />
				<circle fill="#FFFFFF" cx="1628.46" cy="145.96" r="22.69" />
			  </g>
			</svg>
			<div
				class="pricing-table custom-pricing-table-style-1 mb-4 appear-animation"
				data-appear-animation="fadeInUpShorter"
				data-appear-animation-delay="800">
				<div class="col-md-6 col-lg-4">
					<div class="plan plan-featured">
						<div class="plan-header bg-secondary">
							<h3>DARSHAN TIMINGS</h3>
						</div>
						<div class="plan-price">
							<label class="price-label">Normal Days</label> <span
								class="price"> <span class="price-unit">from</span> <br>05:30
								AM
							</span> <span class="price"> <span class="price-unit">to</span> <br>08:00
								PM
							</span>
							<p>&nbsp;</p>
							<label class="price-label">Amas</label> <span class="price">
								<span class="price-unit">from</span> <br>00:00 AM
							</span> <span class="price"> <span class="price-unit">to</span> <br>10:00
								PM
							</span>
						</div>
						<!--<div class="plan-features"><ul><li>Exclusive Design</li><li>HTML5</li><li>CSS3</li><li>Bootstrap</li><li>Sass</li><li>Images and Videos</li></ul></div> -->
						<p></p>
						<div class="plan-footer">
							<a href="#"
								class="btn btn-dark text-3 font-weight-bold border-0 btn-px-5 py-3">Call
								Now</a>
						</div>
					</div>
				</div>
				<div class="col-md-6 col-lg-4">
					<div class="plan plan-featured">
						<div class="plan-header bg-secondary">
							<h3>HOW TO REACH</h3>
						</div>
						<div class="plan-price">
							<span class="price">By Road</span> <label class="price-label">60
								KM from Vadodara</label> <label class="price-label">27 KM from
								Dabhoi</label> <label class="price-label">05 KM from Chandod</label> <label
								class="price-label">47 KM from SoU</label>
						</div>
						<div class="plan-price">
							<span class="price">By Railways</span> <label class="price-label">Nearest
								Railway Station is Chandod</label> <label class="price-label">from
								Vadodara to Dabhoi</label> <label class="price-label">from
								Dabhoi to Chandod</label>
						</div>
						<div class="plan-price">
							<span class="price">By Air</span> <label class="price-label">Nearest
								airport is Vadodara</label> <br>
						</div>
						<!--<div class="plan-features"><ul><li>60 KM</li></ul></div> -->
						<div class="plan-footer">
							<a href="#"
								class="btn btn-dark text-3 font-weight-bold border-0 btn-px-5 py-3">More
								Info</a>
						</div>
					</div>
				</div>
				<div class="col-md-6 col-lg-4">
					<div class="plan plan-featured">
						<div class="plan-header bg-secondary">
							<h3>NEARBY PLACES</h3>
						</div>
						<div class="plan-price">
							<!-- <span class="price"><span class="price-unit">$</span>59</span>-->
							<label class="price-label">from Karnali</label>
						</div>
						<div class="plan-features">
							<ul>
								<li>Statue of Unity (SoU), Kevadia</li>
								<li>Narmada Dam, Kevadia</li>
								<li>Wadhwana Bird Sanctuary, Dabhoi</li>
								<li>Hira Bhagol, Dabhoi</li>
								<li>Harasiddhi Mata, Rajpipla</li>
								<li>Ansuya Mata</li>
								<li>Kabirwad</li>
								<li>Nilkanth Dham, Poicha</li>
								<li>Rang Avdhoot Ashram, Malsar</li>
								<li>Triveni Sangam, Chandod</li>
								<li>Shulpaneshwar Mahadev, Garudeshwar</li>
							</ul>
						</div>
						<div class="plan-footer">
							<a href="#"
								class="btn btn-dark text-3 font-weight-bold border-0 btn-px-5 py-3">More
								Info</a>
							<!-- <a href="#" class="btn btn-gradient text-3 font-weight-bold btn-px-5 py-3">Get Started</a> -->
						</div>
					</div>
				</div>
				<!--<div class="col-md-6 col-lg-3"><div class="plan"><div class="plan-header"><h3>ENTERPRISE PLAN</h3></div><div class="plan-price"><span class="price"><span class="price-unit">$</span>99</span><label class="price-label">1 month</label></div><div class="plan-features"><ul><li>Exclusive Design</li><li>HTML5</li><li>CSS3</li><li>Bootstrap</li><li>Sass</li><li>Images and Videos</li></ul></div><div class="plan-footer"><a href="#" class="btn btn-dark text-3 font-weight-bold border-0 btn-px-5 py-3">Get Started</a></div></div></div> -->
			</div>
		</div>
	</div>
	<!-- How to reach 2 ends -->
	</div>
	<div
		class="shape-divider shape-divider-bottom shape-divider-reverse-y z-index-0">
		<svg version="1.1" xmlns="http://www.w3.org/2000/svg"
			xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
			viewBox="0 0 2000 260" preserveAspectRatio="xMinYMin">
			<path fill="#FFFFFF"
				d="M-42,42c21.03-0.71,49.03-1.3,82-1c10.06,0.09,73,0.78,147,7c95.4,8.01,191.25,23.7,278,40
					  c188.62,35.43,247.14,57.2,353,79c102.08,21.02,252.74,44.36,445,46c0,22.68,0,45.35,0,68.03c-433.33,0-866.67,0-1300,0
					  C-38.67,201.35-40.33,121.68-42,42z" />
			<path fill="#222529"
				d="M-39,233c18.45-5.57,45.76-13.68,79-23c65.89-18.48,100.28-28.12,140-36c64.67-12.83,115.09-15.35,151-17
					  c72.37-3.33,126.81,0.97,200,7c21.78,1.79,35.05,3.15,147,16c185.79,21.33,205.66,24.08,252,27c85.5,5.38,150.46,4.35,168,4
					  c48.7-0.96,73.47-3.33,246-19c174.43-15.84,185.89-16.75,211-18c76.46-3.81,133.48-3.48,217-3c83.26,0.48,125.58,2.59,166,6
					  c37.33,3.15,68.3,7,90,10c0,28.67,0,57.35,0,86.02c-688.33,0-1376.67,0-2065,0C-37.67,259.68-38.33,246.34-39,233z" />
		  </svg>
	</div>
	<footer id="footer" class="border-0 bg-dark pt-4 mt-0"
		data-spy-offset="15">
		<div class="container custom-svg-wrapper-4 pb-5">
			<div class=" mt-5 mt-lg-0">
				<div class="row">
					<div class="col-lg-4 text-center pb-3 pb-lg-0 mb-5 mb-lg-0">
						<span
							class="d-block text-color-grey positive-ls-2 font-weight-normal custom-font-size-2 text-color-light opacity-6 mb-1">GET
							IN TOUCH</span>
						<h2 class="font-weight-bold text-color-light text-10 mb-5">Contact
							Us</h2>
						<div class="row">
							<div class="col-lg-6">
								<div class="row pb-5 mb-5">
									<div class="col">
										<div data-plugin-float-element
											data-plugin-options="{'startPos': 'top', 'speed': 0.2, 'isInsideSVG': true, 'transition': true, 'transitionDuration': 2000}">
											<img class="icon-animated" width="55"
												src="resources/front/img/demos/startup-agency/icons/icon-location.svg"
												alt="" data-icon
												data-plugin-options="{'onlySVG': true, 'extraClass': 'svg-fill-color-primary mb-3'}" />
											<h4 class="font-weight-bold text-color-light text-5 mb-0">Address</h4>
											<p
												class="text-4 text-color-light opacity-5 font-weight-light mb-0">Kubereshwar
												Mahadev, Karnali, Dist. Vadodara</p>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col">
										<div data-plugin-float-element
											data-plugin-options="{'startPos': 'bottom', 'speed': 0.1, 'isInsideSVG': true, 'transition': true, 'transitionDuration': 2000}">
											<img class="icon-animated" width="55"
												src="resources/front/img/demos/startup-agency/icons/icon-mail.svg"
												alt="" data-icon
												data-plugin-options="{'onlySVG': true, 'extraClass': 'svg-fill-color-secondary mb-3'}" />
											<h4 class="font-weight-bold text-color-light text-5 mb-0">E-mail
												Address</h4>
											<a href="mailto:mahiti@shreekuberbhandarikarnali.org"
												class="text-1 text-color-light text-color-hover-primary opacity-5 font-weight-light mb-0">mahiti@shreekuberbhandarikarnali.org</a>
										</div>
									</div>
								</div>
							</div>
							<div class="col-lg-6 pt-5">
								<div class="row pb-5 mb-5">
									<div class="col">
										<div data-plugin-float-element
											data-plugin-options="{'startPos': 'bottom', 'speed': 0.2, 'isInsideSVG': true, 'transition': true, 'transitionDuration': 2000}">
											<img class="icon-animated" width="55"
												src="resources/front/img/demos/startup-agency/icons/icon-phone.svg"
												alt="" data-icon
												data-plugin-options="{'onlySVG': true, 'extraClass': 'svg-fill-color-secondary mb-3'}" />
											<h4 class="font-weight-bold text-color-light text-5 mb-0">Phone
												Number</h4>
											<a href="tel:+1234567890"
												class="text-4 text-color-light text-color-hover-primary opacity-5 font-weight-light mb-0">+91-9427611304</a>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col">
										<div data-plugin-float-element
											data-plugin-options="{'startPos': 'bottom', 'speed': 0.1, 'isInsideSVG': true, 'transition': true, 'transitionDuration': 2000}">
											<img class="icon-animated" width="55"
												src="resources/front/img/demos/startup-agency/icons/icon-calendar.svg"
												alt="" data-icon
												data-plugin-options="{'onlySVG': true, 'extraClass': 'svg-fill-color-primary mb-3'}" />
											<h4 class="font-weight-bold text-color-light text-5 mb-0">Darshan
												Timings</h4>
											<p
												class="text-4 text-color-light opacity-5 font-weight-light mb-0">Regular
												Days : - 5:30AM - 8:00PM Amas : - 00:00AM - 10:00PM</p>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-5">
						<form style="font-family: 'Josefin Sans', sans-serif;"
							action="sampark.php" method="POST" role="form" id="crm-form">
							<div class="messages"></div>
							<div class="controls">
								<div class="row">
									<div class="col-md-12">
										<div class="form-group">
											<label style="font-weight: normal;" for="form_name">Fulltname
												*</label> <input style="border: 1px solid #ccc;" id="form_name"
												type="text" name="name" class="form-control input-lg"
												placeholder="Please enter your firstname *"
												required="required" data-error="Firstname is required.">
											<div class="help-block with-errors"></div>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-6">
										<div class="form-group">
											<label style="font-weight: normal;" for="form_email">
												Email </label> <input style="border: 1px solid #ccc;"
												id="form_email" type="email" name="email"
												class="form-control input-lg"
												placeholder="Please enter your email" required="required"
												data-error="Email is required.">
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group">
											<label style="font-weight: normal;" for="form_phone">
												Phone *</label> <input style="border: 1px solid #ccc;"
												id="form_phone" type="tel" name="phone"
												class="form-control input-lg"
												placeholder="Please enter your phone">
											<div class="help-block with-errors"></div>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-12">
										<div class="form-group">
											<label style="font-weight: normal;" for="form_message">Message
											</label>
											<textarea style="height: auto; border: 1px solid #ccc;"
												id="form_message" name="message" class="form-control"
												placeholder="Message for us *" cols="20" rows="5"></textarea>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-4">
										<div class="form-group">
											<input style="border: 1px solid #ccc;" type="text"
												id="txtCaptcha" class="form-control">
										</div>
									</div>
									<div class="col-md-2">
										<div class="form-group">
											<input type="button"
												style="border: 1px solid #ccc; padding: 3px" id="btnrefresh"
												value="Refresh" onClick="DrawCaptcha();"
												class="form-control">
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group">
											<input style="border: 1px solid #ccc;" type="text"
												placeholder="Please enter above shown code here"
												id="txtInput" class="form-control" required="required"
												data-error="Please enter above shown code here">
											<div class="help-block with-errors"></div>
										</div>
									</div>
								</div>
								<div class="row mt-20">
									<div class="col-md-12 text-center">
										<input style="background: #0088cc; border-color: transparent;"
											type="submit" class="btn btn-success btn-send btn-lg"
											id="submit" value="Send message"
											onClick="return ValidCaptcha();">
									</div>
								</div>
							</div>
						</form>
					</div>

					<div class="col-md-3 mt-4">
						<p style="color: white; font-size: 23px">Important Links</p>
						<ul>
							<li class="lnkhvr"><a
								href="<%=request.getContextPath()%>/Kuber-bhandari"
								style="font-size: 15px"> Kuber Bhandari </a>
								<ul>
									<li><a href="<%=request.getContextPath()%>/The-Pujaris"
										style="font-size: 15px">The Pujaris </a></li>
									<li><a href="<%=request.getContextPath()%>/The-Trust"
										style="font-size: 15px">The Trust</a></li>
								</ul></li>
							<li class="lnkhvr"><a
								href="<%=request.getContextPath()%>/Darshan"
								style="font-size: 15px"> Darshan </a></li>
							<li class="lnkhvr"><a
								href="<%=request.getContextPath()%>/seva"
								style="font-size: 15px"> Seva </a></li>
							<li class="lnkhvr"><a
								href="<%=request.getContextPath()%>/Events"
								style="font-size: 15px"> Events </a></li>
							<li class="lnkhvr"><a href="<%=request.getContextPath()%>/#">
									Facilities</a></li>
							<li class="lnkhvr"><a
								href="<%=request.getContextPath()%>/Important-dates"
								style="font-size: 15px"> Important Dates </a></li>
							<li class="lnkhvr"><a href="<%=request.getContextPath()%>/#"
								style="font-size: 15px"> Narmada Parikrama </a></li>
							<li class="lnkhvr">Downloads</li>
							<ul>
								<li><a href="<%=request.getContextPath()%>/#"
									style="font-size: 15px">Aarti </a></li>
								<li><a href="<%=request.getContextPath()%>/#"
									style="font-size: 15px">Stuti </a></li>
							</ul>
							<li class="lnkhvr"><a href="<%=request.getContextPath()%>/#"
								style="font-size: 15px"> Social Service </a></li>
							<li class="lnkhvr"><a href="<%=request.getContextPath()%>/#"
								style="font-size: 15px"> FAQ's </a></li>
							<li class="lnkhvr"><a
								href="<%=request.getContextPath()%>/gallery"
								style="font-size: 15px"> Gallery </a></li>
							<li class="lnkhvr"><a
								href="<%=request.getContextPath()%>/sampark"
								style="font-size: 15px"> Contact </a></li>
							<li class="lnkhvr"><a href="<%=request.getContextPath()%>/#"
								style="font-size: 15px"> Credits </a></li>
						</ul>
						<div class="row">
							<div class="col-md-2">
								<a href="#"> <img src="resources/front/images/youtube.svg"
									height="30px" width="30px" alt="">
								</a>
							</div>
							<div class="col-md-2">
								<a href="https://www.instagram.com/kuberbhandarikarnali/"
									target="_blank"> <img
									src="resources/front/images/instagram.svg" height="30px"
									width="30px" alt="">
								</a>
							</div>
							<div class="col-md-2">
								<a href="https://www.facebook.com/kuberbhandarikarnali/"
									target="_blank"> <img
									src="resources/front/images/facebook.svg" height="30px"
									width="30px" alt="">
								</a>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-2"></div>
					<div class="col-md-2"></div>
					<div class="col-md-2"></div>
				</div>
			</div>
		</div>
		<div class="container"
			style="background-color: #2c2b2b; border-radius: 10px;">
			<div class="row ">
				<div class="col-md-3">
					<a href="#" style="color: rgb(155, 153, 153)" class="ftrhvr"> >
						Terms & Conditions</a>
				</div>
				<div class="col-md-3">
					<a href="#" style="color: rgb(155, 153, 153)" class="ftrhvr"> >
						Delivery & Shipping Policy</a>
				</div>
				<div class="col-md-3">
					<a href="#" style="color: rgb(155, 153, 153)" class="ftrhvr"> >
						Privacy Policy</a>
				</div>
				<div class="col-md-3">
					<a href="#" style="color: rgb(155, 153, 153)" class="ftrhvr"> >
						Refund & Cancellation</a>
				</div>
			</div>
		</div>
		<div class="footer-copyright bg-dark mt-5 pb-5">
			<div class="container footer-top-light-border pt-4">
				<div class="row">
					<div class="col">
						<p class="text-center text-color-light opacity-5">
							Content © 2024. All Rights Reserved.
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							Powered by: <a href="https://www.AstarTechnologies.net"
								target="_blank">Astar Technologies</a>
						</p>
					</div>
				</div>
			</div>
		</div>
	</footer>
	</div>

	<!-- Vendor -->
	<script src="resources/front/vendor/plugins/js/plugins.min.js"></script>
	<script src="resources/front/vendor/kute/kute.min.js"></script>
	<!-- Theme Base, Components and Settings -->
	<script src="resources/front/js/theme.js"></script>
	<!-- Current Page Vendor and Views -->
	<script src="resources/front/js/views/view.contact.js"></script>
	<!-- Demo -->
	<script src="resources/front/js/demos/demo-startup-agency.js"></script>
	<!-- Theme Custom -->
	<script src="resources/front/js/custom.js"></script>
	<!-- Theme Initialization Files -->
	<script src="resources/front/js/theme.init.js"></script>

	<script>
		// Get the modal
		var modal = document.getElementById("myModal");

		// Get the <span> element that closes the modal
		var span = document.getElementsByClassName("close")[0];

		// When the page loads, display the modal
		window.onload = function() {
			modal.style.display = "block";
		}

		// When the user clicks on <span> (x), close the modal
		span.onclick = function() {
			modal.style.display = "none";
		}

		// When the user clicks anywhere outside of the modal, close it
		window.onclick = function(event) {
			if (event.target == modal) {
				modal.style.display = "none";
			}
		}
	</script>
	<!-- Initialize AOS -->
	<script>
		AOS.init({
			duration : 800,
			once : true
		});
	</script>

</body>
</html>