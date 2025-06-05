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
<script src="https://code.jquery.com/jquery-3.3.1.js"
	integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
	crossorigin="anonymous">
	
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

.artibtn {
	margin: auto;
	border-radius: 2px;
	align-items: center;
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

/*Cart*/
.cart-table th, .cart-table td {
	vertical-align: middle;
	text-align: center;
}

.total-price-row {
	background-color: #e9f5e9;
	font-weight: bold;
}

.checkout-container {
	margin-top: 15px;
}

.action-btn {
	display: flex;
	justify-content: center;
}

/*Checkout*/
/* Progress Bar */
.progress-bar-custom {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin: 30px 0;
	position: relative;
}

.progress-bar-step {
	text-align: center;
	font-size: 1rem;
	font-weight: 500;
}

.progress-circle {
	width: 50px;
	height: 50px;
	border-radius: 50%;
	background-color: #ddd;
	color: #555;
	display: flex;
	justify-content: center;
	align-items: center;
	font-size: 1.2rem;
	font-weight: bold;
	margin: 0 auto;
}

.progress-circle.active {
	background-color: #444;
	color: white;
}

.progress-bar-line {
	height: 3px;
	background: #ddd;
	flex: 1;
	margin: 0 10px;
	position: relative;
}

.progress-bar-line.active {
	background: #444;
}

/* Form Sections */
.box {
	background: white;
	border: 1px solid #e3e3e3;
	border-radius: 10px;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
	padding: 25px;
	margin-bottom: 20px;
}

.box h5 {
	font-size: 1.3rem;
	color: #333;
	text-align: center;
	margin-bottom: 20px;
	text-transform: uppercase;
}

.form-control {
	border-radius: 8px;
	border: 1px solid #ddd;
	box-shadow: inset 0 2px 5px rgba(0, 0, 0, 0.05);
}

.btn {
	border-radius: 8px;
	padding: 10px 20px;
	font-size: 1rem;
}

.btn-success {
	background: linear-gradient(90deg, #28a745, #5bc256);
	border: none;
	color: white;
}

.btn-primary {
	background: linear-gradient(90deg, #007bff, #4299e1);
	border: none;
	color: white;
}

.btn-outline-primary {
	border: 2px solid #007bff;
	color: #007bff;
}

.btn-outline-primary:hover {
	background: #007bff;
	color: white;
}

/* Order Summary */
.order-summary {
	background-color: #f9f9f9;
	padding: 20px;
	border-radius: 10px;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
}

.order-summary h5 {
	font-size: 1.4rem;
	color: #333;
	text-align: center;
	margin-bottom: 20px;
}

.order-summary p {
	font-size: 1.1rem;
	margin-bottom: 10px;
}

.order-summary .total-price {
	font-weight: bold;
	font-size: 1.2rem;
	color: #333;
	text-align: center;
}

/* Ensures radio buttons are aligned properly */
.radio-group {
	display: flex;
	align-items: center;
	gap: 15px; /* Space between items */
}

/* Styles for labels to keep them aligned */
.radio-group label {
	display: flex;
	align-items: center;
	gap: 5px; /* Space between radio button and text */
	font-size: 16px;
}

/* Optional: Increase radio button size */
.radio-group input[type="radio"] {
	width: 16px;
	height: 16px;
}
</style>

</head>

<body>
	<div class="body ">
		<div class="sticky-note">
			<div class="sticky-note-content">
				<a href="tel:+91-9824332016"
					class="text-4 text-color-light text-color-hover-primary font-weight-light mb-0">
					<img src="resources/front/images/whtpp.svg" height="40px"
					width="40px" alt=""> <!-- <img width="180%"  src="Website-Photos/market-svg/inquiry-1.png" > -->
					<!-- <h3>Important Note</h3>
					  <p>This is a sticky note on the side of the website.</p> -->
				</a>
			</div>
		</div>
		<div class="sticky-notes">
			<div class="sticky-note-contents">

				<div id="google_translate_element"></div>
			</div>
		</div>
		<!-- 	<div class="header" id="Header"></div> -->
		<%@include file="header.jsp"%>
		<!-- <div role="main" class="main"> -->
		<!-- <div class="header" id="myHeader"></div> -->
		<section
			class="page-header page-header-modern  bg-tertiary border-0 my-0 "
			style="background-color: #ffad28 !important;">
			<div class="container my-3">
				<div class="row p-4">
					<div
						class="col-md-12 align-self-center p-static order-2 text-center">
						<h1 class="font-weight-bold text-10">Checkout</h1>
					</div>
					<div class="col-md-12 align-self-center order-1">
						<ul class="breadcrumb breadcrumb-light d-block text-center">
							<li><a href="<%=request.getContextPath()%>/">Home</a></li>
							<li class="active">Checkout</li>
						</ul>
					</div>
				</div>
			</div>
		</section>

		<!-- Progress Steps -->
		<div class="container" ng-controller="checkoutCtrl">
			<!-- <div class="progress-bar-custom" style="margin-right: 311px;"> -->
			<div class="progress-bar-custom">
				<div class="progress-bar-step">
					<div class="progress-circle active">1</div>
					Email Login
				</div>
				<div class="progress-bar-line active"></div>
				<div class="progress-bar-step">
					<div class="progress-circle">2</div>
					Delivery Address
				</div>
				<div class="progress-bar-line"></div>
				<div class="progress-bar-step">
					<div class="progress-circle">3</div>
					Order Summary
				</div>
				<div class="progress-bar-line"></div>
				<div class="progress-bar-step">
					<div class="progress-circle">4</div>
					Payment Options
				</div>
			</div>

			<!-- Main Content -->
			<div class="row mt-5">
				<!-- Login Section -->
				<div
					class="col-12 col-md-6 d-flex justify-content-center mb-4 mb-md-0">
					<div class="box w-100" style="max-width: 400px;">
						<h4>Sign In with Shree Kubereshwar Mahadev?</h4>
						<div class="mb-3">
							<input type="text" class="form-control" placeholder="Email"
								ng-model="email" />
						</div>
						<div class="mb-3">
							<input type="password" class="form-control"
								placeholder="Password" ng-model="password"
								ng-keypress="$event.which === 13 && checkoutLogin()" />
						</div>
						<div class="d-grid">
							<button class="btn btn-dark" ng-click="checkoutLogin()">Login</button>
						</div>
						<div class="text-center my-3">OR</div>
						<div class="text-center">
							<button class="btn btn-outline-dark" data-bs-toggle="modal"
								data-bs-target="#guestModal">Continue as a guest user</button>
						</div>
					</div>
				</div>

				<!-- Register Section -->
				<div class="col-12 col-md-6 d-flex justify-content-center">
					<div class="box w-100" style="max-width: 500px;">
						<h4>Sign Up with Shree Kubereshwar Mahadev.</h4>
						<div class="row mb-3">
							<div class="col-12 col-sm-6 mb-2 mb-sm-0">
								<input type="text" class="form-control" placeholder="First name"
									ng-model="firstName" />
							</div>
							<div class="col-12 col-sm-6">
								<input type="text" class="form-control" placeholder="Last name"
									ng-model="lastName" />
							</div>
						</div>
						<div class="mb-3">
							<input type="text" class="form-control"
								placeholder="Mobile Number" ng-model="mobile" />
						</div>
						<div class="mb-3">
							<label class="form-label d-block">Gender:</label>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio" name="gender"
									ng-model="genderId" value="0" id="genderMale" required /> <label
									class="form-check-label" for="genderMale">Male</label>
							</div>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio" name="gender"
									ng-model="genderId" value="1" id="genderFemale" required /> <label
									class="form-check-label" for="genderFemale">Female</label>
							</div>
						</div>
						<div class="mb-3">
							<input type="email" class="form-control" ng-model="signUpEmail"
								placeholder="Enter Email Address" />
						</div>
						<div class="mb-3">
							<input type="password" class="form-control"
								ng-model="signUpPassword" placeholder="Password"
								ng-keypress="$event.which === 13 && checkoutSignUp()" />
						</div>
						<div class="d-grid">
							<button class="btn btn-dark" ng-click="checkoutSignUp()">Register</button>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- Guest User Modal -->
		<div class="modal fade" id="guestModal" tabindex="-1"
			aria-labelledby="guestModalLabel" aria-hidden="true"
			ng-controller="checkoutCtrl">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="guestModalLabel">Guest User
							Registration</h5>
						<span class="fa fa-times close"
							style="margin-left: auto; cursor: pointer;"
							ng-click="guestUserClose()" aria-label="Close"></span>
						<!-- <button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button> -->
					</div>
					<div class="modal-body">
						<form>
							<div class="mb-3">
								<input id="guestFirstName" name="guestFirstName" type="text"
									class="form-control" placeholder="First Name"
									ng-model="guestFirstName">
							</div>
							<div class="mb-3">
								<input id="guestLastName" name="guestLastName" type="text"
									class="form-control" placeholder="Last Name"
									ng-model="guestLastName">
							</div>
							<div class="mb-3">
								<input id="guestemail" name="guestemail" type="email"
									class="form-control" placeholder="Email Address"
									ng-model="guestemail">
							</div>
							<div class="mb-3">
								<input id="guestmobileno" name="guestmobileno" type="text"
									class="form-control" placeholder="Mobile Number"
									ng-model="guestmobileno">
							</div>
						</form>
					</div>
					<div class="modal-footer">
						<div class="d-grid">
							<button class="btn" ng-click="guestUser()"
								style="background-color: black; color: white;">Continue</button>
						</div>
						<div class="d-grid">
							<button class="btn" ng-click="guestUserClose()"
								style="background-color: black; color: white;">Close</button>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- 	<div id="footer"></div> -->
		<%@include file="footer.jsp"%>

		<script src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY"></script>
		<script>
			/*  $(function () {
			     $(".header").load("header.html");
			     $("#footer").load("footer.html");
			 });
			 */
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

	</div>
</body>


</html>