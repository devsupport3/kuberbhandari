
/*app.controller('headerCtrl', function($scope, $http, $window, $location) {

	var baseUrl = $location.protocol() + "://" + $location.host() + ":" + $location.port() + "/Kuberbhandari/manageKuberbhandari/";

	$scope.logout = function() {
		var link = adminUrl + 'admin-logout';
		$http({
			method: 'POST',
			url: link,

		}).then(function(response) {
			$window.location.href = adminUrl + 'login';
		}).catch(function(error) {
			console.log(error);
		});
	}
});*/