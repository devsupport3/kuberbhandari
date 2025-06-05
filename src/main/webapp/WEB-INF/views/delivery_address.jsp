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

/*Delivery Address*/
.delivery-container {
	max-width: 1000px;
	margin: 40px auto;
	padding: 20px;
	background-color: #333;
	color: white;
	border-radius: 8px;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

.address-card {
	background-color: #444;
	padding: 15px;
	border-radius: 8px;
	margin: 10px;
	position: relative;
	flex: 1;
}

.address-card h5 {
	margin-bottom: 10px;
}

.address-card .close-btn {
	position: absolute;
	top: 10px;
	right: 10px;
	background: none;
	border: none;
	color: white;
	font-size: 18px;
	cursor: pointer;
}

.btn-deliver {
	background-color: #ff6f00;
	border: none;
	color: white;
	border-radius: 5px;
	padding: 10px 20px;
}

.btn-deliver:hover {
	background-color: #e65c00;
}

.address-row {
	display: flex;
	flex-wrap: wrap;
	gap: 20px;
}

.add-address-btn {
	position: absolute;
	top: 20px;
	right: 20px;
}

.modal-content {
	background-color: #333;
	color: white;
}

.modal-header {
	border-bottom: 1px solid #444;
}

.modal-footer {
	border-top: 1px solid #444;
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
						<h1 class="font-weight-bold text-10">Delivery Address</h1>
					</div>
					<div class="col-md-12 align-self-center order-1">
						<ul class="breadcrumb breadcrumb-light d-block text-center">
							<li><a href="<%=request.getContextPath()%>/">Home</a></li>
							<li class="active">Delivery Address</li>
						</ul>
					</div>
				</div>
			</div>
		</section>

		<!-- Progress Steps -->
		<div class="container">
			<div class="progress-bar-custom">
				<div class="progress-bar-step">
					<div class="progress-circle">1</div>
					Email Login
				</div>
				<div class="progress-bar-line active"></div>
				<div class="progress-bar-step">
					<div class="progress-circle active">2</div>
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
		</div>

		<div class="container delivery-container position-relative"
			ng-controller="deliveryAddressCtrl" ng-init="loadAddresses()">
			<button class="btn btn-primary add-address-btn"
				data-bs-toggle="modal" data-bs-target="#addAddressModal"
				style="background-color: #444;">Add New Delivery Address</button>

			<div class="row" style="margin-top: 72px;">
				<div class="address-row col-lg-4 col-md-6 col-sm-12"
					ng-repeat="address in addresses track by address.userAddressId">
					<div class="address-card">
						<button class="close-btn"
							ng-click="removeAddress(address.userAddressId)">&times;</button>
						<h5 style="color: white;">{{ address.fullName }}</h5>
						<p style="color: white;">
							<strong>Mail:</strong> {{ address.emailId }}
						</p>
						<p style="color: white;">
							<strong>Mobile:</strong> {{ address.mobileNo }}
						</p>
						<p style="color: white;">
							<strong>Address:</strong> {{ address.address1 }}
						</p>
						<p style="color: white;">
							<strong></strong> {{ address.cityName }}, {{ address.stateName
							}}, {{ address.countryName }}
						</p>
						<p style="color: white;">
							<strong>Pincode:</strong> {{ address.pincode }}
						</p>
						<button class="btn btn-deliver w-100"
							style="background-color: black; color: white;"
							ng-click="selectAddress(address.userAddressId)">Deliver
							Here</button>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Add Address Modal -->
	<div class="modal fade" id="addAddressModal" tabindex="-1"
		aria-labelledby="addAddressModalLabel" aria-hidden="true"
		ng-controller="deliveryAddressCtrl">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="addAddressModalLabel">Add New
						Delivery Address</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form>
						<!-- Personal Information Section -->
						<div class="row mb-4">
							<div class="col-lg-6">
								<label class="form-label">Name</label> <input type="text"
									class="form-control" id="name" placeholder="Enter Name"
									ng-model="newAddress.fullName">
							</div>
							<div class="col-lg-6">
								<label class="form-label">Email</label> <input type="email"
									class="form-control" id="email" placeholder="Enter email"
									ng-model="newAddress.emailId">
							</div>
						</div>

						<div class="row mb-4">
							<div class="col-lg-6">
								<label class="form-label">Mobile No.</label> <input type="text"
									class="form-control" id="mobile"
									placeholder="Enter mobile number"
									ng-model="newAddress.mobileNo">
							</div>
							<div class="col-lg-6">
								<label class="form-label">Address Line 1</label> <input
									type="text" class="form-control" id="address1"
									placeholder="Enter address line 1"
									ng-model="newAddress.address1">
							</div>
						</div>

						<!-- Address Section -->
						<div class="row mb-4">
							<div class="col-lg-6">
								<label class="form-label">Address Line 2</label> <input
									type="text" class="form-control" id="address2"
									placeholder="Enter address line 2"
									ng-model="newAddress.address2">
							</div>
							<div class="col-lg-6">
								<label class="form-label">Country</label> <select id="country"
									name="country" class="form-select"
									ng-model="newAddress.countryId">
									<option value="" disabled selected>Select country</option>
									<option ng-repeat="country in countries"
										ng-value="{{country.countryId}}">{{country.countryName}}</option>
								</select>
							</div>
						</div>

						<!-- State and City Section -->
						<div class="row mb-4">
							<div class="col-lg-6">
								<label class="form-label">State</label> <input type="text"
									class="form-control" ng-model="newAddress.stateName"
									placeholder="Enter State" required>
								<!-- <select
										class="form-select" ng-model="newAddress.state" required>
										<option value="">Select state</option>
										<option value="1">Gujarat</option>
										<option value="2">Maharashtra</option>
										<option value="3">Rajasthan</option>
									</select> -->
							</div>
							<div class="col-lg-6">
								<label class="form-label">City</label> <input type="text"
									class="form-control" ng-model="newAddress.cityName"
									placeholder="Enter City" required>
							</div>
						</div>

						<div class="row mb-4">
							<div class="col-lg-6">
								<label class="form-label">Pincode</label> <input type="text"
									class="form-control" ng-model="newAddress.pincode"
									placeholder="Enter pincode" required>
							</div>
						</div>
					</form>
				</div>

				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal"
						style="background-color: black; color: white; border-color: black;">Close</button>
					<button type="button" class="btn btn-primary"
						ng-click="addAddress()"
						style="background-color: black; color: white; border-color: black;">Add
						Address</button>
				</div>
			</div>
		</div>
	</div>

	<%@include file="footer.jsp"%>

	<script src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY"></script>
	<script>
		/*  $(function () {
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

	</div>
</body>
</html>