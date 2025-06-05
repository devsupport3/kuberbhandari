<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en" ng-app="kuberbhandari">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Kuber Bhandari - Shree Kubereshwar Mahadev</title>

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet" />
<!-- Font Awesome -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"
	rel="stylesheet" />

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

.left-section {
	display: flex;
	align-items: center;
	gap: 12px;
}

.logo img {
	height: 36px;
}

.menu {
	font-size: 24px;
	cursor: pointer;
	color: #fff;
}

.right-section {
	display: flex;
	align-items: center;
	gap: 12px;
	position: relative;
}

.user-dropdown {
	position: relative;
	cursor: pointer;
	display: flex;
	align-items: center;
	gap: 6px;
}

.dropdown-content {
	display: none;
	position: absolute;
	top: 120%;
	right: 0;
	background-color: #fff;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.15);
	padding: 10px;
	border-radius: 6px;
	z-index: 1001;
	min-width: 140px;
}

.dropdown-content button {
	width: 100%;
	background-color: white;
	color: black;
	border: none;
	padding: 8px;
	border-radius: 4px;
}

/* .dropdown-content button:hover {
	background-color: #c82333;
} */
main {
	background-color: white;
	padding: 40px 20px;
	flex: 1;
	overflow: auto;
}

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

@media screen and (max-width: 768px) {
	.logo img {
		height: 32px;
	}
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
				<img
					src="<%=request.getContextPath()%>/resources/front/img/logos/logo-ShreeKubereshwarMahadev-3.png"
					alt="Shree Kubereshwar Mahadev Logo">
			</div>
		</div>

		<div class="right-section">
			<!-- Admin User Dropdown -->
			<div class="user-dropdown" onclick="toggleDropdown()">
				<span><%=session.getAttribute("adminUserName")%></span> <i
					class="fas fa-caret-down"></i>
				<div class="dropdown-content" id="dropdownMenu">
					<button ng-click="logout()">Logout</button>
				</div>
			</div>
		</div>
	</header>

	<!-- Sidebar (offcanvas) -->
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
				<li class="nav-item"><a class="nav-link"
					href="<%=request.getContextPath()%>/manageKuberbhandari/admin-dashboard"
					style="color: black;"><i class="fas fa-tachometer-alt"
						style="color: black;"></i> Dashboard</a></li>
				<li class="nav-item"><a class="nav-link"
					href="<%=request.getContextPath()%>/manageKuberbhandari/admin-daily-darshan" style="color: black;"><i
						class="fas fa-calendar-day" style="color: black;"></i> Daily
						Darshan</a></li>
				<li class="nav-item"><a class="nav-link"
					href="<%=request.getContextPath()%>/manageKuberbhandari/admin-seva"
					style="color: black;"><i class="fas fa-hands-helping"
						style="color: black;"></i> Seva</a></li>
				<li class="nav-item"><a class="nav-link"
					href="<%=request.getContextPath()%>/manageKuberbhandari/events"
					style="color: black;"><i class="fas fa-calendar-alt"
						style="color: black;"></i> Events</a></li>
				<li class="nav-item"><a class="nav-link"
					href="<%=request.getContextPath()%>/manageKuberbhandari/admin-important-dates"
					style="color: black;"><i class="fas fa-calendar-check"
						style="color: black;"></i> Important Dates</a></li>
				<li class="nav-item"><a class="nav-link"
					href="<%=request.getContextPath()%>/manageKuberbhandari/gallery"
					style="color: black;"><i class="fas fa-images"
						style="color: black;"></i> Gallery</a></li>
				<li class="nav-item"><a class="nav-link"
					href="<%=request.getContextPath()%>/manageKuberbhandari/seva-booked"
					style="color: black;"><i class="fas fa-book"
						style="color: black;"></i> Booking</a></li>
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

	<!-- Main Content -->
	<main>
		<section class="content text-center">
			<h2>Welcome to</h2>
			<p>Shree Kubereshwar Mahadev.</p>
		</section>
	</main>

	<!-- Footer -->
	<footer class="footer">
		<div class="container">
			<p class="mb-0">
				Copyrights © <span class="current-year"></span> ShreeKubereshwar
				Mahadev. All rights reserved | Powered by: <a
					href="http://www.astartechnologies.net/" target="_blank">ASTAR
					Technologies.</a>
			</p>
		</div>
	</footer>

	<!-- Bootstrap JS, Popper.js, and jQuery -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

	<!-- Dropdown Toggle Script -->
	<script>
		function toggleDropdown() {
			const menu = document.getElementById("dropdownMenu");
			menu.style.display = menu.style.display === "block" ? "none"
					: "block";
		}

		document.addEventListener("click", function(event) {
			const dropdown = document.querySelector(".user-dropdown");
			const menu = document.getElementById("dropdownMenu");
			if (!dropdown.contains(event.target)) {
				menu.style.display = "none";
			}
		});
	</script>
	<script>
		$(document).ready(function() {
			var currentYear = new Date().getFullYear();
			$(".current-year").text(currentYear);
		});
	</script>

</body>
</html>
