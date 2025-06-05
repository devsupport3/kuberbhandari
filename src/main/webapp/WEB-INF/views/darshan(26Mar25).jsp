<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html ng-app="kuberbhandari">

<head>
<!-- Basic -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Shree Kubereshwar Mahadev, Karnali, Dist. Vadodara,
	Gujarat, India</title>
<meta name="keywords"
	content="Shree Kubereshwar Mahadev, Shree Kuber Bhandari, Karnali, Shree Someshwwar Mahadev" />
<meta name="description"
	content="Shree Kubereshwar Mahadev, Shree Kuber Bhandari, Karnali, Shree Someshwwar Mahadev">
<meta name="author" content="www.AstarTechnologies.net">

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
<script src="https://code.jquery.com/jquery-3.3.1.js"
	integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
	crossorigin="anonymous"></script>

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
</head>

<body>
	<div class="body ">
		<div class="sticky-note">
			<div class="sticky-note-content">
				<a href="tel:+91-9824332016"
					class="text-4 text-color-light text-color-hover-primary font-weight-light mb-0">
					<img
					src="<%=request.getContextPath()%>/resources/front/images/whtpp.svg"
					height="40px" width="40px" alt="">
				</a>
			</div>
		</div>
		<div class="sticky-notes">
			<div class="sticky-note-contents">
				<div id="google_translate_element"></div>
			</div>
		</div>

		<%@include file="header.jsp"%>

		<div ng-controller="FrontDarshanController"
			ng-init="getAllActiveDailyDarshan()">

			<section
				class="page-header page-header-modern  bg-tertiary border-0 my-0 "
				style="background-color: #ffad28 !important;">
				<div class="container my-3">
					<div class="row p-4">
						<div
							class="col-md-12 align-self-center p-static order-2 text-center">
							<h1 class="font-weight-bold text-10">Darshan</h1>
						</div>
						<div class="col-md-12 align-self-center order-1">
							<ul class="breadcrumb breadcrumb-light d-block text-center">
								<li><a href="<%=request.getContextPath()%>/">Home</a></li>
								<li class="active">Darshan</li>
							</ul>
						</div>
					</div>
				</div>
			</section>

			<!-- new section starts -->
			<div class="container mt-4 mb-5 mt-5"
				ng-repeat="dailyDarshan in getAllActiveDailyDarshan">
				<div id="pricing" class="row justify-content-center">
					<div class="col-lg-10 text-center">
						<h2 class="font-weight-bold text-10 mb-4 appear-animation"
							data-appear-animation="fadeInUpShorter"
							data-appear-animation-delay="400">{{
							dailyDarshan.dailyDarshanTitle }},{{ dailyDarshan.dailyDarshanDay
							}}, {{ dailyDarshan.dailyDarshanDate }}</h2>
					</div>
				</div>

				<!-- Daily Darshan Starts -->
				<div class="row px-0 pb-5 mb-5">
					<div class="col">
						<div
							class="owl-carousel custom-carousel-backward-shape custom-dots-style-1 custom-dots-style-1-light"
							data-plugin-options="{'responsive': {'0': {'items': 1, 'stagePadding': 100}, '479': {'items': 1, 'stagePadding': 100}, '768': {'items': 3, 'stagePadding': 100}, '992': {'items': 3, 'stagePadding': 100}, '1200': {'items': 4}}, 'autoplay': true, 'autoplayTimeout': 5000, 'autoplayHoverPause': true, 'dots': true, 'nav': false, 'center': true, 'loop': true, 'margin': 25}">
							<div class="my-5"
								ng-repeat="image in dailyDarshan.dailyDarshanImages">
								<a href="#">
									<div
										class="thumb-info thumb-info-hide-wrapper-bg custom-thumb-info-hover-1 box-shadow-4 rounded-0 my-3">
										<div class="thumb-info-wrapper rounded-0">
											<img id="img{{image.dailyDarshanImageId}}"
												ng-src="{{image.dailyDarshanImages}}"
												class="img-fluid rounded-0" alt="Darshan Image" />
										</div>
									</div>
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- Daily Darshan Ends -->

			<!-- new section starts -->
			<div class="container mt-4 mb-5 mt-5">
				<div id="pricing" class="row justify-content-center">
					<div class="col-lg-10 text-center">
						<h2 class="font-weight-bold text-10 mb-4 appear-animation"
							data-appear-animation="fadeInUpShorter"
							data-appear-animation-delay="400">Magsar Sud 10, Wednesday,
							10 December 2024</h2>
					</div>
				</div>

				<!--				Daily Darshan Starts
