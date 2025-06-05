<!DOCTYPE html>
<html lang="en" ng-app="kuberbhandari">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Sign In</title>

<!-- AngularJS script -->
<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.8.2/angular.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/front/js/config.js"></script>
<script src="<%=request.getContextPath()%>/resources/front/js/login.js"></script>

<style>
body {
	font-family: 'Arial', sans-serif;
	margin: 0;
	background: linear-gradient(to right, #ece9e6, #ffffff);
	color: #333;
}

.logo img {
	width: 275px;
	display: block;
	margin: 20px auto;
}

.container {
	max-width: 400px;
	margin: 30px auto;
	padding: 20px;
	background-color: #fff;
	border-radius: 10px;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
	text-align: center;
}

h2 {
	margin-bottom: 39px;
	color: #333;
}

.form-group {
	margin-bottom: 28px;
	text-align: left;
}

.form-group label {
	display: block;
	margin-bottom: 5px;
	margin-top: -11px;
}

.form-group input, .form-group select {
	width: 94%;
	padding: 10px;
	font-size: 14px;
	border: 1px solid #ccc;
	border-radius: 5px;
	transition: all 0.3s ease;
}

.form-group input:focus, .form-group select:focus {
	outline: none;
	border-color: #0073e6;
	box-shadow: 0 0 5px rgba(0, 115, 230, 0.5);
}

.form-group label {
	display: inline-block;
	margin-right: 15px;
}

.radio-inline {
	display: inline-block;
	margin-right: 10px;
}

.btn {
	display: block;
	width: 100%;
	padding: 12px;
	background-color: #f0c14b;
	border: none;
	border-radius: 5px;
	color: #333;
	font-size: 16px;
	font-weight: bold;
	cursor: pointer;
	transition: background-color 0.3s ease;
	margin-bottom: 20px;
}

.btn:hover {
	background-color: #e1a700;
}

.separator {
	margin: 15px 0;
	text-align: center;
	color: #888;
	font-size: 14px;
}

.create-account {
	color: #0073e6;
	cursor: pointer;
	font-weight: bold;
	text-decoration: none;
}

.create-account:hover {
	text-decoration: underline;
}

.modal {
	display: flex;
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.7);
	z-index: 1000;
	align-items: center;
	justify-content: center;
}

.modal-content {
	position: relative;
	background: #fff;
	width: 90%;
	max-width: 400px;
	padding: 20px;
	border-radius: 10px;
	box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
	animation: slideIn 0.4s ease;
}

@
keyframes slideIn {from { transform:translateY(-50px);
	opacity: 0;
}

to {
	transform: translateY(0);
	opacity: 1;
}

}
.close {
	position: absolute;
	top: 10px;
	right: 10px;
	font-size: 24px;
	color: #888;
	cursor: pointer;
	transition: color 0.3s ease;
}

.close:hover {
	color: #000;
}

.footer a {
	color: #0073e6;
	text-decoration: none;
}

.footer a:hover {
	text-decoration: underline;
}
</style>
</head>

<body ng-controller="LoginRegisterController">
	<div class="logo">
		<img
			src="resources/front/img/logos/logo-ShreeKubereshwarMahadev-3.png"
			alt="Logo">
	</div>
	<div class="container">
		<h2>Sign in</h2>
		<div class="form-group">
			<label for="email">Email</label> <input type="text" id="email"
				name="email" ng-model="email" required
				ng-keypress="$event.which === 13 && loginRegister()">
		</div>
		<button class="btn" ng-click="loginRegister()">Continue</button>
		<div class="separator">
			<span>Don't have an account?</span>
		</div>
		<div>
			<a href="#" class="create-account" ng-click="openModal()">Sign Up</a>
		</div>
	</div>

	<!-- Modal -->
	<div class="modal" id="modal" ng-show="isModalOpen">
		<div class="modal-content">
			<span class="close" ng-click="closeModal()">&times;</span>
			<h2 style="text-align: center;">Create Account</h2>
			<div class="row">
				<div class="form-group">
					<input type="text" ng-model="firstName" placeholder="First name"
						required>
				</div>
				<div class="form-group">
					<input type="text" ng-model="lastName" placeholder="Last name"
						required>
				</div>
			</div>
			<div class="form-group">
				<input type="text" ng-model="mobile" placeholder="Mobile number"
					required>
			</div>
			<div class="row">
				<label>Gender:</label> <label class="radio-inline"> <input
					type="radio" ng-model="genderId" value="0" required> Male
				</label> <label class="radio-inline"> <input type="radio"
					ng-model="genderId" value="1" required> Female
				</label>
			</div>
			<div class="form-group">
				<!-- <label for="email">Email</label> -->
				<input type="email" ng-model="signUpEmail" autocomplete="off"
					placeholder="Enter your email" required style="margin-top: 16px;">
			</div>
			<div class="form-group">
				<!-- <label for="password">Password</label> -->
				<input type="password" ng-model="password" autocomplete="off"
					placeholder="At least 6 characters" required ng-keypress="$event.which === 13 && signUp()">
			</div>
			<button class="btn" ng-click="signUp()">Create Account</button>
			<div class="footer" style="text-align: center;">
				Already have an account? <a href="#" ng-click="registerSignin()">Sign
					in</a>
			</div>
		</div>
	</div>
</body>
</html>
