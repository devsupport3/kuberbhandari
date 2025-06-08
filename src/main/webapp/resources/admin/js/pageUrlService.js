app.factory('pageUrlService', function($window, $location) {
	var url = "/kuberbhandari/";
	var adminUrl = url + "manageKuberbhandari/";
	return {
		redirectToAdminDashboard: function() {
			var url = $location.protocol() + "://" + location.host + adminUrl + "admin-dashboard";
			$window.location.href = url;
		}
	};
});
