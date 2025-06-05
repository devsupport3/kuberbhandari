<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html ng-app="kuberbhandari">

<head>

<!-- Basic -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Shree Kubereshwar Mahadev, Karnali, Dist. Vadodara, Gujarat, India</title>

<meta name="keywords"
	content="Shree Kubereshwar Mahadev, Shree Kuber Bhandari, Karnali, Shree Someshwwar Mahadev" />
<meta name="description"
	content="Shree Kubereshwar Mahadev, Shree Kuber Bhandari, Karnali, Shree Someshwwar Mahadev">
<meta name="author" content="www.AstarTechnologies.net">

<!-- Favicon -->
<link rel="shortcut icon" href="resources/front/img/favicon.ico" type="image/x-icon" />
<link rel="apple-touch-icon" href="resources/front/img/apple-touch-icon.png">

<!-- Web Fonts  -->
<link id="googleFonts"
	href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700%7CPlayfair+Display:400,700,900&display=swap"
	rel="stylesheet" type="text/css">

<!-- Vendor CSS -->
<link rel="stylesheet" href="resources/front/vendor/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/front/vendor/fontawesome-free/css/all.min.css">
<link rel="stylesheet" href="resources/front/vendor/animate/animate.compat.css">
<link rel="stylesheet" href="resources/front/vendor/simple-line-icons/css/simple-line-icons.min.css">
<link rel="stylesheet" href="resources/front/vendor/owl.carousel/assets/owl.carousel.min.css">
<link rel="stylesheet" href="resources/front/vendor/owl.carousel/assets/owl.theme.default.min.css">
<link rel="stylesheet" href="resources/front/vendor/magnific-popup/magnific-popup.min.css">

<!-- Theme CSS -->
<link rel="stylesheet" href="resources/front/css/theme.css">
<link rel="stylesheet" href="resources/front/css/theme-elements.css">
<link rel="stylesheet" href="resources/front/css/theme-blog.css">
<link rel="stylesheet" href="resources/front/css/theme-shop.css">

<!-- Demo CSS -->
<link rel="stylesheet" href="resources/front/css/demos/demo-startup-agency.css">

<!-- Skin CSS -->
<link id="skinCSS" rel="stylesheet" href="resources/front/css/skins/skin-startup-agency.css">

<!-- Theme Custom CSS -->
<link rel="stylesheet" href="resources/front/css/custom.css">

<!-- Head Libs -->
<script src="resources/front/vendor/modernizr/modernizr.min.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.js"
	integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60=" crossorigin="anonymous"></script>

<!-- AngularJS -->
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.8.2/angular.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/admin/js/confAdmin.js"></script>

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

@media (max-width: 576px) {
	.cart-table th, .cart-table td {
		font-size: 12px;
		padding: 8px;
	}
	.total-price-row div {
		font-size: 14px;
	}
	.sticky-note, .sticky-notes {
		right: 10px;
		top: auto;
		bottom: 20px;
		transform: none;
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
					<img src="resources/front/images/whtpp.svg" height="40px" width="40px" alt="">
				</a>
			</div>
		</div>
		<div class="sticky-notes">
			<div class="sticky-note-contents">
				<div id="google_translate_element"></div>
			</div>
		</div>

		<%@include file="header.jsp"%>

		<section class="page-header page-header-modern bg-tertiary border-0 my-0" style="background-color: #ffad28 !important;">
			<div class="container my-3">
				<div class="row p-4">
					<div class="col-md-12 align-self-center p-static order-2 text-center">
						<h1 class="font-weight-bold text-10">Seva Booking Cart</h1>
					</div>
					<div class="col-md-12 align-self-center order-1">
						<ul class="breadcrumb breadcrumb-light d-block text-center">
							<li><a href="<%=request.getContextPath()%>/">Home</a></li>
							<li class="active">Seva Booking Cart</li>
						</ul>
					</div>
				</div>
			</div>
		</section>

		<div class="container my-5" ng-controller="cartCtrl">
			<div class="table-responsive">
				<table class="table table-bordered table-striped cart-table">
					<thead class="table-success">
						<tr>
							<th style="background-color: #444; color: white;">Seq. No.</th>
							<th style="background-color: #444; color: white;">Seva Name</th>
							<th style="background-color: #444; color: white;">Variation</th>
							<th style="background-color: #444; color: white;">Frequency</th>
							<th style="background-color: #444; color: white;">Quantity</th>
							<th style="background-color: #444; color: white;">Booking Date</th>
							<th style="background-color: #444; color: white;">Price</th>
							<th style="background-color: #444; color: white;">Delivery Available</th>
							<th style="background-color: #444; color: white;"></th>
						</tr>
					</thead>
					<tbody>
						<tr ng-repeat="seva in cartItems track by $index">
							<td>{{$index + 1}}</td>
							<td>{{seva.orderSevaTitle}}</td>
							<td>{{seva.orderVariationName}}</td>
							<td>{{seva.orderFrequencyName}}</td>
							<td>{{seva.orderSevaQuantity}}</td>
							<td>{{seva.bookingDate}}</td>
							<td>&#8377;{{seva.orderSevaPrice * seva.orderSevaQuantity}}</td>
							<td>{{seva.orderDelivery}}</td>
							<td class="action-btn">
								<button class="btn btn-danger btn-sm" ng-click="removeItem(seva)">
									<i class="fas fa-trash-alt"></i>
								</button>
							</td>
						</tr>
					</tbody>
				</table>
			</div>

			<!-- Total Price Row -->
			<div class="row total-price-row p-2 text-white" style="background-color: #444; margin: 10px -1px;">
				<div class="col-6 col-md-8 text-end text-md-end text-start">Total Price:</div>
				<div class="col-6 col-md-4 text-center text-md-center text-start">
					&#8377; {{getTotalPrice()}}
				</div>
			</div>

			<!-- Checkout Button -->
			<div class="row checkout-container justify-content-end">
				<div class="col-12 col-sm-auto text-end">
					<button class="btn btn-primary w-100 w-sm-auto mt-3"
						style="background-color: #444; color: white; border-color: #444;"
						ng-click="goToCheckout()">Checkout</button>
				</div>
			</div>
		</div>

		<%@include file="footer.jsp"%>

		<script src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY"></script>
		<script>
			window.onscroll = function () {
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
