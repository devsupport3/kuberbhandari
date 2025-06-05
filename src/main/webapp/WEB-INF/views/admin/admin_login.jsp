<!DOCTYPE html>
<html lang="en" ng-app="kuberbhandari">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login</title>

<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.8.2/angular.min.js"></script>
	
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
	rel="stylesheet">

<script src="<%=request.getContextPath()%>/resources/admin/js/confAdmin.js"></script>
<script src="<%=request.getContextPath()%>/resources/admin/js/admin_login.js"></script>

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

<body ng-controller="AdminLoginController">
	<div class="login-container">
		<div class="text-center mb-4">
			<img src="<%=request.getContextPath()%>/resources/front/img/logos/logo-ShreeKubereshwarMahadev-3.png" alt="Logo"
				style="height: 80px;">
		</div>
		<form>
			<div class="mb-3">
				<div class="input-group">
					<span class="input-group-text bg-white text-secondary"> <i
						class="fas fa-user"></i>
					</span> <input type="text" class="form-control" id="username"
						ng-model="username" placeholder="Username" required>
				</div>
			</div>
			<div class="mb-3">
				<div class="input-group">
					<span class="input-group-text bg-white text-secondary"> <i
						class="fas fa-lock"></i>
					</span> <input type="password" class="form-control" id="password"
						ng-model="password" placeholder="Password" required ng-keypress="$event.which === 13 && login()">
				</div>
			</div>
			<button class="login-btn" ng-click="login()">Login</button>
			<%-- <a href="<%=request.getContextPath()%>/manageKuberbhandari/forgotPassword" class="forgot-password">Forgot
				Password?</a> --%>
		</form>
	</div>

	<!-- Bootstrap -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
	

</body>
</html>
