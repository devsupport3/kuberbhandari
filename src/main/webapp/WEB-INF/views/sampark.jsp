<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

<!-- Basic -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Contact</title>

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

<!-----------------Generates the captcha function  ------------------->
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
<style>
.hidden {
	display: none;
	visibility: hidden;
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
<script src="https://code.jquery.com/jquery-3.3.1.js"
	integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
	crossorigin="anonymous">
	
</script>
<script>
	$(function() {
		$("#header").load("header.html");
		$("#footer").load("footer.html");
	});
</script>
</head>

<body onLoad="DrawCaptcha();">
	<div class="sticky-note">
		<div class="sticky-note-content">
			<a href="tel:+91-9824332016"
				class="text-4 text-color-light text-color-hover-primary font-weight-light mb-0">
				<img src="images/whtpp.svg" height="40px" width="40px" alt="">
				<!-- <img width="180%"  src="Website-Photos/market-svg/inquiry-1.png" > -->
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
	<div class="body">

		<!-- <div id="header" id="myHeader"></div> -->
		<%@include file="header.jsp"%>

		<section
			class="page-header page-header-modern  bg-tertiary border-0 my-0 "
			style="background-color: #ffad28 !important;">
			<div class="container my-3">
				<div class="row p-4">
					<div
						class="col-md-12 align-self-center p-static order-2 text-center">
						<h1 class="font-weight-bold text-10">Contact</h1>
					</div>
					<div class="col-md-12 align-self-center order-1">
						<ul class="breadcrumb breadcrumb-light d-block text-center">
							<li><a href="<%=request.getContextPath()%>/">Home</a></li>
							<li class="active">Contact</li>
						</ul>
					</div>
				</div>
			</div>
		</section>
		<div class="container py-4 my-5">
			<div class="row align-items-center">
				<div class="col-md-6 ">
					<div class="overflow-hidden">
						<h2
							class=" font-weight-bold line-height-3 text-5-5 mb-0 appear-animation"
							data-appear-animation="maskUp" data-appear-animation-delay="250"
							style="color: #ED3237">
							Kubereshwar Mahadev<br> <span style="color: rgb(65, 63, 63)">Karnali,
								Dist. Vadodara </span>
						</h2>
					</div>

					<ul
						class="list list-unstyled text-color-dark font-weight-bold text-4 py-2 my-4 appear-animation"
						data-appear-animation="fadeInUpShorter"
						data-appear-animation-delay="750">
						<li class="d-flex align-items-center mb-2"><i
							class="icons icon-envelope text-color-dark mx-2"></i> Email: <a
							href="mailto: info@airtoursholidays.us"
							class="text-color-dark text-color-hover-primary text-decoration-none ms-1">
								<span style="color: #ED3237">mahiti@shreekuberbhandarikarnali.org</span>
						</a></li>
						<li class="d-flex align-items-center mb-0"><i
							class="icons icon-phone text-color-dark mx-2 "></i> Phone: <a
							href="tel:646-770-7333"
							class="text-color-dark text-color-hover-primary text-decoration-none ms-1"><span
								style="color: #ED3237">+91-9427611304</span> </a></li>
						<li class="d-flex align-items-center mb-0"><i
							class="fa-solid fa-hands-praying  text-color-dark mx-1"></i>
							Darshan Timings : &nbsp; <span style="color: #ED3237">
								5:30AM - 8:30PM </span></a></li>
					</ul>

				</div>


				<div class="col-md-6">

					<div
						style="border: 9px solid #f7f7f9; padding: 2em 1.5em 0em 1.5em; background-color: #ffffff;"
						class="panel panel-default">
						<div style="background-color: transparent; color: #333;"
							class="panel-heading core-projects">
							<!-- <h1 style="color: #4e4e4e;"> QUICK ENQUIRY Ultra Smart CRM
							</h1> -->
						</div>
						<div class="panel-body">

							<form style="font-family: 'Josefin Sans', sans-serif;"
								action="sampark.php" method="POST" role="form" id="crm-form"
								class="xs-form">

								<div class="messages"></div>

								<div class="controls">
									<div class="col-md-6">
										<div class="form-group">

											<input style="border: 1px solid #ccc;" class="hidden"
												type="text" name="title">

										</div>
									</div>
									<div class="row">

										<div class="col-md-6">
											<div class="form-group">
												<label style="font-weight: normal;" for="form_name">Firstname
													*</label> <input style="border: 1px solid #ccc;" id="form_name"
													type="text" name="name" class="form-control input-lg"
													placeholder="Please enter your firstname *"
													required="required" data-error="Firstname is required.">
												<div class="help-block with-errors"></div>
											</div>
										</div>

										<div class="col-md-6">
											<div class="form-group">
												<label style="font-weight: normal;" for="form_lastname">
													Lastname </label> <input style="border: 1px solid #ccc;"
													id="form_lastname" type="text" name="surname"
													class="form-control input-lg"
													placeholder="Please enter your lastname *">
											</div>
										</div>
									</div>

									<div class="row">

										<div class="col-md-4">
											<div class="form-group">
												<label style="font-weight: normal;" for="form_email">
													Email </label> <input style="border: 1px solid #ccc;"
													id="form_email" type="email" name="email"
													class="form-control input-lg"
													placeholder="Please enter your email" required="required"
													data-error="Email is required.">
											</div>
										</div>

										<div class="col-md-4">
											<div class="form-group">
												<label style="font-weight: normal;" for="form_phone">
													Phone *</label> <input style="border: 1px solid #ccc;"
													id="form_phone" type="tel" name="phone"
													class="form-control input-lg"
													placeholder="Please enter your phone" required="required">
												<div class="help-block with-errors"></div>
											</div>
										</div>


										<div class="col-md-4">
											<div class="form-group">
												<label style="font-weight: normal;" for="form_phone">Subject</label>
												<input style="border: 1px solid #ccc;" type="text"
													class="form-control input-lg" name="subject"
													placeholder="Subject" id="xs_contact_subject">
											</div>
										</div>


									</div>

									<div class="row">

										<div class="col-md-12">
											<div class="form-group">
												<label style="font-weight: normal;" for="form_message">Message
												</label>
												<textarea style="height: auto; border: 1px solid #ccc;"
													id="form_message" name="message" class="form-control"
													placeholder="Message for us *" cols="20" rows="5"></textarea>
											</div>
										</div>
									</div>

									<div class="row">
										<div class="col-md-4">
											<div class="form-group">

												<input style="border: 1px solid #ccc;" type="text"
													id="txtCaptcha" class="form-control">
											</div>
										</div>

										<div class="col-md-2">
											<div class="form-group">
												<input type="button"
													style="border: 1px solid #ccc; padding: 3px"
													id="btnrefresh" value="Refresh" onClick="DrawCaptcha();"
													class="form-control">
											</div>
										</div>


										<div class="col-md-6">
											<div class="form-group">

												<input style="border: 1px solid #ccc;" type="text"
													placeholder="Please enter above shown code here"
													id="txtInput" class="form-control" required="required"
													data-error="Please enter above shown code here">
												<div class="help-block with-errors"></div>
											</div>
										</div>

									</div>

									<div class="row mt-20">
										<div class="col-md-12 text-center">
											<input
												style="background: #ffad28; border-color: transparent;"
												type="submit" class="btn btn-success btn-send btn-lg"
												id="submit" value="Send message" name="send"
												onClick="return ValidCaptcha();">

										</div>
									</div>

								</div>

							</form>


						</div>

					</div>


				</div>
				<!-- <div class="col-lg-7 col-xl-5 offset-lg-1 appear-animation" data-appear-animation="fadeInUpShorter" data-appear-animation-delay="1250">
							<form class="contact-form custom-form-style-1" action="contactus.php" method="POST">
                                <div class="contact-form-success alert alert-success d-none mt-4">
                                    <strong>Success!</strong> Your message has been sent to us.
                                </div>

                                <div class="contact-form-error alert alert-danger d-none mt-4">
                                    <strong>Error!</strong> There was an error sending your message.
                                    <span class="mail-error-message text-1 d-block"></span>
                                </div>

                                <div class="row row-gutter-sm">
                                    <div class="form-group col-md-6 mb-3">
                                        <input type="text" value="" data-msg-required="Please enter your first name." maxlength="100" class="form-control" name="name" id="form_name" required placeholder="First Name">
                                    </div>
                                    <div class="form-group col-md-6 mb-3">
                                        <input type="text" value="" data-msg-required="Please enter your last name." maxlength="100" class="form-control" name="surname" id="form_lstname" required placeholder="Last Name">
                                    </div>
                                </div>
                                <div class="row row-gutter-sm">
                                    <div class="form-group col-md-6 mb-3">
                                        <input type="email" value="" data-msg-required="Please enter your email address." data-msg-email="Please enter a valid email address." maxlength="100" class="form-control" name="email" id="form_email" required placeholder="E-mail Address">
                                    </div>
                                    <div class="form-group col-md-6 mb-3">
                                        <input type="text" value="" data-msg-required="Please enter your Phone number."  maxlength="100" class="form-control" name="phone" id="form_phone" required placeholder="Phone Number">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="form-group col-md-12 mb-3">
                                        <input type="text" value="" data-msg-required="Please enter Subject." maxlength="100" class="form-control" name="subject" id="form_subject" required placeholder="subject">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="form-group col-md-12 mb-3">
                                        <textarea maxlength="5000" data-msg-required="Please enter your message." rows="4" class="form-control" name="message" id="form_message" required placeholder="Message"></textarea>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="form-group col-md-3 mb-3">
										<input style="border: 1px solid #ccc;"  type="text" id="txtCaptcha"  class="form-control">
                                    </div>
                                    <div class="form-group col-md-3 mb-3">
                                        <button type="button" id="btnrefresh" value="Refresh" onClick="DrawCaptcha();" class="form-control">Refresh</button>

                                    </div>
                                    <div class="form-group col-md-6 mb-3">
                                        <input style="border: 1px solid #ccc;" type="text" placeholder="Please enter above shown code here" id="txtInput"  class="form-control" required="required" data-error="Please enter above shown code here">
                                    </div>
                                </div>
                                <div class="row appear-animation" data-appear-animation="fadeInUpShorterPlus" data-appear-animation-delay="1500">
                                    <div class="form-group col mb-0">
                                        <input style="    background: linear-gradient(90deg, #853576 10%, #a21d89 90%); border-color: transparent;" type="submit" class="btn btn-success btn-send btn-lg" id="submit" value="Send message" onClick="return ValidCaptcha();">


                                    </div>
                                </div>
                            </form>
						</div> -->
			</div>
		</div>

		<!-- <div class="position-relative appear-animation" data-appear-animation="fadeInUpShorterPlus" data-appear-animation-delay="750">
					<div class="custom-directions-panel position-absolute top-0 left-0 w-100pct w-md-50pct w-lg-25pct h-100 mh-100 overflow-auto z-index-1"></div>
					<div id="googlemaps" class="google-map m-0" style="min-height: 500px;"></div>
				</div> -->




	</div>

	<!-- <svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 2000 260" preserveAspectRatio="xMinYMin">
				<path fill="#FFFFFF" d="M-42,42c21.03-0.71,49.03-1.3,82-1c10.06,0.09,73,0.78,147,7c95.4,8.01,191.25,23.7,278,40
					c188.62,35.43,247.14,57.2,353,79c102.08,21.02,252.74,44.36,445,46c0,22.68,0,45.35,0,68.03c-433.33,0-866.67,0-1300,0
					C-38.67,201.35-40.33,121.68-42,42z"/>
				<path fill="#222529" d="M-39,233c18.45-5.57,45.76-13.68,79-23c65.89-18.48,100.28-28.12,140-36c64.67-12.83,115.09-15.35,151-17
					c72.37-3.33,126.81,0.97,200,7c21.78,1.79,35.05,3.15,147,16c185.79,21.33,205.66,24.08,252,27c85.5,5.38,150.46,4.35,168,4
					c48.7-0.96,73.47-3.33,246-19c174.43-15.84,185.89-16.75,211-18c76.46-3.81,133.48-3.48,217-3c83.26,0.48,125.58,2.59,166,6
					c37.33,3.15,68.3,7,90,10c0,28.67,0,57.35,0,86.02c-688.33,0-1376.67,0-2065,0C-37.67,259.68-38.33,246.34-39,233z"/>
			</svg> -->

	<%@include file="footer.jsp"%>

	<script>
		function initializeGoogleMaps() {
			// Map Initial Location
			var initLatitude = 40.75198;
			var initLongitude = -73.96978;

			// Map Markers
			var mapMarkers = [ {
				latitude : initLatitude,
				longitude : initLongitude,
				html : "<strong>Porto Business Consulting 3</strong><br>New York, NY 10017<br><br><a href='#' onclick='mapCenterAt({latitude: 40.75198, longitude: -73.96978, zoom: 16}, event)'>[+] zoom here</a>",
				icon : {
					image : "resources/front/img/demos/business-consulting-3/map-pin.png",
					iconsize : [ 26, 27 ],
					iconanchor : [ 12, 27 ]
				}
			} ];

			// Map Extended Settings
			var mapSettings = {
				controls : {
					draggable : (($.browser.mobile) ? false : true),
					panControl : false,
					zoomControl : false,
					mapTypeControl : false,
					scaleControl : false,
					streetViewControl : false,
					overviewMapControl : false
				},
				scrollwheel : false,
				markers : mapMarkers,
				latitude : initLatitude,
				longitude : initLongitude,
				zoom : 14
			};

			var map = $('#googlemaps').gMap(mapSettings), mapRef = $(
					'#googlemaps').data('gMap.reference');

			// Styles from https://snazzymaps.com/
			var styles = [ {
				"featureType" : "water",
				"elementType" : "geometry",
				"stylers" : [ {
					"color" : "#e9e9e9"
				}, {
					"lightness" : 17
				} ]
			}, {
				"featureType" : "landscape",
				"elementType" : "geometry",
				"stylers" : [ {
					"color" : "#f5f5f5"
				}, {
					"lightness" : 20
				} ]
			}, {
				"featureType" : "road.highway",
				"elementType" : "geometry.fill",
				"stylers" : [ {
					"color" : "#ffffff"
				}, {
					"lightness" : 17
				} ]
			}, {
				"featureType" : "road.highway",
				"elementType" : "geometry.stroke",
				"stylers" : [ {
					"color" : "#ffffff"
				}, {
					"lightness" : 29
				}, {
					"weight" : 0.2
				} ]
			}, {
				"featureType" : "road.arterial",
				"elementType" : "geometry",
				"stylers" : [ {
					"color" : "#ffffff"
				}, {
					"lightness" : 18
				} ]
			}, {
				"featureType" : "road.local",
				"elementType" : "geometry",
				"stylers" : [ {
					"color" : "#ffffff"
				}, {
					"lightness" : 16
				} ]
			}, {
				"featureType" : "poi",
				"elementType" : "geometry",
				"stylers" : [ {
					"color" : "#f5f5f5"
				}, {
					"lightness" : 21
				} ]
			}, {
				"featureType" : "poi.park",
				"elementType" : "geometry",
				"stylers" : [ {
					"color" : "#dedede"
				}, {
					"lightness" : 21
				} ]
			}, {
				"elementType" : "labels.text.stroke",
				"stylers" : [ {
					"visibility" : "on"
				}, {
					"color" : "#ffffff"
				}, {
					"lightness" : 16
				} ]
			}, {
				"elementType" : "labels.text.fill",
				"stylers" : [ {
					"saturation" : 36
				}, {
					"color" : "#333333"
				}, {
					"lightness" : 40
				} ]
			}, {
				"elementType" : "labels.icon",
				"stylers" : [ {
					"visibility" : "off"
				} ]
			}, {
				"featureType" : "transit",
				"elementType" : "geometry",
				"stylers" : [ {
					"color" : "#f2f2f2"
				}, {
					"lightness" : 19
				} ]
			}, {
				"featureType" : "administrative",
				"elementType" : "geometry.fill",
				"stylers" : [ {
					"color" : "#fefefe"
				}, {
					"lightness" : 20
				} ]
			}, {
				"featureType" : "administrative",
				"elementType" : "geometry.stroke",
				"stylers" : [ {
					"color" : "#fefefe"
				}, {
					"lightness" : 17
				}, {
					"weight" : 1.2
				} ]
			} ];

			var styledMap = new google.maps.StyledMapType(styles, {
				name : 'Styled Map'
			});

			mapRef.mapTypes.set('map_style', styledMap);
			mapRef.setMapTypeId('map_style');
		}

		// Initialize Google Maps when element enter on browser view
		theme.fn.intObs('#googlemaps', 'initializeGoogleMaps()', {});

		// Map text-center At
		var mapCenterAt = function(options, e) {
			e.preventDefault();
			$('#googlemaps').gMap("centerAt", options);
		}
	</script>

</body>
</html>