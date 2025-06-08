app.controller('AdminLoginController', function($scope, commonService, apiUrlService, pageUrlService, $timeout) {
	$scope.login = function() {
		commonService.touchAllFields($scope.myForm);
		if ($scope.myForm.$invalid) return;

		commonService.runWithLoader(() =>
			apiUrlService.adminLogin($scope.entity)
				.then(function(response) {
					if (response.data && response.data.status) {
						commonService.notify.success("Success", response.data.message || "Login successful!");

						// Redirect after toaster delay (1 second)
						$timeout(function () {
							pageUrlService.redirectToAdminDashboard();
						}, 1000);
					} else {
						commonService.notify.error("Error", response.data.message || "Login failed");
					}
				})
				.catch(function(error) {
					console.error("Login error:", error);
					commonService.notify.error("Error", "Server error occurred");
				})
		);
	};
});
