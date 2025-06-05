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
/***********************/
.table th, .table td {
	vertical-align: middle;
	text-align: center;
}

.card {
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.clickable-row {
	cursor: pointer;
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
						<h1 class="font-weight-bold text-10">Order History</h1>
					</div>
					<div class="col-md-12 align-self-center order-1">
						<ul class="breadcrumb breadcrumb-light d-block text-center">
							<li><a href="<%=request.getContextPath()%>/">Home</a></li>
							<li class="active">Order History</li>
						</ul>
					</div>
				</div>
			</div>
		</section>

		<div class="container" ng-controller="AdminBookingCtrl"
			ng-init="getAllOrderDetailsByUserId()" style="margin-top: 15px;">

			<div class="row">
				<!-- Order Summary Table -->
				<div class="col-12 col-lg-8 mx-auto" style="width: 100.666667%;">
					<div class="table-responsive">
						<table class="table table-bordered table-hover">
							<thead class="table-primary">
								<tr>
									<th style="background-color: #444; color: white;">Order
										ID/Trans. Date</th>
									<th style="background-color: #444; color: white;">Order
										By/Mobile No.</th>
									<th style="background-color: #444; color: white;">Total
										Amount</th>
									<th style="background-color: #444; color: white;">Performance
										date</th>
									<th style="background-color: #444; color: white;">Payment
										Status</th>
								</tr>
							</thead>
							<tbody>
								<tr ng-click="toggleDetails(item, orderDetails)"
									ng-repeat-start="item in orderDetails"
									ng-class="{'table-warning': item.showDetails}">
									<td class="text-center">
										<div>{{ item.orderNumber }}/</div>
										<div>{{ item.orderDate }}</div>
									</td>
									<td class="text-center">
										<div>{{item.billerName}}/</div>
										<div>{{item.billerMobileno}}</div>
									</td>
									<td class="text-center">{{item.totalAmount}}</td>
									<td class="text-center">
										<div>{{ item.orderSevaDetailsList[0].bookingDate }}</div>
									</td>
									<td class="text-center">{{item.paymentStatus}}</td>
								</tr>

								<tr ng-repeat-end ng-show="item.showDetails">
									<td colspan="6">
										<h5 class="text-center">Booking Summary</h5> <!-- Seva Summary Table -->
										<div class="table-responsive">
											<table class="table table-bordered table-striped mt-3">
												<thead>
													<tr class="text-center">
														<th>#</th>
														<th>Seva Name</th>
														<th>Variation</th>
														<th>Frequency</th>
														<th>Quantity</th>
														<th>Amount</th>
														<th>Delivery</th>
													</tr>
												</thead>
												<tbody>
													<tr ng-repeat="sevaItem in item.orderSevaDetailsList"
														class="text-center">
														<td>{{$index + 1}}</td>
														<td>{{sevaItem.orderSevaTitle}}</td>
														<td>{{sevaItem.variationName}}</td>
														<td>{{sevaItem.frequencyName}}</td>
														<td>{{sevaItem.orderSevaQuantity}}</td>
														<td>{{sevaItem.orderSevaPrice}}</td>
														<td>{{sevaItem.orderDelivery}}</td>
													</tr>
												</tbody>
											</table>
										</div> <!-- Billing and Payment Info -->
										<div class="row mt-3">
											<div class="col-md-6 mb-3">
												<div class="border p-2">
													<strong>Payment Details:</strong>
													<p class="mb-1">Payment Method: {{item.paymentMode}}</p>
													<p class="mb-1">Transaction ID: {{item.trackingId}}</p>
												</div>
											</div>
											<div class="col-md-6 mb-3">
												<div class="border p-2">
													<strong>Bill To:</strong>
													<p class="mb-1">{{item.billerName}}</p>
													<p class="mb-1">{{item.billerAddress1}},
														{{item.billerAddress2}}</p>
													<p class="mb-1">{{item.billerCityName}},
														{{item.billerStateName}}</p>
													<p class="mb-1">{{item.billerCountryName}},
														{{item.billerPincode}}</p>
													<p class="mb-1">Email: {{item.billerEmailid}}</p>
													<p class="mb-1">Phone: {{item.billerMobileno}}</p>
												</div>
											</div>
										</div>

									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>

		<%@include file="footer.jsp"%>

		<!-- Bootstrap JS and jQuery -->
		<script
			src="resources/front/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>


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


	</div>
</body>


</html>