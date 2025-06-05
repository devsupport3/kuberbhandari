<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html ng-app="kuberbhandari">
<head>
<!-- Basic -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="keywords"
	content="All Inclusive Holidays, Holiday Tours And Travel, Family Vacations All Inclusive, Escorted Tours, Family Vacation Deals, Escorted Tours Holiday , Air Tours Holidays Photo Gallery, Africa Tour Packages, Asia Tour Packages, America Tour Packages, Tours With Indian Meals, Tours With Indian Tour Manager, Brochure 2018 for Holiday Packages, Special Offer Holiday Packages" />
<meta name="description"
	content="We Are Most Popular Tours And Travel Operators In USA For Offering Various Inclusive Holiday Tour Packages For Various Tour Destinations In America, Europe, Africa, Asia & Australia.">
<meta name="author" content="UltraInfotech.net">
<!-- Favicon -->
<link rel="shortcut icon" href="resources/front/Images/favicon.ico"
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
<!-- AngularJS -->
<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.8.2/angular.min.js"></script>

<script
	src="<%=request.getContextPath()%>/resources/admin/js/confAdmin.js"></script>
<style>
.hvr:hover {
	color: red !important;
}

.hv:hover {
	color: #F57926 !important;
}

.hvrbck:hover {
	background-color: #fdbf14ee !important;
}
</style>
<script type="text/javascript">
	function googleTranslateElementInit() {
		new google.translate.TranslateElement({
			pageLanguage : 'en',
			includedLanguages : 'en,hi,gu,mr',
			layout : google.translate.TranslateElement.InlineLayout.SIMPLE
		}, 'google_translate_element');
	}
</script>
<script type="text/javascript"
	src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>
<!-- JavaScript to Handle Language Change -->
<script>
	// Function to handle language change
	function handleLanguageChange(event) {
		// Store selected language preference in local storage
		const selectedLanguage = event.target.value;
		localStorage.setItem('preferredLanguage', selectedLanguage);
	}
	// Function to apply language preference
	function applyLanguagePreference() {
		// Retrieve stored language preference from local storage
		const preferredLanguage = localStorage.getItem('preferredLanguage')
				|| 'en';
		// Apply language preference to Google Translate plugin
		const googleTranslateElement = document.querySelector('.goog-te-combo');
		if (googleTranslateElement) {
			googleTranslateElement.value = preferredLanguage;
			googleTranslateElement.dispatchEvent(new Event('change'));
		}
	}
	// Listen for language change event
	document.addEventListener('googleTranslateChange', handleLanguageChange);
	// Apply language preference on page load
	applyLanguagePreference();
