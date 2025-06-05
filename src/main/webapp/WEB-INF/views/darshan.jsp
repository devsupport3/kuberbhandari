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
	box-sizing: border-box;
}

.sticky-notes {
	position: fixed;
	top: 60%;
	right: 120px;
	transform: translateY(-50%);
	padding: 5px;
	width: 50px;
	z-index: 9999;
	box-sizing: border-box;
}

.slider-wrapper {
	display: flex;
	align-items: center;
	position: relative;
	overflow-x: hidden;
}

.slider {
	display: flex;
	transition: transform 0.5s ease-in-out;
}

.slider img {
	width: 275px;
	height: 615px;
	object-fit: cover;
	margin: 0 5px;
	max-width: 100%;
	height: auto;
	box-sizing: border-box;
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
	background-color: rgba(0,0,0,0.5);
}

.btn-left {
	left: 0;
}

.btn-right {
	right: 0;
}

.container1 {
	position: relative;
	width: 100%;
	max-width: 1140px;
	margin: auto;
	overflow: hidden;
	box-sizing: border-box;
}

.title {
	font-size: 33px;
	font-weight: bold;
	margin-bottom: 22px;
	margin-top: 71px;
	text-align: center;
	color: black;
	box-sizing: border-box;
}

@media (max-width: 1200px) {
	.container1 {
		width: 90%;
		max-width: 100%;
		margin: auto;
	}
	.slider img {
		width: 200px;
		height: auto;
	}
}

@media (max-width: 768px) {
	.slider img {
		width: 150px;
		height: auto;
		margin: 0 3px;
	}
	.btn1 {
		padding: 8px 12px;
		font-size: 16px;
	}
	.title {
		font-size: 24px;
		margin-top: 40px;
		margin-bottom: 15px;
	}
}

@media (max-width: 576px) {
	.slider-wrapper {
		overflow-x: auto;
		-webkit-overflow-scrolling: touch;
	}
	.slider {
		flex-wrap: nowrap;
	}
}

@media (max-width: 480px) {
	.slider img {
		width: 120px;
		height: auto;
	}
	.btn1 {
		padding: 6px 10px;
		font-size: 14px;
	}
	.container1 {
		width: 100%;
		overflow-x: auto;
	}
	.sticky-note {
		width: 40px;
		right: 5px;
	}
	.sticky-notes {
		right: 60px;
		width: 40px;
	}
	ul.breadcrumb {
		font-size: 14px;
	}
}

/* Hide navigation buttons on tablets and mobile */
@media (max-width: 991px) {
  .btn1 {
    display: none !important;
  }
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

			<!-- Show loading message until data is available -->
			<div ng-if="!getAllActiveDailyDarshan.length"
				class="text-center my-5">
				<p>Loading daily darshan data...</p>
			</div>

			<!-- Pushtimargiya Utsav Header Section with Month & Year Dropdowns -->
			<section class="py-3" style="background-color: lightgrey;">
				<div class="container">
					<div class="row align-items-center">
						<!-- Title -->
						<div class="col-md-6 col-sm-12 text-white">
							<!-- <h2 class="mb-0" style="font-weight: bold;">પુષ્ટિમાર્ગીય
								ઉત્સવ</h2> -->
						</div>

						<!-- Dropdowns -->
						<div
							class="col-md-6 col-sm-12 text-md-end text-sm-start mt-2 mt-md-0">
							<div class="d-inline-block me-2">
								<select class="form-select w-auto" style="min-width: 150px;"
									ng-model="selectedMonth">
									<option value="">Select Month</option>
									<option value="{{month.value}}" ng-repeat="month in months">
										{{month.label}}</option>
								</select>
							</div>
							<div class="d-inline-block">
								<select class="form-select w-auto" style="min-width: 120px;"
									ng-model="selectedYear">
									<option value="">Select Year</option>
									<option ng-repeat="year in years" value="{{year}}">{{year}}</option>
								</select>
							</div>
						</div>
					</div>
				</div>
			</section>

			<div class="container" ng-if="getAllActiveDailyDarshan"
				ng-repeat="dailyDarshan in getAllActiveDailyDarshan | filter:filterDarshan | orderBy:'-dailyDarshanId'">
				<div class="title text-center text-wrap fw-bold fs-5">{{
					dailyDarshan.dailyDarshanTitle }}, {{ dailyDarshan.dailyDarshanDay
					}}, {{ dailyDarshan.dailyDarshanDate | dateFormat1 }}</div>

				<div class="container1">
					<div class="slider-wrapper">
						<button class="btn1 btn-left" ng-click="moveSlide($index, -1)"
							style="background: rgba(0, 0, 0, 0.5); color: white;">&#10094;</button>
						<!-- Previous Button -->
						<div class="slider" id="slider-{{$index}}">
							<img ng-repeat="image in dailyDarshan.dailyDarshanImages"
								ng-src="<%=request.getContextPath()%>/resources/front/img/DailyDarshan/{{image.dailyDarshanImages}}"
								ng-if="image.dailyDarshanImages && image.dailyDarshanImages.trim() !== ''"
								alt="Darshan Image">
						</div>
						<button class="btn1 btn-right" ng-click="moveSlide($index, 1)"
							style="background: rgba(0, 0, 0, 0.5); color: white;">&#10095;</button>
						<!-- Next Button -->
					</div>
				</div>
			</div>
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