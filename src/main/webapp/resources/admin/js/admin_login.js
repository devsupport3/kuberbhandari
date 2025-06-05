
app.controller('AdminLoginController', function($scope, $http, $window, $location) {


	$scope.login = function() {
		if ($scope.username && $scope.password) {
			var link = adminUrl + 'admin-login?email=' + $scope.username + '&password=' + $scope.password;
			$http({
				method: 'POST',
				url: link,

			}).then(function(response) {
				if (response.data && response.data.status) {
					//alert(response.data.message);
					$window.location.href = $location.protocol() + "://" + location.host + "/Kuberbhandari/manageKuberbhandari/admin-dashboard";
				} else {
					alert(response.data.message);
				}
			}).catch(function(error) {
				console.log(error);
			});
		} else {
			alert('Please enter both username and password');
		}
	};

});

/*app.controller('AdminLoginController', function($scope, $http, $window, $location) {

	var baseUrl = $location.protocol() + "://" + location.host + url;
	var adminBaseUrl = $location.protocol() + "://" + location.host + adminurl;

	$scope.email = '';
	$scope.password = '';

	$scope.login = function() {
		if ($scope.email && $scope.password) {
			var link = baseUrl + 'admin-login?email=' + $scope.email + '&password=' + $scope.password;
			$http({
				method: 'POST',
				url: link,
				data: {
					username: $scope.email,
					password: $scope.password
				}
			}).then(function(response) {
				if (response.data === true) {
					$window.location.href = $location.protocol() + "://" + location.host + "/kuberbhandari/manageKuberbhandari/admin-dashboard';
				} else {
					alert('Invalid username or password');
				}, function(error) {
					console.error('Error occurred:', error);
					alert('An error occurred during login. Please try again.');
				});
		} else {
			alert('Please enter both username and password');
		}
	};
});*/

// change password
/*app.controller('AdminChangePasswordController', function($scope) {
	var baseUrl = $location.protocol() + "://" + location.host + url;
	$scope.currentPassword = '';
	$scope.newPassword = '';
	$scope.confirmPassword = '';

	$scope.adminChangePassword = function() {
		if ($scope.newPassword !== $scope.confirmPassword) {
			alert('Passwords do not match!');
		} else {
			alert('Password changed successfully');
		}
	};
});*/

// Forgot Password Controller
/*app.controller('AdminForgotPasswordController', function($scope) {
	var baseUrl = $location.protocol() + "://" + location.host + url;
	 $scope.email = '';

	 $scope.adminResetPassword = function() {
		if ($scope.email) {
			alert('Password reset instructions sent to ' + $scope.email);
			$window.location.href = 'admin_login.jsp';
		} else {
			alert('Please enter a valid email address');
		}
	};
});*/