</script>
</head>
<body>
	<!-- <audio controls><source src= "music/Mantra-KubereshwarMahadev-Karnali.mp3" autoply loop type="audio/mp3"><source src= "music/Mantra-KubereshwarMahadev-Karnali.mp3" type="audio/mp3"></audio>  -->
	<!-- <audio src="music/Mantra-KubereshwarMahadev-Karnali.mp3" controls autoplay loop hidden="true"><p>If you are reading this, it is because your browser does not support the audio element.</p></audio> -->
	<header id="header" class="header-effect-shrink header-transparent"
		style="position: unset;"
		data-plugin-options="{'stickyEnabled': true, 'stickyEffect': 'shrink', 'stickyEnableOnBoxed': true, 'stickyEnableOnMobile': false, 'stickyChangeLogo': true, 'stickyStartAt': 30, 'stickyHeaderContainerHeight': 70}">
		<div class="header-body">
			<div class="header-container container"
				style="max-width: 1245px !important;">
				<div class="header-row">
					<div class="header-column">
						<div class="header-row">
							<div class="header-logo">
								<a href="<%=request.getContextPath()%>/"> <img
									src="resources/front/img/logos/logo-ShreeKubereshwarMahadev-3.png"
									class="img-fluid" width="210" alt="" />
								</a>
							</div>
						</div>
					</div>
					<div class="header-column justify-content-end">
						<div class="header-row">
							<div class="header-nav pt-1">
								<div
									class="header-nav-main header-nav-main-effect-1 header-nav-main-sub-effect-1">
									<nav id="mainNavCollapse" class="collapse">
										<ul class="nav nav-pills" id="mainNav">
											<li class="dropdown"><a
												class="dropdown-item dropdown-toggle  "
												href="<%=request.getContextPath()%>/kuber-bhandari">
													Kuber Bhandari </a>
												<ul class="dropdown-menu" style="padding: 0px !important">
													<li style="background-color: #FD7E14"><a
														class="dropdown-item hvrbck" style="color: white"
														href="<%=request.getContextPath()%>/kuber-bhandari">
															Kuber Bhandari History </a></li>
													<li style="background-color: #FD7E14"><a
														class="dropdown-item hvrbck" style="color: white"
														href="<%=request.getContextPath()%>/kuber-bhandari-campus">
															Kuber Bhandari Campus</a></li>
													<li style="background-color: #FD7E14;"><a
														class="dropdown-item hvrbck" style="color: white"
														href="<%=request.getContextPath()%>/pujaris"> The
															Pujaris </a></li>
													<li style="background-color: #FD7E14;"><a
														class="dropdown-item hvrbck" style="color: white"
														href="<%=request.getContextPath()%>/trust"> The
															Trust </a></li>
												</ul></li>
											<li><a class="dropdown-item hvrbckclr"
												href="<%=request.getContextPath()%>/darshan"> Darshan </a></li>
											<li><a class="dropdown-item hvrbckclr"
												href="<%=request.getContextPath()%>/prabhu-seva">Prabhu
													Seva </a></li>
											<li><a class="dropdown-item hvrbckclr"
												href="<%=request.getContextPath()%>/events"> Events </a></li>
											<li><a class="dropdown-item hvrbckclr"
												href="<%=request.getContextPath()%>/important-dates">
													Dates </a></li>
											<li><a class="dropdown-item hvrbckclr"
												href="<%=request.getContextPath()%>/gallery"> Gallery </a></li>
											<li><a class="dropdown-item hvrbckclr"
												href="#"> Jan Seva </a></li>
											<li><a class="dropdown-item hvrbckclr"
												href="<%=request.getContextPath()%>/sampark"> Contact Us
											</a></li>
										</ul>
									</nav>
								</div>

								<!-- Social & Other Icons -->
								<div class="d-flex align-items-center" ng-controller="cartCtrl">
									<%
									String username = (String) session.getAttribute("userName");
									%>
									<!-- If user is logged in, display their name and dropdown menu -->
									<%
									if (username != null) {
									%>
									<div class="dropdown">
										<a href="#" class="d-flex align-items-center"
											id="userDropdown" role="button" data-bs-toggle="dropdown"
											aria-expanded="false"
											style="color: #444; text-decoration: none;"> <i
											class="fas fa-user me-2"
											style="font-size: 1.5rem; transition: all 0.3s ease;"></i> <span><%=username%></span>
											<!-- Display username -->
										</a>

										<ul class="dropdown-menu" aria-labelledby="userDropdown">
											<li><a class="dropdown-item"
												href="<%=request.getContextPath()%>/userChangePassword">Change
													Password</a></li>
											<li><a class="dropdown-item"
												href="<%=request.getContextPath()%>/manage-address">Manage
													Address</a></li>
											<li><a class="dropdown-item"
												href="<%=request.getContextPath()%>/order-history">Order
													History</a></li>
											<li><a class="dropdown-item"
												href="<%=request.getContextPath()%>/logout">Logout</a></li>
										</ul>
									</div>
									<%
									} else {
									%>
									<!-- If user is not logged in, show login link -->
									<a href="<%=request.getContextPath()%>/login-register"
										class="d-flex align-items-center ms-3"
										style="color: #444; text-decoration: none;"> <i
										class="fas fa-user me-2"
										style="font-size: 1.5rem; transition: all 0.3s ease;"></i>
									</a>
									<%
									}
									%>

									<!-- Booking Cart Link -->
									<%-- <a href="<%=request.getContextPath()%>/cart" class="d-flex align-items-center ms-3"
											style="color: #444;"> <i
											class="fas fa-shopping-cart me-2"
											style="font-size: 1.5rem; transition: all 0.3s ease;"></i>
										</a> --%>
									<%
									Integer CartLength = (Integer) session.getAttribute("CartLength");
									%>
									<a href="<%=request.getContextPath()%>/cart"
										class="ms-3 position-relative text-dark"> <i
										class="fas fa-shopping-cart fa-lg"></i> <span
										class="badge bg-danger rounded-circle position-absolute translate-middle p-1"
										style="top: 0; font-size: 0.75rem; min-width: 18px; height: 18px;">
											{{cartCount}} </span>
									</a>
								</div>
							</div>
							<button class="btn header-btn-collapse-nav"
								data-bs-toggle="collapse" data-bs-target="#mainNavCollapse">
								<i class="fas fa-bars"></i>
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</header>
	<script src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY"></script>
</body>
</html>