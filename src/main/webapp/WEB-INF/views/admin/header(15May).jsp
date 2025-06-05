<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en" ng-app="kuberbhandari">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Kuber Bhandari - Shree Kubereshwar Mahadev</title>

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

.menu {
	font-size: 24px;
	cursor: pointer;
	color: #fff;
}

.logo img {
	height: 36px;
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

/* --- User Dropdown --- */
.right-section {
	position: relative;
	display: flex;
	align-items: center;
	gap: 10px;
	/* margin-left: 1121px;
	top: -19px; */
	margin-left: auto;
}

.user-dropdown {
	position: relative;
	color: white;
	cursor: pointer;
	display: flex;
	align-items: center;
	gap: 8px;
}

.user-dropdown i {
	font-size: 14px;
}

.dropdown-content {
	display: none;
	position: absolute;
	top: 100%;
	right: 0;
	background-color: white;
	color: black;
	min-width: 140px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.15);
	border-radius: 6px;
	padding: 8px 0;
	z-index: 1001;
}

.dropdown-content button {
	width: 100%;
	padding: 8px 16px;
	background: none;
	border: none;
	text-align: left;
	font-size: 14px;
	color: black;
	cursor: pointer;
}

.dropdown-content button:hover {
	background-color: #f0f0f0;
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
				<a
					href="<%=request.getContextPath()%>/manageKuberbhandari/admin-dashboard">
					<img
					src="<%=request.getContextPath()%>/resources/front/img/logos/logo-ShreeKubereshwarMahadev-3.png"
					alt="Shree Kubereshwar Mahadev Logo">
				</a>
			</div>
		</div>

		<div class="right-section">
			<!-- Admin User Dropdown -->
			<div class="user-dropdown" onclick="toggleDropdown()">
				<span><%=session.getAttribute("adminUserName")%></span> <i
					class="fas fa-caret-down" onclick="toggleDropdown()"></i>
				<div class="dropdown-content" id="dropdownMenu">
					<button class="btn btn-danger" ng-click="logout()">Logout</button>
				</div>
			</div>
		</div>
	</header>

	<!-- Offcanvas Sidebar -->
	<div class="offcanvas offcanvas-start" tabindex="-1" id="mobileSidebar"
		aria-labelledby="offcanvasLabel">
		<div class="offcanvas-header">
			<h5 class="offcanvas-title" id="offcanvasLabel">Menu</h5>
			<button type="button" class="btn-close" data-bs-dismiss="offcanvas"
				aria-label="Close"></button>
		</div>
		<div class="offcanvas-body sidebar-custom"
			style="background-color: #ffad28;">
			<ul class="nav flex-column">
				<li class="nav-item"><a class="nav-link" href="index.html"><i
						class="fas fa-tachometer-alt"></i> Dashboard</a></li>
				<li class="nav-item"><a class="nav-link"
					href="manage_front_daily_darshan_image.html"><i
						class="fas fa-calendar-day"></i> Daily Darshan</a></li>
				<li class="nav-item"><a class="nav-link"
					href="<%=request.getContextPath()%>/manageKuberbhandari/admin-seva"><i
						class="fas fa-hands-helping"></i> Seva</a></li>
				<li class="nav-item"><a class="nav-link"
					href="<%=request.getContextPath()%>/manageKuberbhandari/events"><i
						class="fas fa-calendar-alt"></i> Events</a></li>
				<li class="nav-item"><a class="nav-link"
					href="<%=request.getContextPath()%>/manageKuberbhandari/admin-important-dates"><i
						class="fas fa-calendar-check"></i> Important Dates</a></li>
				<li class="nav-item"><a class="nav-link"
					href="<%=request.getContextPath()%>/manageKuberbhandari/gallery"><i
						class="fas fa-images"></i> Gallery</a></li>
				<li class="nav-item"><a class="nav-link"
					href="<%=request.getContextPath()%>/manageKuberbhandari/seva-booked"><i
						class="fas fa-book"></i> Booking</a></li>
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
</body>
</html>

