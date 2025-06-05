<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en" ng-app="kuberbhandari">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Sidebar</title>

<!-- Add Bootstrap and Font Awesome CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
	rel="stylesheet">

<!-- AngularJS -->
<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.8.2/angular.min.js"></script>

<style>
/* Style for the dropdown container */
#dailyDarshanDropdown, #sevaDropdown, #pujarisDropdown, #trusteeDropdown
	{
	padding-left: 20px;
	background-color: #333;
	border-left: 2px solid #ffad28;
}

/* Style for the dropdown items */
#dailyDarshanDropdown .nav-link, #sevaDropdown .nav-link,
	#pujarisDropdown .nav-link, #trusteeDropdown .nav-link {
	color: #ddd;
	padding: 8px 15px;
	font-size: 0.95rem;
	text-transform: capitalize;
	transition: background-color 0.3s ease, color 0.3s ease;
}

#dailyDarshanDropdown .nav-link:hover, #sevaDropdown .nav-link:hover,
	#pujarisDropdown .nav-link:hover, #trusteeDropdown .nav-link:hover {
	background-color: #ffad28;
	color: white;
}

/* Ensure smooth opening/closing animation */
.collapse {
	transition: height 0.3s ease-in-out;
}

/* Ensure the sidebar links are properly spaced */
.nav-item {
	margin: 10px 0;
}

/* Optional: Style for the active state of the dropdown link */
.nav-item.active>.nav-link {
	color: #ffad28;
	font-weight: bold;
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

	<!-- Sidebar -->
	<div class="col-md-2 p-4"
		style="margin-bottom: -11px; background-color: #ffad28;">
		<ul class="nav flex-column">
			<li class="nav-item"><a class="nav-link"
				href="<%=request.getContextPath()%>/manageKuberbhandari/admin-dashboard"
				style="color: black !important;"> <i
					class="fas fa-tachometer-alt" style="margin-right: 10px;"></i>Dashboard
			</a></li>
			<!-- Pujaris -->
			<!-- <li class="nav-item"><a class="nav-link" href="#"
				style="color: black !important;"> <i class="fas fa-user-shield"
					style="margin-right: 10px;"></i>Pujaris
			</a></li> -->
			<!-- Trustee -->
			<!-- <li class="nav-item"><a class="nav-link" href="#"
				style="color: black !important;"> <i class="fas fa-users"
					style="margin-right: 10px;"></i>Trustee
			</a></li> -->
			<!-- Daily Darshan -->
			<li class="nav-item"><a class="nav-link"
				href="<%=request.getContextPath()%>/manageKuberbhandari/admin-daily-darshan"
				style="color: black !important;"> <i class="fas fa-calendar-day"
					style="margin-right: 10px;"></i>Daily Darshan
			</a></li>
			<!-- Seva -->
			<li class="nav-item"><a class="nav-link"
				href="<%=request.getContextPath()%>/manageKuberbhandari/admin-seva"
				style="color: black !important;"> <i
					class="fas fa-hands-helping" style="margin-right: 10px;"></i>Seva
			</a></li>
			<!-- Events -->
			<li class="nav-item"><a class="nav-link"
				href="<%=request.getContextPath()%>/manageKuberbhandari/events"
				style="color: black !important;"> <i class="fas fa-calendar-alt"
					style="margin-right: 10px;"></i>Events
			</a></li>
			<!-- Important Dates -->
			<li class="nav-item"><a class="nav-link"
				href="<%=request.getContextPath()%>/manageKuberbhandari/admin-important-dates"
				style="color: black !important;"> <i
					class="fas fa-calendar-check" style="margin-right: 10px;"></i>Important
					Dates
			</a></li>
			<!-- Gallery -->
			<li class="nav-item"><a class="nav-link"
				href="<%=request.getContextPath()%>/manageKuberbhandari/gallery"
				style="color: black !important;"> <i class="fas fa-images"
					style="margin-right: 10px;"></i>Gallery
			</a></li>
			<!-- Booking -->
			<li class="nav-item"><a class="nav-link"
				href="<%=request.getContextPath()%>/manageKuberbhandari/seva-booked"
				style="color: black !important;"> <i class="fas fa-book"
					style="margin-right: 10px;"></i>Booking
			</a></li>
			<!-- Users -->
			<!-- <li class="nav-item"><a class="nav-link" href="#"
				style="color: black !important;"> <i class="fas fa-user-circle"
					style="margin-right: 10px;"></i>Users
			</a></li> -->
			<!-- Messages -->
			<!-- <li class="nav-item"><a class="nav-link" href="#"
				style="color: black !important;"> <i class="fas fa-envelope"
					style="margin-right: 10px;"></i>Messages
			</a></li> -->
			<!-- Role -->
			<!-- <li class="nav-item"><a class="nav-link" href="#"
				style="color: black !important;"> <i class="fas fa-user-cog"
					style="margin-right: 10px;"></i>Roles Assign
			</a></li> -->
			<!-- Dropdown for Master -->
			<li class="nav-item" style="background-color: #444;"><a
				class="nav-link" href="#" data-bs-toggle="collapse"
				data-bs-target="#masterDropdown" aria-expanded="false"
				aria-controls="masterDropdown" style="color: white !important;">
					Master <i class="caret"></i>
			</a>
				<div id="masterDropdown" class="collapse pl-4">
					<ul class="nav flex-column">
						<!-- <li class="nav-item"><a class="nav-link text-white" href="#">Pujaris</a></li>
						<li class="nav-item"><a class="nav-link text-white" href="#">Trustee</a></li>
						<li class="nav-item"><a class="nav-link text-white" href="#">Daily
								Darshan</a></li> -->
						<li class="nav-item"><a class="nav-link text-white"
							href="<%=request.getContextPath()%>/manageKuberbhandari/admin-seva-master">Seva</a>
						</li>
						<!-- <li class="nav-item"><a class="nav-link text-white" href="#">CCAvenue</a></li> -->
						<li class="nav-item"><a class="nav-link text-white"
							href="<%=request.getContextPath()%>/manageKuberbhandari/hindu-calendar-master">Hindu
								Calendar</a></li>
						<%-- <li class="nav-item"><a class="nav-link text-white"
							href="<%=request.getContextPath()%>/manageKuberbhandari/english-calendar-master">English
								Calendar</a></li> --%>
						<!-- <li class="nav-item"><a class="nav-link text-white" href="#">Roles</a></li> -->
					</ul>
				</div></li>
		</ul>
	</div>

	<!-- Add Bootstrap and necessary scripts -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
