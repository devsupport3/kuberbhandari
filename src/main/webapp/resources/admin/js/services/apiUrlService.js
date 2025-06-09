app.factory('apiUrlService', function($http) {
	//	var serverUrl = "http://localhost:8080/api/v1/";
	var serverUrl = "/kuberbhandari/manageKuberbhandari/";
	return {
		adminLogin: function(obj) {
			var link = serverUrl + 'admin-login';
			return $http.post(link, obj); // send the login object in request body
		},
		addSevaType: function(formData) {
			return $http.post(serverUrl + "addSevaType", formData, {
				transformRequest: angular.identity,
				headers: { 'Content-Type': undefined }
			});
		},
		// ✅ Add this function to fetch all SevaTypes
		getAllSevaTypes: function() {
			return $http.get(serverUrl + "getAllSevaTypes");
		}
	};
});
