// Login and Register Controller
app.controller('LoginRegisterController', function($scope, $http, $window, $location) {

	var baseUrl = $location.protocol() + "://" + location.host + url;

	// Data binding for sign-in form
	$scope.email = '';
	$scope.password = '';

	// Data binding for sign-up form
	$scope.firstName = '';
	$scope.lastName = '';
	$scope.mobile = '';
	$scope.signUpEmail = '';
	$scope.signUpPassword = '';

	// Show or hide the modal
	$scope.isModalOpen = false;

	// Function to handle the modal visibility
	$scope.openModal = function() {
		$scope.isModalOpen = true;
	};

	$scope.closeModal = function() {
		$scope.isModalOpen = false;
	};

	// Function to handle sign-in
	$scope.loginRegister = function() {
		if ($scope.email) {
			var link = baseUrl + 'user-login?email=' + $scope.email;
			$http({
				method: 'POST',
				url: link
			}).then(function(response) {
				if (response.data == true) {
					$window.location.href = $location.protocol() + "://" + location.host + "/Kuberbhandari/signIn";
				}
			}, function(error) {

			});

		} else {
			alert('Please enter your email');
		}
	};

	// Function to handle sign-up
	$scope.signUp = function() {
		if ($scope.firstName && $scope.lastName && $scope.mobile && $scope.signUpEmail && $scope.password && $scope.genderId) {
			var link = baseUrl + 'user-create?firstName=' + $scope.firstName + '&lastName=' + $scope.lastName + '&email=' + $scope.signUpEmail + '&mobile=' + $scope.mobile + '&password=' + $scope.password + '&gender=' + $scope.genderId;
			$http({
				method: 'POST',
				url: link
			}).then(function(response) {
				alert(response.data.message);
				if (response.status === 200) {

					// Clear the form fields
					$scope.firstName = '';
					$scope.lastName = '';
					$scope.mobile = '';
					$scope.signUpEmail = '';
					$scope.password = '';
					$scope.genderId = '';

					$scope.closeModal(); // Close the modal after successful sign-up
					$window.location.href = $location.protocol() + "://" + location.host + "/Kuberbhandari/login-register";
					// $window.location.reload();
				}
			}, function(error) {
				alert('Error occurred while creating the account. Please try again.');
			});

		} else {
			alert('Please fill all fields');
		}
	};

	$scope.registerSignin = function() {
		$window.location.href = $location.protocol() + "://" + location.host + "/Kuberbhandari/login-register";
	};

	// Function to handle sign-in action
	$scope.signIn = function() {
		if ($scope.password) {
			var link = baseUrl + 'user-signin?email=' + $scope.email + '&password=' + $scope.password;
			$http({
				method: 'POST',
				url: link
			}).then(function(response) {
				if (response.data) {
					//alert("Sign in successful!");
					$window.location.href = $location.protocol() + "://" + location.host + "/Kuberbhandari/";
				} else {
					alert("Invalid Password");
				}

			}, function(error) {

			});

		} else {
			alert('Please enter your password');
		}
	};
});

// Change Password Controller
app.controller('ChangePasswordController', function($scope, $http, $window, $location) {
	
	var baseUrl = $location.protocol() + "://" + location.host + url;
	$scope.currentPassword = '';
	$scope.newPassword = '';
	$scope.confirmPassword = '';

	$scope.changePassword = function() {
		// Check if the new password and confirm password match
		if ($scope.newPassword && $scope.currentPassword && $scope.confirmPassword) {
			if ($scope.newpassword != $scope.confirmPassword) {
				toastr.error('New Password and Confirm Password is not same!');
			} else {
				var link = baseUrl + 'changePassword?newPassword=' + $scope.newpassword + '&currentPassword=' + $scope.currentpassword;
				$http({ url: link, method: "POST" }).success(function(data, status, headers, config) {
					console.log(data);
					if (data.success) {
						toastr.success('Password changed successfully!');
						$window.location.href = baseUrl + "/";
					} else {
						toastr.error('Current Password is not match!');
					}
				}).error(function(data, status, headers, config) {
					toastr.error('Something went wrong. Please try again!');
				});
			}
		} else {
			toastr.error('All field are required');
		}
	}
});

// Forgot Password Controller
app.controller('ForgotPasswordController', function($scope, $http, $window, $location) {
	var baseUrl = $location.protocol() + "://" + location.host + url;
	$scope.email = '';

	$scope.resetPassword = function() {
		if ($scope.email) {
			alert('Password reset instructions sent to ' + $scope.email);
			$window.location.href = $location.protocol() + "://" + location.host + "/Kuberbhandari/login-register";
		} else {
			alert('Please enter a valid email address');
		}
	};
});