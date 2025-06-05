<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

<!-- Basic -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>The Trust</title>

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
						<h1 class="font-weight-bold text-10">The Trust</h1>
					</div>
					<div class="col-md-12 align-self-center order-1">
						<ul class="breadcrumb breadcrumb-light d-block text-center">
							<li><a href="<%=request.getContextPath()%>/">Home</a></li>
							<li class="active">The Trust</li>
						</ul>
					</div>
				</div>
			</div>
		</section>


		<!-- List of Pujari Trustees Starts -->
		<div
			class="container position-relative z-index-3 pt-md-5 pb-1 pb-sm-5 my-5">
			<div class="row justify-content-center pt-5">
				<div class="col-lg-12 text-center">
					<span
						class="text-color-grey positive-ls-2 font-weight-medium custom-font-size-2 d-block mb-1 appear-animation"
						data-appear-animation="fadeInUpShorter"
						data-appear-animation-delay="200">the trust</span>
					<h2 class="font-weight-bold text-10 mb-4 appear-animation"
						data-appear-animation="fadeInUpShorter"
						data-appear-animation-delay="400">Shree Kubereshwar Someshwar
						Sanyukt Sansthan Trust</h2>
					<p class="custom-font-size-2 font-weight-light appear-animation"
						data-appear-animation="fadeInUpShorter"
						data-appear-animation-delay="600">In 1952, Shri Gajanan
						Shankarlal Bhatt, one of the pujaris registered Shree Kubereshwar
						Someshwar Sanyukt Sansthan. During due course of time and
						requirements set by the state government, in 1962 a Scheme was
						framed for the trust and till date is being followed through due
						changes and ammendments. As per the existing scheme, there are
						nine trustees of the trust. Out of which 4 trustees are pujari
						trustees who are from 7 inherited pujaris and 5 trustees are
						individual trustees who are appointed by trustees.</p>
				</div>
			</div>
		</div>
		<!-- List of Pujari Trustees Ends -->
	</div>

	<%@include file="footer.jsp"%>

	<script src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY"></script>
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


</body>
</html>