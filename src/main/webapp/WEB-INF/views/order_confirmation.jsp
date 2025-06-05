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

/*Order confirmation*/
/* General Styles */
body {
	font-family: 'Arial', sans-serif;
	background-color: #f8f9fa;
	margin: 0;
	padding: 0;
}

.container {
	max-width: 1200px;
	margin: auto;
	padding: 20px;
}

/* Order Confirmation Box */
.cart {
	background: #ffffff;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
}

.oaerror.info {
	background: #d9edf7;
	padding: 15px;
	border-radius: 5px;
	border-left: 5px solid #31708f;
	color: #31708f;
}

/* Order Details */
.panel-body {
	background: #fff;
	padding: 15px;
	border-radius: 5px;
	box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
}

.table {
	width: 100%;
	background: #fff;
	border-collapse: collapse;
}

.table th, .table td {
	padding: 12px;
	text-align: left;
	border-bottom: 1px solid #ddd;
}

.table th {
	background: #f1f1f1;
	font-weight: bold;
	text-align: center;
}

.table td.text-right {
	text-align: right;
}

/* Address and Payment Details */
.panel-table {
	border-radius: 8px;
	box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
	padding: 10px;
	background: #ffffff;
}

.address-text p {
	font-size: 16px;
	line-height: 1.6;
	margin: 10px 0;
}

/* Buttons */
.btn-primary, .btn-success, .btn-danger {
	padding: 10px 15px;
	font-size: 16px;
	border-radius: 5px;
	display: inline-block;
	text-decoration: none;
	text-align: center;
}

.btn-primary {
	background: #007bff;
	color: white;
	border: none;
}

.btn-success {
	background: #28a745;
	color: white;
	border: none;
}

.btn-danger {
	background: #dc3545;
	color: white;
	border: none;
}

.btn-primary:hover, .btn-success:hover, .btn-danger:hover {
	opacity: 0.9;
}