-->
				<div class="row px-0 pb-5 mb-5">
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
												src="resources/front/img/DailyDarshan/DailyDarshan-KuberBhandari-18Mar24-1.jpg"
												class="img-fluid rounded-0" alt="Mahalaxmi Mataji" />
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
												src="resources/front/img/DailyDarshan/DailyDarshan-KuberBhandari-18Mar24-2.jpg"
												class="img-fluid rounded-0"
												alt="Rudrabhishek to Shree Kubereshwar Mahadev" />
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
												src="resources/front/img/DailyDarshan/DailyDarshan-KuberBhandari-18Mar24-3.jpg"
												class="img-fluid rounded-0"
												alt="Rudrabhishek to Shree Kubereshwar Mahadev" />
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
												src="resources/front/img/DailyDarshan/DailyDarshan-KuberBhandari-18Mar24-4.jpg"
												class="img-fluid rounded-0"
												alt="Shangar Darshan Shree Kubereshwar Mahadev" />
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
												src="resources/front/img/DailyDarshan/DailyDarshan-KuberBhandari-18Mar24-5.jpg"
												class="img-fluid rounded-0" alt="Maa Amba" />
										</div>
									</div>
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- Daily Darshan Ends -->

			<!-- new section starts -->
			<div class="container mt-4 mb-5 mt-5">
				<div id="pricing" class="row justify-content-center">
					<div class="col-lg-10 text-center">
						<h2 class="font-weight-bold text-10 mb-4 appear-animation"
							data-appear-animation="fadeInUpShorter"
							data-appear-animation-delay="400">Magsar Sud 10, Wednesday,
							10 December 2024</h2>
					</div>
				</div>

				<!--				Daily Darshan Starts -->
				<div class="row px-0 pb-5 mb-5">
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
												src="resources/front/img/DailyDarshan/DailyDarshan-KuberBhandari-18Mar24-1.jpg"
												class="img-fluid rounded-0" alt="Mahalaxmi Mataji" />
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
												src="resources/front/img/DailyDarshan/DailyDarshan-KuberBhandari-18Mar24-2.jpg"
												class="img-fluid rounded-0"
												alt="Rudrabhishek to Shree Kubereshwar Mahadev" />
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
												src="resources/front/img/DailyDarshan/DailyDarshan-KuberBhandari-18Mar24-3.jpg"
												class="img-fluid rounded-0"
												alt="Rudrabhishek to Shree Kubereshwar Mahadev" />
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
												src="resources/front/img/DailyDarshan/DailyDarshan-KuberBhandari-18Mar24-4.jpg"
												class="img-fluid rounded-0"
												alt="Shangar Darshan Shree Kubereshwar Mahadev" />
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
												src="resources/front/img/DailyDarshan/DailyDarshan-KuberBhandari-18Mar24-5.jpg"
												class="img-fluid rounded-0" alt="Maa Amba" />
										</div>
									</div>
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- Daily Darshan Ends -->

		</div>
	</div>

	<%@include file="footer.jsp"%>

	<script src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY"></script>
	<script>
		// $(function() {
		// $(".header").load("header.html");
		// $("#footer").load("footer.html");
		// });
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
</body>
</html>