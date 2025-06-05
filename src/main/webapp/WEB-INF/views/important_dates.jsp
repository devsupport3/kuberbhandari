<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html ng-app="kuberbhandari">

<head>

<!-- Basic -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Important Dates</title>

<meta name="keywords"
	content="Important dates kuber bhandari, kuber bhandari amas date, kuber bhandari shivratri dates, kuber bhandari, kuber bhandari karnali, narmada river" />
<meta name="description"
	content="Important dates of Teras, Shivratri and Amas for Kuber Bhandari, Karnali.">
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

<!-- Demo CSS -->
<!-- <link rel="stylesheet" href="css/demos/demo-business-consulting-3.css"> -->
<link rel="stylesheet" href="resources/front/css/demos/demo-medical.css">
<link rel="stylesheet"
	href="resources/front/css/demos/demo-startup-agency.css">

<!-- Skin CSS -->
<link id="skinCSS" rel="stylesheet"
	href="resources/front/css/skins/skin-medical.css">
<!-- <link id="skinCSS" rel="stylesheet" href="css/skins/skin-business-consulting-3.css"> -->

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
</head>

<body>
	<div class="body ">

		<%@include file="header.jsp"%>

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

		<section
			class="page-header page-header-modern  bg-tertiary border-0 my-0 "
			style="background-color: #ffad28 !important;">
			<div class="container my-3">
				<div class="row p-4">
					<div
						class="col-md-12 align-self-center p-static order-2 text-center">
						<h1 class="font-weight-bold text-10">Important Dates</h1>
					</div>
					<div class="col-md-12 align-self-center order-1">
						<ul class="breadcrumb breadcrumb-light d-block text-center">
							<li><a href="<%=request.getContextPath()%>/">Home</a></li>
							<li class="active">Important dates</li>
						</ul>
					</div>
				</div>
			</div>
		</section>

		<!-- title section -->

		<div class="container">
			<div class="row" ng-controller="impDateController">
				<div class="box1 col-md-6"
					ng-repeat="festival in groupedImportantDates">
					<div class="row mt-5 p-static z-index-1 text-center">
						<!-- <img width="100" height="100"
							src="resources/front/img/svg/noun-maha-shivratri-3859125.svg" alt="" data-icon
							data-plugin-options="{'onlySVG': true, 'extraClass': 'svg-fill-color-primary mt-3 mb-4 pb-3'}" /> -->
						<h1 class="font-weight-bold text-8">{{festival.festivalName}}</h1>
					</div>

					<!-- shivratri section -->
					<div class=" row border text-center p-3 mx-5"
						ng-repeat="date in festival.dates | orderBy:'englishDate | dateFormat1':true">
						<h4 class="mb-3">{{date.englishDate| dateFormat1}}, {{date.englishDay}}</h4>
						<p class="mb-0">{{date.hinduMonthName}}, {{date.pakshName}} {{date.tithiNumber}},
							{{date.tithiName}}</p>
					</div>
				</div>

				<!-- Festivals section -->
				<div class="row mt-5 text-center">
					<h1 class="font-weight-bold text-8">Festivals</h1>
				</div>
				<div class="row mb-3 mb-lg-0">
					<div class="col">
						<div class="appear-animation"
							data-appear-animation="fadeInUpShorter"
							data-appear-animation-delay="500">
							<div class="owl-carousel "
								data-plugin-options="{'responsive': {'0': {'items': 1}, '476': {'items': 2}, '768': {'items': 3}, '994'} : {'items': 4}, 'autoplay': false, 'autoplayTimeout': 5000, 'autoplayHoverPause': true, 'nav': false, 'loop': true, 'margin': 30, 'stagePadding': 15}">

								<div>
									<a href="#" class="text-decoration-none">
										<div class="card custom-card-style-1 box-shadow-4 my-4">
											<div class="card-body p-3">
												<div class="thumb-info thumb-info-hide-wrapper-bg mb-3 pb-2">
													<div class="thumb-info-wrapper">
														<img
															src="resources/front/demo-images/imgdates/baatcheet-films-2yKKcOoll74-unsplash.jpg"
															width="230px" height="152px" class="img-fluid"
															alt="Mahashivaratri" />
													</div>
												</div>
												<h3
													class="text-center font-weight-bold text-capitalize line-height-1 text-5 text-color-hover-primary mb-0">
													Mahashivaratri</h3>

											</div>
										</div>
									</a>
								</div>

								<div>
									<a href="#" class="text-decoration-none">
										<div class="card custom-card-style-1 box-shadow-4 my-4">
											<div class="card-body p-3">
												<div class="thumb-info thumb-info-hide-wrapper-bg mb-3 pb-2">
													<div class="thumb-info-wrapper">
														<img
															src="resources/front/demo-images/imgdates/sonika-agarwal-iQ6zvGT_Z7E-unsplash.jpg"
															width="230px" height="152px" class="img-fluid"
															alt="xchaitra_navratri" />
													</div>
												</div>
												<h3
													class="text-center font-weight-bold text-capitalize line-height-1 text-5 text-color-hover-primary mb-0">
													Chaitra Navratra</h3>

											</div>
										</div>
									</a>
								</div>

								<div>
									<a href="#" class="text-decoration-none">
										<div class="card custom-card-style-1 box-shadow-4 my-4">
											<div class="card-body p-3">
												<div class="thumb-info thumb-info-hide-wrapper-bg mb-3 pb-2">
													<div class="thumb-info-wrapper">
														<img
															src="resources/front/demo-images/imgdates/dibakar-roy-3IgdXDzh8IE-unsplash.jpg"
															width="230px" height="152px" class="img-fluid"
															alt="palkhi yatra" />
													</div>
												</div>
												<h3
													class="text-center font-weight-bold text-capitalize line-height-1 text-5 text-color-hover-primary mb-0">
													Palkhi Yatra</h3>

											</div>
										</div>
									</a>
								</div>

								<div>
									<a href="#" class="text-decoration-none">
										<div class="card custom-card-style-1 box-shadow-4 my-4">
											<div class="card-body p-3">
												<div class="thumb-info thumb-info-hide-wrapper-bg mb-3 pb-2">
													<div class="thumb-info-wrapper">
														<img
															src="resources/front/demo-images/imgdates/joshi-milestoner-GardauGN-HU-unsplash.jpg"
															class="img-fluid" width="230px" height="152px"
															alt="Dipawali" />
													</div>
												</div>
												<h3
													class="text-center font-weight-bold text-capitalize line-height-1 text-5 text-color-hover-primary mb-0">
													Dipawali</h3>
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

		<%@include file="footer.jsp"%>

		<!-- <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY"></script>
		<script>

			/* $(function () {
				$(".header").load("header.html");
				$("#footer").load("footer.html");
			}); */

			window.onscroll = function () { myFunction() };

			var header = document.getElementById("myHeader");
			var sticky = header.offsetTop;

			function myFunction() {
				if (window.pageYOffset > sticky) {
					header.classList.add("sticky");
				} else {
					header.classList.remove("sticky");
				}
			}
		</script> -->
</body>

</html>