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
<body>

	<!-- Header -->
	<%@include file="header.jsp"%>

	<!-- Offcanvas Sidebar -->
	<%@include file="sidebar.jsp"%>

	<!-- Main Content -->
	<main>
		<section class="content">
			<h2>Welcome to</h2>
			<p>Shree Kubereshwar Mahadev.</p>
		</section>
	</main>

	<!-- Footer -->
	<%@include file="footer.jsp" %>

	<!-- Bootstrap JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
