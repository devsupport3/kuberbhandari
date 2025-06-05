<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	max-width: 90%;
	width: 400px;
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

.link {
	font-size: 14px;
	color: #0073e6;
	text-decoration: none;
}

.link:hover {
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
		<%-- <div class="info-text" style="margin-right: 199px; margin-bottom: 15px;">
			{{signUpEmail}} <a class="link" href="<%=request.getContextPath()%>/userChangePassword">Change</a>
		</div> --%>
		<div class="form-group">
			<label for="password"><strong>Password</strong></label> <a
				class="link forgot-password"
				href="<%=request.getContextPath()%>/userForgotPassword"
				style="float: right;">Forgot password?</a>
			<div class="input-wrapper">
				<input type="password" id="password" name="password"
					ng-model="password" style="margin-top: 10px;"
					ng-keypress="$event.which === 13 && signIn()">
			</div>
		</div>
		<button class="btn" ng-click="signIn()">Sign in</button>
		<!-- Uncomment if OTP feature is required
        <div class="info-text" style="text-align: center; margin: 15px 0;">or</div>
        <button class="btn" style="background-color: #e7e7e7; border: 1px solid #ccc; color: #111;" ng-click="getOtp()">
            Get an OTP on your email
        </button>
        -->
	</div>

	<!-- <script>
        const app = angular.module('signInApp', []);
        app.controller('SignInController', function($scope) {
            // Initialize user object
            $scope.user = {
                email: 'johndeo@example.com',
                password: ''
            };

            // Function to handle sign-in
            $scope.signIn = function() {
                if ($scope.user.password) {
                    console.log('Signing in with:', $scope.user);
                    alert('Sign-in successful!');
                    // Add form submission or API integration logic here
                    window.location.href = 'index.jsp';
                } else {
                    alert('Please enter your password.');
                }
            };

            // Function to handle OTP feature (if required)
            $scope.getOtp = function() {
                console.log('Requesting OTP for:', $scope.user.email);
                alert('OTP sent to your email!');
            };
        });
    </script> -->
</body>
</html>