/* Responsive Design */
@media ( max-width : 768px) {
	.col-md-6, .col-md-4, .col-xs-12 {
		width: 100%;
		margin-bottom: 15px;
	}
	.table th, .table td {
		padding: 8px;
		font-size: 14px;
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
						<h1 class="font-weight-bold text-10">Order Confirmation</h1>
					</div>
					<div class="col-md-12 align-self-center order-1">
						<ul class="breadcrumb breadcrumb-light d-block text-center">
							<li><a href="<%=request.getContextPath()%>/">Home</a></li>
							<li class="active">Order Confirmation</li>
						</ul>
					</div>
				</div>
			</div>
		</section>

		<div class="container" ng-controller="orderConfirmationCtrl"
				ng-init="getorderdetail('<%=session.getAttribute("ordernumber")%>')">

			<div class="cart" style="padding-top: 2%;"
				ng-if="'<%=session.getAttribute("orderStatus")%>' == 'Success'">

				<div class="oaerror info">
					<div class="row">
						<div class="col col-xs-6">
							<h4>Your order has been successfully placed!</h4>
						</div>
						<div class="col col-xs-6 text-right">
							<h4 class="pull-right">
								Order No :
								<%=session.getAttribute("ordernumber")%></h4>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="col-md-6 ">
						<address style="font-size: large;">
							<strong> Payment Method: </strong><br> {{orderdetail[0].paymentMode}}
						</address>
					</div>
					<div class="col-md-6 text-right">
						<address style="font-size: large;">
							<strong>Order Date:</strong><br> {{orderdetail[0].orderDate}} <br>
							<br>
						</address>
					</div>
				</div>

				<div class="panel-body">
					<div class="table-responsive">
						<table style="font-size: 16px;" class="table table-condensed">
							<thead>
								<tr>
									<td style="width: 10%;" class="text-center"><strong>Image</strong></td>
									<td style="width: 35%;" class="text-center"><strong>Item</strong></td>
									<td style="width: 20%;" class="text-right"><strong>Price</strong></td>
									<td style="width: 20%;" class="text-right"><strong>Quantity</strong></td>
									<td style="width: 15%;" class="text-right"><strong>Total</strong></td>
								</tr>
							</thead>
							<tbody>
								<tr ng-repeat="item in orderSevadetails">
									<td colspan="5" style="padding: inherit;">
										<table style="font-size: 16px; width: 100%;" class="">
											<tr>
												<td></td>
												<td></td>
												<td></td>
												<!-- <td style="width: 20%;" ng-repeat="tax in ordertax"
													ng-if="item.orderProductDetailId == tax.orderProductDetailsId  && tax.taxOn == 'subtotal'">{{tax.taxName}}
													@ {{tax.taxValue}}% : {{tax.taxAmount}}</td> -->
											</tr>
											<tr>
												<td style="width: 10%;" style="padding-right: inherit;">
													<img src="<%=request.getContextPath()%>/resources/front/demo-images/imgseva/{{item.orderSevaImages}}"
													class="img-fluid"
									style="object-fit: cover; height: 100%; width: 100%;"
													alt="item1" />
												</td>
												<td style="width: 35%;"><span style="font-weight: 500;">{{item.orderSevaTitle}}</span><br>
													<span style="font-size: small;" ng-bind-html="item.orderSevaDescription | cut:true:250:' ' | to_trusted "></span><br>
													<span style="font-size: small;" Booking Date:>{{item.bookingDate}}</span></td>
												<td style="width: 20%;" class="text-right">&#8377;
													{{item.orderSevaPrice | currency : "" : 2}}</td>
												<td style="width: 20%;" class="text-right">{{item.orderSevaQuantity}}
												</td>
												<td style="width: 15%;" class="text-right">&#8377;
													{{item.orderSevaQuantity * item.orderSevaPrice |
													currency : "" : 2}}</td>
											</tr>
										</table>
									</td>
								</tr>
							<!--	<tr>
									<td class="no-line"></td>
									<td class="no-line"></td>
									<td class="no-line"></td>
									<td class="no-line text-right"><strong>Sub Total</strong></td>
									<td class="no-line text-right" ng-repeat="item in orderdetail ">&#8377;
										{{item.subtotal | currency : "" : 2}}</td>
								</tr> -->
								<!-- <tr>
									<td class="no-line"></td>
									<td class="no-line"></td>
									<td class="no-line"></td>
									<td class="no-line text-right"><strong>Discount</strong></td>
									<td class="no-line text-right" ng-repeat="item in orderdetail">&#8377;
										{{item.discountAmount | currency : "" : 2}}</td>
								</tr> -->
								<!-- <tr>
									<td class="no-line"></td>
									<td class="no-line"></td>
									<td class="no-line"></td>
									<td class="no-line text-right"><strong>Total Tax</strong></td>
									<td class="no-line text-right">&#8377; {{totalTaxAmount |
										currency : "" : 2}}</td>
								</tr> -->
								<!-- <tr>
									<td class="no-line"></td>
									<td class="no-line"></td>
									<td class="no-line"></td>
									<td class="no-line text-right"><strong>Shipping
											Charges</strong></td>
									<td class="no-line text-right" ng-repeat="item in orderdetail">&#8377;
										{{item.shippingCharges | currency : "" : 2}}</td>
								</tr> -->
								<tr>
									<td class="no-line"></td>
									<td class="no-line"></td>
									<td class="no-line"></td>
									<td class="no-line text-right"><strong>Sub Total</strong></td>
									<td class="no-line text-right">&#8377;
										{{orderdetail[0].totalAmount | currency : "" : 2}}</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>

				<div class="row">
					<div class="col-xs-12">
						<hr>
						<div class="row">
							<div class="col-md-4">
								<div class="panel panel-default panel-table">
									<div class="panel-heading">
										<div class="row">
											<div class="col col-xs-12">
												<h3 class="panel-title2">Payment Details</h3>
											</div>
										</div>
									</div>
									<div class="panel-body address-text">
										<p ng-show="item.paymentMode != 'COD'">
											<strong>Tracking ID:</strong>&nbsp;&nbsp;{{orderdetail[0].trackingId}}<br>
											<strong>Bank Ref No:</strong>&nbsp;&nbsp;{{orderdetail[0].bankReferenceNumber}}<br>
											<strong>Transaction Dt:</strong>&nbsp;&nbsp;{{orderdetail[0].orderDate}}<br>
											<strong>Bank Name:</strong>&nbsp;&nbsp;{{orderdetail[0].cardName}}<br>
											<strong>Amount Paid:</strong><i style="font-size: 14px;"
												class="fa fa-inr"></i>&nbsp;&nbsp;{{orderdetail[0].totalAmount |
											currency : "" : 2}}<br>
										</p>
									</div>
								</div>
							</div>
							<!-- <div class="col-md-4">
									<div class="panel panel-default panel-table">
										<div class="panel-heading">
											<div class="row">
												<div class="col col-xs-12">
													<h3 class="panel-title2">Shipping Address</h3>
												</div>
											</div>
										</div>
										<div class="panel-body address-text">
											<p ng-repeat="item in orderdetail"
												ng-show="item.customerAddress2 != ''">
												<strong> {{item.customerName}} </strong><br>
												{{item.customerAddress1}},<br>
												{{item.customerAddress2}},<br>
												{{item.customerCityName}}, {{item.customerStateName}} -
												{{item.customerPincode}} {{item.customerCountryName}}<br>
												<strong> Mobile : </strong> {{item.customerMobileno}}
											</p>
											<p ng-repeat="item in orderdetail"
												ng-show="item.customerAddress2 == ''">
												<strong> {{item.customerName}} </strong><br>
												{{item.customerAddress1}},<br>
												{{item.customerCityName}}, {{item.customerStateName}} -
												{{item.customerPincode}} {{item.customerCountryName}}<br>
												<strong> Mobile : </strong> {{item.customerMobileno}}
											</p>
										</div>
									</div>
								</div> -->
							<div class="col-md-4">
								<div class="panel panel-default panel-table">
									<div class="panel-heading">
										<div class="row">
											<div class="col col-xs-12">
												<h3 class="panel-title2">Billing Address</h3>
											</div>
										</div>
									</div>
									<div class="panel-body address-text">
										<p ng-show="item.billerAddress2 != ''">
											<strong> {{orderdetail[0].billerName}} </strong><br>
											{{orderdetail[0].billerAddress1}},<br> {{orderdetail[0].billerAddress2}},<br>
											{{orderdetail[0].billerCityName}}, {{orderdetail[0].billerStateName}} -
											{{orderdetail[0].billerPincode}} {{orderdetail[0].billerCountryName}} <br> <strong>
												Mobile : </strong> {{orderdetail[0].billerMobileno}}
										</p>
										<p ng-show="item.billerAddress2 == ''">
											<strong> {{orderdetail[0].billerName}} </strong><br>
											{{orderdetail[0].billerAddress1}},<br> {{orderdetail[0].billerCityName}},
											{{orderdetail[0].billerStateName}} - {{orderdetail[0].billerPincode}}
											{{orderdetail[0].billerCountryName}} <br> <strong> Mobile
												: </strong> {{orderdetail[0].billerMobileno}}
										</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div style="border-top: 1px solid #bce8f1; padding-top: 15px;"></div>
				<div class="row">
					<div class="col-md-3 col-xs-offset-9">
						<a style="width: 100%;" id="btn-fblogin"
							href="<%=request.getContextPath()%>/" class="btn btn-primary">
							Continue Shopping </a>
					</div>
				</div>
			</div>

			<div class="col col-xs-12" style="margin: 50px;"
				ng-if="'<%=session.getAttribute("orderStatus")%>' != 'Success'"<%-- ng-if="'<%=session.getAttribute("authdesc")%>' != 'Paid'" --%>>
				<h2>Thank you for shopping with us. However, the transaction
					has been declined.</h2>
			</div>

			<div class="col col-xs-12 text-center" style="margin-bottom: 50px;">
				<div class="col col-xs-6 text-center" style="margin-bottom: 20px;"
					ng-if="'<%=session.getAttribute("orderStatus")%>' != 'Success'"<%-- ng-if="'<%=session.getAttribute("authdesc")%>' != 'Paid'" --%>>
					<a href="" class="btn btn-success" ng-click="makepayment()"
						style="font-size: large;">Make Payment</a>
				</div>
				<div class="col col-xs-6 text-center" style="margin-bottom: 20px;"
					ng-if="'<%=session.getAttribute("orderStatus")%>' != 'Success'"<%-- ng-if="'<%=session.getAttribute("authdesc")%>' != 'Paid'" --%>>
					<a href="" class="btn btn-danger" ng-click="cancelorder()"
						style="font-size: large;">Cancel Order</a>
				</div>
			</div>
		</div>

		<%@include file="footer.jsp"%>

		<script src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY"></script>
		<script>
		/*	$(function() {
				$(".header").load("header.html");
				$("#footer").load("footer.html");
			});*/

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