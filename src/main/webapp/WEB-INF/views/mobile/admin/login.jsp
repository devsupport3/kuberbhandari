<!DOCTYPE html>
<html lang="en" ng-app="kuberbhandari">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Login</title>

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet" />
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
	rel="stylesheet" />

<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.8.2/angular.min.js"></script>
<script
	src="<%=request.getContextPath()%>/resources/admin/js/confAdmin.js"></script>
<script
	src="<%=request.getContextPath()%>/resources/admin/js/admin_login.js"></script>
	
<style>
body {
	height: 100vh;
	background: #ffad28;
	margin: 0;
	display: flex;
	align-items: center;
	justify-content: center;
	padding: 15px;
}

.login-container {
	background: rgba(255, 255, 255, 0.95);
	padding: 30px 25px;
	border-radius: 12px;
	box-shadow: 0 10px 25px rgba(0, 0, 0, 0.15);
	width: 100%;
	max-width: 400px;
}

.login-container h2 {
	text-align: center;
	margin-bottom: 20px;
	font-weight: bold;
	color: #333;
}

.login-btn {
	background: black;
	color: white;
	border: none;
	border-radius: 25px;
	padding: 12px;
	width: 100%;
	font-size: 16px;
	font-weight: bold;
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
}

.forgot-password:hover {
	color: #2575fc;
}

.form-control {
	border-radius: 25px;
	padding-left: 15px;
	font-size: 14px;
	height: 45px;
}

.input-group-text {
	border-radius: 25px 0 0 25px;
	padding: 0 15px;
}

.logo {
	display: block;
	margin: 0 auto 20px;
	max-width: 200px;
}

@media ( max-width : 576px) {
	.login-container {
		padding: 25px 20px;
	}
	.form-control {
		height: 42px;
		font-size: 13px;
	}
	.login-btn {
		font-size: 14px;
		padding: 10px;
	}
	.logo {
		max-width: 160px;
	}
}
</style>
</head>
<body ng-controller="AdminLoginController">

	<div class="login-container">
		<div class="text-center">
			<img src="img/logos/logo-ShreeKubereshwarMahadev-3.png" alt="Logo"
				class="logo" />
		</div>
		<h2>Login</h2>
		<form>
			<div class="mb-3">
				<div class="input-group">
					<span class="input-group-text bg-white text-secondary"> <i
						class="fas fa-user"></i>
					</span> <input type="text" class="form-control" id="username"
						placeholder="Username" required />
				</div>
			</div>

			<div class="mb-3">
				<div class="input-group">
					<span class="input-group-text bg-white text-secondary"> <i
						class="fas fa-lock"></i>
					</span> <input type="password" class="form-control" id="password"
						placeholder="Password" required />
				</div>
			</div>

			<button type="submit" class="login-btn">
				<a href="index.html" style="color: white; text-decoration: none;">Login</a>
			</button>

			<a href="forgot-password.html" class="forgot-password">Forgot
				Password?</a>
		</form>
	</div>

	<!-- Bootstrap JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
