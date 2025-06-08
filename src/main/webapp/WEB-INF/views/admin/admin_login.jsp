<!DOCTYPE html>
<html lang="en" ng-app="kuberbhandari">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login</title>
<%@ include file="/WEB-INF/views/includeCssJs.jsp"%>
<style>
body {
	height: 100vh;
	display: flex;
	justify-content: center;
	align-items: center;
	background: #ffad28;
	color: #fff;
	margin: 0;
	padding: 0;
}

.login-container {
	background: rgba(255, 255, 255, 0.9);
	padding: 30px;
	border-radius: 10px;
	box-shadow: 0 8px 15px rgba(0, 0, 0, 0.1);
	max-width: 400px;
	width: 100%;
}

.login-container h2 {
	text-align: center;
	margin-bottom: 20px;
	font-weight: bold;
	color: #333;
}

.login-btn {
	background: black;
	color: #fff;
	border: none;
	border-radius: 25px;
	padding: 10px;
	width: 100%;
	font-size: 16px;
	font-weight: bold;
	cursor: pointer;
	transition: all 0.3s ease-in-out;
}

.login-btn:hover {
	background: linear-gradient(135deg, #2575fc, #6a11cb);
}

.forgot-password {
	display: block;
	text-align: center;
	margin-top: 10px;
	font-size: 14px;
	color: #6a11cb;
	text-decoration: none;
	transition: color 0.3s ease-in-out;
}

.forgot-password:hover {
	color: #2575fc;
}
</style>
</head>

<body ng-controller="AdminLoginController" ng-cloak>
	<div class="login-container">
		<div class="text-center mb-4">
			<img
				src="<%=request.getContextPath()%>/resources/front/img/logos/logo-ShreeKubereshwarMahadev-3.png"
				alt="Logo">
		</div>
		<form name="myForm" novalidate>
			<div class="mb-3">
				<div class="input-group">
					<span class="input-group-text bg-white text-secondary"> <i
						class="fas fa-user"></i>
					</span> <input type="text" class="form-control" id="emailId"
						name="emailId" ng-model="entity.emailId" placeholder="Username"
						required>
				</div>
				<small class="text-danger"
					ng-if="myForm.emailId.$touched && myForm.emailId.$invalid">
					This field is required. </small>
			</div>
			<div class="mb-3">
				<div class="input-group">
					<span class="input-group-text bg-white text-secondary"> <i
						class="fas fa-lock"></i>
					</span> <input type="password" class="form-control" id="password"
						name="password" ng-model="entity.password" placeholder="Password"
						required ng-keypress="$event.which === 13 && login()">
				</div>
				<small class="text-danger"
					ng-if="myForm.password.$touched && myForm.password.$invalid">
					This field is required. </small>
			</div>
			<button class="login-btn" ng-click="login()">Login</button>

		</form>
	</div>
<!-- ✅ Place this near the top of <body> -->
	<toaster-container toaster-options="{'time-out': 1000}"></toaster-container>
	<script
		src="<%=request.getContextPath()%>/resources/admin/js/admin_login.js"></script>
</body>
</html>
