app.factory('apiUrlService', function($http) {
	//	var serverUrl = "http://localhost:8080/api/v1/";
	const baseUrl = "/kuberbhandari/manageKuberbhandari/";

	function buildUrl(module, endpoint = '') {
		return `${baseUrl}${module}/${endpoint}`;
	}

	return {
		adminLogin: function(obj) {
			var link = baseUrl + 'admin-login';
			return $http.post(link, obj); // send the login object in request body
		},
		saveEntity: function(module, formData, isUpdate) {
			const endpoint = isUpdate ? 'update' : 'add';
			return $http.post(buildUrl(module, endpoint), formData, {
				transformRequest: angular.identity,
				headers: { 'Content-Type': undefined }
			});
		},

		getAll: function(module) {
			return $http.get(buildUrl(module, 'getAll'));
		},

		getById: function(module, id) {
			return $http.get(buildUrl(module, id));
		},
		delete: function(module, ids) {
			return $http({
				method: 'POST',
				url: buildUrl(module, 'delete'),
				data: ids,
				headers: { 'Content-Type': 'application/json' }
			});
		},

	};
});
