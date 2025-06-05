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
	background-color: #007bff;
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
	background: #007bff;
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

/*payment option*/
.card {
	border: 1px solid #ccc;
	border-radius: 5px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.card-header {
	background-color: #f8f9fa;
	padding: 15px;
	border-bottom: 1px solid #ccc;
}

.card-body {
	padding: 20px;
}

.form-label {
	font-weight: bold;
}

.btn-primary {
	background-color: #007bff;
	border-color: #007bff;
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
						<h1 class="font-weight-bold text-10">Payment Option</h1>
					</div>
					<div class="col-md-12 align-self-center order-1">
						<ul class="breadcrumb breadcrumb-light d-block text-center">
							<li><a href="<%=request.getContextPath()%>/">Home</a></li>
							<li class="active">Payment Option</li>
						</ul>
					</div>
				</div>
			</div>
		</section>

		<!-- Progress Steps -->
		<div class="container">
			<div class="progress-bar-custom" style="margin-right: 404px;">
				<div class="progress-bar-step">
					<div class="progress-circle">1</div>
					Email Login
				</div>
				<div class="progress-bar-line "></div>
				<div class="progress-bar-step">
					<div class="progress-circle">2</div>
					Delivery Address
				</div>
				<div class="progress-bar-line"></div>
				<div class="progress-bar-step">
					<div class="progress-circle">3</div>
					Order Summary
				</div>
				<div class="progress-bar-line active"
					style="background-color: #444;"></div>
				<div class="progress-bar-step">
					<div class="progress-circle  active"
						style="background-color: #444;">4</div>
					Payment Options
				</div>
			</div>

			<!-- Main Content -->
			<div class="row">

				<div class="container">
					<div class="row">
						<div class="col-md-8" ng-controller="deliveryAddressCtrl">
							<input type="hidden" ng-model="billerAddress.countryName">
							<div class="card">
								<!-- Delivery Address Section with Checkbox -->
								<div class="card-header"
									style="background-color: #555; color: #e9f5e9;">
									<h4 style="color: white !important; margin-bottom: 5px;">Biller
										Information</h4>
									<div class="d-flex justify-content-end"
										ng-show="deliveryEnabled">
										<div style="margin-top: -29px;">
											<label class="form-check-label" for="sameAsDelivery">Same
												as Delivery Address</label> <input type="checkbox"
												class="form-check-input" id="sameAsDelivery"
												ng-model="sameAsDeliveryAddress"
												ng-change="getDeliveryAddress()">
										</div>
									</div>
								</div>
								<div class="card-body">
									<div class="row">
										<div class="col-md-4">
											<div class="mb-3">
												<label for="name" class="form-label">Full Name</label> <input
													type="text" class="form-control" id="name"
													ng-model="billerAddress.fullName">
											</div>
											<div class="mb-3">
												<label for="address1" class="form-label">Address1</label> <input
													class="form-control" id="address1" rows="3"
													ng-model="billerAddress.address1">
											</div>
											<div class="mb-3">
												<label for="state" class="form-label">State</label> <input
													type="text" class="form-control" id="state"
													ng-model="billerAddress.stateName">
											</div>
										</div>
										<div class="col-md-4">
											<div class="mb-3">
												<label for="email" class="form-label">Email</label> <input
													type="email" class="form-control" id="email"
													ng-model="billerAddress.emailId">
											</div>
											<div class="mb-3">
												<label for="address2" class="form-label">Address2</label> <input
													class="form-control" id="address2" rows="3"
													ng-model="billerAddress.address2">
											</div>
											<div class="mb-3">
												<label for="city" class="form-label">City</label> <input
													type="text" class="form-control" id="city"
													ng-model="billerAddress.cityName">
											</div>
										</div>
										<div class="col-md-4">
											<div class="mb-3">
												<label for="mobile" class="form-label">Mobile No.</label> <input
													type="tel" class="form-control" id="mobile"
													ng-model="billerAddress.mobileNo">
											</div>
											<div class="mb-3">
												<label for="country" class="form-label">Country</label> <select
													class="form-select" id="country"
													ng-model="billerAddress.countryId"
													aria-label="Default select example">
													<option value="" disabled selected>Select Country</option>
													<option ng-repeat="country in countries"
														ng-value="{{country.countryId}}">{{country.countryName}}</option>
												</select>
											</div>
											<div class="mb-3">
												<label for="pincode" class="form-label">Pincode</label> <input
													type="text" class="form-control" id="pincode"
													ng-model="billerAddress.pincode">
											</div>
										</div>
									</div>
									<div class="d-flex justify-content-end"
										ng-controller="paymentOptionCtrl">
										<button type="button" class="btn btn-ghost"
											style="font-weight: 100; background: #333; color: white; font-family: 'Roboto', sans-serif;"
											ng-click="onCCAvenueSubmit('online', billerAddress)">
											Pay Now</button>
									</div>
								</div>
							</div>
						</div>
						<!-- Order Summary Total-->
						<div class="col-md-4">
							<div class="order-summary" ng-controller="cartCtrl"
								style="margin-left: 28px; margin-right: 18px; border: 1px solid #ddd; padding: 20px; border-radius: 8px; margin-top: 14px;">
								<h5>Order Summary</h5>
								<p>
									Item Qty: <span class="float-end">{{getAllItemsQuantity()}}</span>
								</p>
								<p>
									Sub Total: <span class="float-end">&#8377;{{getTotalPrice()}}</span>
								</p>
								<!-- <hr>
								<p class="total-price" style="font-weight: bold;">TOTAL:
									&#8377; 2,600.00</p> -->
							</div>
							<br>
							<div ng-controller="deliveryAddressCtrl">
								<div class="card-header" ng-if="deliveryEnabled"
									style="margin-left: 28px; margin-right: 18px; border: 1px solid #ddd; padding: 20px; border-radius: 8px;">
									<h4 style="text-align: center;">Delivery Address</h4>
									<p class="mb-1">Name: {{ deliveryAddress.fullName }}</p>
									<p class="mb-1">Email: {{ deliveryAddress.emailId }}</p>
									<p class="mb-1">Mobile No.: {{ deliveryAddress.mobileNo }}</p>
									<p class="mb-1">Address: {{ deliveryAddress.address1 }}</p>
									<p class="mb-1">{{ deliveryAddress.cityName }}, {{
										deliveryAddress.stateName }}, {{ deliveryAddress.countryName
										}}</p>
									<p class="mb-1">{{ deliveryAddress.pincode }}</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<%@include file="footer.jsp"%>


		<!-- <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY"></script> -->
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


	</div>
</body>


</html>