<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en" ng-app="kuberbhandari">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Header</title>

<!-- AngularJS -->
<%-- <script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.8.2/angular.min.js"></script>
<script
	src="<%=request.getContextPath()%>/resources/admin/js/confAdmin.js"></script> --%>
<%-- <script
	src="<%=request.getContextPath()%>/resources/admin/js/admin_header.js"></script> --%>

<style>
body {
	padding-top: 70px;
}

.navbar {
	background-color: #ffad28;
	position: fixed;
	width: 100%;
	top: 0;
	left: 0;
	padding: 10px 20px;
	display: flex;
	justify-content: space-between;
	align-items: center;
	z-index: 999;
	flex-wrap: wrap;
}

/* Logo styling */
.navbar .logo {
	width: 219px;
	max-width: 100%;
	height: auto;
}

.navbar .user-dropdown {
	position: relative;
	display: inline-block;
}

.navbar .dropdown-content {
	display: none;
	position: absolute;
	right: 0;
	background-color: #f1f1f1;
	box-shadow: 0px 8px 16px rgba(0, 0, 0, 0.2);
	z-index: 1;
	min-width: 120px;
}

@media ( hover : hover) and (pointer: fine) {
	.navbar .user-dropdown:hover .dropdown-content {
		display: block;
	}
}

.dropdown-content a {
	padding: 12px 16px;
	text-decoration: none;
	display: block;
	color: black;
}

.dropdown-content a:hover {
	background-color: #ddd;
}

.btn-danger {
	color: black !important;
	background-color: white !important;
	border-color: white !important;
	width: 100%;
	text-align: left;
	padding: 10px 16px;
	border: none;
	cursor: pointer;
}

/* Responsive */
@media screen and (max-width: 768px) {
	.navbar {
		flex-direction: row;
		justify-content: space-between;
		align-items: center;
	}
	.navbar-brand {
		display: flex;
		align-items: center;
		flex: 1;
	}
	.navbar .logo {
		width: auto;
		max-height: 40px;
		margin-left: 10px;
	}
	.navbar .user-dropdown {
		position: relative;
		margin-top: 10px;
		/* width: 100%; */
		text-align: right;
	}
	.navbar .dropdown-content {
		top: 100%;
		right: 0;
		background-color: #f1f1f1;
		border: 1px solid #ddd;
		z-index: 10;
	}
	.dropdown-content a, .btn-danger {
		padding: 12px 16px;
		width: 100%;
		box-sizing: border-box;
	}
}
</style>
</head>
<body ng-controller="headerCtrl">

	<!-- Navbar -->
	<nav class="navbar">

		<!-- Logo -->
		<a class="navbar-brand"
			href="<%=request.getContextPath()%>/manageKuberbhandari/admin-dashboard">
			<img
			src="<%=request.getContextPath()%>/resources/front/img/logos/logo-ShreeKubereshwarMahadev-3.png"
			alt="Logo" class="logo" style="    object-fit: scale-down;">
		</a>

		<!-- User Info Dropdown -->
		<div class="user-dropdown" id="userDropdown">
			<a href="#" id="navbarDropdown" onclick="toggleDropdown()"><%=session.getAttribute("adminUserName")%></a>
			<i class="fas fa-caret-down" onclick="toggleDropdown()"></i>
			<div class="dropdown-content" id="dropdownMenu">
				<button class="btn btn-danger" ng-click="logout()">Logout</button>
			</div>
		</div>
	</nav>

	<script>
		function toggleDropdown() {
			var dropdownMenu = document.getElementById('dropdownMenu');
			dropdownMenu.style.display = (dropdownMenu.style.display === 'none' || dropdownMenu.style.display === '') ? 'block'
					: 'none';
		}
	</script>

</body>
</html>