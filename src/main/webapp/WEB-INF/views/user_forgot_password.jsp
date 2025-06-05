<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" ng-app="kuberbhandari">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Forgot Password</title>

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
	margin-bottom: 20px;
	color: #333;
}

p {
	font-size: 14px;
	margin-bottom: 20px;
}

.form-group {
	margin-bottom: 15px;
	text-align: left;
}

.form-group input {
	width: 94%;
	padding: 10px;
	font-size: 14px;
	border: 1px solid #ccc;
	border-radius: 5px;
	transition: all 0.3s ease;
}

.form-group input:focus {
	outline: none;
	border-color: #0073e6;
	box-shadow: 0 0 5px rgba(0, 115, 230, 0.5);
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

.footer a {
	color: #0073e6;
	text-decoration: none;
}

.footer a:hover {
	text-decoration: underline;
}
</style>
</head>
<body ng-controller="ForgotPasswordController">
	<div class="logo">
		<img
			src="resources/front/img/logos/logo-ShreeKubereshwarMahadev-3.png"
			alt="Logo">
	</div>
	<div class="container">
		<h2>Forgot Password</h2>
		<p>Enter the email address associated with your Shree Kubereshwar
			Mahadev account.</p>

		<div class="form-group">
			<input type="email" ng-model="email" placeholder="Email" required
				ng-keypress="$event.which === 13 && resetPassword()">
		</div>
		<button class="btn" ng-click="resetPassword()">Reset Password</button>

		<div class="footer">
			<a href="<%=request.getContextPath()%>/login-register">Back to
				Login</a>
		</div>
	</div>


	<!-- <script>
         angular.module('forgotPasswordApp', [])
            .controller('ForgotPasswordController', function($scope) {
                // Placeholder for userEmail model
                $scope.userEmail = '';

                // Function to reset the password (to be integrated with backend)
                $scope.resetPassword = function() {
                    if ($scope.userEmail) {
                        // Logic to handle password reset (e.g., API call)
                        alert('Password reset link sent to ' + $scope.userEmail);
                    } else {
                        alert('Please enter a valid email address.');
                    }
                };
            }); 
    </script> -->
</body>
</html>
