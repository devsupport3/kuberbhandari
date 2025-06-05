<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en" ng-app="kuberbhandari">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Sidebar</title>

	<!-- Bootstrap & Font Awesome -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">

	<!-- AngularJS -->
	<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.8.2/angular.min.js"></script>

	<style>
		.sidebar-custom {
			background-color: #ffad28;
			min-height: 100vh;
			padding: 20px;
		}

		.nav-link {
			color: black !important;
		}

		.nav-link i {
			margin-right: 10px;
		}

		.nav-item.active > .nav-link {
			color: #ffad28;
			font-weight: bold;
		}

		#dailyDarshanDropdown, #sevaDropdown, #pujarisDropdown, #trusteeDropdown {
			padding-left: 20px;
			background-color: #333;
		/*	border-left: 2px solid #ffad28;*/
		}

		#dailyDarshanDropdown .nav-link,
		#sevaDropdown .nav-link,
		#pujarisDropdown .nav-link,
		#trusteeDropdown .nav-link {
			color: #ddd;
			padding: 8px 0px;
			font-size: 0.95rem;
			text-transform: capitalize;
		}

		#dailyDarshanDropdown .nav-link:hover,
		#sevaDropdown .nav-link:hover,
		#pujarisDropdown .nav-link:hover,
		#trusteeDropdown .nav-link:hover {
		/*	background-color: #ffad28;*/
			color: white;
		}

		.caret {
			display: inline-block;
			width: 0;
			height: 0;
			margin-left: 2px;
			vertical-align: middle;
			border-top: 4px solid;
			border-right: 4px solid transparent;
			border-left: 4px solid transparent;
		}
	</style>
</head>

<body ng-controller="SidebarController">

	<!-- Navbar Toggle Button (Visible on Mobile) -->
	<nav class="navbar navbar-light bg-light d-md-none">
		<div class="container-fluid">
			<button class="btn btn-outline-warning" type="button" data-bs-toggle="offcanvas" data-bs-target="#mobileSidebar">
				<i class="fas fa-bars"></i> Menu
			</button>
		</div>
	</nav>

	<!-- Sidebar for Desktop -->
	<div class="d-none d-md-block col-md-2 sidebar-custom" style="margin-bottom: -23px;">
		<%-- Your existing sidebar code starts here --%>
		<ul class="nav flex-column">
			<li class="nav-item"><a class="nav-link"
				href="<%=request.getContextPath()%>/manageKuberbhandari/admin-dashboard">
				<i class="fas fa-tachometer-alt"></i>Dashboard</a></li>

			<li class="nav-item"><a class="nav-link"
				href="<%=request.getContextPath()%>/manageKuberbhandari/admin-daily-darshan">
				<i class="fas fa-calendar-day"></i>Daily Darshan</a></li>

			<li class="nav-item"><a class="nav-link"
				href="<%=request.getContextPath()%>/manageKuberbhandari/admin-seva">
				<i class="fas fa-hands-helping"></i>Seva</a></li>

			<li class="nav-item"><a class="nav-link"
				href="<%=request.getContextPath()%>/manageKuberbhandari/events">
				<i class="fas fa-calendar-alt"></i>Events</a></li>

			<li class="nav-item"><a class="nav-link"
				href="<%=request.getContextPath()%>/manageKuberbhandari/admin-important-dates">
				<i class="fas fa-calendar-check"></i>Important Dates</a></li>

			<li class="nav-item"><a class="nav-link"
				href="<%=request.getContextPath()%>/manageKuberbhandari/gallery">
				<i class="fas fa-images"></i>Gallery</a></li>

			<li class="nav-item"><a class="nav-link"
				href="<%=request.getContextPath()%>/manageKuberbhandari/seva-booked">
				<i class="fas fa-book"></i>Booking</a></li>

			<!-- Master Dropdown -->
			<li class="nav-item" style="background-color: #444; margin-left: 10px;">
			    <a class="nav-link text-white" href="#" data-bs-toggle="collapse" data-bs-target="#masterDropdownSidebar">  
				Master <i class="caret"></i></a>
				<div id="masterDropdownSidebar" class="collapse">
					<ul class="nav flex-column" id="sevaDropdown">
						<li class="nav-item"><a class="nav-link text-white"
							href="<%=request.getContextPath()%>/manageKuberbhandari/admin-seva-master">Seva</a></li>
						<li class="nav-item"><a class="nav-link text-white"
							href="<%=request.getContextPath()%>/manageKuberbhandari/hindu-calendar-master">Hindu Calendar</a></li>
					</ul>
				</div>
			</li>
		</ul>
	</div>

	<!-- Offcanvas Sidebar for Mobile -->
	<div class="offcanvas offcanvas-start d-md-none" tabindex="-1" id="mobileSidebar">
		<div class="offcanvas-header">
			<h5 class="offcanvas-title">Menu</h5>
			<button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas"></button>
		</div>
		<div class="offcanvas-body sidebar-custom">
			<!-- Same Sidebar Content (repeated) -->
			<ul class="nav flex-column">
				<!-- ... repeat same <li> structure as above ... -->
				<li class="nav-item"><a class="nav-link"
					href="<%=request.getContextPath()%>/manageKuberbhandari/admin-dashboard">
					<i class="fas fa-tachometer-alt"></i>Dashboard</a></li>

				<li class="nav-item"><a class="nav-link"
					href="<%=request.getContextPath()%>/manageKuberbhandari/admin-daily-darshan">
					<i class="fas fa-calendar-day"></i>Daily Darshan</a></li>

				<li class="nav-item"><a class="nav-link"
					href="<%=request.getContextPath()%>/manageKuberbhandari/admin-seva">
					<i class="fas fa-hands-helping"></i>Seva</a></li>

				<li class="nav-item"><a class="nav-link"
					href="<%=request.getContextPath()%>/manageKuberbhandari/events">
					<i class="fas fa-calendar-alt"></i>Events</a></li>

				<li class="nav-item"><a class="nav-link"
					href="<%=request.getContextPath()%>/manageKuberbhandari/admin-important-dates">
					<i class="fas fa-calendar-check"></i>Important Dates</a></li>

				<li class="nav-item"><a class="nav-link"
					href="<%=request.getContextPath()%>/manageKuberbhandari/gallery">
					<i class="fas fa-images"></i>Gallery</a></li>

				<li class="nav-item"><a class="nav-link"
					href="<%=request.getContextPath()%>/manageKuberbhandari/seva-booked">
					<i class="fas fa-book"></i>Booking</a></li>

				<li class="nav-item" style="background-color: #444;"><a class="nav-link text-white" href="#" data-bs-toggle="collapse" data-bs-target="#mobileMasterDropdown">
					Master <i class="caret"></i></a>
					<div id="mobileMasterDropdown" class="collapse">
						<ul class="nav flex-column" id="sevaDropdown">
							<li class="nav-item"><a class="nav-link text-white"
								href="<%=request.getContextPath()%>/manageKuberbhandari/admin-seva-master">Seva</a></li>
							<li class="nav-item"><a class="nav-link text-white"
								href="<%=request.getContextPath()%>/manageKuberbhandari/hindu-calendar-master">Hindu Calendar</a></li>
						</ul>
					</div>
				</li>
			</ul>
		</div>
	</div>

	<!-- Bootstrap Script -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
