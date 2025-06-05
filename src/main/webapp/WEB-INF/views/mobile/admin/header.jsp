<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en" ng-app="kuberbhandari">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Kuber Bhandari - Shree Kubereshwar Mahadev, Karnali,
	Dist. Vadodara, Gujarat, India</title>

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Font Awesome -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"
	rel="stylesheet">

<!-- AngularJS -->
<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.8.2/angular.min.js"></script>
<script
	src="<%=request.getContextPath()%>/resources/admin/js/confAdmin.js"></script>
<script
	src="<%=request.getContextPath()%>/resources/admin/js/admin_header.js"></script>

<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

html, body {
	height: 100%;
	display: flex;
	flex-direction: column;
	overflow: hidden;
}

body {
	background-color: #f5e6f0;
	color: #000;
}

header {
	background-color: #ffad28;
	color: white;
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 12px 16px;
	font-size: 16px;
	position: sticky;
	top: 0;
	z-index: 1000;
}

.left-section, .right-section {
	display: flex;
	align-items: center;
	gap: 12px;
}

.menu {
	font-size: 24px;
	cursor: pointer;
	color: #fff;
}

.logo img {
	height: 36px;
}

.cart, .login {
	position: relative;
	font-size: 20px;
	color: #fff;
	cursor: pointer;
}

.badge {
	position: absolute;
	top: -8px;
	right: -10px;
	background-color: yellow;
	color: black;
	border-radius: 50%;
	padding: 2px 6px;
	font-size: 12px;
}

main {
	background-color: white;
	padding: 40px 20px;
	flex: 1;
	overflow: auto;
}

.content {
	text-align: center;
}

.content h2 {
	font-size: 24px;
	margin-bottom: 10px;
}

.content p {
	font-size: 16px;
	line-height: 1.5;
}

.sidebar-custom .nav-link {
	color: #333;
	font-weight: 500;
}

.sidebar-custom .nav-link:hover {
	background-color: #f0f0f0;
}

.sidebar-custom .nav-item {
	margin-bottom: 8px;
}

.nav-link.text-white:hover {
	background-color: #555;
}

.collapse .nav-link {
	padding-left: 24px;
}

/* Footer styling */
.footer {
	background-color: #ffad28;
	color: #fff;
	padding: 15px 0;
	text-align: center;
	font-size: 0.9rem;
}

.footer a {
	color: #0056b3;
	text-decoration: none;
}

.footer a:hover {
	text-decoration: underline;
}
</style>
</head>

<body ng-controller="headerCtrl">
	<!-- Header -->
	<header>
		<div class="left-section">
			<span class="menu" data-bs-toggle="offcanvas"
				data-bs-target="#mobileSidebar" aria-controls="mobileSidebar">☰</span>
			<div class="logo">
				<img src="img/logos/logo-ShreeKubereshwarMahadev-3.png"
					alt="Shree Kubereshwar Mahadev Logo">
			</div>
		</div>

		<div class="right-section">
			<span class="cart" style="margin-right: 10px;"> <i
				class="fas fa-shopping-cart cart-icon"></i> <span class="badge">0</span>
			</span> <a href="login.html"> <i class="fas fa-user-circle user-icon"
				style="color: white;"></i>
			</a>
		</div>
	</header>

	<!-- Offcanvas Sidebar -->
	<div class="offcanvas offcanvas-start" tabindex="-1" id="mobileSidebar"
		aria-labelledby="offcanvasLabel">
		<div class="offcanvas-header">
			<h5 class="offcanvas-title" id="offcanvasLabel">Menu</h5>
			<button type="button" class="btn-close text-reset"
				data-bs-dismiss="offcanvas" aria-label="Close"></button>
		</div>
		<div class="offcanvas-body sidebar-custom"
			style="background-color: #ffad28;">
			<ul class="nav flex-column">
				<li class="nav-item"><a class="nav-link" href="index.html">
						<i class="fas fa-tachometer-alt"></i> Dashboard
				</a></li>
				<li class="nav-item"><a class="nav-link"
					href="manage_front_daily_darshan_image.html"> <i
						class="fas fa-calendar-day"></i> Daily Darshan
				</a></li>
				<li class="nav-item"><a class="nav-link"
					href="<%=request.getContextPath()%>/manageKuberbhandari/admin-seva">
						<i class="fas fa-hands-helping"></i> Seva
				</a></li>
				<li class="nav-item"><a class="nav-link"
					href="<%=request.getContextPath()%>/manageKuberbhandari/events">
						<i class="fas fa-calendar-alt"></i> Events
				</a></li>
				<li class="nav-item"><a class="nav-link"
					href="<%=request.getContextPath()%>/manageKuberbhandari/admin-important-dates">
						<i class="fas fa-calendar-check"></i> Important Dates
				</a></li>
				<li class="nav-item"><a class="nav-link"
					href="<%=request.getContextPath()%>/manageKuberbhandari/gallery">
						<i class="fas fa-images"></i> Gallery
				</a></li>
				<li class="nav-item"><a class="nav-link"
					href="<%=request.getContextPath()%>/manageKuberbhandari/seva-booked">
						<i class="fas fa-book"></i> Booking
				</a></li>
				<li class="nav-item" style="background-color: #444;"><a
					class="nav-link text-white" data-bs-toggle="collapse"
					href="#mobileMasterDropdown" role="button" aria-expanded="false"
					aria-controls="mobileMasterDropdown"> Master <i
						class="fas fa-caret-down"></i>
				</a>
					<div class="collapse" id="mobileMasterDropdown">
						<ul class="nav flex-column ms-3">
							<li class="nav-item"><a class="nav-link text-white"
								href="<%=request.getContextPath()%>/manageKuberbhandari/admin-seva-master">Seva</a>
							</li>
							<li class="nav-item"><a class="nav-link text-white"
								href="<%=request.getContextPath()%>/manageKuberbhandari/hindu-calendar-master">Hindu
									Calendar</a></li>
						</ul>
					</div></li>
			</ul>
		</div>
	</div>

	<!-- Bootstrap JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
