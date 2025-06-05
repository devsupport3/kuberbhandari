<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en" ng-app="kuberbhandari">
<head>
<meta charset="UTF-8">
<title>Change Password</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- AngularJS script -->
<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.8.2/angular.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/front/js/config.js"></script>
<script src="<%=request.getContextPath()%>/resources/front/js/login.js"></script>

<style>
html, body {
	height: 100%;
	margin: 0;
	overflow: hidden; /* 🚫 No scrollbars */
}

body {
	display: flex;
	align-items: center;
	justify-content: center;
	background-color: #f8f9fa;
}

.form-container {
	width: 100%;
	max-width: 400px;
	padding: 2rem;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	background: white;
	border-radius: 10px;
}

.logo img {
	max-height: 80px;
}
</style>
</head>
<body ng-controller="ChangePasswordController">
	<div class="form-container text-center">
		<div class="logo mb-3">
			<img
				src="resources/front/img/logos/logo-ShreeKubereshwarMahadev-3.png"
				alt="Logo" class="img-fluid">
		</div>
		<!-- <h2 class="mb-4">Change Password</h2> -->
		<form>
			<div class="form-group mb-3 text-start">
				<label for="currentPassword">Current Password</label> <input
					type="password" id="currentPassword" ng-model="currentPassword"
					class="form-control" required>
			</div>
			<div class="form-group mb-3 text-start">
				<label for="newPassword">New Password</label> <input type="password"
					id="newPassword" ng-model="newPassword" class="form-control"
					required>
			</div>
			<div class="form-group mb-4 text-start">
				<label for="confirmPassword">Confirm New Password</label> <input
					type="password" id="confirmPassword" ng-model="confirmPassword"
					class="form-control" required
					ng-keypress="$event.which === 13 && changePassword()">
			</div>
			<button type="button" class="btn btn-dark w-100"
				style="background-color: #f0c14b; color: black; border: none;"
				ng-click="changePassword()">Change Password</button>
		</form>
	</div>
</body>
</html>
