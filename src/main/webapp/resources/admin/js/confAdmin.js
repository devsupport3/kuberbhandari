var app = angular.module("kuberbhandari", []);

var baseUrl = "/Kuberbhandari/";
var url = "/Kuberbhandari/";
var adminUrl = "/Kuberbhandari/manageKuberbhandari/";

// var url = "/";
//var adminurl = "/manageKuberbhandari/";

/* For Print data with html tag start */
app.filter('to_trusted', ['$sce', function($sce) {
	return function(text) {
		return $sce.trustAsHtml(text);
	};
}]);

app.filter('cut', function() {
	return function(value, wordwise, max, tail) {
		if (!value) return '';

		max = parseInt(max, 10);
		if (!max) return value;
		if (value.length <= max) return value;

		let div = document.createElement('div');
		div.innerHTML = value;
		let text = div.textContent || div.innerText || '';

		value = text.substr(0, max);
		if (wordwise) {
			var lastspace = value.lastIndexOf(' ');
			if (lastspace !== -1) {
				//Also remove . and , so its gives a cleaner result.
				if (value.charAt(lastspace - 1) === '.' || value.charAt(lastspace - 1) === ',') {
					lastspace = lastspace - 1;
				}
				value = value.substr(0, lastspace);
			}
		}

		return value + (tail || '…');
	};
});

app.filter('dateFormat', function() {
	return function(input) {
		if (!input) return "";

		var parts = input.split("/");
		if (parts.length !== 3) return input; // Return original if format is wrong

		var date = new Date(parts[2], parts[1] - 1, parts[0]); // (YYYY, MM-1, DD)
		var options = { day: 'numeric', month: 'short', year: 'numeric' };

		return date.toLocaleDateString('en-US', options).replace(",", ""); // "30 Mar 2025"
	};
});

app.filter('dateFormat1', function() {
	return function(input) {
		if (!input) return "";

		var parts = input.split("/");
		if (parts.length !== 3) return input; // Return original if format is wrong

		var date = new Date(parts[2], parts[1] - 1, parts[0]); // (YYYY, MM-1, DD)

		// Get day with leading zero
		var day = ("0" + date.getDate()).slice(-2);
		// Get short month name
		var month = date.toLocaleString('en-US', { month: 'short' });
		// Get full year
		var year = date.getFullYear();

		return `${day} ${month} ${year}`; // e.g., "09 May 2025"
	};
});

app.service('cartService', function() {
	var cart = []; // Shared cart array

	return {
		getCart: function() {
			return cart;
		},
		addItem: function(item) {
			cart = item;
		},
		getCartCount: function() {
			return cart.length;
		},
		isDelivery: function() {
			return cart.some(function(item) {
				return item.orderDelivery === "y" ? true : false;
			})
		}
	};
});

app.service('pagePermissionService', function() {
	var roleBasedPermission = [];
	return {
		getAllPermitPages: function() {
			return roleBasedPermission;
		},
		addPermitPages: function(item) {
			roleBasedPermission = item;
		},
		getAdminNonMasterPages: function() {
			return roleBasedPermission.filter(function(item) {
				return !item.pageName.includes('_master');
			});
		},
		getAdminMasterPages: function() {
			return roleBasedPermission.filter(function(item) {
				return item.pageName.includes('_master');
			});
		},
	};

});

app.controller('AdminSevaController', function($scope, $http, $window, $location) {

	/******** Master Seva Type *********/
	$scope.sevaTypeList = [];

	$scope.newSevaType = {
		sevaTypeId: 0,
		sevaTypeName: '',
		description: '',
		image: '',
		status: 'n',
		createdBy: 0,
		createdDate: '',
		ipAddress: ''
	};
	$scope.isSevaTypeActive = $scope.newSevaType.status === 'y' ? true : false;

	$scope.sevaTypeToggle = function() {
		$scope.newSevaType.status = $scope.isSevaTypeActive ? 'y' : 'n';
	};

	// Function to add a Seva Type
	$scope.addSevaType = function() {

		var valuex = document.getElementById("valuex").value;
		var valuey = document.getElementById("valuey").value;
		var valuew = document.getElementById("valuew").value;
		var valueh = document.getElementById("valueh").value;

		if (!valuex)
			valuex = 0;
		if (!valuey)
			valuey = 0;
		if (!valuew)
			valuew = 0;
		if (!valueh)
			valueh = 0;

		if (!$scope.newSevaType.sevaTypeName) {
			alert("Seva type name cannot be empty");
			return;
		}

		var formData = new FormData();

		// Check if the file input has a file or not
		var sevaTypeImageInput = document.getElementById("sevaTypeImage");
		if (sevaTypeImageInput.files.length > 0) {
			formData.append('file', sevaTypeImageInput.files[0]);
		}

		formData.append('sevaTypeStr', JSON.stringify($scope.newSevaType));

		var link = adminUrl + "addSevaType?valuex=" + valuex + '&valuey=' + valuey + '&valuew=' + valuew + '&valueh=' + valueh;

		// API call to add Seva Type
		$http.post(link, formData, {
			headers: { 'Content-Type': undefined },
			transformRequest: function(data, headersGetterFunction) { return data; }
		}).then(function(response) {
			if (response.status === 201) {
				alert("Seva type added successfully!");
				$scope.newSevaType = {};  // Clear form
				$scope.getAllSevaTypes();
				document.getElementById("sevaTypeImage").value = null;

			}
		})
			.catch(function(error) {
				if (response.status === 401) {
					$window.location.href = adminUrl + 'login';
				} else {
					console.error("Error Response:", error);
					alert("An error occurred: " + error.data.message || "Unknown error");
				}
			});
	};

	// Function to update a Seva Type
	$scope.updateSevaType = function() {

		var valuex = document.getElementById("valuex").value;
		var valuey = document.getElementById("valuey").value;
		var valuew = document.getElementById("valuew").value;
		var valueh = document.getElementById("valueh").value;

		if (!valuex)
			valuex = 0;
		if (!valuey)
			valuey = 0;
		if (!valuew)
			valuew = 0;
		if (!valueh)
			valueh = 0;

		if (!$scope.newSevaType.sevaTypeId) {
			alert("Seva Type ID is required");
			return;
		}
		if (!$scope.newSevaType.sevaTypeName) {
			alert("Seva type name cannot be empty");
			return;
		}

		var formData = new FormData();
		if (sevaTypeImage.files[0]) {
			formData.append('file', sevaTypeImage.files[0]);
		}

		formData.append('sevaTypeStr', JSON.stringify($scope.newSevaType));

		var link = adminUrl + "updateSevaType?id=" + $scope.newSevaType.sevaTypeId + '&valuex=' + valuex + '&valuey=' + valuey + '&valuew=' + valuew + '&valueh=' + valueh;

		// API call to update Seva Type
		$http.post(link, formData, {
			headers: { 'Content-Type': undefined },
			transformRequest: function(data, headersGetterFunction) { return data; }
		})
			.then(function(response) {
				if (response.status === 200) {
					alert("Seva type updated successfully!");
					$scope.newSevaType.sevaTypeId = 0;
					$scope.newSevaType.sevaTypeName = ''; // Clear form
					$scope.newSevaType.description = '';
					$scope.newSevaType.image = '';
					$scope.newSevaType.status = 'n';
					$scope.getAllSevaTypes();
				}
			})
			.catch(function(error) {
				console.error("Error updating Seva Type", error);
				if (error.status === 404) {
					alert("Seva type not found with the provided ID.");
				} else {
					alert("An unexpected error occurred. Please try again.");
				}
			});
	};

	$scope.GetSevaTypeById = function(sevaType) {
		if (!sevaType.sevaTypeId) {
			alert("Seva Type ID is required");
			return;
		}

		// API call to fetch Seva Type by ID
		$http.get(adminUrl + 'getSevaTypeById/' + sevaType.sevaTypeId)
			.then(function(response) {
				if (response.status === 200) {
					$scope.newSevaType = response.data;
					$scope.isSevaTypeActive = $scope.newSevaType.status === 'y' ? true : false;
				}
			})
			.catch(function(error) {
				console.error("Error fetching Seva Type by ID", error);
				if (error.status === 404) {
					alert("Seva Type not found with the provided ID.");
				} else {
					alert("An unexpected error occurred. Please try again.");
				}
				$scope.newSevaType = null; // Clear the result if there's an error
			});
	}

	// Function to delete a Seva Type
	$scope.deleteSevaType = function() {
		var selectedSevaType = $scope.sevaTypeList.filter(function(sevaType) {
			return sevaType.selected;
		});
		if (selectedSevaType) {
			if (!confirm("Are you sure you want to delete this Seva Type?")) {
				return;
			}

			selectedSevaType.forEach(function(item, index, array) {
				// API call to delete Seva Type
				$http.delete(adminUrl + 'deleteSevaType/' + item.sevaTypeId)
					.then(function(response) {
						if (response.status === 204 && index === array.length - 1) {
							alert("Seva type deleted successfully!");
							$scope.sevaTypeId = 0;
							$scope.getAllSevaTypes();
						}
					})
					.catch(function(error) {
						console.error("Error deleting Seva Type", error);
						if (error.status === 404) {
							alert("Seva Type not found with the provided ID.");
						} else {
							alert("An unexpected error occurred. Please try again.");
						}
					});
			});

		}
	};

	// Function to fetch all Seva Types
	$scope.getAllSevaTypes = function() {
		$http.get(adminUrl + 'getAllSevaTypes')
			.then(function(response) {
				$scope.sevaTypeList = response.data;
				$scope.sevaTypeList.forEach(function(sevaType) {
					sevaType.selected = false;
				});
			}, function(error) {
				console.error('Error fetching seva types:', error);
				alert('Error fetching seva types.');
			});
	};

	$scope.getAllSevaTypes();

	/******** Master Seva Category *********/
	$scope.sevaCategoriesList = [];

	// New Seva Category object
	$scope.newSevaCategory = {
		sevaCategoryId: 0,
		sevaCategoryName: '',
		description: '',
		image: '',
		status: 'n',
		createdBy: 0,
		createdDate: '',
		ipAddress: ''
	};

	$scope.isSevaCategoryActive = $scope.newSevaCategory.status === 'y' ? true : false;

	// Toggle active/inactive status
	$scope.sevaCategoryToggle = function() {
		$scope.newSevaCategory.status = $scope.isSevaCategoryActive ? 'y' : 'n';
	};

	// Add new Seva Category
	$scope.addSevaCategory = function() {

		var valuex1 = document.getElementById("valuex1").value;
		var valuey1 = document.getElementById("valuey1").value;
		var valuew1 = document.getElementById("valuew1").value;
		var valueh1 = document.getElementById("valueh1").value;


		if (!valuex1)
			valuex1 = 0;
		if (!valuey1)
			valuey1 = 0;
		if (!valuew1)
			valuew1 = 0;
		if (!valueh1)
			valueh1 = 0;

		if (!$scope.newSevaCategory.sevaCategoryName) {
			alert("Seva category name cannot be empty");
			return;
		}

		var formData = new FormData();

		// Check if the file input has a file or not
		var sevaCategoryImageInput = document.getElementById("sevaCategoryImage");
		if (sevaCategoryImageInput.files.length > 0) {
			formData.append('file', sevaCategoryImageInput.files[0]);
		}

		formData.append('sevaCategoryStr', JSON.stringify($scope.newSevaCategory));

		var link = adminUrl + "addSevaCategory?valuex=" + valuex1 + '&valuey=' + valuey1 + '&valuew=' + valuew1 + '&valueh=' + valueh1;

		// API call to add Seva Category
		$http.post(link, formData, {
			headers: { 'Content-Type': undefined },
			transformRequest: function(data, headersGetterFunction) { return data; }
		}).then(function(response) {
			if (response.status === 201) {
				alert("Seva category added successfully!");
				$scope.newSevaCategory = {};  // Clear form
				$scope.getAllSevaCategories();
				document.getElementById("sevaCategoryImage").value = null;

			}
		})
			.catch(function(error) {
				if (response.status === 401) {
					$window.location.href = adminUrl + 'login';
				} else {
					console.error("Error Response:", error);
					alert("An error occurred: " + error.data.message || "Unknown error");
				}
			});
	};

	// Function to update a Seva Category
	$scope.updateSevaCategory = function() {

		var valuex1 = document.getElementById("valuex1").value;
		var valuey1 = document.getElementById("valuey1").value;
		var valuew1 = document.getElementById("valuew1").value;
		var valueh1 = document.getElementById("valueh1").value;


		if (!valuex1)
			valuex1 = 0;
		if (!valuey1)
			valuey1 = 0;
		if (!valuew1)
			valuew1 = 0;
		if (!valueh1)
			valueh1 = 0;

		if (!$scope.newSevaCategory.sevaCategoryId) {
			alert("Seva Category ID is required");
			return;
		}
		if (!$scope.newSevaCategory.sevaCategoryName) {
			alert("Seva Category name cannot be empty");
			return;
		}

		var formData = new FormData();
		if (sevaCategoryImage.files[0]) {
			formData.append('file', sevaCategoryImage.files[0]);
		}

		formData.append('sevaCategoryStr', JSON.stringify($scope.newSevaCategory));

		var link = adminUrl + "updateSevaCategory?id=" + $scope.newSevaCategory.sevaCategoryId + '&valuex=' + valuex1 + '&valuey=' + valuey1 + '&valuew=' + valuew1 + '&valueh=' + valueh1;

		// API call to update Seva Category
		$http.post(link, formData, {
			headers: { 'Content-Type': undefined },
			transformRequest: function(data, headersGetterFunction) { return data; }
		})
			.then(function(response) {
				if (response.status === 200) {
					alert("Seva category updated successfully!");
					$scope.newSevaCategory.sevaCategoryId = 0;
					$scope.newSevaCategory.sevaCategoryName = ''; // Clear form
					$scope.newSevaCategory.description = '';
					$scope.newSevaCategory.image = '';
					$scope.newSevaCategory.status = 'n';
					$scope.getAllSevaCategories();
				}
			})
			.catch(function(error) {
				console.error("Error updating Seva Category", error);
				if (error.status === 404) {
					alert("Seva Category not found with the provided ID.");
				} else {
					alert("An unexpected error occurred. Please try again.");
				}
			});
	};

	$scope.GetSevaCategoryById = function(sevaCategory) {
		if (!sevaCategory.sevaCategoryId) {
			alert("Seva Category ID is required");
			return;
		}

		// API call to fetch Seva Category by ID
		$http.get(adminUrl + 'getSevaCategoryById/' + sevaCategory.sevaCategoryId)
			.then(function(response) {
				if (response.status === 200) {
					$scope.newSevaCategory = response.data;
					$scope.isSevaCategoryActive = $scope.newSevaCategory.status === 'y' ? true : false;
				}
			})
			.catch(function(error) {
				console.error("Error fetching Seva Category by ID", error);
				if (error.status === 404) {
					alert("Seva Category not found with the provided ID.");
				} else {
					alert("An unexpected error occurred. Please try again.");
				}
				$scope.newSevaCategory = null; // Clear the result if there's an error
			});
	}

	// Function to delete a Seva Category
	$scope.deleteSevaCategory = function() {
		var selectedSevaCategory = $scope.sevaCategoriesList.filter(function(sevaCategory) {
			return sevaCategory.selected;
		});
		if (selectedSevaCategory) {
			if (!confirm("Are you sure you want to delete this Seva Category?")) {
				return;
			}

			selectedSevaCategory.forEach(function(item, index, array) {
				// API call to delete Seva Category
				$http.delete(adminUrl + 'deleteSevaCategory/' + item.sevaCategoryId)
					.then(function(response) {
						if (response.status === 204 && index === array.length - 1) {
							alert("Seva category deleted successfully!");
							$scope.sevaCategoryId = 0;
							$scope.getAllSevaCategories();
						}
					})
					.catch(function(error) {
						console.error("Error deleting Seva Category", error);
						if (error.status === 404) {
							alert("Seva Category not found with the provided ID.");
						} else {
							alert("An unexpected error occurred. Please try again.");
						}
					});
			});

		}
	};

	// Fetch all Seva Categories
	$scope.getAllSevaCategories = function() {
		$http.get(adminUrl + 'getAllSevaCategories')
			.then(function(response) {
				$scope.sevaCategoriesList = response.data;
				$scope.sevaCategoriesList.forEach(function(sevaCategory) {
					sevaCategory.selected = false;
				});
			}, function(error) {
				console.error("Error fetching Seva Categories", error);
				alert('Error fetching seva Categories.');
			});
	};

	$scope.getAllSevaCategories();

	/******** Master Variation *********/
	$scope.variationList = [];

	// New Variation object
	$scope.newVariation = {
		variationId: 0,
		variationName: '',
		description: '',
		image: '',
		status: 'n',
		createdBy: 0,
		createdDate: '',
		ipAddress: ''
	};

	$scope.isVariationActive = $scope.newVariation.status === 'y' ? true : false;

	// Toggle active/inactive status
	$scope.variationToggle = function() {
		$scope.newVariation.status = $scope.isVariationActive ? 'y' : 'n';
	};

	// Function to add a variation
	$scope.addVariation = function() {

		var valuex2 = document.getElementById("valuex2").value;
		var valuey2 = document.getElementById("valuey2").value;
		var valuew2 = document.getElementById("valuew2").value;
		var valueh2 = document.getElementById("valueh2").value;


		if (!valuex2)
			valuex2 = 0;
		if (!valuey2)
			valuey2 = 0;
		if (!valuew2)
			valuew2 = 0;
		if (!valueh2)
			valueh2 = 0;

		if (!$scope.newVariation.variationName) {
			alert("Variation name cannot be empty");
			return;
		}

		var formData = new FormData();

		// Check if the file input has a file or not
		var variationImageInput = document.getElementById("variationImage");
		if (variationImageInput.files.length > 0) {
			formData.append('file', variationImageInput.files[0]);
		}

		formData.append('variationStr', JSON.stringify($scope.newVariation));

		var link = adminUrl + "addVariation?valuex=" + valuex2 + '&valuey=' + valuey2 + '&valuew=' + valuew2 + '&valueh=' + valueh2;

		// API call to add Seva Type
		$http.post(link, formData, {
			headers: { 'Content-Type': undefined },
			transformRequest: function(data, headersGetterFunction) { return data; }
		}).then(function(response) {
			if (response.status === 201) {
				alert("Variation added successfully!");
				$scope.newVariation = {};  // Clear form
				$scope.getAllVariation();
				document.getElementById("variationImage").value = null;

			}
		})
			.catch(function(error) {
				if (response.status === 401) {
					$window.location.href = adminUrl + 'login';
				} else {
					console.error("Error Response:", error);
					alert("An error occurred: " + error.data.message || "Unknown error");
				}
			});
	};

	// Function to update a Variation
	$scope.updateVariation = function() {

		var valuex2 = document.getElementById("valuex2").value;
		var valuey2 = document.getElementById("valuey2").value;
		var valuew2 = document.getElementById("valuew2").value;
		var valueh2 = document.getElementById("valueh2").value;


		if (!valuex2)
			valuex2 = 0;
		if (!valuey2)
			valuey2 = 0;
		if (!valuew2)
			valuew2 = 0;
		if (!valueh2)
			valueh2 = 0;

		if (!$scope.newVariation.variationId) {
			alert("Variation ID is required");
			return;
		}
		if (!$scope.newVariation.variationName) {
			alert("Variation name cannot be empty");
			return;
		}

		var formData = new FormData();
		if (variationImage.files[0]) {
			formData.append('file', variationImage.files[0]);
		}

		formData.append('variationStr', JSON.stringify($scope.newVariation));

		var link = adminUrl + "updateVariation?id=" + $scope.newVariation.variationId + '&valuex=' + valuex2 + '&valuey=' + valuey2 + '&valuew=' + valuew2 + '&valueh=' + valueh2;

		// API call to update Variation
		$http.post(link, formData, {
			headers: { 'Content-Type': undefined },
			transformRequest: function(data, headersGetterFunction) { return data; }
		})
			.then(function(response) {
				if (response.status === 200) {
					alert("Variation updated successfully!");
					$scope.newVariation.variationId = 0;
					$scope.newVariation.variationName = ''; // Clear form
					$scope.newVariation.description = '';
					$scope.newVariation.image = '';
					$scope.newVariation.status = 'n';
					$scope.getAllVariations();
				}
			})
			.catch(function(error) {
				console.error("Error updating Variation", error);
				if (error.status === 404) {
					alert("Variation not found with the provided ID.");
				} else {
					alert("An unexpected error occurred. Please try again.");
				}
			});
	};

	$scope.GetVariationById = function(variation) {
		if (!variation.variationId) {
			alert("Variation ID is required");
			return;
		}

		// API call to fetch variation by ID
		$http.get(adminUrl + 'getVariationById/' + variation.variationId)
			.then(function(response) {
				if (response.status === 200) {
					$scope.newVariation = response.data;
					$scope.isVariationActive = $scope.newVariation.status === 'y' ? true : false;
				}
			})
			.catch(function(error) {
				console.error("Error fetching Variation by ID", error);
				if (error.status === 404) {
					alert("Variation not found with the provided ID.");
				} else {
					alert("An unexpected error occurred. Please try again.");
				}
				$scope.newVariation = null; // Clear the result if there's an error
			});
	}

	// Function to delete a Variation
	$scope.deleteVariation = function() {
		var selectedVariation = $scope.variationList.filter(function(variation) {
			return variation.selected;
		});
		if (selectedVariation) {
			if (!confirm("Are you sure you want to delete this Variation?")) {
				return;
			}

			selectedVariation.forEach(function(item, index, array) {
				// API call to delete Variation
				$http.delete(adminUrl + 'deleteVariation/' + item.variationId)
					.then(function(response) {
						if (response.status === 204 && index === array.length - 1) {
							alert("Variation deleted successfully!");
							$scope.variationId = 0;
							$scope.getAllVariations();
						}
					})
					.catch(function(error) {
						console.error("Error deleting Variation", error);
						if (error.status === 404) {
							alert("Variation not found with the provided ID.");
						} else {
							alert("An unexpected error occurred. Please try again.");
						}
					});
			});

		}
	};

	// Function to fetch all Variation
	$scope.getAllVariations = function() {
		$http.get(adminUrl + 'getAllVariations')
			.then(function(response) {
				$scope.variationList = response.data;
				$scope.variationList.forEach(function(variation) {
					variation.selected = false;
				});
			}, function(error) {
				console.error('Error fetching variation:', error);
				alert('Error fetching variation.');
			});
	}

	$scope.getAllVariations();

	/******** Master Frequency *********/
	$scope.frequencyList = [];

	$scope.newFrequency = {
		frequencyId: 0,
		frequencyName: '',
		description: '',
		image: '',
		status: 'n',
		createdBy: 0,
		createdDate: '',
		ipAddress: ''
	};

	$scope.isFrequencyActive = $scope.newFrequency.status === 'y' ? true : false;

	// Toggle active/inactive status of Frequency
	$scope.frequencyToggle = function() {
		$scope.newFrequency.status = $scope.isFrequencyActive ? 'y' : 'n';
	};

	// Function to add a Frequency
	$scope.addFrequency = function() {

		var valuex3 = document.getElementById("valuex3").value;
		var valuey3 = document.getElementById("valuey3").value;
		var valuew3 = document.getElementById("valuew3").value;
		var valueh3 = document.getElementById("valueh3").value;


		if (!valuex3)
			valuex3 = 0;
		if (!valuey3)
			valuey3 = 0;
		if (!valuew3)
			valuew3 = 0;
		if (!valueh3)
			valueh3 = 0;

		if (!$scope.newFrequency.frequencyName) {
			alert("Frequency name cannot be empty");
			return;
		}

		var formData = new FormData();

		// Check if the file input has a file or not
		var frequencyImageInput = document.getElementById("frequencyImage");
		if (frequencyImageInput.files.length > 0) {
			formData.append('file', frequencyImageInput.files[0]);
		}

		formData.append('frequencyStr', JSON.stringify($scope.newFrequency));

		var link = adminUrl + "addFrequency?valuex=" + valuex3 + '&valuey=' + valuey3 + '&valuew=' + valuew3 + '&valueh=' + valueh3;

		// API call to add frequency
		$http.post(link, formData, {
			headers: { 'Content-Type': undefined },
			transformRequest: function(data, headersGetterFunction) { return data; }
		}).then(function(response) {
			if (response.status === 201) {
				alert("Frequency added successfully!");
				$scope.newFrequency = {};  // Clear form
				$scope.getAllFrequency();
				document.getElementById("frequencyImage").value = null;

			}
		})
			.catch(function(error) {
				if (response.status === 401) {
					$window.location.href = adminUrl + 'login';
				} else {
					console.error("Error Response:", error);
					alert("An error occurred: " + error.data.message || "Unknown error");
				}
			});
	};

	// Function to update a Frequency
	$scope.updateFrequency = function() {

		var valuex3 = document.getElementById("valuex3").value;
		var valuey3 = document.getElementById("valuey3").value;
		var valuew3 = document.getElementById("valuew3").value;
		var valueh3 = document.getElementById("valueh3").value;


		if (!valuex3)
			valuex3 = 0;
		if (!valuey3)
			valuey3 = 0;
		if (!valuew3)
			valuew3 = 0;
		if (!valueh3)
			valueh3 = 0;

		if (!$scope.newFrequency.frequencyId) {
			alert("Frequency ID is required");
			return;
		}
		if (!$scope.newFrequency.frequencyName) {
			alert("Frequency name cannot be empty");
			return;
		}

		var formData = new FormData();
		if (frequencyImage.files[0]) {
			formData.append('file', frequencyImage.files[0]);
		}

		formData.append('frequencyStr', JSON.stringify($scope.newFrequency));

		var link = adminUrl + "updateFrequency?id=" + $scope.newFrequency.frequencyId + '&valuex=' + valuex3 + '&valuey=' + valuey3 + '&valuew=' + valuew3 + '&valueh=' + valueh3;

		// API call to update Frequency
		$http.post(link, formData, {
			headers: { 'Content-Type': undefined },
			transformRequest: function(data, headersGetterFunction) { return data; }
		})
			.then(function(response) {
				if (response.status === 200) {
					alert("Frequency updated successfully!");
					$scope.newFrequency.frequencyId = 0;
					$scope.newFrequency.frequencyName = ''; // Clear form
					$scope.newFrequency.description = '';
					$scope.newFrequency.image = '';
					$scope.newFrequency.status = 'n';
					$scope.getAllFrequency();
				}
			})
			.catch(function(error) {
				console.error("Error updating frequency", error);
				if (error.status === 404) {
					alert("Frequency not found with the provided ID.");
				} else {
					alert("An unexpected error occurred. Please try again.");
				}
			});
	};

	$scope.GetFrequencyById = function(frequency) {
		if (!frequency.frequencyId) {
			alert("Frequency ID is required");
			return;
		}

		// API call to fetch frequency by ID
		$http.get(adminUrl + 'getFrequencyById/' + frequency.frequencyId)
			.then(function(response) {
				if (response.status === 200) {
					$scope.newFrequency = response.data;
					$scope.isFrequencyActive = $scope.newFrequency.status === 'y' ? true : false;
				}
			})
			.catch(function(error) {
				console.error("Error fetching frequency by ID", error);
				if (error.status === 404) {
					alert("Frequency not found with the provided ID.");
				} else {
					alert("An unexpected error occurred. Please try again.");
				}
				$scope.newFrequency = null; // Clear the result if there's an error
			});
	}

	// Function to delete a Frequency
	$scope.deleteFrequency = function() {
		var selectedFrequency = $scope.frequencyList.filter(function(frequency) {
			return frequency.selected;
		});
		if (selectedFrequency) {
			if (!confirm("Are you sure you want to delete this Frequency?")) {
				return;
			}

			selectedFrequency.forEach(function(item, index, array) {
				// API call to delete Seva Type
				$http.delete(adminUrl + 'deleteFrequency/' + item.frequencyId)
					.then(function(response) {
						if (response.status === 204 && index === array.length - 1) {
							alert("Frequency deleted successfully!");
							$scope.frequencyId = 0;
							$scope.getAllFrequency();
						}
					})
					.catch(function(error) {
						console.error("Error deleting Frequency", error);
						if (error.status === 404) {
							alert("Frequency not found with the provided ID.");
						} else {
							alert("An unexpected error occurred. Please try again.");
						}
					});
			});

		}
	};

	// Function to fetch all Frequency
	$scope.getAllFrequency = function() {
		$http.get(adminUrl + 'getAllFrequency')
			.then(function(response) {
				$scope.frequencyList = response.data;
				$scope.frequencyList.forEach(function(frequency) {
					frequency.selected = false;
				});
			}, function(error) {
				console.error('Error fetching frequency:', error);
				alert('Error fetching frequency.');
			});
	}

	$scope.getAllFrequency();

});
/******************************************* Manage Seva *************************************************/

app.controller('AdminManageSevaController', function($scope, $http, $window) {

	$scope.openCollapse = function() {
		$("#collapseCardSeva").collapse('show');
	};

	// Function to navigate back to the previous page
	$scope.backSevaData = function() {
		$window.history.back(); // This will navigate to the previous page in history
	};

	$scope.editSeva = function(seva) {
		$scope.sevas = angular.copy(seva);
		// scroll to top
		window.scrollTo({ top: 0, behavior: 'smooth' });
	};

	$scope.sevaList = [];

	$scope.seva = {
		sevaId: 0,
		sequence: '',
		sevaTitle: '',
		sevaSubtitle: '',
		sevaTypeId: '',
		sevaCategoryId: '',
		variationId: '',
		frequencyId: '',
		bookBeforeDays: '',
		sevaDescription: '',
		sevaPrice: '',
		delivery: 'n',
		status: 'y',
		createdBy: 0,
		createdDate: '',
		ipAddress: ''
	};


	$scope.sevaImages = {
		sevaImageId: 0,
		sevaId: 0,
		imageTitle: '',
		imageDescription: '',
		sevaImages: '',
		status: 'y',
		createdBy: 0,
		createdDate: '',
		ipAddress: ''
	};

	$scope.clearSevaData = function() {

		$scope.seva = {
			sevaId: 0,
			sequence: '',
			sevaTitle: '',
			sevaSubtitle: '',
			sevaTypeId: '',
			sevaCategoryId: '',
			variationId: '',
			frequencyId: '',
			bookBeforeDays: '',
			sevaDescription: '',
			sevaPrice: '',
			delivery: 'n',
			status: 'y',
			createdBy: 0,
			createdDate: '',
			ipAddress: ''
		};

		$scope.sevaImages = {
			sevaImageId: 0,
			sevaId: 0,
			imageTitle: '',
			imageDescription: '',
			sevaImages: '',
			status: 'y',
			createdBy: 0,
			createdDate: '',
			ipAddress: ''
		};

		CKEDITOR.instances.sevaDescription.setData($scope.seva.sevaDescription);
	}

	$scope.isSevaDeliveryActive = $scope.seva.delivery === 'y' ? true : false;

	$scope.sevaDeliveryToggle = function() {
		$scope.seva.delivery = $scope.isSevaDeliveryActive ? 'y' : 'n';
	};

	// Add new seva to the list
	$scope.addAllSeva = function() {
		var sevaDescription = CKEDITOR.instances.sevaDescription.getData();
		var s = encodeURIComponent(sevaDescription);

		var valuex = document.getElementById("valuex").value;
		var valuey = document.getElementById("valuey").value;
		var valuew = document.getElementById("valuew").value;
		var valueh = document.getElementById("valueh").value;


		if (!valuex)
			valuex = 0;
		if (!valuey)
			valuey = 0;
		if (!valuew)
			valuew = 0;
		if (!valueh)
			valueh = 0;

		if (!$scope.seva.sequence) {
			alert("Seva sequence cannot be empty");
			return;
		}
		if (!$scope.seva.sevaTitle) {
			alert("Seva name cannot be empty");
			return;
		}
		if (!$scope.seva.sevaTypeId) {
			alert("Seva type cannot be empty");
			return;
		}
		if (!$scope.seva.sevaCategoryId) {
			alert("Seva category cannot be empty");
			return;
		}
		if (!$scope.seva.sevaPrice) {
			alert("Seva amount cannot be empty");
			return;
		}
		if (!$scope.seva.bookBeforeDays) {
			alert("Book before days cannot be empty");
			return;
		}

		if (!sevaImage.files[0]) {
			alert("Seva Image should be required");
			return;
		}

		if (sevaDescription) {
			$scope.seva.sevaDescription = sevaDescription;
		}

		var formData = new FormData();
		formData.append('file', sevaImage.files[0]);
		formData.append('sevaStr', JSON.stringify($scope.seva));
		formData.append('sevaImageStr', JSON.stringify($scope.sevaImages));

		var link = adminUrl + "addSeva?valuex=" + valuex + '&valuey=' + valuey + '&valuew=' + valuew + '&valueh=' + valueh;

		// API call to add seva
		$http.post(link, formData, {
			headers: { 'Content-Type': undefined },
			transformRequest: function(data, headersGetterFunction) { return data; }
		}).then(function(response) {
			if (response.status === 201) {
				alert("Seva added successfully!");
				$scope.clearSevaData();
				$scope.getAllSeva();
				document.getElementById("sevaImage").value = null;
/*				document.getElementById('target').data('Jcrop').destroy();
*/			}
		})
			.catch(function(error) {
				if (response.status === 401) {
					$window.location.href = adminUrl + 'login';
				} else {
					console.error("Error Response:", error);
					alert("An error occurred: " + error.data.message || "Unknown error");
				}
			});
	};


	// Function to update a seva
	$scope.updateSeva = function() {
		var sevaDescription = CKEDITOR.instances.sevaDescription.getData();
		var s = encodeURIComponent(sevaDescription);

		var valuex = document.getElementById("valuex").value;
		var valuey = document.getElementById("valuey").value;
		var valuew = document.getElementById("valuew").value;
		var valueh = document.getElementById("valueh").value;


		if (!valuex)
			valuex = 0;
		if (!valuey)
			valuey = 0;
		if (!valuew)
			valuew = 0;
		if (!valueh)
			valueh = 0;

		if (!$scope.seva.sevaId) {
			alert("Seva ID is required");
			return;
		}
		if (!$scope.seva.sequence) {
			alert("Seva sequence cannot be empty");
			return;
		}
		if (!$scope.seva.sevaTitle) {
			alert("Seva name cannot be empty");
			return;
		}
		if (!$scope.seva.sevaTypeId) {
			alert("Seva type cannot be empty");
			return;
		}
		if (!$scope.seva.sevaCategoryId) {
			alert("Seva category cannot be empty");
			return;
		}
		if (!$scope.seva.sevaPrice) {
			alert("Seva amount cannot be empty");
			return;
		}
		if (!$scope.seva.bookBeforeDays) {
			alert("Book before days cannot be empty");
			return;
		}

		if (sevaDescription) {
			$scope.seva.sevaDescription = sevaDescription;
		}

		var formData = new FormData();
		if (sevaImage.files[0]) {
			formData.append('file', sevaImage.files[0]);
		}

		formData.append('sevaStr', JSON.stringify($scope.seva));
		formData.append('sevaImageStr', JSON.stringify($scope.sevaImages));

		var link = adminUrl + "updateSeva?id=" + $scope.seva.sevaId + '&valuex=' + valuex + '&valuey=' + valuey + '&valuew=' + valuew + '&valueh=' + valueh;

		// API call to update seva
		$http.post(link, formData, {
			headers: { 'Content-Type': undefined },
			transformRequest: function(data, headersGetterFunction) { return data; }
		})
			.then(function(response) {
				if (response.status === 200) {
					alert("Seva updated successfully!");
					$scope.clearSevaData();
					$scope.getAllSeva();
				}
			})
			.catch(function(error) {
				console.error("Error updating seva", error);
				if (error.status === 404) {
					alert("Seva not found with the provided ID.");
				} else {
					alert("An unexpected error occurred. Please try again.");
				}
			});
	};

	$scope.GetSevaById = function(seva) {
		if (!seva.sevaId) {
			alert("Seva ID is required");
			return;
		}

		// API call to fetch seva by ID
		$http.get(adminUrl + 'getSevaById/' + seva.sevaId)
			.then(function(response) {
				if (response.status === 200) {
					$scope.seva = response.data;
					$scope.isSevaActive = $scope.seva.status === 'y' ? true : false;
					CKEDITOR.instances.sevaDescription.setData($scope.seva.sevaDescription);
					$scope.sevaImages = response.data.sevaImages[0];
				}
			})
			.catch(function(error) {
				console.error("Error fetching seva by ID", error);
				if (error.status === 404) {
					alert("seva not found with the provided ID.");
				} else {
					alert("An unexpected error occurred. Please try again.");
				}
				$scope.seva = null; // Clear the result if there's an error
			});
	}

	// Function to delete a seva
	$scope.deleteSeva = function() {
		var selectedSeva = $scope.sevaList.filter(function(seva) {
			return seva.selected;
		});
		if (selectedSeva) {
			if (!confirm("Are you sure you want to delete this seva?")) {
				return;
			}

			selectedSeva.forEach(function(item, index, array) {
				// API call to delete Seva 
				$http.delete(adminUrl + 'deleteSeva/' + item.sevaId)
					.then(function(response) {
						if (response.status === 204 && index === array.length - 1) {
							alert("Seva deleted successfully!");
							$scope.sevaId = 0;
							$scope.getAllSeva();
						}
					})
					.catch(function(error) {
						console.error("Error deleting seva", error);
						if (error.status === 404) {
							alert("Seva not found with the provided ID.");
						} else {
							alert("An unexpected error occurred. Please try again.");
						}
					});
			});
		}
	};

	// Function to fetch all seva
	$scope.getAllSeva = function() {
		$http.get(adminUrl + 'getAllSeva')
			.then(function(response) {
				$scope.sevaList = response.data;
				$scope.sevaList.forEach(function(seva) {
					seva.selected = false;
				});
			}, function(error) {
				console.error('Error fetching seva:', error);
				alert('Error fetching seva.');
			});
	}

	$scope.getAllSeva();

	// Function to fetch all Frequency
	$scope.getAllActiveFrequencies = function() {
		$http.get(adminUrl + 'getAllActiveFrequencies')
			.then(function(response) {
				$scope.frequencyList = response.data;
				$scope.frequencyList.forEach(function(frequency) {
					frequency.selected = false;
				});
			}, function(error) {
				console.error('Error fetching frequency:', error);
				alert('Error fetching frequency.');
			});
	}

	$scope.getAllActiveFrequencies();

	// Function to fetch all Variation
	$scope.getAllActiveVariations = function() {
		$http.get(adminUrl + 'getAllActiveVariations')
			.then(function(response) {
				$scope.variationList = response.data;
				$scope.variationList.forEach(function(variation) {
					variation.selected = false;
				});
			}, function(error) {
				console.error('Error fetching variation:', error);
				alert('Error fetching variation.');
			});
	}

	$scope.getAllActiveVariations();

	// Fetch all Seva Categories
	$scope.getAllActiveSevaCategories = function() {
		$http.get(adminUrl + 'getAllActiveSevaCategories')
			.then(function(response) {
				$scope.sevaCategoriesList = response.data;
				$scope.sevaCategoriesList.forEach(function(sevaCategory) {
					sevaCategory.selected = false;
				});
			}, function(error) {
				console.error("Error fetching Seva Categories", error);
				alert('Error fetching seva Categories.');
			});
	};

	$scope.getAllActiveSevaCategories();

	// Function to fetch all Seva Types
	$scope.getAllActiveSevaTypes = function() {
		$http.get(adminUrl + 'getAllActiveSevaTypes')
			.then(function(response) {
				$scope.sevaTypeList = response.data;
				$scope.sevaTypeList.forEach(function(sevaType) {
					sevaType.selected = false;
				});
			}, function(error) {
				console.error('Error fetching seva types:', error);
				alert('Error fetching seva types.');
			});
	};

	$scope.getAllActiveSevaTypes();

	/******************************* Modal of Seva Type *******************************************/
	$scope.newSevaType = {
		sevaTypeId: 0,
		sevaTypeName: '',
		description: '',
		image: '',
		status: 'n',
		createdBy: 0,
		createdDate: '',
		ipAddress: ''
	};

	$scope.clearSevaTypeFormData = function() {

		$scope.newSevaType = {
			sevaTypeId: 0,
			sevaTypeName: '',
			description: '',
			image: '',
			status: 'n',
			createdBy: 0,
			createdDate: '',
			ipAddress: ''
		};
	}

	$scope.isSevaTypeActive = $scope.newSevaType.status === 'y' ? true : false;

	$scope.sevaTypeToggle = function() {
		$scope.newSevaType.status = $scope.isSevaTypeActive ? 'y' : 'n';
	};

	// Function to add a Seva Type
	$scope.addSevaType = function() {

		var valuex1 = document.getElementById("valuex1").value;
		var valuey1 = document.getElementById("valuey1").value;
		var valuew1 = document.getElementById("valuew1").value;
		var valueh1 = document.getElementById("valueh1").value;


		if (!valuex1)
			valuex1 = 0;
		if (!valuey1)
			valuey1 = 0;
		if (!valuew1)
			valuew1 = 0;
		if (!valueh1)
			valueh1 = 0;

		if (!$scope.newSevaType.sevaTypeName) {
			alert("Seva type name cannot be empty");
			return;
		}

		var formData = new FormData();

		// Check if the file input has a file or not
		var sevaTypeImageInput = document.getElementById("sevaTypeImage");
		if (sevaTypeImageInput.files.length > 0) {
			formData.append('file', sevaTypeImageInput.files[0]);
		}

		formData.append('sevaTypeStr', JSON.stringify($scope.newSevaType));

		var link = adminUrl + "addSevaType?valuex=" + valuex1 + '&valuey=' + valuey1 + '&valuew=' + valuew1 + '&valueh=' + valueh1;

		// API call to add Seva Type
		$http.post(link, formData, {
			headers: { 'Content-Type': undefined },
			transformRequest: function(data, headersGetterFunction) { return data; }
		}).then(function(response) {
			if (response.status === 201) {
				alert("Seva type added successfully!");
				$scope.sevaTypeCloseModal();  // Clear form
				$scope.getAllSevaTypes();
				document.getElementById("sevaTypeImage").value = null;

			}
		})
			.catch(function(error) {
				if (response.status === 401) {
					$window.location.href = adminUrl + 'login';
				} else {
					console.error("Error Response:", error);
					alert("An error occurred: " + error.data.message || "Unknown error");
				}
			});
	};

	$scope.sevaTypeCloseModal = function() {
		$scope.clearSevaTypeFormData();
		$('#sevaType').modal('hide');
	};

	$scope.getAllSevaTypes = function() {
		$http.get(adminUrl + 'getAllSevaTypes')
			.then(function(response) {
				$scope.sevaTypeList = response.data;
				$scope.sevaTypeList.forEach(function(sevaType) {
					sevaType.selected = false;
				});
			}, function(error) {
				console.error('Error fetching seva type:', error);
				alert('Error fetching seva type.');
			});
	};

	/******************************* Modal of Seva Category *******************************************/
	$scope.newSevaCategory = {
		sevaCategoryId: 0,
		sevaCategoryName: '',
		description: '',
		image: '',
		status: 'n',
		createdBy: 0,
		createdDate: '',
		ipAddress: ''
	};

	$scope.clearSevaCategoryFormData = function() {

		$scope.newSevaCategory = {
			sevaCategoryId: 0,
			sevaCategoryName: '',
			description: '',
			image: '',
			status: 'n',
			createdBy: 0,
			createdDate: '',
			ipAddress: ''
		};
	}

	$scope.isSevaCategoryActive = $scope.newSevaCategory.status === 'y' ? true : false;

	$scope.sevaCategoryToggle = function() {
		$scope.newSevaCategory.status = $scope.isSevaCategoryActive ? 'y' : 'n';
	};

	// Function to add a Seva Category
	$scope.addSevaCategory = function() {

		var valuex2 = document.getElementById("valuex2").value;
		var valuey2 = document.getElementById("valuey2").value;
		var valuew2 = document.getElementById("valuew2").value;
		var valueh2 = document.getElementById("valueh2").value;


		if (!valuex2)
			valuex2 = 0;
		if (!valuey2)
			valuey2 = 0;
		if (!valuew2)
			valuew2 = 0;
		if (!valueh2)
			valueh2 = 0;

		if (!$scope.newSevaCategory.sevaCategoryName) {
			alert("Seva Category name cannot be empty");
			return;
		}

		var formData = new FormData();

		// Check if the file input has a file or not
		var sevaCategoryImageInput = document.getElementById("sevaCategoryImage");
		if (sevaCategoryImageInput.files.length > 0) {
			formData.append('file', sevaCategoryImageInput.files[0]);
		}

		formData.append('sevaCategoryStr', JSON.stringify($scope.newSevaCategory));

		var link = adminUrl + "addSevaCategory?valuex=" + valuex2 + '&valuey=' + valuey2 + '&valuew=' + valuew2 + '&valueh=' + valueh2;

		// API call to add Seva Category
		$http.post(link, formData, {
			headers: { 'Content-Type': undefined },
			transformRequest: function(data, headersGetterFunction) { return data; }
		}).then(function(response) {
			if (response.status === 201) {
				alert("Seva Category added successfully!");
				$scope.sevaCategoryCloseModal();  // Clear form
				$scope.getAllSevaCategories();
				document.getElementById("sevaCategoryImage").value = null;

			}
		})
			.catch(function(error) {
				if (response.status === 401) {
					$window.location.href = adminUrl + 'login';
				} else {
					console.error("Error Response:", error);
					alert("An error occurred: " + error.data.message || "Unknown error");
				}
			});
	};

	$scope.sevaCategoryCloseModal = function() {
		$scope.clearSevaCategoryFormData();
		$('#sevaCategory').modal('hide');
	};

	$scope.getAllSevaCategories = function() {
		$http.get(adminUrl + 'getAllSevaCategories')
			.then(function(response) {
				$scope.sevaCategoriesList = response.data;
				$scope.sevaCategoriesList.forEach(function(sevaCategory) {
					sevaCategory.selected = false;
				});
			}, function(error) {
				console.error("Error fetching Seva Categories", error);
				alert('Error fetching seva Categories.');
			});
	};

	/******************************* Modal of Variation *******************************************/
	$scope.newVariation = {
		variationId: 0,
		variationName: '',
		description: '',
		image: '',
		status: 'n',
		createdBy: 0,
		createdDate: '',
		ipAddress: ''
	};

	$scope.clearVariationFormData = function() {

		$scope.newVariation = {
			variationId: 0,
			variationName: '',
			description: '',
			image: '',
			status: 'n',
			createdBy: 0,
			createdDate: '',
			ipAddress: ''
		};
	}

	$scope.isVariationActive = $scope.newVariation.status === 'y' ? true : false;

	$scope.variationToggle = function() {
		$scope.newVariation.status = $scope.isVariationActive ? 'y' : 'n';
	};

	// Function to add a Variation
	$scope.addVariation = function() {

		var valuex3 = document.getElementById("valuex3").value;
		var valuey3 = document.getElementById("valuey3").value;
		var valuew3 = document.getElementById("valuew3").value;
		var valueh3 = document.getElementById("valueh3").value;


		if (!valuex3)
			valuex3 = 0;
		if (!valuey3)
			valuey3 = 0;
		if (!valuew3)
			valuew3 = 0;
		if (!valueh3)
			valueh3 = 0;

		if (!$scope.newVariation.variationName) {
			alert("Variation name cannot be empty");
			return;
		}

		var formData = new FormData();

		// Check if the file input has a file or not
		var variationImageInput = document.getElementById("variationImage");
		if (variationImageInput.files.length > 0) {
			formData.append('file', variationImageInput.files[0]);
		}

		formData.append('variationStr', JSON.stringify($scope.newVariation));

		var link = adminUrl + "addVariation?valuex=" + valuex3 + '&valuey=' + valuey3 + '&valuew=' + valuew3 + '&valueh=' + valueh3;

		// API call to add Variation
		$http.post(link, formData, {
			headers: { 'Content-Type': undefined },
			transformRequest: function(data, headersGetterFunction) { return data; }
		}).then(function(response) {
			if (response.status === 201) {
				alert("Variation added successfully!");
				$scope.variationCloseModal();  // Clear form
				$scope.getAllVariations();
				document.getElementById("variationImage").value = null;

			}
		})
			.catch(function(error) {
				if (response.status === 401) {
					$window.location.href = adminUrl + 'login';
				} else {
					console.error("Error Response:", error);
					alert("An error occurred: " + error.data.message || "Unknown error");
				}
			});
	};

	$scope.variationCloseModal = function() {
		$scope.clearVariationFormData();
		$('#variation').modal('hide');
	};

	$scope.getAllVariations = function() {
		$http.get(adminUrl + 'getAllVariations')
			.then(function(response) {
				$scope.variationList = response.data;
				$scope.variationList.forEach(function(variation) {
					variation.selected = false;
				});
			}, function(error) {
				console.error('Error fetching variation:', error);
				alert('Error fetching variation.');
			});
	}

	/******************************* Modal of Frequency *******************************************/
	$scope.newFrequency = {
		frequencyId: 0,
		frequencyName: '',
		description: '',
		image: '',
		status: 'n',
		createdBy: 0,
		createdDate: '',
		ipAddress: ''
	};

	$scope.clearFrequencyFormData = function() {

		$scope.newFrequency = {
			frequencyId: 0,
			frequencyName: '',
			description: '',
			image: '',
			status: 'n',
			createdBy: 0,
			createdDate: '',
			ipAddress: ''
		};
	}

	$scope.isFrequencyActive = $scope.newFrequency.status === 'y' ? true : false;

	$scope.frequencyToggle = function() {
		$scope.newFrequency.status = $scope.isFrequencyActive ? 'y' : 'n';
	};

	// Function to add a Frequency
	$scope.addFrequency = function() {

		var valuex4 = document.getElementById("valuex4").value;
		var valuey4 = document.getElementById("valuey4").value;
		var valuew4 = document.getElementById("valuew4").value;
		var valueh4 = document.getElementById("valueh4").value;


		if (!valuex4)
			valuex4 = 0;
		if (!valuey4)
			valuey4 = 0;
		if (!valuew4)
			valuew4 = 0;
		if (!valueh4)
			valueh4 = 0;

		if (!$scope.newFrequency.frequencyName) {
			alert("Frequency name cannot be empty");
			return;
		}

		var formData = new FormData();

		// Check if the file input has a file or not
		var frequencyImageInput = document.getElementById("frequencyImage");
		if (frequencyImageInput.files.length > 0) {
			formData.append('file', frequencyImageInput.files[0]);
		}

		formData.append('frequencyStr', JSON.stringify($scope.newFrequency));

		var link = adminUrl + "addFrequency?valuex=" + valuex4 + '&valuey=' + valuey4 + '&valuew=' + valuew4 + '&valueh=' + valueh4;

		// API call to add Frequency
		$http.post(link, formData, {
			headers: { 'Content-Type': undefined },
			transformRequest: function(data, headersGetterFunction) { return data; }
		}).then(function(response) {
			if (response.status === 201) {
				alert("Frequency added successfully!");
				$scope.frequencyCloseModal();  // Clear form
				$scope.getAllFrequency();
				document.getElementById("frequencyImage").value = null;

			}
		})
			.catch(function(error) {
				if (response.status === 401) {
					$window.location.href = adminUrl + 'login';
				} else {
					console.error("Error Response:", error);
					alert("An error occurred: " + error.data.message || "Unknown error");
				}
			});
	};

	$scope.frequencyCloseModal = function() {
		$scope.clearFrequencyFormData();
		$('#frequency').modal('hide');
	};

	$scope.getAllFrequency = function() {
		$http.get(adminUrl + 'getAllFrequency')
			.then(function(response) {
				$scope.frequencyList = response.data;
				$scope.frequencyList.forEach(function(frequency) {
					frequency.selected = false;
				});
			}, function(error) {
				console.error('Error fetching frequency:', error);
				alert('Error fetching frequency.');
			});
	}
});

/*************************************** Front Seva ***************************************************************/
app.controller('FrontSevaController', function($scope, $http, $window, $location) {

	$scope.getAllActiveSeva = [];

	/*$scope.imageError = function() {
		return baseUrl + "/resources/front/demo-images/imgseva/Rudrabhishek-3.jpg"; // Fallback image
	};*/

	// Function to fetch all seva
	$scope.getAllActiveSeva = function() {
		$http.get(adminUrl + 'getAllActiveSeva')
			.then(function(response) {
				$scope.getAllActiveSeva = response.data;
			}, function(error) {
				console.error('Error fetching seva:', error);
				alert('Error fetching seva.');
			});
	}

	$scope.getAllActiveSeva();
});

app.controller('FrontSevaDetailController', function($scope, $http, $window, $location, $filter, cartService) {

	$scope.seva = {
		sevaId: 0,
		sequence: '',
		sevaTitle: '',
		sevaSubtitle: '',
		sevaTypeId: '',
		sevaCategoryId: '',
		variationId: '',
		frequencyId: '',
		bookBeforeDays: '',
		sevaDescription: '',
		sevaPrice: '',
		delivery: 'n',
		status: 'y',
		createdBy: 0,
		createdDate: '',
		ipAddress: ''
	};

	$scope.sevaImages = {
		sevaImageId: 0,
		sevaId: 0,
		imageTitle: '',
		imageDescription: '',
		sevaImages: '',
		status: 'y',
		createdBy: 0,
		createdDate: '',
		ipAddress: ''
	};

	$scope.cart = [];

	$scope.quantity = 1;

	var today = new Date();
	var yyyy = today.getFullYear();
	var mm = String(today.getMonth() + 1).padStart(2, '0'); // Two-digit month
	var dd = String(today.getDate()).padStart(2, '0'); // Two-digit day

	$scope.minDate = `${yyyy}-${mm}-${dd}`; // Format: YYYY-MM-DD

	$scope.GetSevaById = function() {

		var search = $window.location.search;
		var urlParam = new URLSearchParams(search);
		var sevaId = urlParam.get("sevaId");

		// API call to fetch seva by ID
		$http.get(adminUrl + 'getSevaById/' + sevaId)
			.then(function(response) {
				if (response.status === 200) {
					$scope.seva = response.data;
					$scope.sevaImages = response.data.sevaImages[0];
				}
			})
			.catch(function(error) {
				console.error("Error fetching seva by ID", error);
				if (error.status === 404) {
					alert("seva not found with the provided ID.");
				} else {
					alert("An unexpected error occurred. Please try again.");
				}
				$scope.seva = null; // Clear the result if there's an error
			});
	}

	$scope.GetSevaById();

	$scope.addTocartseva = function(item) {
		if (!$scope.bookingDate) {
			alert("Booking date is required");
			return;
		}

		var bookingDate = $filter('date')($scope.bookingDate, 'dd/MM/yyyy');
		var link = baseUrl + 'addToCart?sevaId=' + item.sevaId + '&bookigDate=' + bookingDate + '&quantity=' + $scope.quantity;
		$http.post(link)
			.then(function(response) {
				if (response.data) {
					$scope.cart = response.data; // Add item to cart if not already present
					alert(item.sevaTitle + " has been added to the cart.");
					$scope.bookingDate = '';
					cartService.addItem(response.data);
				} else {
					alert("Error adding item to cart.");
				}
			})
			.catch(function(error) {
				alert("Error occurred while adding the item to the cart.");
				console.error("Error:", error);
			});
	};

	$scope.onPlusClick = function() {
		$scope.quantity = $scope.quantity + 1;
	}

	$scope.onMinusClick = function() {
		if ($scope.quantity > 1) {
			$scope.quantity = $scope.quantity - 1;
		}
	}

});

/*************************************** Cart ***************************************************************/

app.controller('cartCtrl', function($scope, $http, $window, $filter, $location, cartService) {

	$scope.cartItems = [];

	$scope.seva = {
		sevaId: 0,
		sequence: '',
		sevaTitle: '',
		sevaSubtitle: '',
		sevaTypeId: '',
		sevaCategoryId: '',
		variationId: '',
		frequencyId: '',
		bookBeforeDays: '',
		sevaDescription: '',
		sevaPrice: '',
		delivery: 'n',
		status: 'y',
		createdBy: 0,
		createdDate: '',
		ipAddress: ''
	};


	$scope.cartCount = cartService.getCartCount();

	$scope.GetCart = function() {
		$http.get(baseUrl + 'getCart/')
			.then(function(response) {
				if (response.status === 200) {
					if (response.data && response.data.length > 0) {
						$scope.cartItems = response.data;
						cartService.addItem(response.data);

					}
				}
			})
			.catch(function(error) {
				console.error("Error fetching cart", error);
				if (error.status === 404) {
					alert("seva not found with the provided ID.");
				} else {
					alert("An unexpected error occurred. Please try again.");
				}
				$scope.cartItems = []; // Clear the result if there's an error
			});

	}
	$scope.GetCart();

	$scope.getTotalPrice = function() {
		return $scope.cartItems.reduce((total, item) => total + (item.orderSevaPrice * item.orderSevaQuantity), 0);
	};

	$scope.getAllItemsQuantity = function() {
		return $scope.cartItems.reduce((total, item) => total + (item.orderSevaQuantity), 0);
	};

	$scope.removeItem = function(item) {
		var link = baseUrl + 'removeFromCart?sevaId=' + item.orderSevaId + '&bookingDate=' + item.bookingDate;
		$http.post(link)
			.then(function(response) {
				if (response.status === 200) {
					cartService.addItem(response.data);

					if (response.data && response.data.length > 0) {
						$scope.cartItems = response.data;
					} else {
						$window.location.href = $location.protocol() + "://" + location.host + baseUrl + 'prabhu-seva';
					}
				}
			})
			.catch(function(error) {
				console.error("Error fetching cart", error);
				if (error.status === 404) {
					alert("seva not found with the provided ID.");
				} else {
					alert("An unexpected error occurred. Please try again.");
				}
				$scope.cartItems = []; // Clear the result if there's an error
			});
	};

	// Watch for cart changes
	$scope.$watch(function() {
		return cartService.getCart().length;
	}, function(newVal) {
		$scope.cartCount = newVal; // Update cart count dynamically
	});

	$scope.goToCheckout = function() {
		$http.get(baseUrl + "check-user-login")
			.then(function(response) {
				if (response.data) {
					// User is logged in, check if delivery is enabled
					$http.get(baseUrl + "check-delivery-enabled")
						.then(function(deliveryResponse) {
							if (deliveryResponse.data) {
								$window.location.href = $location.protocol() + "://" + location.host + "/Kuberbhandari/delivery-address";

							} else {
								$window.location.href = $location.protocol() + "://" + location.host + "/Kuberbhandari/order-summary";

							}
						})
						.catch(function(error) {
							console.error("Error checking delivery status:", error);
							alert("An error occurred while checking delivery options.");
						});
				} else {
					// User is not logged in, redirect to checkout page
					$window.location.href = $location.protocol() + "://" + location.host + "/Kuberbhandari/checkout";
				}
			})
			.catch(function(error) {
				console.error("Error checking login status:", error);
				alert("An error occurred while checking login status.");
			});
	};

	$scope.cancelOrder = function() {
		$http.get(baseUrl + "cancel-order")
			.then(function(response) {
				if (response.status === 200) {
					cartService.addItem(response.data);

					$window.location.href = $location.protocol() + "://" + location.host + "/Kuberbhandari/";
				}
			})
			.catch(function(error) {
			});

	};

	$scope.continuePayment = function() {
		$window.location.href = $location.protocol() + "://" + location.host + "/Kuberbhandari/payment-option";
	};
});

/*************************************** Checkout ***************************************************************/

app.controller('checkoutCtrl', function($scope, $http, $window, $filter, $location, cartService) {

	// Data binding for sign-in form
	$scope.email = '';
	$scope.password = '';

	// Data binding for sign-up form
	$scope.firstName = '';
	$scope.lastName = '';
	$scope.mobile = '';
	$scope.signUpEmail = '';
	$scope.signUpPassword = '';

	// Function to handle sign-in
	$scope.checkoutLogin = function() {
		if (!$scope.email) {
			alert('Please enter your email');
			return;
		}
		if (!$scope.password) {
			alert('Please enter your password');
			return;
		}

		var link = baseUrl + 'user-signin?email=' + $scope.email + '&password=' + $scope.password;
		$http({
			method: 'POST',
			url: link,
		}).then(function(response) {
			if (response.data == true) {
				//alert('Sign-in successful');
				// After login, check delivery status and redirect accordingly
				$http.get(baseUrl + "check-delivery-enabled")
					.then(function(deliveryResponse) {
						if (deliveryResponse.data) {
							$window.location.href = $location.protocol() + "://" + location.host + "/Kuberbhandari/delivery-address";
						} else {
							$window.location.href = $location.protocol() + "://" + location.host + "/Kuberbhandari/order-summary";
						}
					})
					.catch(function(error) {
						console.error("Error checking delivery status after login:", error);
						alert("An error occurred while checking delivery options.");
					});
			} else {
				alert('Invalid email or password');
			}
		}, function(error) {
			alert('An error occurred during login. Please try again.');
			console.error('Login error:', error);
		});
	};

	// Function to handle sign-up
	$scope.checkoutSignUp = function() {
		if ($scope.firstName && $scope.lastName && $scope.mobile && $scope.signUpEmail && $scope.signUpPassword && $scope.genderId) {
			var link = baseUrl + 'user-create?firstName=' + $scope.firstName + '&lastName=' + $scope.lastName + '&email=' + $scope.signUpEmail + '&mobile=' + $scope.mobile + '&password=' + $scope.signUpPassword + '&gender=' + $scope.genderId;
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
					$scope.signUpPassword = '';
					$scope.genderId = '';

					// After login, check delivery status and redirect accordingly
					$http.get(baseUrl + "check-delivery-enabled")
						.then(function(deliveryResponse) {
							if (deliveryResponse.data) {
								$window.location.href = $location.protocol() + "://" + location.host + "/Kuberbhandari/delivery-address";
							} else {
								$window.location.href = $location.protocol() + "://" + location.host + "/Kuberbhandari/order-summary";
							}
						})
						.catch(function(error) {
							console.error("Error checking delivery status after login:", error);
							alert("An error occurred while checking delivery options.");
						});
				}

			}, function(error) {
				alert('Error occurred while creating the account. Please try again.');
			});

		} else {
			alert('Please fill all fields');
		}
	};

	/**Guest User**/
	$scope.guestUser = function() {
		var guestemail = $scope.guestemail;
		var guestmobileno = $scope.guestmobileno;
		var guestFirstName = $scope.guestFirstName;
		var guestLastName = $scope.guestLastName;
		var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;

		if (guestFirstName == undefined || guestFirstName == "") {
			$window.alert("Please enter first name!");
			document.getElementById("guestFirstName").focus();
			return;
		} else if (guestLastName == undefined || guestLastName == "") {
			$window.alert("Please enter last name!");
			document.getElementById("guestLastName").focus();
			return;
		}
		else if (guestemail == undefined || guestemail == "") {
			$window.alert("Please enter a valid email address!");
			document.getElementById("guestemail").focus();
			return;
		}
		else if (!guestemail.match(mailformat)) {
			$window.alert("Please enter a valid email address!");
			document.getElementById("guestemail").focus();
			return;
		}
		else if (guestmobileno == undefined || guestmobileno == "") {
			$window.alert("Please enter mobile number!");
			document.getElementById("guestmobileno").focus();
			return;
		}
		else if (guestmobileno.length != 10) {
			window.alert("Please enter 10 digit mobile number");
			document.getElementById("guestmobileno").focus();
			return false;
		}
		else {
			var link = baseUrl + 'setGuestSession?guestemail=' + guestemail + '&guestmobileno=' + guestmobileno + '&guestFirstName=' + guestFirstName + '&guestLastName=' + guestLastName;
			$http.post(link).then(
				function() {
					// After login, check delivery status and redirect accordingly
					$http.get(baseUrl + "check-delivery-enabled")
						.then(function(deliveryResponse) {
							if (deliveryResponse.data) {
								$window.location.href = $location.protocol() + "://" + location.host + "/Kuberbhandari/delivery-address";
							} else {
								$window.location.href = $location.protocol() + "://" + location.host + "/Kuberbhandari/order-summary";
							}
						})
						.catch(function(error) {
							console.error("Error checking delivery status after login:", error);
							alert("An error occurred while checking delivery options.");
						});
				}).
				catch(function() {
					$scope.guestsession = "Response Fail";
				});
		}
	}

	$scope.guestUserClose = function() {
		$('#guestModal').modal('hide');
	}


});

/*************************************** delivery-address ***************************************************************/

app.controller('deliveryAddressCtrl', function($scope, $http, $window, $filter, $location, cartService) {

	$scope.addresses = [];

	$scope.countries = [];

	$scope.cartItems = [];

	$scope.userAddressId = 0;

	$scope.newAddress = {
		userAddressId: 0,
		userId: 0,
		fullName: '',
		address1: '',
		address2: '',
		cityName: '',
		stateName: '',
		countryId: 0,
		pincode: '',
		status: 'y',
		createdBy: 0,
		createdDate: '',
		ipAddress: '',
		emailId: '',
		mobileNo: '',
		countryName: ''

	};

	$scope.deliveryEnabled = false;

	// Function to register a new address
	$scope.addAddress = function() {
		if (!$scope.newAddress.fullName || !$scope.newAddress.emailId || !$scope.newAddress.mobileNo ||
			!$scope.newAddress.address1 || !$scope.newAddress.countryId || !$scope.newAddress.stateName ||
			!$scope.newAddress.cityName || !$scope.newAddress.pincode) {
			alert("Please fill in all required fields.");
			return;
		}

		$http.post(baseUrl + "addDeliveryAddress", $scope.newAddress)
			.then(function(response) {
				if (response.status === 200) {
					$scope.newAddress = {}; // Clear form fields
					alert("Address added successfully!");
					//	document.getElementById("addAddressModal").click(); // Close modal
					$scope.loadAddresses(); // Refresh address list
				} else {
					alert("Failed to add address.");
				}
			})
			.catch(function(error) {
				console.error("Error adding address:", error);
				alert("An error occurred. Please try again.");
			});
	};

	// Fetch delivery addresses from the server
	$scope.loadAddresses = function() {
		$http.get(baseUrl + "getAllUserAddressesByUserId").then(function(response) {
			$scope.addresses = [];

			if (response.status === 200 && response.data.length > 0) {
				$scope.addresses = response.data;
			} else {
				//alert("No addresses found.");
			}
		}).catch(function(error) {
			console.error("Error fetching addresses:", error);
		});
	};

	// Select an address and proceed to order summary
	$scope.selectAddress = function(userAddressId) {
		$scope.userAddressId = userAddressId;
		$window.location.href = $location.protocol() + "://" + location.host + "/Kuberbhandari/order-summary?userAddressId=" + userAddressId;

	};

	// Remove an address
	$scope.removeAddress = function(userAddressId) {
		if (confirm("Are you sure you want to delete this address?")) {
			$http.delete(baseUrl + "deleteUserAddress/" + userAddressId).then(function(response) {
				if (response.status === 200) {
					$scope.loadAddresses(); // Refresh list after deletion
				} else {
					alert("Failed to delete the address.");
				}
			}).catch(function(error) {
				console.error("Error deleting address:", error);
			});
		}
	};

	$scope.loadCountry = function() {
		$http.get(baseUrl + "getAllCountry").then(function(response) {
			$scope.countries = response.data;
		}).catch(function(error) {
			console.error("Error fetching addresses:", error);
		});
	};

	$scope.loadCountry();

	$scope.getDeliveryAddress = function() {
		$scope.billerAddress = {};
		if ($scope.sameAsDeliveryAddress) {
			$scope.billerAddress = $scope.deliveryAddress;
		}
	}

	$scope.getUserDeliveryAddress = function() {
		$http.get(baseUrl + "get-selected-delivery-address").then(function(response) {
			if (response.data) {
				$scope.deliveryAddress = response.data;
			} else {
				$scope.deliveryAddress = {

				};
			}
		}).catch(function(error) {
			console.error("Error fetching addresses:", error);
		});
	}

	$scope.GetCart = function() {
		$http.get(baseUrl + 'getCart/')
			.then(function(response) {
				if (response.status === 200) {
					if (response.data && response.data.length > 0) {
						$scope.cartItems = response.data;
						cartService.addItem(response.data);
						$scope.deliveryEnabled = cartService.isDelivery();
					}
				}
			})
			.catch(function(error) {
				console.error("Error fetching cart", error);
				if (error.status === 404) {
					alert("seva not found with the provided ID.");
				} else {
					alert("An unexpected error occurred. Please try again.");
				}
				$scope.cartItems = []; // Clear the result if there's an error
			});

	}

	$scope.GetCart();

	$scope.getUserDeliveryAddress();

	$scope.getBillingAddress = function() {
		$http.get(baseUrl + "getBillerInformationByLoginUserId").then(function(response) {
			if (response.data != null) {
				$scope.billerAddress = response.data;

				if (response.data.countryName) {
					var filterName = $scope.countries.filter(function(country) {
						return country.countryName === response.data.countryName;
					});
					$scope.billerAddress.countryId = filterName.length > 0 ? filterName[0].countryId : '';
				} else {
					$scope.billerAddress.countryId = 1;
				}

			} else {
				$scope.billerAddress = {};
			}
		}).catch(function(error) {
			console.error("Error fetching addresses:", error);
		});
	}

	$scope.getBillingAddress();
});

/*************************************** Payment option ***************************************************************/

app.controller('paymentOptionCtrl', function($scope, $http, $window, $filter, $location, $timeout) {

	$scope.onCCAvenueSubmit = function(paymentoption, data) {

		var name = data.fullName;
		var email = data.emailId;
		var address1 = data.address1;
		var address2 = data.address2;
		var pincode = data.pincode;
		var mobile = data.mobileNo;
		var countryId = data.countryId;
		var countryName = data.countryName;
		if (countryId > 0 && !countryName) {
			var filterName = $scope.countries.filter(function(country) {
				return country.countryId === countryId;
			});
			countryName = filterName.length > 0 ? filterName[0].countryName : '';
		}
		var state = data.stateName;
		var city = data.cityName;

		if (address2 == undefined || address2 == "") {
			address2 = "";
		}

		var billingcountryname = countryName;
		var billingstatename = state;
		var billingcityname = city;
		var billingname = name;
		var billingemail = email;
		var billingaddress1 = address1;
		var billingaddress2 = address2;
		var billingpincode = pincode;
		var billingmobileno = mobile;

		/*	var subtotal = $scope.totalamount;
			var total = $scope.total;*/

		var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;

		if (name == undefined || name == "") {
			$window.alert("Please enter full name!");
			document.getElementById("name").focus();
			return;
		}
		else if (email == undefined || email == "") {
			$window.alert("Please enter a valid email address!");
			document.getElementById("email").focus();
			return;
		}
		else if (!email.match(mailformat)) {
			$window.alert("Please enter a valid email address!");
			document.getElementById("email").focus();
			return;
		}
		else if (mobile == undefined || mobile == "") {
			$window.alert("Please enter mobile number!");
			document.getElementById("mobile").focus();
			return;
		}
		else if (mobile.length != 10) {
			window.alert("Please enter 10 digit mobile number");
			document.getElementById("mobile").focus();
			return false;
		}
		else if (address1 == undefined || address1 == "") {
			$window.alert("Please enter address line-1!");
			document.getElementById("address1").focus();
			return;
		}
		else if (address2 == undefined || address2 == "") {
			$window.alert("Please enter address line-2!");
			document.getElementById("address2").focus();
			return;
		}
		else if (countryName == undefined || countryName == "") {
			$window.alert("Please select country!");
			document.getElementById("country").focus();
			return;
		}
		else if (state == undefined || state == "") {
			$window.alert("Please enter state name!");
			document.getElementById("state").focus();
			return;
		}
		else if (city == undefined || city == "") {
			$window.alert("Please enter city name!");
			document.getElementById("city").focus();
			return;
		}
		else if (pincode == undefined || pincode == "") {
			$window.alert("Please enter pincode!");
			document.getElementById("pincode").focus();
			return;
		}
		else {

			var link = baseUrl + 'setBillingAddress?billingname=' + billingname + '&billingemail=' + billingemail + '&billingaddress1=' + billingaddress1 + '&billingaddress2=' + billingaddress2 + '&billingcountryname=' + billingcountryname + '&billingstatename=' + billingstatename + '&billingcityname=' + billingcityname + '&billingpincode=' + billingpincode + '&billingmobileno=' + billingmobileno;
			$http.post(link).then(
				function(data, status, headers, config) {
					$scope.billingaddress = data;

					var link = baseUrl + 'addOrder?billingname=' + billingname + '&billingemail=' + billingemail + '&billingaddress1=' + billingaddress1 + '&billingaddress2=' + billingaddress2 + '&billingcountryname=' + billingcountryname + '&billingstatename=' + billingstatename + '&billingcityname=' + billingcityname + '&billingpincode=' + billingpincode + '&billingmobileno=' + billingmobileno + '&paymentoption=' + paymentoption;

					$http.post(link).then(
						function(response, status, headers, config) {
							if (response.data == null || response.data == undefined || response.data == "") {
								if (paymentoption == 'online')

									$window.location.href = url + 'datafrom';
								else
									$window.location.href = url + 'order_confirmation';
							} else {
								$window.alert(response.data);
							}

						}).
						catch(function(data, status, headers, config) {
							$scope.addorder = "Response Fail";
						});

				}).
				catch(function(data, status, headers, config) {
					$scope.billingaddress = "Response Fail";
				});

		}

	}

});

/*************************************** CCAvenue  ***************************************************************/

app.controller('ccAvResCtrl', function($scope, $http, $window, $filter, $location) {
	//var baseUrl = $location.protocol() + "://" + location.host + baseUrl;

	$scope.ccavenueresponse = function() {
		var orderid = $scope.orderid;
		//var authdesc = $scope.authdesc;
		var trackingid = $scope.trackingid;
		var bankrefnumber = $scope.bankrefnumber;
		var orderstatus = $scope.orderstatus;
		var failuremessage = $scope.failuremessage;
		var paymentmode = $scope.paymentmode;
		var cardname = $scope.cardname;
		//var bankname = $scope.bankname;
		var statuscode = $scope.statuscode;
		var statusmessage = $scope.statusmessage;
		var currency = $scope.currency;

		/*var createddate = $filter('date')(new Date(), 'dd/MM/yyyy');
		var createdtime = $filter('date')(new Date(), 'hh:mm:ss');*/

		if (orderid == undefined || orderid == "" || orderid == 'null') {
			orderid = "";
		}
		if (trackingid == undefined || trackingid == "" || trackingid == 'null') {
			trackingid = "";
		}
		if (bankrefnumber == undefined || bankrefnumber == "" || bankrefnumber == 'null') {
			bankrefnumber = "";
		}
		if (orderstatus == undefined || orderstatus == "" || orderstatus == 'null') {
			orderstatus = "";
		}
		if (failuremessage == undefined || failuremessage == "" || failuremessage == 'null') {
			failuremessage = "";
		}
		/*if(bankname == undefined || bankname == "" || bankname == 'null'){
			bankname = "";
		}*/
		if (paymentmode == undefined || paymentmode == "" || paymentmode == 'null') {
			paymentmode = "";
		}
		if (cardname == undefined || cardname == "" || cardname == 'null') {
			cardname = "";
		}
		if (currency == undefined || currency == "" || currency == 'null') {
			currency = "";
		}
		if (statuscode == undefined || statuscode == "" || statuscode == "null") {
			statuscode = "";
		}
		if (statusmessage == undefined || statusmessage == "" || statusmessage == "null") {
			statusmessage = "";
		}

		var link = baseUrl + 'ccavenueResponse?orderid=' + orderid + '&trackingid=' + trackingid + '&bankrefnumber=' + bankrefnumber + '&orderstatus=' + orderstatus + '&failuremessage=' + failuremessage + '&paymentmode=' + paymentmode + '&cardname=' + cardname + '&statuscode=' + statuscode + '&currency=' + currency;
		$http.post(link).then(
			function(data, status, headers, config) {

				$window.location.href = url + "order_confirmation";
			}).
			catch(function(data, status, headers, config) {
				$window.location.href = url + "order_confirmation";
			});
	}
});

/*************************************** order confrimation  ***************************************************************/

app.controller('orderConfirmationCtrl', function($scope, $http, $window, $filter, $location) {

	$scope.getorderdetail = function(ordernumber) {
		$scope.date = $filter('date')(new Date(), 'dd/MM/yyyy');
		//	var createddate = $scope.date;

		//	$scope.a = "y";

		var link = baseUrl + 'getOrderDetailById?ordernumber=' + ordernumber;
		$http.get(link).then(
			function(response, status, headers, config) {
				$scope.orderdetail = response.data;
				//$scope.totalTaxAmount = 0;
				var link = baseUrl + 'getOrderSevaDetailsById?ordernumber=' + ordernumber;
				$http.get(link).then(
					function(response, status, headers, config) {
						$scope.orderSevadetails = response.data;
					}).catch(function(data, status, headers, config) {
						$scope.orderSevadetails = "Response Fail";
					});


				if ($scope.orderdetail[0].paymentStatus == "Success" || $scope.orderdetail[0].paymentMode == "COD") {
					$scope.date = $filter('date')(new Date(), 'dd/MM/yyyy');
					var link = baseUrl + 'sendOrderConfirmationMail?ordernumber=' + ordernumber;
					$http.post(link).then(
						function(data, status, headers, config) {
						}).
						catch(function(data, status, headers, config) {
						});
				}
			}).
			catch(function(data, status, headers, config) {
				$scope.orderdetail = "Response Fail";
			});
	}

	$scope.cancelorder = function() {
		var link = baseUrl + 'cancelOrder';
		$http.post(link).then(
			function(response, status, headers, config) {
				$scope.cancelorder = response.data;

				$scope.cart = [];

				$window.location.href = url;
			}).
			catch(function(data, status, headers, config) {
				$scope.cancelorder = "Response Fail";
			});
	}

	$scope.makepayment = function() {
		$window.location.href = url + 'datafrom';
	}
});

/***************************************Admin Booking  ***************************************************************/

/*app.controller('AdminBookingCtrl', function($scope, $http, $window, $filter, $location) {

	$scope.orders = [];
	$scope.orderDetails = [];

	$scope.getAllOrderDetails = function() {
		$http.get(baseUrl + 'getAllOrderDetails/')
			.then(function(response) {
				if (response.data && response.data.length > 0) {
					$scope.orders = response.data;
					$scope.orderDetails = response.data;
				}
			})
			.catch(function(error) {
				$scope.orders = [];
			});

	}

	$scope.getAllOrderDetailsByUserId = function() {
		var link = baseUrl + "getAllOrderDetailsByUserId";

		$http.get(link).then(function(response) {
			$scope.orderDetails = response.data;
		})
			.catch(function(error) {
				$scope.orderDetails = null;
			});
	}

	// Toggle Details Function (Only One Row Expands at a Time)
	$scope.toggleDetails = function(selectedOrder, data) {
		angular.forEach(data, function(order) {
			if (order !== selectedOrder) {
				order.showDetails = false; // Collapse other rows
			}
		});

		// Toggle the clicked row
		selectedOrder.showDetails = !selectedOrder.showDetails;
	};

});*/
app.controller('AdminBookingCtrl', function($scope, $http, $window, $filter) {

	$scope.orders = [];
	$scope.filteredOrders = [];
	$scope.currentPage = 1;
	$scope.pageSize = "10";

	// Function to fetch all order details
	$scope.getAllOrderDetails = function() {
		$http.get(baseUrl + 'getAllOrderDetails/')
			.then(function(response) {
				if (response.data && response.data.length > 0) {
					$scope.orders = response.data;
					angular.forEach($scope.orders, function(order) {
						order.showDetails = false;
					});
					$scope.setPageSize($scope.pageSize);
				}
			})
			.catch(function(error) {
				$scope.orders = [];
			});
	};

	// Toggle order details (Only One Row Expands at a Time)
	$scope.toggleDetails = function(selectedOrder) {
		angular.forEach($scope.orders, function(order) {
			if (order !== selectedOrder) {
				order.showDetails = false; // Collapse other rows
			}
		});
		selectedOrder.showDetails = !selectedOrder.showDetails; // Toggle selected row
	};

	// Update the filtered orders for pagination
	$scope.updatePagination = function() {
		let start = ($scope.currentPage - 1) * $scope.pageSize;
		let end = $scope.pageSize === "0" ? $scope.orders.length : start + $scope.pageSize;
		$scope.filteredOrders = $scope.orders.slice(start, end);
	};

	// Set the current page
	$scope.setPage = function(page) {
		if (page >= 1 && page <= $scope.totalPages()) {
			$scope.currentPage = page;
			$scope.updatePagination();
		}
	};

	// Set the page size
	$scope.setPageSize = function(size) {
		$scope.pageSize = size;
		$scope.currentPage = 1; // Reset to first page
		$scope.updatePagination();
	};

	// Total number of pages
	$scope.totalPages = function() {
		return $scope.pageSize === "0" ? 1 : Math.ceil($scope.orders.length / $scope.pageSize);
	};

	// Initial fetch of order details
	$scope.getAllOrderDetails();
});

/***************************************Admin Daily Darshan  ***************************************************************/

app.controller('AdminManageDailyDarshanCtrl', function($scope, $http, $window, $filter, $location, $timeout) {

	// Function to navigate back to the previous page
	$scope.backDailyDarshanData = function() {
		$window.history.back(); // This will navigate to the previous page in history
	};

	$scope.openCollapse = function() {
		$("#collapseCardDailyDarshan").collapse('show');
	};


	$scope.updateDay = function() {
		if ($scope.dailyDarshan.dailyDarshanDate instanceof Date) {
			var date = new Date($scope.dailyDarshan.dailyDarshanDate);

			if (!isNaN(date.getTime())) {
				// Convert to DD/MM/YYYY format
				var day = String(date.getDate()).padStart(2, '0'); // Ensure two digits
				var month = String(date.getMonth() + 1).padStart(2, '0'); // Ensure two digits
				var year = date.getFullYear();

				$scope.dailyDarshan.dailyDarshanDate = `${day}/${month}/${year}`; // Correctly formatted date
				$scope.dailyDarshan.dailyDarshanDay = date.toLocaleDateString('en-US', { weekday: 'long' });
			} else {
				$scope.dailyDarshan.dailyDarshanDay = "Invalid Date";
			}
		} else {
			if ($scope.dailyDarshan.dailyDarshanDate) {
				const [day, month, year] = $scope.dailyDarshan.dailyDarshanDate.split('/').map(Number);
				var selectedDate = new Date(year, month - 1, day);
				$scope.dailyDarshan.dailyDarshanDay = selectedDate.toLocaleDateString('en-US', { weekday: 'long' });
			} else {
				$scope.dailyDarshan.dailyDarshanDay = "";
			}
		}
	};


	$scope.dailyDarshanList = [];

	$scope.dailyDarshan = {
		dailyDarshanId: 0,
		dailyDarshanTitle: '',
		dailyDarshanSubtitle: '',
		dailyDarshanDescription: '',
		dailyDarshanDate: '',
		dailyDarshanDay: '',
		status: 'y',
		createdBy: 0,
		createdDate: '',
		ipAddress: ''
	};


	$scope.dailyDarshanImages = {
		dailyDarshanImageId: 0,
		dailyDarshanId: 0,
		imageTitle: '',
		imageDescription: '',
		youTubeUrl: '',
		dailyDarshanImages: '',
		imageInputType: '',
		status: 'y',
		createdBy: 0,
		createdDate: '',
		ipAddress: ''
	};

	$scope.clearDailyDarshanData = function() {

		$scope.dailyDarshan = {
			dailyDarshanId: 0,
			dailyDarshanTitle: '',
			dailyDarshanSubtitle: '',
			dailyDarshanDescription: '',
			dailyDarshanDate: '',
			dailyDarshanDay: '',
			status: 'y',
			createdBy: 0,
			createdDate: '',
			ipAddress: ''
		};

		$scope.dailyDarshanImages = {
			dailyDarshanImageId: 0,
			dailyDarshanId: 0,
			imageTitle: '',
			imageDescription: '',
			youTubeUrl: '',
			dailyDarshanImages: '',
			imageInputType: '',
			status: 'y',
			createdBy: 0,
			createdDate: '',
			ipAddress: ''
		};

		// Clear the image list
		$scope.dailydarshanimagelist = [];

		CKEDITOR.instances.dailyDarshanDescription.setData($scope.dailyDarshan.dailyDarshanDescription);
	}

	// Add new gallery images
	$scope.dailydarshanimagelist = [];

	$scope.addDailyDarshan = function() {

		let imageTitle = $scope.dailyDarshanImages.imageTitle;
		let imageDescription = $scope.dailyDarshanImages.imageDescription;
		let youTubeUrl = $scope.dailyDarshanImages.youTubeUrl;
		let imageInput = document.getElementById("dailyDarshanImage");
		let imageType = $scope.dailyDarshanImages.imageInputType;
		if (imageType === 'upload') {
			imageInput = document.getElementById("dailyDarshanUploadImage");
		}

		if (!imageTitle || !imageDescription) {
			alert("Image title and description are required.");
			return;
		}

		if (!imageInput.files.length) {
			alert("Please select an image file.");
			return;
		}

		let files = imageInput.files;

		if (files && files.length > 0) {
			for (let i = 0; i < files.length; i++) {
				let file = files[i];
				let reader = new FileReader();

				reader.onload = (function(fileObj) {
					return function(e) {
						$scope.$apply(function() {
							$scope.dailydarshanimagelist.push({
								imageTitle: imageTitle,
								imageDescription: imageDescription,
								youTubeUrl: youTubeUrl,
								imageFile: fileObj,
								image: e.target.result, // Base64 preview
								isNew: true,
								imageInputType: imageType
							});
						});
					};
				})(file);

				reader.readAsDataURL(file);
			}

			// Clear input and form fields after processing all files
			$scope.dailyDarshanImages.imageTitle = '';
			$scope.dailyDarshanImages.imageDescription = '';
			$scope.dailyDarshanImages.youTubeUrl = '';

			if (imageType !== 'upload') {
				document.getElementById("dailyDarshanImage").value = null;
			} else {
				document.getElementById("dailyDarshanUploadImage").value = null;
			}
		}

		/*if (imageType !== 'upload') {
			let file = imageInput.files[0];
			let reader = new FileReader();
			reader.onload = function(e) {
				$scope.$apply(function() {
					$scope.dailydarshanimagelist.push({
						imageTitle: imageTitle,
						imageDescription: imageDescription,
						youTubeUrl: youTubeUrl,
						imageFile: file,
						image: e.target.result, // For previewing image if needed
						isNew: true
					});

					// Clear input fields after adding
					$scope.dailyDarshanImages.imageTitle = '';
					$scope.dailyDarshanImages.imageDescription = '';
					$scope.dailyDarshanImages.youTubeUrl = '';
					document.getElementById("dailyDarshanImage").value = null;
				});
			};

			reader.readAsDataURL(file); // Reads file and creates preview URL
		}else{
			
		}*/
	};

	$scope.deleteItem = function(item) {
		if (item.dailyDarshanImageId && item.dailyDarshanImageId > 0) {
			var link = adminUrl + "deleteDailyDarshanImage/" + item.dailyDarshanImageId;

			$http.delete(link)
				.then(function(response) {
					if (response.status === 204) {
						alert("Image deleted successfully!");
						var index = $scope.dailydarshanimagelist.indexOf(item);
						if (index !== -1) {
							$scope.dailydarshanimagelist.splice(index, 1);
						}
					} else {
						alert("Error deleting image. Please try again.");
					}
				})
				.catch(function(error) {
					console.error("Error deleting image", error);
					alert("An error occurred while deleting the image.");
				});
		} else {
			var index = $scope.dailydarshanimagelist.indexOf(item);
			if (index === -1) {
				alert("Something went wrong. Please try again.");
				return;
			}
			$scope.dailydarshanimagelist.splice(index, 1);
		}
	};

	$scope.addAllDailyDarshan = function() {
		let dailyDarshanDescription = "";
		let imageInputType = "upload";
		if (CKEDITOR.instances.dailyDarshanDescription) {
			dailyDarshanDescription = CKEDITOR.instances.dailyDarshanDescription.getData();
		}

		let valuex = 0;
		let valuey = 0;
		let valuew = 0;
		let valueh = 0;

		if ($scope.dailydarshanimagelist[0].imageInputType !== 'upload') {
			imageInputType = 'capture';
			valuex = document.getElementById("valuex").value || 0;
			valuey = document.getElementById("valuey").value || 0;
			valuew = document.getElementById("valuew").value || 0;
			valueh = document.getElementById("valueh").value || 0;
		}


		if (!$scope.dailyDarshan.dailyDarshanTitle) {
			alert("Daily Darshan title cannot be empty");
			return;
		}

		if (!$scope.dailyDarshan.dailyDarshanDate) {
			alert("Daily Darshan Date cannot be empty");
			return;
		}

		if (!$scope.dailydarshanimagelist.length) {
			alert("At least one image is required.");
			return;
		}

		if (dailyDarshanDescription) {
			$scope.dailyDarshan.dailyDarshanDescription = dailyDarshanDescription;
		}

		let formData = new FormData();

		// Add daily darshan data
		formData.append("dailyDarshanStr", JSON.stringify($scope.dailyDarshan));

		// Add each image and details
		let imageMetaList = []; // just metadata for dailyDarshanImageStr

		$scope.dailydarshanimagelist.forEach((item, index) => {
			formData.append("files", item.imageFile); // Add the actual file

			imageMetaList.push({
				imageTitle: item.imageTitle,
				imageDescription: item.imageDescription,
				youTubeUrl: item.youTubeUrl,
				status: 'y',
				createdBy: 0,
				createdDate: '',
				ipAddress: '',
				imageInputType: item.imageInputType
			});
		});

		formData.append("dailyDarshanImageStr", JSON.stringify(imageMetaList));

		let link = adminUrl + "addDailyDarshan?valuex=" + valuex + "&valuey=" + valuey + "&valuew=" + valuew + "&valueh=" + valueh +
			"&imageInputType=" + imageInputType;

		$http
			.post(link, formData, {
				headers: { "Content-Type": undefined },
				transformRequest: function(data, headersGetterFunction) {
					return data;
				},
			})
			.then(function(response) {
				if (response.status === 200 || response.status === 201) {
					alert("Daily Darshan added successfully!");
					$scope.clearDailyDarshanData();
					$scope.dailydarshanimagelist = []; //  Clear the list of added images
					$scope.getAllDailyDarshan();
					document.getElementById("dailyDarshanImage").value = null;
					document.getElementById("dailyDarshanUploadImage").value = null;
				}
			})
			.catch(function(error) {
				if (error.status === 401) {
					$window.location.href = adminUrl + "login";
				} else {
					console.error("Error Response:", error);
					alert(
						"An error occurred: " +
						(error.data && error.data.message
							? error.data.message
							: "Unknown error")
					);
				}
			});
	};

	// Function to update a daily darshan
	$scope.updateDailyDarshan = function() {
		let dailyDarshanDescription = "";
		let imageInputType = "upload";
		if (CKEDITOR.instances.dailyDarshanDescription) {
			dailyDarshanDescription = CKEDITOR.instances.dailyDarshanDescription.getData();
		}

		let valuex = 0;
		let valuey = 0;
		let valuew = 0;
		let valueh = 0;

		if ($scope.dailydarshanimagelist[0].imageInputType !== 'upload') {
			imageInputType = 'capture';
			valuex = document.getElementById("valuex").value || 0;
			valuey = document.getElementById("valuey").value || 0;
			valuew = document.getElementById("valuew").value || 0;
			valueh = document.getElementById("valueh").value || 0;
		}

		if (!$scope.dailyDarshan.dailyDarshanTitle) {
			alert("Daily Darshan title cannot be empty");
			return;
		}

		if (!$scope.dailyDarshan.dailyDarshanDate) {
			alert("Daily Darshan date cannot be empty");
			return;
		}

		if (!$scope.dailydarshanimagelist.length) {
			alert("At least one image is required.");
			return;
		}

		if (dailyDarshanDescription) {
			$scope.dailyDarshan.dailyDarshanDescription = dailyDarshanDescription;
		}

		$scope.updateDay();
		let formData = new FormData();

		// Add dailyDarshan data
		formData.append("dailyDarshanStr", JSON.stringify($scope.dailyDarshan));

		// Add each image and details (whether new or existing)
		let imageMetaList = []; // just metadata for dailyDarshanImageStr

		$scope.dailydarshanimagelist.forEach((item, index) => {
			if (item.isNew) {
				if (item.imageFile) { // Only add file if it's new or updated
					formData.append("files", item.imageFile); // Add the actual file
				}

				imageMetaList.push({
					imageTitle: item.imageTitle,
					imageDescription: item.imageDescription,
					youTubeUrl: item.youTubeUrl,
					status: item.status || 'y', // default to 'y' if no status provided
					createdBy: item.createdBy || 0, // set proper creator if needed
					createdDate: item.createdDate || '', // set created date if needed
					ipAddress: item.ipAddress || '', // set IP address if needed
					imageInputType: item.imageInputType || 'capture'
				});
			}

		});

		formData.append("dailyDarshanImageStr", JSON.stringify(imageMetaList));

		let link = adminUrl + "updateDailyDarshan?valuex=" + valuex + "&valuey=" + valuey + "&valuew=" + valuew + "&valueh=" + valueh +
			"&imageInputType=" + imageInputType;

		$http
			.post(link, formData, {
				headers: { "Content-Type": undefined },
				transformRequest: function(data) {
					return data;
				},
			})
			.then(function(response) {
				if (response.status === 200 || response.status === 201) {
					alert("Daily darshan updated successfully!");
					$scope.clearDailyDarshanData();
					$scope.dailydarshanimagelist = []; // Clear the list of images
					$scope.getAllDailyDarshan();
					document.getElementById("dailyDarshanImage").value = null;
					document.getElementById("dailyDarshanUploadImage").value = null;
				}
			})
			.catch(function(error) {
				if (error.status === 401) {
					$window.location.href = adminUrl + "login";
				} else {
					console.error("Error Response:", error);
					alert(
						"An error occurred: " +
						(error.data && error.data.message
							? error.data.message
							: "Unknown error")
					);
				}
			});
	};

	$scope.convertToDate = function(dateStr) {
		var parts = dateStr.split("/"); // Split "30/03/2025" into ["30", "03", "2025"]
		return new Date(parts[2], parts[1] - 1, parts[0]); // (YYYY, MM-1, DD)
	}

	$scope.GetDailyDarshanById = function(dailyDarshan) {
		if (!dailyDarshan.dailyDarshanId) {
			alert("Daily Darshan ID is required");
			return;
		}

		// API call to fetch daily Darshan by ID
		$http.get(adminUrl + 'getDailyDarshanById/' + dailyDarshan.dailyDarshanId)
			.then(function(response) {
				if (response.status === 200) {
					var date = $scope.convertToDate(response.data.dailyDarshanDate);
					$scope.dailyDarshan = response.data;
					$scope.dailydarshanimagelist = response.data.dailyDarshanImages;
					$scope.isDailyDarshanActive = $scope.dailyDarshan.status === 'y' ? true : false;
					$scope.dailyDarshan.dailyDarshanDate = date;
					CKEDITOR.instances.dailyDarshanDescription.setData($scope.dailyDarshan.dailyDarshanDescription);
				}
			})
			.catch(function(error) {
				console.error("Error fetching daily darshan by ID", error);
				if (error.status === 404) {
					alert("Daily Darshan not found with the provided ID.");
				} else {
					alert("An unexpected error occurred. Please try again.");
				}
				$scope.dailyDarshan = null; // Clear the result if there's an error
			});
	}

	// Function to delete a daily Darshan
	$scope.deleteDailyDarshan = function() {
		var selectedDailyDarshan = $scope.dailyDarshanList.filter(function(dailyDarshan) {
			return dailyDarshan.selected;
		});
		if (selectedDailyDarshan) {
			if (!confirm("Are you sure you want to delete this daily darshan?")) {
				return;
			}

			selectedDailyDarshan.forEach(function(item, index, array) {
				// API call to delete daily Darshan
				$http.delete(adminUrl + 'deleteDailyDarshan/' + item.dailyDarshanId)
					.then(function(response) {
						if (response.status === 204 && index === array.length - 1) {
							alert("Daily Darshan deleted successfully!");
							$scope.dailyDarshanId = 0;
							$scope.getAllDailyDarshan();
						}
					})
					.catch(function(error) {
						console.error("Error deleting daily darshan", error);
						if (error.status === 404) {
							alert("Daily Darshan not found with the provided ID.");
						} else {
							alert("An unexpected error occurred. Please try again.");
						}
					});
			});
		}
	};

	$scope.getAllDailyDarshan = function() {
		$http.get(adminUrl + 'getAllDailyDarshan')
			.then(function(response) {
				$scope.dailyDarshanList = response.data;
			}).catch(function(error) {
				console.error("Error fetching daily darshan", error);
			});
	};

	$scope.getAllDailyDarshan();

	$scope.editDailyDarshan = function(darshan) {
		$scope.dailyDarshan = angular.copy(darshan);
		// scroll to top
		window.scrollTo({ top: 0, behavior: 'smooth' });
	};

	/* Start: Upload multiple image & preview*/
	$scope.imagePreviews = [];

	$scope.previewImages = function(files) {
		$scope.imagePreviews = []; // reset previews
		if (files && files.length > 0) {
			Array.from(files).forEach(file => {
				const reader = new FileReader();
				reader.onload = function(e) {
					$scope.$apply(function() {
						$scope.imagePreviews.push(e.target.result);
					});
				};
				reader.readAsDataURL(file);
			});
		}
	};
	/* End: Upload multiple image & preview*/

});

/*************************************** Front Darshan ***************************************************************/
app.controller('FrontDarshanController', function($scope, $http, $window, $location, $filter) {

	$scope.dailyDarshan = {
		dailyDarshanId: 0,
		dailyDarshanTitle: '',
		dailyDarshanSubtitle: '',
		dailyDarshanDescription: '',
		dailyDarshanDate: '',
		dailyDarshanDay: '',
		status: 'y',
		createdBy: 0,
		createdDate: '',
		ipAddress: ''
	};


	$scope.dailyDarshanImages = {
		dailyDarshanImageId: 0,
		dailyDarshanId: 0,
		imageTitle: '',
		imageDescription: '',
		youTubeUrl: '',
		dailyDarshanImages: '',
		imageInputType: '',
		status: 'y',
		createdBy: 0,
		createdDate: '',
		ipAddress: ''
	};

	$scope.dailyDarshanList = [];

	$scope.getAllActiveDailyDarshan = [];

	// Function to fetch all daily darshan
	$scope.getAllActiveDailyDarshan = function() {
		$http.get(adminUrl + 'getAllActiveDailyDarshan')
			.then(function(response) {
				$scope.getAllActiveDailyDarshan = response.data;
			}, function(error) {
				console.error('Error fetching daily darshan:', error);
				alert('Error fetching daily darshan.');
			});
	};

	$scope.getTodayActiveDailyDarshan = [];

	// Function to fetch all daily darshan
	$scope.getTodayActiveDailyDarshan = function() {
		$http.get(adminUrl + 'getAllActiveDailyDarshan?filterToday=true')
			.then(function(response) {
				$scope.getTodayActiveDailyDarshan = response.data;
			}, function(error) {
				console.error('Error fetching daily darshan:', error);
				alert('Error fetching daily darshan.');
			});
	};
	$scope.sliderPositions = [];

	$scope.moveSlide = function(index, direction) {
		const sliderId = "slider-" + index;
		const slider = document.getElementById(sliderId);

		if (!slider) return;

		const images = slider.querySelectorAll("img");
		const imageCount = images.length;
		const imageWidth = 285;
		const visibleImages = 4;
		const maxPosition = (imageCount - visibleImages) * imageWidth;

		if (!$scope.sliderPositions[index]) {
			$scope.sliderPositions[index] = 0;
		}

		$scope.sliderPositions[index] += direction * imageWidth * visibleImages;

		if ($scope.sliderPositions[index] < 0) {
			$scope.sliderPositions[index] = 0;
		} else if ($scope.sliderPositions[index] > maxPosition) {
			$scope.sliderPositions[index] = maxPosition;
		}

		slider.style.transform = `translateX(-${$scope.sliderPositions[index]}px)`;
	};

	// Month & Year dropdowns
	$scope.months = [
		{ value: "01", label: "January" },
		{ value: "02", label: "February" },
		{ value: "03", label: "March" },
		{ value: "04", label: "April" },
		{ value: "05", label: "May" },
		{ value: "06", label: "June" },
		{ value: "07", label: "July" },
		{ value: "08", label: "August" },
		{ value: "09", label: "September" },
		{ value: "10", label: "October" },
		{ value: "11", label: "November" },
		{ value: "12", label: "December" }
	];

	$scope.years = [];
	const currentYear = new Date().getFullYear();
	for (let y = currentYear; y >= 2000; y--) {
		$scope.years.push(y.toString());
	}

	$scope.selectedMonth = "";
	$scope.selectedYear = currentYear.toString();

	// Corrected Filter function
	$scope.filterDarshan = function(dailyDarshan) {
		if (!$scope.selectedMonth && !$scope.selectedYear) {
			return true;
		}

		if (!dailyDarshan.dailyDarshanDate) {
			return false;
		}

		// Assuming format is dd-MM-yyyy
		const parts = dailyDarshan.dailyDarshanDate.split("/");
		if (parts.length !== 3) {
			return false;
		}

		const day = parseInt(parts[0], 10);
		const month = parseInt(parts[1], 10);
		const year = parseInt(parts[2], 10);

		if (isNaN(day) || isNaN(month) || isNaN(year)) {
			return false;
		}

		const monthStr = ('0' + month).slice(-2);
		const yearStr = year.toString();

		const matchMonth = !$scope.selectedMonth || $scope.selectedMonth === monthStr;
		const matchYear = !$scope.selectedYear || $scope.selectedYear === yearStr;

		return matchMonth && matchYear;
	};

});

/*************************************** Admin Events ***************************************************************/

app.controller('AdminManageEventsController', function($scope, $http, $window) {

	$scope.openCollapse = function() {
		$("#collapseCardEvents").collapse('show');
	};

	// Function to navigate back to the previous page
	$scope.backEventData = function() {
		$window.history.back(); // This will navigate to the previous page in history
	};

	$scope.editEvent = function(event) {
		$scope.events = angular.copy(event);
		// scroll to top
		window.scrollTo({ top: 0, behavior: 'smooth' });
	};

	$scope.updateDay = function() {
		if ($scope.event.eventDate) {
			var date = new Date($scope.event.eventDate);

			if (!isNaN(date.getTime())) {
				// Convert to DD/MM/YYYY format
				var day = String(date.getDate()).padStart(2, '0'); // Two digits
				var month = String(date.getMonth() + 1).padStart(2, '0'); // Two digits
				var year = date.getFullYear();

				$scope.event.eventDate = `${day}/${month}/${year}`; // Set formatted date
			}
		}
	};

	$scope.eventList = [];

	$scope.event = {
		eventId: 0,
		eventTitle: '',
		eventLocation: '',
		eventDate: '',
		eventDescription: '',
		status: 'y',
		createdBy: 0,
		createdDate: '',
		ipAddress: ''
	};


	$scope.eventImages = {
		eventImageId: 0,
		eventId: 0,
		eventImageTitle: '',
		eventImageDescription: '',
		eventsImages: '',
		status: 'y',
		createdBy: 0,
		createdDate: '',
		ipAddress: ''
	};

	$scope.clearEventData = function() {

		$scope.event = {
			eventId: 0,
			eventTitle: '',
			eventLocation: '',
			eventDate: '',
			eventDescription: '',
			status: 'y',
			createdBy: 0,
			createdDate: '',
			ipAddress: ''
		};


		$scope.eventImages = {
			eventImageId: 0,
			eventId: 0,
			eventImageTitle: '',
			eventImageDescription: '',
			eventsImages: '',
			status: 'y',
			createdBy: 0,
			createdDate: '',
			ipAddress: ''
		};

		CKEDITOR.instances.eventDescription.setData($scope.event.eventDescription);
	}

	// Add new event to the list
	$scope.addAllEvent = function() {
		var eventDescription = CKEDITOR.instances.eventDescription.getData();
		var s = encodeURIComponent(eventDescription);

		var valuex = document.getElementById("valuex").value;
		var valuey = document.getElementById("valuey").value;
		var valuew = document.getElementById("valuew").value;
		var valueh = document.getElementById("valueh").value;


		if (!valuex)
			valuex = 0;
		if (!valuey)
			valuey = 0;
		if (!valuew)
			valuew = 0;
		if (!valueh)
			valueh = 0;

		if (!$scope.event.eventTitle) {
			alert("Event title cannot be empty");
			return;
		}
		if (!$scope.event.eventLocation) {
			alert("Event location cannot be empty");
			return;
		}
		if (!$scope.event.eventDate) {
			alert("Event Date cannot be empty");
			return;
		}
		if (!eventImage.files[0]) {
			alert("Event Image should be required");
			return;
		}

		if (eventDescription) {
			$scope.event.eventDescription = eventDescription;
		}

		var formData = new FormData();
		formData.append('file', eventImage.files[0]);
		formData.append('eventStr', JSON.stringify($scope.event));
		formData.append('eventImageStr', JSON.stringify($scope.eventImages));

		var link = adminUrl + "addEvent?valuex=" + valuex + '&valuey=' + valuey + '&valuew=' + valuew + '&valueh=' + valueh;

		// API call to add event
		$http.post(link, formData, {
			headers: { 'Content-Type': undefined },
			transformRequest: function(data, headersGetterFunction) { return data; }
		}).then(function(response) {
			if (response.status === 201) {
				alert("Event added successfully!");
				$scope.clearEventData();
				$scope.getAllEvents();
				document.getElementById("eventImage").value = null;
			}
		})
			.catch(function(error) {
				if (response.status === 401) {
					$window.location.href = adminUrl + 'login';
				} else {
					console.error("Error Response:", error);
					alert("An error occurred: " + error.data.message || "Unknown error");
				}
			});
	};


	// Function to update a event
	$scope.updateEvent = function() {
		var eventDescription = CKEDITOR.instances.eventDescription.getData();
		var s = encodeURIComponent(eventDescription);

		var valuex = document.getElementById("valuex").value;
		var valuey = document.getElementById("valuey").value;
		var valuew = document.getElementById("valuew").value;
		var valueh = document.getElementById("valueh").value;


		if (!valuex)
			valuex = 0;
		if (!valuey)
			valuey = 0;
		if (!valuew)
			valuew = 0;
		if (!valueh)
			valueh = 0;

		if (!$scope.event.eventId) {
			alert("Event ID is required");
			return;
		}

		if (!$scope.event.eventTitle) {
			alert("Event title cannot be empty");
			return;
		}

		if (!$scope.event.eventLocation) {
			alert("Event location cannot be empty");
			return;
		}

		if (!$scope.event.eventDate) {
			alert("Event Date cannot be empty");
			return;
		}

		if (eventDescription) {
			$scope.event.eventDescription = eventDescription;
		}

		$scope.updateDay();
		var formData = new FormData();
		if (eventImage.files[0]) {
			formData.append('file', eventImage.files[0]);
		}

		formData.append('eventStr', JSON.stringify($scope.event));
		formData.append('eventImageStr', JSON.stringify($scope.eventImages));

		var link = adminUrl + "updateEvent?id=" + $scope.event.eventId + '&valuex=' + valuex + '&valuey=' + valuey + '&valuew=' + valuew + '&valueh=' + valueh;

		// API call to update event
		$http.post(link, formData, {
			headers: { 'Content-Type': undefined },
			transformRequest: function(data, headersGetterFunction) { return data; }
		})
			.then(function(response) {
				if (response.status === 200) {
					alert("Event updated successfully!");
					$scope.clearEventData();
					$scope.getAllEvents();
				}
			})
			.catch(function(error) {
				console.error("Error updating event", error);
				if (error.status === 404) {
					alert("Event not found with the provided ID.");
				} else {
					alert("An unexpected error occurred. Please try again.");
				}
			});
	};

	$scope.convertToDate = function(dateStr) {
		var parts = dateStr.split("/"); // Split "30/03/2025" into ["30", "03", "2025"]
		return new Date(parts[2], parts[1] - 1, parts[0]); // (YYYY, MM-1, DD)
	}

	$scope.GetEventById = function(event) {
		if (!event.eventId) {
			alert("Event ID is required");
			return;
		}

		// API call to fetch event by ID
		$http.get(adminUrl + 'getEventById/' + event.eventId)
			.then(function(response) {
				if (response.status === 200) {
					var date = $scope.convertToDate(response.data.eventDate);
					$scope.event = response.data;
					$scope.isEventActive = $scope.event.status === 'y' ? true : false;
					$scope.event.eventDate = date;
					CKEDITOR.instances.eventDescription.setData($scope.event.eventDescription);
					$scope.eventImages = response.data.eventsImages[0];
				}
			})
			.catch(function(error) {
				console.error("Error fetching event by ID", error);
				if (error.status === 404) {
					alert("Event not found with the provided ID.");
				} else {
					alert("An unexpected error occurred. Please try again.");
				}
				$scope.event = null; // Clear the result if there's an error
			});
	}

	// Function to delete a event
	$scope.deleteEvent = function() {
		var selectedEvent = $scope.eventList.filter(function(event) {
			return event.selected;
		});
		if (selectedEvent) {
			if (!confirm("Are you sure you want to delete this event?")) {
				return;
			}

			selectedEvent.forEach(function(item, index, array) {
				// API call to delete event 
				$http.delete(adminUrl + 'deleteEvent/' + item.eventId)
					.then(function(response) {
						if (response.status === 204 && index === array.length - 1) {
							alert("Event deleted successfully!");
							$scope.eventId = 0;
							$scope.getAllEvents();
						}
					})
					.catch(function(error) {
						console.error("Error deleting event", error);
						if (error.status === 404) {
							alert("Event not found with the provided ID.");
						} else {
							alert("An unexpected error occurred. Please try again.");
						}
					});
			});
		}
	};

	// Function to fetch all event
	$scope.getAllEvents = function() {
		$http.get(adminUrl + 'getAllEvents')
			.then(function(response) {
				$scope.eventList = response.data;
				$scope.eventList.forEach(function(event) {
					event.selected = false;
				});
			}, function(error) {
				console.error('Error fetching event:', error);
				alert('Error fetching event.');
			});
	}

	$scope.getAllEvents();

});

/*************************************** Front Events ***************************************************************/
app.controller('FrontEventController', function($scope, $http, $window, $location) {

	$scope.getAllActiveEvents = [];


	// Function to fetch all event
	$scope.getAllActiveEvents = function() {
		$http.get(adminUrl + 'getAllActiveEvents')
			.then(function(response) {
				$scope.getAllActiveEvents = response.data;
			}, function(error) {
				console.error('Error fetching event:', error);
				alert('Error fetching event.');
			});
	}

	$scope.getAllActiveEvents();
});

/*************************************** Admin Gallery ***************************************************************/
app.controller('AdminManageGalleryCtrl', function($scope, $http, $window) {


	$scope.openCollapse = function() {
		$("#collapseCardGallery").collapse('show');
	};

	// Function to navigate back to the previous page
	$scope.backAlbumData = function() {
		$window.history.back(); // This will navigate to the previous page in history
	};

	$scope.editAlbum = function(album) {
		$scope.gallery = angular.copy(album);
		// scroll to top
		window.scrollTo({ top: 0, behavior: 'smooth' });
	};

	$scope.updateDay = function() {
		if ($scope.album.albumDate) {
			var date = new Date($scope.album.albumDate);

			if (!isNaN(date.getTime())) {
				// Convert to DD/MM/YYYY format
				var day = String(date.getDate()).padStart(2, '0'); // Two digits
				var month = String(date.getMonth() + 1).padStart(2, '0'); // Two digits
				var year = date.getFullYear();

				$scope.album.albumDate = `${day}/${month}/${year}`; // Set formatted date
			}
		}
	};

	$scope.convertToDate = function(dateStr) {
		var parts = dateStr.split("/"); // Split "30/03/2025" into ["30", "03", "2025"]
		return new Date(parts[2], parts[1] - 1, parts[0]); // (YYYY, MM-1, DD)
	}

	$scope.albumList = [];

	$scope.album = {
		albumId: 0,
		albumTitle: '',
		albumSubtitle: '',
		albumDate: '',
		description: '',
		status: 'y',
		createdBy: 0,
		createdDate: '',
		ipAddress: ''
	};


	$scope.albumImages = {
		albumImageId: 0,
		albumId: 0,
		imageTitle: '',
		imageDescription: '',
		albumImages: '',
		status: 'y',
		createdBy: 0,
		createdDate: '',
		ipAddress: ''
	};

	$scope.clearAlbumData = function() {

		$scope.album = {
			albumId: 0,
			albumTitle: '',
			albumSubtitle: '',
			albumDate: '',
			description: '',
			status: 'y',
			createdBy: 0,
			createdDate: '',
			ipAddress: ''
		};


		$scope.albumImages = {
			albumImageId: 0,
			albumId: 0,
			imageTitle: '',
			imageDescription: '',
			image: '',
			thumbnailImage: '',
			status: 'y',
			createdBy: 0,
			createdDate: '',
			ipAddress: ''
		};

		$scope.albumimagelist = [];

		CKEDITOR.instances.galleryDescription.setData($scope.album.description);
	}

	// Add new gallery images
	$scope.albumimagelist = [];

	$scope.addAlbumImages = function() {
		let imageTitle = $scope.albumImages.imageTitle;
		let imageDescription = $scope.albumImages.imageDescription;
		let imageInput = document.getElementById("AlbumImage");

		if (!imageTitle || !imageDescription) {
			alert("Image title and description are required.");
			return;
		}

		if (!imageInput.files.length) {
			alert("Please select an image file.");
			return;
		}

		let file = imageInput.files[0];

		let reader = new FileReader();
		reader.onload = function(e) {
			$scope.$apply(function() {
				$scope.albumimagelist.push({
					imageTitle: imageTitle,
					imageDescription: imageDescription,
					imageFile: file,
					image: e.target.result, // For previewing image if needed
					isNew: true
				});

				// Clear input fields after adding
				$scope.albumImages.imageTitle = '';
				$scope.albumImages.imageDescription = '';
				document.getElementById("AlbumImage").value = null;
			});
		};

		reader.readAsDataURL(file); // Reads file and creates preview URL
	};

	$scope.addAllAlbum = function() {
		let galleryDescription = "";
		if (CKEDITOR.instances.galleryDescription) {
			galleryDescription = CKEDITOR.instances.galleryDescription.getData();
		}

		let valuex = document.getElementById("valuex").value || 0;
		let valuey = document.getElementById("valuey").value || 0;
		let valuew = document.getElementById("valuew").value || 0;
		let valueh = document.getElementById("valueh").value || 0;

		if (!$scope.album.albumTitle) {
			alert("Album title cannot be empty");
			return;
		}

		if (!$scope.album.albumDate) {
			alert("Album date cannot be empty");
			return;
		}

		if (!$scope.albumimagelist.length) {
			alert("At least one album image is required.");
			return;
		}

		if (galleryDescription) {
			$scope.album.description = galleryDescription;
		}

		let formData = new FormData();

		// Add album data
		formData.append("albumStr", JSON.stringify($scope.album));

		// Add each image and details
		let imageMetaList = []; // just metadata for albumImageStr

		$scope.albumimagelist.forEach((item, index) => {
			formData.append("files", item.imageFile); // Add the actual file

			imageMetaList.push({
				imageTitle: item.imageTitle,
				imageDescription: item.imageDescription,
				status: 'y',
				createdBy: 0,
				createdDate: '',
				ipAddress: ''
			});
		});

		formData.append("albumImageStr", JSON.stringify(imageMetaList));

		let link = adminUrl + "addAlbum?valuex=" + valuex + "&valuey=" + valuey + "&valuew=" + valuew + "&valueh=" + valueh;

		$http
			.post(link, formData, {
				headers: { "Content-Type": undefined },
				transformRequest: function(data, headersGetterFunction) {
					return data;
				},
			})
			.then(function(response) {
				if (response.status === 200 || response.status === 201) {
					alert("Album added successfully!");
					$scope.clearAlbumData();
					$scope.albumimagelist = []; //  Clear the list of added images
					$scope.getAllGallery();
					document.getElementById("AlbumImage").value = null;
				}
			})
			.catch(function(error) {
				if (error.status === 401) {
					$window.location.href = adminUrl + "login";
				} else {
					console.error("Error Response:", error);
					alert(
						"An error occurred: " +
						(error.data && error.data.message
							? error.data.message
							: "Unknown error")
					);
				}
			});
	};

	// Function to fetch all gallery
	$scope.getAllGallery = function() {
		$http.get(adminUrl + 'getAllGallery')
			.then(function(response) {
				$scope.albumList = response.data;
				$scope.albumList.forEach(function(album) {
					album.selected = false;
				});
			}, function(error) {
				console.error('Error fetching album:', error);
				alert('Error fetching album.');
			});
	}

	$scope.getAllGallery();

	$scope.GetGalleryById = function(album) {
		if (!album.albumId) {
			alert("Album ID is required");
			return;
		}

		// API call to fetch album by ID
		$http.get(adminUrl + 'getGalleryById/' + album.albumId)
			.then(function(response) {
				if (response.status === 200) {
					var date = $scope.convertToDate(response.data.albumDate);
					$scope.album = response.data;
					$scope.album.albumDate = date;
					$scope.isAlbumActive = $scope.album.status === 'y';

					CKEDITOR.instances.galleryDescription.setData($scope.album.description || '');
					$scope.albumimagelist = response.data.galleryImages;
					// Ensure albumImages is correctly formatted
					/*$scope.albumimagelist = (response.data.galleryImages || []).map(function(image) {
						return {
							imageTitle: image.imageTitle,
							imageDescription: image.imageDescription,
							image: image.image,
							isNew: false
						};
					});*/
				}
			})
			.catch(function(error) {
				console.error("Error fetching album by ID", error);
				if (error.status === 404) {
					alert("Album not found with the provided ID.");
				} else {
					alert("An unexpected error occurred. Please try again.");
				}
				$scope.album = null; // Clear the result if there's an error
			});
	}

	$scope.updateAlbum = function() {
		let galleryDescription = "";
		if (CKEDITOR.instances.galleryDescription) {
			galleryDescription = CKEDITOR.instances.galleryDescription.getData();
		}

		let valuex = document.getElementById("valuex").value || 0;
		let valuey = document.getElementById("valuey").value || 0;
		let valuew = document.getElementById("valuew").value || 0;
		let valueh = document.getElementById("valueh").value || 0;

		if (!$scope.album.albumTitle) {
			alert("Album title cannot be empty");
			return;
		}

		if (!$scope.album.albumDate) {
			alert("Album date cannot be empty");
			return;
		}

		if (!$scope.albumimagelist.length) {
			alert("At least one album image is required.");
			return;
		}

		if (galleryDescription) {
			$scope.album.description = galleryDescription;
		}

		$scope.updateDay();
		let formData = new FormData();

		// Add album data
		formData.append("albumStr", JSON.stringify($scope.album));

		// Add each image and details (whether new or existing)
		let imageMetaList = []; // just metadata for albumImageStr

		$scope.albumimagelist.forEach((item, index) => {
			if (item.isNew) {
				if (item.imageFile) { // Only add file if it's new or updated
					formData.append("files", item.imageFile); // Add the actual file
				}

				imageMetaList.push({
					imageTitle: item.imageTitle,
					imageDescription: item.imageDescription,
					status: item.status || 'y', // default to 'y' if no status provided
					createdBy: item.createdBy || 0, // set proper creator if needed
					createdDate: item.createdDate || '', // set created date if needed
					ipAddress: item.ipAddress || '' // set IP address if needed
				});
			}

		});

		formData.append("albumImageStr", JSON.stringify(imageMetaList));

		let link = adminUrl + "updateAlbum?valuex=" + valuex + "&valuey=" + valuey + "&valuew=" + valuew + "&valueh=" + valueh;

		$http
			.post(link, formData, {
				headers: { "Content-Type": undefined },
				transformRequest: function(data, headersGetterFunction) {
					return data;
				},
			})
			.then(function(response) {
				if (response.status === 200 || response.status === 201) {
					alert("Album updated successfully!");
					$scope.clearAlbumData();
					$scope.albumimagelist = []; // Clear the list of images
					$scope.getAllGallery();
					document.getElementById("AlbumImage").value = null;
				}
			})
			.catch(function(error) {
				if (error.status === 401) {
					$window.location.href = adminUrl + "login";
				} else {
					console.error("Error Response:", error);
					alert(
						"An error occurred: " +
						(error.data && error.data.message
							? error.data.message
							: "Unknown error")
					);
				}
			});
	};

	$scope.deleteItem = function(item) {
		if (item.albumImageId && item.albumImageId > 0) {
			var link = adminUrl + "deleteGalleryImage/" + item.albumImageId;

			$http.delete(link)
				.then(function(response) {
					if (response.status === 204) {
						alert("Image deleted successfully!");
						var index = $scope.albumimagelist.indexOf(item);
						if (index !== -1) {
							$scope.albumimagelist.splice(index, 1);
						}
					} else {
						alert("Error deleting image. Please try again.");
					}
				})
				.catch(function(error) {
					console.error("Error deleting image", error);
					alert("An error occurred while deleting the image.");
				});
		} else {
			var index = $scope.albumimagelist.indexOf(item);
			if (index === -1) {
				alert("Something went wrong. Please try again.");
				return;
			}
			$scope.albumimagelist.splice(index, 1);
		}
	};


	// Function to delete a album
	$scope.deleteGallery = function() {
		var selectedGallery = $scope.albumList.filter(function(album) {
			return album.selected;
		});
		if (selectedGallery) {
			if (!confirm("Are you sure you want to delete this album?")) {
				return;
			}

			selectedGallery.forEach(function(item, index, array) {
				// API call to delete album
				$http.delete(adminUrl + 'deleteGallery/' + item.albumId)
					.then(function(response) {
						if (response.status === 204 && index === array.length - 1) {
							alert("Album deleted successfully!");
							$scope.albumId = 0;
							$scope.getAllGallery();
						}
					})
					.catch(function(error) {
						console.error("Error deleting album", error);
						if (error.status === 404) {
							alert("Album not found with the provided ID.");
						} else {
							alert("An unexpected error occurred. Please try again.");
						}
					});
			});
		}
	};
});

/*************************************** Front Gallery ***************************************************************/
app.controller('FrontGalleryController', function($scope, $http, $timeout) {

	$scope.getAllActiveGallery = [];
	$scope.classList = [
		"col-md-6 mb-4 mb-lg-0",
		"col-sm-6 col-md-3 mb-4 mb-md-0",
		"col-sm-6 col-md-3"
	];


	// Function to fetch all Gallery
	$scope.getAllActiveGallery = function() {
		$http.get(adminUrl + 'getAllActiveGallery')
			.then(function(response) {
				$scope.getAllActiveGallery = response.data;

			}, function(error) {
				console.error('Error fetching gallery:', error);
				alert('Error fetching gallery.');
			});
	}

	$scope.getAllActiveGallery();

	function initGallery(index) {
		var $thumbGalleryDetail = $('#thumbGalleryDetail' + index);
		var $thumbGalleryThumbs = $('#thumbGalleryThumbs' + index);
		var flag = false;
		var duration = 300;

		$thumbGalleryDetail
			.owlCarousel({
				items: 1,
				margin: 10,
				nav: true,
				dots: false,
				loop: false,
				navText: [],
				rtl: $('html[dir="rtl"]').length > 0,
				onRefreshed: function() {
					setTimeout(function() {
						$('.mfp-wrap.wedding-portfolio-gallery1').css('opacity', 1);
					}, 300);
				}
			})
			.on('changed.owl.carousel', function(e) {
				if (!flag) {
					flag = true;
					$thumbGalleryThumbs.trigger('to.owl.carousel', [e.item.index - 1, duration, true]);

					$thumbGalleryThumbs.find('.owl-item').removeClass('active-thumb');
					$thumbGalleryThumbs.find('.owl-item').eq(e.item.index).addClass('active-thumb');

					flag = false;
				}
			});

		$thumbGalleryThumbs
			.owlCarousel({
				margin: 15,
				items: 5,
				nav: false,
				center: false,
				dots: false,
				pagination: false,
				rtl: $('html[dir="rtl"]').length > 0
			})
			.on('click', '.owl-item', function() {
				var itemIndex = $(this).index();
				$thumbGalleryDetail.trigger('to.owl.carousel', [itemIndex, duration, true]);

				$thumbGalleryThumbs.find('.owl-item').removeClass('active-thumb');
				$(this).addClass('active-thumb');
			});

		// Set first thumb as active
		$thumbGalleryThumbs.find('.owl-item').eq(0).addClass('active-thumb');
	}


	$scope.openPopup = function(index) {
		$timeout(function() {
			$('a[href="#ourHistoryLightbox' + index + '"]').magnificPopup({
				type: 'inline',
				fixedContentPos: true,
				fixedBgPos: true,
				overflowY: 'hidden',
				closeBtnInside: true,
				preloader: false,
				midClick: true,
				removalDelay: 300,
				mainClass: 'wedding-portfolio-gallery1',
				callbacks: {
					open: function() {
						initGallery(index);
						const $detail = $('#thumbGalleryDetail' + index);
						/*const $thumbs = $('#thumbGalleryThumbs' + index);

						$detail.owlCarousel({
							items: 1,
							margin: 10,
							nav: true,
							dots: false
						});

						$thumbs.owlCarousel({
							items: 5,
							margin: 10,
							nav: false,
							dots: false
						});
*/
						$(document).on('keydown.galleryNav', function(event) {
							if (event.keyCode === 37) $detail.trigger('prev.owl.carousel');
							if (event.keyCode === 39) $detail.trigger('next.owl.carousel');
						});

						/*setTimeout(() => {
							$thumbs.removeClass('show-thumbs1');
						}, 3000);*/
					},
					close: function() {
						$('#thumbGalleryThumbs' + index).addClass('show-thumbs1');
						$(document).off('keydown.galleryNav');
					}
				}
			}).magnificPopup('open');
		});
	};
});

/*************************************** Admin Important Dates  ***************************************************************/

app.controller('hinduCalendarCtrl', function($scope, $http, $window, $location) {

	/******** Festivals *********/
	$scope.festivalList = [];

	$scope.newFestival = {
		festivalId: 0,
		festivalName: '',
		description: '',
		status: 'y',
		createdBy: 0,
		createdDate: '',
		ipAddress: ''
	};

	$scope.clearFestivalFormData = function() {

		$scope.newFestival = {
			festivalId: 0,
			festivalName: '',
			description: '',
			status: 'y',
			createdBy: 0,
			createdDate: '',
			ipAddress: ''
		};
	}

	// Function to add a festival
	$scope.addFestival = function() {

		if (!$scope.newFestival.festivalName) {
			alert("Festival name cannot be empty");
			return;
		}

		var formData = new FormData();
		formData.append('festivalStr', JSON.stringify($scope.newFestival));

		var link = adminUrl + "addFestival";

		// API call to add festival
		$http.post(link, formData, {
			headers: { 'Content-Type': undefined },
			transformRequest: function(data, headersGetterFunction) { return data; }
		}).then(function(response) {
			if (response.status === 201) {
				alert("Festival added successfully!");
				$scope.clearFestivalFormData();  // Clear form
				$scope.getAllFestivals();
			}
		})
			.catch(function(error) {
				if (response.status === 401) {
					$window.location.href = adminUrl + 'login';
				} else {
					console.error("Error Response:", error);
					alert("An error occurred: " + error.data.message || "Unknown error");
				}
			});
	};

	// Function to update a festival
	$scope.updateFestival = function() {

		if (!$scope.newFestival.festivalId) {
			alert("Festival ID is required");
			return;
		}
		if (!$scope.newFestival.festivalName) {
			alert("Festival name cannot be empty");
			return;
		}

		var formData = new FormData();
		formData.append('festivalStr', JSON.stringify($scope.newFestival));

		var link = adminUrl + "updateFestival?id=" + $scope.newFestival.festivalId;

		// API call to update festival
		$http.post(link, formData, {
			headers: { 'Content-Type': undefined },
			transformRequest: function(data, headersGetterFunction) { return data; }
		})
			.then(function(response) {
				if (response.status === 200) {
					alert("Festival updated successfully!");
					$scope.clearFestivalFormData();
					$scope.getAllFestivals();
				}
			})
			.catch(function(error) {
				console.error("Error updating festival", error);
				if (error.status === 404) {
					alert("Festival not found with the provided ID.");
				} else {
					alert("An unexpected error occurred. Please try again.");
				}
			});
	};

	$scope.GetFestivalById = function(festival) {
		if (!festival.festivalId) {
			alert("Festival ID is required");
			return;
		}

		// API call to fetch festival by ID
		$http.get(adminUrl + 'getFestivalById/' + festival.festivalId)
			.then(function(response) {
				if (response.status === 200) {
					$scope.newFestival = response.data;
				}
			})
			.catch(function(error) {
				console.error("Error fetching festival by ID", error);
				if (error.status === 404) {
					alert("Festival not found with the provided ID.");
				} else {
					alert("An unexpected error occurred. Please try again.");
				}
				$scope.newFestival = null; // Clear the result if there's an error
			});
	}

	// Function to delete a festival
	$scope.deleteFestival = function() {
		var selectedFestival = $scope.festivalList.filter(function(festival) {
			return festival.selected;
		});
		if (selectedFestival) {
			if (!confirm("Are you sure you want to delete this festival?")) {
				return;
			}

			selectedFestival.forEach(function(item, index, array) {
				// API call to delete festival
				$http.delete(adminUrl + 'deleteFestival/' + item.festivalId)
					.then(function(response) {
						if (response.status === 204 && index === array.length - 1) {
							alert("Festival deleted successfully!");
							$scope.festivalId = 0;
							$scope.getAllFestivals();
						}
					})
					.catch(function(error) {
						console.error("Error deleting festival", error);
						if (error.status === 404) {
							alert("Festival not found with the provided ID.");
						} else {
							alert("An unexpected error occurred. Please try again.");
						}
					});
			});

		}
	};

	// Function to fetch all festival
	$scope.getAllFestivals = function() {
		$http.get(adminUrl + 'getAllFestivals')
			.then(function(response) {
				$scope.festivalList = response.data;
				$scope.festivalList.forEach(function(festival) {
					festival.selected = false;
				});
			}, function(error) {
				console.error('Error fetching festival:', error);
				alert('Error fetching festival.');
			});
	};

	$scope.getAllFestivals();

	/******** Samvat *********/
	$scope.samvatList = [];

	$scope.newSamvat = {
		samvatId: 0,
		samvatName: '',
		description: '',
		status: 'y',
		createdBy: 0,
		createdDate: '',
		ipAddress: ''
	};

	$scope.clearSamvatFormData = function() {

		$scope.newSamvat = {
			samvatId: 0,
			samvatName: '',
			description: '',
			status: 'y',
			createdBy: 0,
			createdDate: '',
			ipAddress: ''
		};
	}

	// Function to add a samvat
	$scope.addSamvat = function() {

		if (!$scope.newSamvat.samvatName) {
			alert("Samvat name cannot be empty");
			return;
		}

		var formData = new FormData();
		formData.append('samvatStr', JSON.stringify($scope.newSamvat));

		var link = adminUrl + "addSamvat";

		// API call to add samvat
		$http.post(link, formData, {
			headers: { 'Content-Type': undefined },
			transformRequest: function(data, headersGetterFunction) { return data; }
		}).then(function(response) {
			if (response.status === 201) {
				alert("Samvat added successfully!");
				$scope.clearSamvatFormData();  // Clear form
				$scope.getAllSamvat();
			}
		})
			.catch(function(error) {
				if (response.status === 401) {
					$window.location.href = adminUrl + 'login';
				} else {
					console.error("Error Response:", error);
					alert("An error occurred: " + error.data.message || "Unknown error");
				}
			});
	};

	// Function to update a samvat
	$scope.updateSamvat = function() {

		if (!$scope.newSamvat.samvatId) {
			alert("Samvat ID is required");
			return;
		}
		if (!$scope.newSamvat.samvatName) {
			alert("Samvat name cannot be empty");
			return;
		}

		var formData = new FormData();
		formData.append('samvatStr', JSON.stringify($scope.newSamvat));

		var link = adminUrl + "updateSamvat?id=" + $scope.newSamvat.samvatId;

		// API call to update samvat
		$http.post(link, formData, {
			headers: { 'Content-Type': undefined },
			transformRequest: function(data, headersGetterFunction) { return data; }
		})
			.then(function(response) {
				if (response.status === 200) {
					alert("Samvat updated successfully!");
					$scope.clearSamvatFormData();
					$scope.getAllSamvat();
				}
			})
			.catch(function(error) {
				console.error("Error updating samvat", error);
				if (error.status === 404) {
					alert("Samvat not found with the provided ID.");
				} else {
					alert("An unexpected error occurred. Please try again.");
				}
			});
	};

	$scope.GetSamvatById = function(samvat) {
		if (!samvat.samvatId) {
			alert("Samvat ID is required");
			return;
		}

		// API call to fetch samvat by ID
		$http.get(adminUrl + 'getSamvatById/' + samvat.samvatId)
			.then(function(response) {
				if (response.status === 200) {
					$scope.newSamvat = response.data;
				}
			})
			.catch(function(error) {
				console.error("Error fetching samvat by ID", error);
				if (error.status === 404) {
					alert("Samvat not found with the provided ID.");
				} else {
					alert("An unexpected error occurred. Please try again.");
				}
				$scope.newSamvat = null; // Clear the result if there's an error
			});
	}

	// Function to delete a samvat
	$scope.deleteSamvat = function() {
		var selectedSamvat = $scope.samvatList.filter(function(samvat) {
			return samvat.selected;
		});
		if (selectedSamvat) {
			if (!confirm("Are you sure you want to delete this samvat?")) {
				return;
			}

			selectedSamvat.forEach(function(item, index, array) {
				// API call to delete samvat
				$http.delete(adminUrl + 'deleteSamvat/' + item.samvatId)
					.then(function(response) {
						if (response.status === 204 && index === array.length - 1) {
							alert("Samvat deleted successfully!");
							$scope.samvatId = 0;
							$scope.getAllSamvat();
						}
					})
					.catch(function(error) {
						console.error("Error deleting samvat", error);
						if (error.status === 404) {
							alert("Samvat not found with the provided ID.");
						} else {
							alert("An unexpected error occurred. Please try again.");
						}
					});
			});

		}
	};

	// Function to fetch all samvat
	$scope.getAllSamvat = function() {
		$http.get(adminUrl + 'getAllSamvat')
			.then(function(response) {
				$scope.samvatList = response.data;
				$scope.samvatList.forEach(function(samvat) {
					samvat.selected = false;
				});
			}, function(error) {
				console.error('Error fetching samvat:', error);
				alert('Error fetching samvat.');
			});
	};

	$scope.getAllSamvat();

	/******** Hindu Paksh *********/
	$scope.hinduPakshList = [];

	$scope.newHinduPaksh = {
		hinduPakshId: 0,
		pakshName: '',
		pakshNameAlias: '',
		description: '',
		status: 'y',
		createdBy: 0,
		createdDate: '',
		ipAddress: ''
	};

	$scope.clearHinduPakshFormData = function() {

		$scope.newHinduPaksh = {
			hinduPakshId: 0,
			pakshName: '',
			pakshNameAlias: '',
			description: '',
			status: 'y',
			createdBy: 0,
			createdDate: '',
			ipAddress: ''
		};
	}

	// Function to add a hindu paksh
	$scope.addHinduPaksh = function() {

		if (!$scope.newHinduPaksh.pakshName) {
			alert("Hindu paksh name cannot be empty");
			return;
		}

		var formData = new FormData();
		formData.append('hinduPakshStr', JSON.stringify($scope.newHinduPaksh));

		var link = adminUrl + "addHinduPaksh";

		// API call to add hindu paksh
		$http.post(link, formData, {
			headers: { 'Content-Type': undefined },
			transformRequest: function(data, headersGetterFunction) { return data; }
		}).then(function(response) {
			if (response.status === 201) {
				alert("Hindu paksh added successfully!");
				$scope.clearHinduPakshFormData();  // Clear form
				$scope.getAllHinduPaksh();
			}
		})
			.catch(function(error) {
				if (response.status === 401) {
					$window.location.href = adminUrl + 'login';
				} else {
					console.error("Error Response:", error);
					alert("An error occurred: " + error.data.message || "Unknown error");
				}
			});
	};

	// Function to update a hindu paksh
	$scope.updateHinduPaksh = function() {

		if (!$scope.newHinduPaksh.hinduPakshId) {
			alert("Hindu paksh ID is required");
			return;
		}
		if (!$scope.newHinduPaksh.pakshName) {
			alert("Paksh name cannot be empty");
			return;
		}

		var formData = new FormData();
		formData.append('hinduPakshStr', JSON.stringify($scope.newHinduPaksh));

		var link = adminUrl + "updateHinduPaksh?id=" + $scope.newHinduPaksh.hinduPakshId;

		// API call to update hindu paksh
		$http.post(link, formData, {
			headers: { 'Content-Type': undefined },
			transformRequest: function(data, headersGetterFunction) { return data; }
		})
			.then(function(response) {
				if (response.status === 200) {
					alert("Hindu paksh updated successfully!");
					$scope.clearHinduPakshFormData();
					$scope.getAllHinduPaksh();
				}
			})
			.catch(function(error) {
				console.error("Error updating hindu paksh", error);
				if (error.status === 404) {
					alert("Hindu paksh not found with the provided ID.");
				} else {
					alert("An unexpected error occurred. Please try again.");
				}
			});
	};

	$scope.GetHinduPakshById = function(hinduPaksh) {
		if (!hinduPaksh.hinduPakshId) {
			alert("Hindu paksh ID is required");
			return;
		}

		// API call to fetch hindu paksh by ID
		$http.get(adminUrl + 'getHinduPakshById/' + hinduPaksh.hinduPakshId)
			.then(function(response) {
				if (response.status === 200) {
					$scope.newHinduPaksh = response.data;
				}
			})
			.catch(function(error) {
				console.error("Error fetching hindu paksh by ID", error);
				if (error.status === 404) {
					alert("Hindu paksh not found with the provided ID.");
				} else {
					alert("An unexpected error occurred. Please try again.");
				}
				$scope.newHinduPaksh = null; // Clear the result if there's an error
			});
	}

	// Function to delete a hindu paksh
	$scope.deleteHinduPaksh = function() {
		var selectedHinduPaksh = $scope.hinduPakshList.filter(function(hinduPaksh) {
			return hinduPaksh.selected;
		});
		if (selectedHinduPaksh) {
			if (!confirm("Are you sure you want to delete this hindu paksh?")) {
				return;
			}

			selectedHinduPaksh.forEach(function(item, index, array) {
				// API call to delete hindu paksh
				$http.delete(adminUrl + 'deleteHinduPaksh/' + item.hinduPakshId)
					.then(function(response) {
						if (response.status === 204 && index === array.length - 1) {
							alert("Hindu paksh deleted successfully!");
							$scope.hinduPakshId = 0;
							$scope.getAllHinduPaksh();
						}
					})
					.catch(function(error) {
						console.error("Error deleting hindu paksh", error);
						if (error.status === 404) {
							alert("Hindu paksh not found with the provided ID.");
						} else {
							alert("An unexpected error occurred. Please try again.");
						}
					});
			});

		}
	};

	// Function to fetch all hindu paksh
	$scope.getAllHinduPaksh = function() {
		$http.get(adminUrl + 'getAllHinduPaksh')
			.then(function(response) {
				$scope.hinduPakshList = response.data;
				$scope.hinduPakshList.forEach(function(hinduPaksh) {
					hinduPaksh.selected = false;
				});
			}, function(error) {
				console.error('Error fetching hindu paksh:', error);
				alert('Error fetching hindu paksh.');
			});
	};

	$scope.getAllHinduPaksh();

	/******** Hindu Year *********/
	$scope.hinduYearList = [];

	$scope.newHinduYear = {
		hinduYearId: 0,
		hinduYear: '',
		description: '',
		status: 'y',
		createdBy: 0,
		createdDate: '',
		ipAddress: ''
	};

	$scope.clearHinduYearFormData = function() {

		$scope.newHinduYear = {
			hinduYearId: 0,
			hinduYear: '',
			description: '',
			status: 'y',
			createdBy: 0,
			createdDate: '',
			ipAddress: ''
		};
	}

	// Function to add a hindu year
	$scope.addHinduYear = function() {

		if (!$scope.newHinduYear.hinduYear) {
			alert("Hindu Year name cannot be empty");
			return;
		}

		var formData = new FormData();
		formData.append('hinduYearStr', JSON.stringify($scope.newHinduYear));

		var link = adminUrl + "addHinduYear";

		// API call to add hindu year
		$http.post(link, formData, {
			headers: { 'Content-Type': undefined },
			transformRequest: function(data, headersGetterFunction) { return data; }
		}).then(function(response) {
			if (response.status === 201) {
				alert("Hindu year added successfully!");
				$scope.clearHinduYearFormData();  // Clear form
				$scope.getAllHinduYear();
			}
		})
			.catch(function(error) {
				if (response.status === 401) {
					$window.location.href = adminUrl + 'login';
				} else {
					console.error("Error Response:", error);
					alert("An error occurred: " + error.data.message || "Unknown error");
				}
			});
	};

	// Function to update a hindu year
	$scope.updateHinduYear = function() {

		if (!$scope.newHinduYear.hinduYearId) {
			alert("Hindu year ID is required");
			return;
		}
		if (!$scope.newHinduYear.hinduYear) {
			alert("Hindu Year cannot be empty");
			return;
		}

		var formData = new FormData();
		formData.append('hinduYearStr', JSON.stringify($scope.newHinduYear));

		var link = adminUrl + "updateHinduYear?id=" + $scope.newHinduYear.hinduYearId;

		// API call to update hindu year
		$http.post(link, formData, {
			headers: { 'Content-Type': undefined },
			transformRequest: function(data, headersGetterFunction) { return data; }
		})
			.then(function(response) {
				if (response.status === 200) {
					alert("Hindu year updated successfully!");
					$scope.clearHinduYearFormData();
					$scope.getAllHinduYear();
				}
			})
			.catch(function(error) {
				console.error("Error updating hindu year", error);
				if (error.status === 404) {
					alert("Hindu year not found with the provided ID.");
				} else {
					alert("An unexpected error occurred. Please try again.");
				}
			});
	};

	$scope.GetHinduYearById = function(hinduYear) {
		if (!hinduYear.hinduYearId) {
			alert("Hindu year ID is required");
			return;
		}

		// API call to fetch hindu year by ID
		$http.get(adminUrl + 'getHinduYearById/' + hinduYear.hinduYearId)
			.then(function(response) {
				if (response.status === 200) {
					$scope.newHinduYear = response.data;
				}
			})
			.catch(function(error) {
				console.error("Error fetching hindu year by ID", error);
				if (error.status === 404) {
					alert("Hindu year not found with the provided ID.");
				} else {
					alert("An unexpected error occurred. Please try again.");
				}
				$scope.newHinduYear = null; // Clear the result if there's an error
			});
	}

	// Function to delete a hindu year
	$scope.deleteHinduYear = function() {
		var selectedHinduYear = $scope.hinduYearList.filter(function(hinduYear) {
			return hinduYear.selected;
		});
		if (selectedHinduYear) {
			if (!confirm("Are you sure you want to delete this hindu year?")) {
				return;
			}

			selectedHinduYear.forEach(function(item, index, array) {
				// API call to delete hindu year
				$http.delete(adminUrl + 'deleteHinduYear/' + item.hinduYearId)
					.then(function(response) {
						if (response.status === 204 && index === array.length - 1) {
							alert("Hindu year deleted successfully!");
							$scope.hinduYearId = 0;
							$scope.getAllHinduYear();
						}
					})
					.catch(function(error) {
						console.error("Error deleting hindu year", error);
						if (error.status === 404) {
							alert("Hindu year not found with the provided ID.");
						} else {
							alert("An unexpected error occurred. Please try again.");
						}
					});
			});

		}
	};

	// Function to fetch all hindu year
	$scope.getAllHinduYear = function() {
		$http.get(adminUrl + 'getAllHinduYear')
			.then(function(response) {
				$scope.hinduYearList = response.data;
				$scope.hinduYearList.forEach(function(hinduYear) {
					hinduYear.selected = false;
				});
			}, function(error) {
				console.error('Error fetching hindu year:', error);
				alert('Error fetching hindu year.');
			});
	};

	$scope.getAllHinduYear();

	/******** Hindu Month *********/
	$scope.hinduMonthList = [];

	$scope.newHinduMonth = {
		hinduMonthId: 0,
		hinduMonthName: '',
		hinduMonthNameAlias: '',
		description: '',
		status: 'y',
		createdBy: 0,
		createdDate: '',
		ipAddress: ''
	};

	$scope.clearHinduMonthFormData = function() {

		$scope.newHinduMonth = {
			hinduMonthId: 0,
			hinduMonthName: '',
			hinduMonthNameAlias: '',
			description: '',
			status: 'y',
			createdBy: 0,
			createdDate: '',
			ipAddress: ''
		};
	}

	// Function to add a hindu month
	$scope.addHinduMonth = function() {

		if (!$scope.newHinduMonth.hinduMonthName) {
			alert("Hindu month name cannot be empty");
			return;
		}

		var formData = new FormData();
		formData.append('hinduMonthStr', JSON.stringify($scope.newHinduMonth));

		var link = adminUrl + "addHinduMonth";

		// API call to add hindu month
		$http.post(link, formData, {
			headers: { 'Content-Type': undefined },
			transformRequest: function(data, headersGetterFunction) { return data; }
		}).then(function(response) {
			if (response.status === 201) {
				alert("Hindu month added successfully!");
				$scope.clearHinduMonthFormData();  // Clear form
				$scope.getAllHinduMonth();
			}
		})
			.catch(function(error) {
				if (response.status === 401) {
					$window.location.href = adminUrl + 'login';
				} else {
					console.error("Error Response:", error);
					alert("An error occurred: " + error.data.message || "Unknown error");
				}
			});
	};

	// Function to update a hindu month
	$scope.updateHinduMonth = function() {

		if (!$scope.newHinduMonth.hinduMonthId) {
			alert("Hindu month ID is required");
			return;
		}
		if (!$scope.newHinduMonth.hinduMonthName) {
			alert("Hindu month cannot be empty");
			return;
		}

		var formData = new FormData();
		formData.append('hinduMonthStr', JSON.stringify($scope.newHinduMonth));

		var link = adminUrl + "updateHinduMonth?id=" + $scope.newHinduMonth.hinduMonthId;

		// API call to update hindu month
		$http.post(link, formData, {
			headers: { 'Content-Type': undefined },
			transformRequest: function(data, headersGetterFunction) { return data; }
		})
			.then(function(response) {
				if (response.status === 200) {
					alert("Hindu month updated successfully!");
					$scope.clearHinduMonthFormData();
					$scope.getAllHinduMonth();
				}
			})
			.catch(function(error) {
				console.error("Error updating hindu month", error);
				if (error.status === 404) {
					alert("Hindu month not found with the provided ID.");
				} else {
					alert("An unexpected error occurred. Please try again.");
				}
			});
	};

	$scope.GetHinduMonthById = function(hinduMonth) {
		if (!hinduMonth.hinduMonthId) {
			alert("Hindu month ID is required");
			return;
		}

		// API call to fetch hindu month by ID
		$http.get(adminUrl + 'getHinduMonthById/' + hinduMonth.hinduMonthId)
			.then(function(response) {
				if (response.status === 200) {
					$scope.newHinduMonth = response.data;
				}
			})
			.catch(function(error) {
				console.error("Error fetching hindu month by ID", error);
				if (error.status === 404) {
					alert("Hindu month not found with the provided ID.");
				} else {
					alert("An unexpected error occurred. Please try again.");
				}
				$scope.newHinduMonth = null; // Clear the result if there's an error
			});
	}

	// Function to delete a hindu month
	$scope.deleteHinduMonth = function() {
		var selectedHinduMonth = $scope.hinduMonthList.filter(function(hinduMonth) {
			return hinduMonth.selected;
		});
		if (selectedHinduMonth) {
			if (!confirm("Are you sure you want to delete this hindu month?")) {
				return;
			}

			selectedHinduMonth.forEach(function(item, index, array) {
				// API call to delete hindu month
				$http.delete(adminUrl + 'deleteHinduMonth/' + item.hinduMonthId)
					.then(function(response) {
						if (response.status === 204 && index === array.length - 1) {
							alert("Hindu month deleted successfully!");
							$scope.hinduMonthId = 0;
							$scope.getAllHinduMonth();
						}
					})
					.catch(function(error) {
						console.error("Error deleting hindu month", error);
						if (error.status === 404) {
							alert("Hindu month not found with the provided ID.");
						} else {
							alert("An unexpected error occurred. Please try again.");
						}
					});
			});

		}
	};

	// Function to fetch all hindu month
	$scope.getAllHinduMonth = function() {
		$http.get(adminUrl + 'getAllHinduMonth')
			.then(function(response) {
				$scope.hinduMonthList = response.data;
				$scope.hinduMonthList.forEach(function(hinduMonth) {
					hinduMonth.selected = false;
				});
			}, function(error) {
				console.error('Error fetching hindu month:', error);
				alert('Error fetching hindu month.');
			});
	};

	$scope.getAllHinduMonth();

	/******** Hindu Tithi *********/
	$scope.hinduTithiList = [];

	$scope.newHinduTithi = {
		hinduTithiId: 0,
		tithiName: '',
		tithiNameAlias: '',
		description: '',
		status: 'y',
		createdBy: 0,
		createdDate: '',
		ipAddress: ''
	};

	$scope.clearHinduTithiFormData = function() {

		$scope.newHinduTithi = {
			hinduTithiId: 0,
			tithiName: '',
			tithiNameAlias: '',
			description: '',
			status: 'y',
			createdBy: 0,
			createdDate: '',
			ipAddress: ''
		};
	}

	// Function to add a hindu tithi
	$scope.addHinduTithi = function() {

		if (!$scope.newHinduTithi.tithiName) {
			alert("Hindu tithi name cannot be empty");
			return;
		}

		var formData = new FormData();
		formData.append('hinduTithiStr', JSON.stringify($scope.newHinduTithi));

		var link = adminUrl + "addHinduTithi";

		// API call to add hindu tithi
		$http.post(link, formData, {
			headers: { 'Content-Type': undefined },
			transformRequest: function(data, headersGetterFunction) { return data; }
		}).then(function(response) {
			if (response.status === 201) {
				alert("Hindu tithi added successfully!");
				$scope.clearHinduTithiFormData();  // Clear form
				$scope.getAllHinduTithi();
			}
		})
			.catch(function(error) {
				if (response.status === 401) {
					$window.location.href = adminUrl + 'login';
				} else {
					console.error("Error Response:", error);
					alert("An error occurred: " + error.data.message || "Unknown error");
				}
			});
	};

	// Function to update a hindu tithi
	$scope.updateHinduTithi = function() {

		if (!$scope.newHinduTithi.hinduTithiId) {
			alert("Hindu tithi ID is required");
			return;
		}
		if (!$scope.newHinduTithi.tithiName) {
			alert("Hindu tithi cannot be empty");
			return;
		}

		var formData = new FormData();
		formData.append('hinduTithiStr', JSON.stringify($scope.newHinduTithi));

		var link = adminUrl + "updateHinduTithi?id=" + $scope.newHinduTithi.hinduTithiId;

		// API call to update hindu tithi
		$http.post(link, formData, {
			headers: { 'Content-Type': undefined },
			transformRequest: function(data, headersGetterFunction) { return data; }
		})
			.then(function(response) {
				if (response.status === 200) {
					alert("Hindu tithi updated successfully!");
					$scope.clearHinduTithiFormData();
					$scope.getAllHinduTithi();
				}
			})
			.catch(function(error) {
				console.error("Error updating hindu tithi", error);
				if (error.status === 404) {
					alert("Hindu tithi not found with the provided ID.");
				} else {
					alert("An unexpected error occurred. Please try again.");
				}
			});
	};

	$scope.GetHinduTithiById = function(hinduTithi) {
		if (!hinduTithi.hinduTithiId) {
			alert("Hindu tithi ID is required");
			return;
		}

		// API call to fetch hindu tithi by ID
		$http.get(adminUrl + 'getHinduTithiById/' + hinduTithi.hinduTithiId)
			.then(function(response) {
				if (response.status === 200) {
					$scope.newHinduTithi = response.data;
				}
			})
			.catch(function(error) {
				console.error("Error fetching hindu tithi by ID", error);
				if (error.status === 404) {
					alert("Hindu tithi not found with the provided ID.");
				} else {
					alert("An unexpected error occurred. Please try again.");
				}
				$scope.newHinduTithi = null; // Clear the result if there's an error
			});
	}

	// Function to delete a hindu tithi
	$scope.deleteHinduTithi = function() {
		var selectedHinduTithi = $scope.hinduTithiList.filter(function(hinduTithi) {
			return hinduTithi.selected;
		});
		if (selectedHinduTithi) {
			if (!confirm("Are you sure you want to delete this hindu tithi?")) {
				return;
			}

			selectedHinduTithi.forEach(function(item, index, array) {
				// API call to delete hindu tithi
				$http.delete(adminUrl + 'deleteHinduTithi/' + item.hinduTithiId)
					.then(function(response) {
						if (response.status === 204 && index === array.length - 1) {
							alert("Hindu tithi deleted successfully!");
							$scope.hinduTithiId = 0;
							$scope.getAllHinduTithi();
						}
					})
					.catch(function(error) {
						console.error("Error deleting hindu tithi", error);
						if (error.status === 404) {
							alert("Hindu tithi not found with the provided ID.");
						} else {
							alert("An unexpected error occurred. Please try again.");
						}
					});
			});

		}
	};

	// Function to fetch all hindu tithi
	$scope.getAllHinduTithi = function() {
		$http.get(adminUrl + 'getAllHinduTithi')
			.then(function(response) {
				$scope.hinduTithiList = response.data;
				$scope.hinduTithiList.forEach(function(hinduTithi) {
					hinduTithi.selected = false;
				});
			}, function(error) {
				console.error('Error fetching hindu tithi:', error);
				alert('Error fetching hindu tithi.');
			});
	};

	$scope.getAllHinduTithi();

	/******** Hindu Month Type *********/
	$scope.hinduMonthTypeList = [];

	$scope.newHinduMonthType = {
		hinduMonthTypeId: 0,
		hinduMonthType: '',
		description: '',
		status: 'y',
		createdBy: 0,
		createdDate: '',
		ipAddress: ''
	};

	$scope.clearHinduMonthTypeFormData = function() {

		$scope.newHinduMonthType = {
			hinduMonthTypeId: 0,
			hinduMonthType: '',
			description: '',
			status: 'y',
			createdBy: 0,
			createdDate: '',
			ipAddress: ''
		};
	}

	// Function to add a hindu month type
	$scope.addHinduMonthType = function() {

		if (!$scope.newHinduMonthType.hinduMonthType) {
			alert("Hindu month type name cannot be empty");
			return;
		}

		var formData = new FormData();
		formData.append('hinduMonthTypeStr', JSON.stringify($scope.newHinduMonthType));

		var link = adminUrl + "addHinduMonthType";

		// API call to add hindu month type
		$http.post(link, formData, {
			headers: { 'Content-Type': undefined },
			transformRequest: function(data, headersGetterFunction) { return data; }
		}).then(function(response) {
			if (response.status === 201) {
				alert("Hindu month type added successfully!");
				$scope.clearHinduMonthTypeFormData();  // Clear form
				$scope.getAllHinduMonthType();
			}
		})
			.catch(function(error) {
				if (response.status === 401) {
					$window.location.href = adminUrl + 'login';
				} else {
					console.error("Error Response:", error);
					alert("An error occurred: " + error.data.message || "Unknown error");
				}
			});
	};

	// Function to update a hindu month type
	$scope.updateHinduMonthType = function() {

		if (!$scope.newHinduMonthType.hinduMonthTypeId) {
			alert("Hindu month type ID is required");
			return;
		}
		if (!$scope.newHinduMonthType.hinduMonthType) {
			alert("Hindu month type cannot be empty");
			return;
		}

		var formData = new FormData();
		formData.append('hinduMonthTypeStr', JSON.stringify($scope.newHinduMonthType));

		var link = adminUrl + "updateHinduMonthType?id=" + $scope.newHinduMonthType.hinduMonthTypeId;

		// API call to update hindu month type
		$http.post(link, formData, {
			headers: { 'Content-Type': undefined },
			transformRequest: function(data, headersGetterFunction) { return data; }
		})
			.then(function(response) {
				if (response.status === 200) {
					alert("Hindu month type updated successfully!");
					$scope.clearHinduMonthTypeFormData();
					$scope.getAllHinduMonthType();
				}
			})
			.catch(function(error) {
				console.error("Error updating hindu month type", error);
				if (error.status === 404) {
					alert("Hindu month type not found with the provided ID.");
				} else {
					alert("An unexpected error occurred. Please try again.");
				}
			});
	};

	$scope.GetHinduMonthTypeById = function(hinduMonthType) {
		if (!hinduMonthType.hinduMonthTypeId) {
			alert("Hindu month type ID is required");
			return;
		}

		// API call to fetch hindu month type by ID
		$http.get(adminUrl + 'getHinduMonthTypeById/' + hinduMonthType.hinduMonthTypeId)
			.then(function(response) {
				if (response.status === 200) {
					$scope.newHinduMonthType = response.data;
				}
			})
			.catch(function(error) {
				console.error("Error fetching hindu month type by ID", error);
				if (error.status === 404) {
					alert("Hindu month type not found with the provided ID.");
				} else {
					alert("An unexpected error occurred. Please try again.");
				}
				$scope.newHinduMonthType = null; // Clear the result if there's an error
			});
	}

	// Function to delete a hindu month type
	$scope.deleteHinduMonthType = function() {
		var selectedHinduMonthType = $scope.hinduMonthTypeList.filter(function(hinduMonthType) {
			return hinduMonthType.selected;
		});
		if (selectedHinduMonthType) {
			if (!confirm("Are you sure you want to delete this hindu month type?")) {
				return;
			}

			selectedHinduMonthType.forEach(function(item, index, array) {
				// API call to delete hindu month type
				$http.delete(adminUrl + 'deleteHinduMonthType/' + item.hinduMonthTypeId)
					.then(function(response) {
						if (response.status === 204 && index === array.length - 1) {
							alert("Hindu month type deleted successfully!");
							$scope.hinduMonthTypeId = 0;
							$scope.getAllHinduMonthType();
						}
					})
					.catch(function(error) {
						console.error("Error deleting hindu month type", error);
						if (error.status === 404) {
							alert("Hindu month type not found with the provided ID.");
						} else {
							alert("An unexpected error occurred. Please try again.");
						}
					});
			});

		}
	};

	// Function to fetch all hindu month type
	$scope.getAllHinduMonthType = function() {
		$http.get(adminUrl + 'getAllHinduMonthType')
			.then(function(response) {
				$scope.hinduMonthTypeList = response.data;
				$scope.hinduMonthTypeList.forEach(function(hinduMonthType) {
					hinduMonthType.selected = false;
				});
			}, function(error) {
				console.error('Error fetching hindu month type:', error);
				alert('Error fetching hindu month type.');
			});
	};

	$scope.getAllHinduMonthType();
});

/******************************************* Manage Important Dates ***********************************/

app.controller('AdminManageImpDatesController', function($scope, $http, $window) {

	$scope.openCollapse = function() {
		$("#collapseCardImpDates").collapse('show');
	};

	// Function to navigate back to the previous page
	$scope.backImpDateData = function() {
		$window.history.back(); // This will navigate to the previous page in history
	};

	$scope.editImpDate = function(date) {
		$scope.dates = angular.copy(date);
		// scroll to top
		window.scrollTo({ top: 0, behavior: 'smooth' });
	};

	$scope.dateList = [];

	$scope.date = {
		importantDateId: 0,
		festivalId: '',
		englishDate: '',
		englishDay: '',
		samvatId: '',
		hinduYearId: '',
		hinduMonthId: '',
		hinduPakshId: '',
		tithiNumber: '',
		hinduTithiId: '',
		hinduMonthTypeId: '',
		impDateDescription: '',
		status: 'y',
		createdBy: 0,
		createdDate: '',
		ipAddress: ''
	};

	$scope.clearImpDateData = function() {

		$scope.date = {
			importantDateId: 0,
			festivalId: '',
			englishDate: '',
			englishDay: '',
			samvatId: '',
			hinduYearId: '',
			hinduMonthId: '',
			hinduPakshId: '',
			tithiNumber: '',
			hinduTithiId: '',
			hinduMonthTypeId: '',
			impDateDescription: '',
			status: 'y',
			createdBy: 0,
			createdDate: '',
			ipAddress: ''
		};

		CKEDITOR.instances.impDateDescription.setData($scope.date.impDateDescription);
	}

	$scope.updateDay = function() {
		if ($scope.date.englishDate) {
			var date = new Date($scope.date.englishDate);

			if (!isNaN(date.getTime())) {
				// Convert to DD/MM/YYYY format
				var day = String(date.getDate()).padStart(2, '0'); // Ensure two digits
				var month = String(date.getMonth() + 1).padStart(2, '0'); // Ensure two digits
				var year = date.getFullYear();

				$scope.date.englishDate = `${day}/${month}/${year}`; // Correctly formatted date
				$scope.date.englishDay = date.toLocaleDateString('en-US', { weekday: 'long' });
			} else {
				$scope.date.englishDay = "Invalid Date";
			}
		} else {
			$scope.date.englishDay = "";
		}
	};

	// Add new date to the list
	$scope.addAllImpDate = function() {
		var impDateDescription = CKEDITOR.instances.impDateDescription.getData();
		var s = encodeURIComponent(impDateDescription);

		if (!$scope.date.festivalId) {
			alert("Festival cannot be empty");
			return;
		}
		if (!$scope.date.englishDate) {
			alert("Date cannot be empty");
			return;
		}
		if (!$scope.date.samvatId) {
			alert("Samvat cannot be empty");
			return;
		}
		if (!$scope.date.hinduYearId) {
			alert("Hindu Year cannot be empty");
			return;
		}
		if (!$scope.date.hinduMonthId) {
			alert("Hindu Month cannot be empty");
			return;
		}
		if (!$scope.date.hinduPakshId) {
			alert("Hindu paksh cannot be empty");
			return;
		}
		if (!$scope.date.tithiNumber) {
			alert("Tithi number cannot be empty");
			return;
		}
		if (!$scope.date.hinduTithiId) {
			alert("Hindu tithi cannot be empty");
			return;
		}
		if (!$scope.date.hinduMonthTypeId) {
			alert("Hindu month type cannot be empty");
			return;
		}

		if (impDateDescription) {
			$scope.date.impDateDescription = impDateDescription;
		}

		var formData = new FormData();
		formData.append('importantDatesStr', JSON.stringify($scope.date));

		var link = adminUrl + "addImportantDates";

		// API call to add date
		$http.post(link, formData, {
			headers: { 'Content-Type': undefined },
			transformRequest: function(data, headersGetterFunction) { return data; }
		}).then(function(response) {
			if (response.status === 201) {
				alert("Important date added successfully!");
				$scope.clearImpDateData();
				$scope.getAllImportantDates();
			}
		})
			.catch(function(error) {
				if (response.status === 401) {
					$window.location.href = adminUrl + 'login';
				} else {
					console.error("Error Response:", error);
					alert("An error occurred: " + error.data.message || "Unknown error");
				}
			});
	};


	// Function to update a date
	$scope.updateImpDate = function() {
		var impDateDescription = CKEDITOR.instances.impDateDescription.getData();
		var s = encodeURIComponent(impDateDescription);

		if (!$scope.date.festivalId) {
			alert("Festival cannot be empty");
			return;
		}
		if (!$scope.date.englishDate) {
			alert("Date cannot be empty");
			return;
		}
		if (!$scope.date.samvatId) {
			alert("Samvat cannot be empty");
			return;
		}
		if (!$scope.date.hinduYearId) {
			alert("Hindu Year cannot be empty");
			return;
		}
		if (!$scope.date.hinduMonthId) {
			alert("Hindu Month cannot be empty");
			return;
		}
		if (!$scope.date.hinduPakshId) {
			alert("Hindu paksh cannot be empty");
			return;
		}
		if (!$scope.date.tithiNumber) {
			alert("Tithi number cannot be empty");
			return;
		}
		if (!$scope.date.hinduTithiId) {
			alert("Hindu tithi cannot be empty");
			return;
		}
		if (!$scope.date.hinduMonthTypeId) {
			alert("Hindu month type cannot be empty");
			return;
		}

		if (impDateDescription) {
			$scope.date.impDateDescription = impDateDescription;
		}

		$scope.updateDay();
		var formData = new FormData();
		formData.append('importantDatesStr', JSON.stringify($scope.date));

		var link = adminUrl + "updateImportantDates?id=" + $scope.date.importantDateId;

		// API call to update date
		$http.post(link, formData, {
			headers: { 'Content-Type': undefined },
			transformRequest: function(data, headersGetterFunction) { return data; }
		})
			.then(function(response) {
				if (response.status === 200) {
					alert("Important date updated successfully!");
					$scope.clearImpDateData();
					$scope.getAllImportantDates();
				}
			})
			.catch(function(error) {
				console.error("Error updating important date", error);
				if (error.status === 404) {
					alert("Important Date not found with the provided ID.");
				} else {
					alert("An unexpected error occurred. Please try again.");
				}
			});
	};

	$scope.convertToDate = function(dateStr) {
		var parts = dateStr.split("/"); // Split "30/03/2025" into ["30", "03", "2025"]
		return new Date(parts[2], parts[1] - 1, parts[0]); // (YYYY, MM-1, DD)
	}

	$scope.GetImportantDateById = function(date) {
		if (!date.importantDateId) {
			alert("Important date Id is required");
			return;
		}

		// API call to fetch date by ID
		$http.get(adminUrl + 'getImportantDateById/' + date.importantDateId)
			.then(function(response) {
				if (response.status === 200) {
					var date = $scope.convertToDate(response.data.englishDate);
					$scope.date = response.data;
					$scope.isDateActive = $scope.date.status === 'y' ? true : false;
					$scope.date.englishDate = date;
					CKEDITOR.instances.impDateDescription.setData($scope.date.impDateDescription);
				}
			})
			.catch(function(error) {
				console.error("Error fetching important date by ID", error);
				if (error.status === 404) {
					alert("Important date not found with the provided ID.");
				} else {
					alert("An unexpected error occurred. Please try again.");
				}
				$scope.date = null; // Clear the result if there's an error
			});
	}

	// Function to delete a date
	$scope.deleteImpDates = function() {
		var selectedImpDates = $scope.dateList.filter(function(date) {
			return date.selected;
		});
		if (selectedImpDates) {
			if (!confirm("Are you sure you want to delete this important dates?")) {
				return;
			}

			selectedImpDates.forEach(function(item, index, array) {
				// API call to delete date 
				$http.delete(adminUrl + 'deleteImportantDates/' + item.importantDateId)
					.then(function(response) {
						if (response.status === 204 && index === array.length - 1) {
							alert("Important date deleted successfully!");
							$scope.importantDateId = 0;
							$scope.getAllImportantDates();
						}
					})
					.catch(function(error) {
						console.error("Error deleting important date", error);
						if (error.status === 404) {
							alert("Important date not found with the provided ID.");
						} else {
							alert("An unexpected error occurred. Please try again.");
						}
					});
			});
		}
	};

	// Function to fetch all date
	$scope.getAllImportantDates = function() {
		$http.get(adminUrl + 'getAllImportantDates')
			.then(function(response) {
				$scope.dateList = response.data;
				$scope.dateList.forEach(function(date) {
					//date.selected = false;
					if (date.englishDate) {
						var date = new Date(date.englishDate);
						if (!isNaN(date.getTime())) {
							var day = String(date.getDate()).padStart(2, '0');
							var month = String(date.getMonth() + 1).padStart(2, '0');
							var year = date.getFullYear();
							date.englishDate = `${day}/${month}/${year}`; // Ensure DD/MM/YYYY format
						}
					}
				});
			}).catch(function(error) {
				console.error("Error fetching important date", error);
			});
	};

	$scope.getAllImportantDates();

	// Function to fetch all Festivals
	$scope.getAllActiveFestivals = function() {
		$http.get(adminUrl + 'getAllActiveFestivals')
			.then(function(response) {
				$scope.festivalList = response.data;
				$scope.festivalList.forEach(function(festival) {
					festival.selected = false;
				});
			}, function(error) {
				console.error('Error fetching festival:', error);
				alert('Error fetching festival.');
			});
	}

	$scope.getAllActiveFestivals();

	// Function to fetch all Samvat
	$scope.getAllActiveSamvat = function() {
		$http.get(adminUrl + 'getAllActiveSamvat')
			.then(function(response) {
				$scope.samvatList = response.data;
				$scope.samvatList.forEach(function(samvat) {
					samvat.selected = false;
				});
			}, function(error) {
				console.error('Error fetching samvat:', error);
				alert('Error fetching samvat.');
			});
	}

	$scope.getAllActiveSamvat();

	// Fetch all hindu paksh
	$scope.getAllActiveHinduPaksh = function() {
		$http.get(adminUrl + 'getAllActiveHinduPaksh')
			.then(function(response) {
				$scope.hinduPakshList = response.data;
				$scope.hinduPakshList.forEach(function(hinduPaksh) {
					hinduPaksh.selected = false;
				});
			}, function(error) {
				console.error("Error fetching hindu paksh", error);
				alert('Error fetching hindu paksh.');
			});
	};

	$scope.getAllActiveHinduPaksh();

	// Function to fetch all hindu year
	$scope.getAllActiveHinduYear = function() {
		$http.get(adminUrl + 'getAllActiveHinduYear')
			.then(function(response) {
				$scope.hinduYearList = response.data;
				$scope.hinduYearList.forEach(function(hinduYear) {
					hinduYear.selected = false;
				});
			}, function(error) {
				console.error('Error fetching hindu year:', error);
				alert('Error fetching hindu year.');
			});
	};

	$scope.getAllActiveHinduYear();

	// Function to fetch all hindu month
	$scope.getAllActiveHinduMonth = function() {
		$http.get(adminUrl + 'getAllActiveHinduMonth')
			.then(function(response) {
				$scope.hinduMonthList = response.data;
				$scope.hinduMonthList.forEach(function(hinduMonth) {
					hinduMonth.selected = false;
				});
			}, function(error) {
				console.error('Error fetching hindu month:', error);
				alert('Error fetching hindu month.');
			});
	};

	$scope.getAllActiveHinduMonth();

	// Function to fetch all hindu tithi
	$scope.getAllActiveHinduTithi = function() {
		$http.get(adminUrl + 'getAllActiveHinduTithi')
			.then(function(response) {
				$scope.hinduTithiList = response.data;
				$scope.hinduTithiList.forEach(function(hinduTithi) {
					hinduTithi.selected = false;
				});
			}, function(error) {
				console.error('Error fetching hindu tithi:', error);
				alert('Error fetching hindu tithi.');
			});
	};

	$scope.getAllActiveHinduTithi();

	// Function to fetch all hindu month type
	$scope.getAllActiveHinduMonthType = function() {
		$http.get(adminUrl + 'getAllActiveHinduMonthType')
			.then(function(response) {
				$scope.hinduMonthTypeList = response.data;
				$scope.hinduMonthTypeList.forEach(function(hinduMonthType) {
					hinduMonthType.selected = false;
				});
			}, function(error) {
				console.error('Error fetching hindu month type:', error);
				alert('Error fetching hindu month type.');
			});
	};

	$scope.getAllActiveHinduMonthType();

	/*********************************Modal of festival *******************************************************/
	$scope.newFestival = {
		festivalId: 0,
		festivalName: '',
		description: '',
		status: 'y',
		createdBy: 0,
		createdDate: '',
		ipAddress: ''
	};

	$scope.clearFestivalFormData = function() {

		$scope.newFestival = {
			festivalId: 0,
			festivalName: '',
			description: '',
			status: 'y',
			createdBy: 0,
			createdDate: '',
			ipAddress: ''
		};
	}

	// Function to add a festival
	$scope.addFestival = function() {

		if (!$scope.newFestival.festivalName) {
			alert("Festival name cannot be empty");
			return;
		}

		var formData = new FormData();
		formData.append('festivalStr', JSON.stringify($scope.newFestival));

		var link = adminUrl + "addFestival";

		// API call to add festival
		$http.post(link, formData, {
			headers: { 'Content-Type': undefined },
			transformRequest: function(data, headersGetterFunction) { return data; }
		}).then(function(response) {
			if (response.status === 201) {
				alert("Festival added successfully!");
				$scope.festivalCloseModal();
				$scope.getAllFestivals();

			}
		})
			.catch(function(error) {
				if (response.status === 401) {
					$window.location.href = adminUrl + 'login';
				} else {
					console.error("Error Response:", error);
					alert("An error occurred: " + error.data.message || "Unknown error");
				}
			});
	};

	$scope.festivalCloseModal = function() {
		$scope.clearFestivalFormData();
		$('#festivalModal').modal('hide');
	};

	$scope.getAllFestivals = function() {
		$http.get(adminUrl + 'getAllFestivals')
			.then(function(response) {
				$scope.festivalList = response.data;
				$scope.festivalList.forEach(function(festival) {
					festival.selected = false;
				});
			}, function(error) {
				console.error('Error fetching festival:', error);
				alert('Error fetching festival.');
			});
	};

	/*********************************Modal of Samvat *******************************************************/

	$scope.newSamvat = {
		samvatId: 0,
		samvatName: '',
		description: '',
		status: 'y',
		createdBy: 0,
		createdDate: '',
		ipAddress: ''
	};

	$scope.clearSamvatFormData = function() {

		$scope.newSamvat = {
			samvatId: 0,
			samvatName: '',
			description: '',
			status: 'y',
			createdBy: 0,
			createdDate: '',
			ipAddress: ''
		};
	}

	$scope.samvatCloseModal = function() {
		$scope.clearSamvatFormData();
		$('#samvatModal').modal('hide');
	};

	// Function to add a samvat
	$scope.addSamvat = function() {

		if (!$scope.newSamvat.samvatName) {
			alert("Samvat name cannot be empty");
			return;
		}

		var formData = new FormData();
		formData.append('samvatStr', JSON.stringify($scope.newSamvat));

		var link = adminUrl + "addSamvat";

		// API call to add samvat
		$http.post(link, formData, {
			headers: { 'Content-Type': undefined },
			transformRequest: function(data, headersGetterFunction) { return data; }
		}).then(function(response) {
			if (response.status === 201) {
				alert("Samvat added successfully!");
				$scope.samvatCloseModal();  // Clear form
				$scope.getAllSamvat();
			}
		})
			.catch(function(error) {
				if (response.status === 401) {
					$window.location.href = adminUrl + 'login';
				} else {
					console.error("Error Response:", error);
					alert("An error occurred: " + error.data.message || "Unknown error");
				}
			});
	};

	$scope.getAllSamvat = function() {
		$http.get(adminUrl + 'getAllSamvat')
			.then(function(response) {
				$scope.samvatList = response.data;
				$scope.samvatList.forEach(function(samvat) {
					samvat.selected = false;
				});
			}, function(error) {
				console.error('Error fetching samvat:', error);
				alert('Error fetching samvat.');
			});
	};

	/*********************************Modal of hindu year *******************************************************/

	$scope.newHinduYear = {
		hinduYearId: 0,
		hinduYear: '',
		description: '',
		status: 'y',
		createdBy: 0,
		createdDate: '',
		ipAddress: ''
	};

	$scope.clearHinduYearFormData = function() {

		$scope.newHinduYear = {
			hinduYearId: 0,
			hinduYear: '',
			description: '',
			status: 'y',
			createdBy: 0,
			createdDate: '',
			ipAddress: ''
		};
	}

	// Function to add a hindu year
	$scope.addHinduYear = function() {

		if (!$scope.newHinduYear.hinduYear) {
			alert("Hindu Year name cannot be empty");
			return;
		}

		var formData = new FormData();
		formData.append('hinduYearStr', JSON.stringify($scope.newHinduYear));

		var link = adminUrl + "addHinduYear";

		// API call to add hindu year
		$http.post(link, formData, {
			headers: { 'Content-Type': undefined },
			transformRequest: function(data, headersGetterFunction) { return data; }
		}).then(function(response) {
			if (response.status === 201) {
				alert("Hindu year added successfully!");
				$scope.hinduYearCloseModal();  // Clear form
				$scope.getAllHinduYear();
			}
		})
			.catch(function(error) {
				if (response.status === 401) {
					$window.location.href = adminUrl + 'login';
				} else {
					console.error("Error Response:", error);
					alert("An error occurred: " + error.data.message || "Unknown error");
				}
			});
	};

	$scope.hinduYearCloseModal = function() {
		$scope.clearHinduYearFormData();
		$('#hinduYearModal').modal('hide');
	};

	$scope.getAllHinduYear = function() {
		$http.get(adminUrl + 'getAllHinduYear')
			.then(function(response) {
				$scope.hinduYearList = response.data;
				$scope.hinduYearList.forEach(function(hinduYear) {
					hinduYear.selected = false;
				});
			}, function(error) {
				console.error('Error fetching hindu year:', error);
				alert('Error fetching hindu year.');
			});
	};

	/********************************* Modal of hindu month *******************************************************/

	$scope.newHinduMonth = {
		hinduMonthId: 0,
		hinduMonthName: '',
		hinduMonthNameAlias: '',
		description: '',
		status: 'y',
		createdBy: 0,
		createdDate: '',
		ipAddress: ''
	};

	$scope.clearHinduMonthFormData = function() {

		$scope.newHinduMonth = {
			hinduMonthId: 0,
			hinduMonthName: '',
			hinduMonthNameAlias: '',
			description: '',
			status: 'y',
			createdBy: 0,
			createdDate: '',
			ipAddress: ''
		};
	}

	// Function to add a hindu month
	$scope.addHinduMonth = function() {

		if (!$scope.newHinduMonth.hinduMonthName) {
			alert("Hindu month name cannot be empty");
			return;
		}

		var formData = new FormData();
		formData.append('hinduMonthStr', JSON.stringify($scope.newHinduMonth));

		var link = adminUrl + "addHinduMonth";

		// API call to add hindu month
		$http.post(link, formData, {
			headers: { 'Content-Type': undefined },
			transformRequest: function(data, headersGetterFunction) { return data; }
		}).then(function(response) {
			if (response.status === 201) {
				alert("Hindu month added successfully!");
				$scope.hinduMonthcloseModal();  // Clear form
				$scope.getAllHinduMonth();
			}
		})
			.catch(function(error) {
				if (response.status === 401) {
					$window.location.href = adminUrl + 'login';
				} else {
					console.error("Error Response:", error);
					alert("An error occurred: " + error.data.message || "Unknown error");
				}
			});
	};

	$scope.hinduMonthcloseModal = function() {
		$scope.clearHinduMonthFormData();
		$('#hinduYearMonth').modal('hide');
	};

	$scope.getAllHinduMonth = function() {
		$http.get(adminUrl + 'getAllHinduMonth')
			.then(function(response) {
				$scope.hinduMonthList = response.data;
				$scope.hinduMonthList.forEach(function(hinduMonth) {
					hinduMonth.selected = false;
				});
			}, function(error) {
				console.error('Error fetching hindu month:', error);
				alert('Error fetching hindu month.');
			});
	};

	/********************************* Modal of paksh *******************************************************/
	$scope.newHinduPaksh = {
		hinduPakshId: 0,
		pakshName: '',
		pakshNameAlias: '',
		description: '',
		status: 'y',
		createdBy: 0,
		createdDate: '',
		ipAddress: ''
	};

	$scope.clearHinduPakshFormData = function() {

		$scope.newHinduPaksh = {
			hinduPakshId: 0,
			pakshName: '',
			pakshNameAlias: '',
			description: '',
			status: 'y',
			createdBy: 0,
			createdDate: '',
			ipAddress: ''
		};
	}

	// Function to add a hindu paksh
	$scope.addHinduPaksh = function() {

		if (!$scope.newHinduPaksh.pakshName) {
			alert("Hindu paksh name cannot be empty");
			return;
		}

		var formData = new FormData();
		formData.append('hinduPakshStr', JSON.stringify($scope.newHinduPaksh));

		var link = adminUrl + "addHinduPaksh";

		// API call to add hindu paksh
		$http.post(link, formData, {
			headers: { 'Content-Type': undefined },
			transformRequest: function(data, headersGetterFunction) { return data; }
		}).then(function(response) {
			if (response.status === 201) {
				alert("Hindu paksh added successfully!");
				$scope.hinduPakshcloseModal();  // Clear form
				$scope.getAllHinduPaksh();
			}
		})
			.catch(function(error) {
				if (response.status === 401) {
					$window.location.href = adminUrl + 'login';
				} else {
					console.error("Error Response:", error);
					alert("An error occurred: " + error.data.message || "Unknown error");
				}
			});
	};

	$scope.hinduPakshcloseModal = function() {
		$scope.clearHinduPakshFormData();
		$('#hinduYearPaksh').modal('hide');
	};

	$scope.getAllHinduPaksh = function() {
		$http.get(adminUrl + 'getAllHinduPaksh')
			.then(function(response) {
				$scope.hinduPakshList = response.data;
				$scope.hinduPakshList.forEach(function(hinduPaksh) {
					hinduPaksh.selected = false;
				});
			}, function(error) {
				console.error('Error fetching hindu paksh:', error);
				alert('Error fetching hindu paksh.');
			});
	};

	/********************************* Modal of tithi *******************************************************/
	$scope.newHinduTithi = {
		hinduTithiId: 0,
		tithiName: '',
		tithiNameAlias: '',
		description: '',
		status: 'y',
		createdBy: 0,
		createdDate: '',
		ipAddress: ''
	};

	$scope.clearHinduTithiFormData = function() {

		$scope.newHinduTithi = {
			hinduTithiId: 0,
			tithiName: '',
			tithiNameAlias: '',
			description: '',
			status: 'y',
			createdBy: 0,
			createdDate: '',
			ipAddress: ''
		};
	}

	// Function to add a hindu tithi
	$scope.addHinduTithi = function() {

		if (!$scope.newHinduTithi.tithiName) {
			alert("Hindu tithi name cannot be empty");
			return;
		}

		var formData = new FormData();
		formData.append('hinduTithiStr', JSON.stringify($scope.newHinduTithi));

		var link = adminUrl + "addHinduTithi";

		// API call to add hindu tithi
		$http.post(link, formData, {
			headers: { 'Content-Type': undefined },
			transformRequest: function(data, headersGetterFunction) { return data; }
		}).then(function(response) {
			if (response.status === 201) {
				alert("Hindu tithi added successfully!");
				$scope.hinduTithiCloseModal();  // Clear form
				$scope.getAllHinduTithi();
			}
		})
			.catch(function(error) {
				if (response.status === 401) {
					$window.location.href = adminUrl + 'login';
				} else {
					console.error("Error Response:", error);
					alert("An error occurred: " + error.data.message || "Unknown error");
				}
			});
	};

	$scope.hinduTithiCloseModal = function() {
		$scope.clearHinduTithiFormData();
		$('#hinduYearTithi').modal('hide');
	};

	$scope.getAllHinduTithi = function() {
		$http.get(adminUrl + 'getAllHinduTithi')
			.then(function(response) {
				$scope.hinduTithiList = response.data;
				$scope.hinduTithiList.forEach(function(hinduTithi) {
					hinduTithi.selected = false;
				});
			}, function(error) {
				console.error('Error fetching hindu tithi:', error);
				alert('Error fetching hindu tithi.');
			});
	};
});

/*************************************** Front Important Dates  *****************************************/

app.controller('DateController', function($scope, $http) {

	$scope.getAllActiveImportantDates = [];

	// Function to fetch all seva
	$scope.getAllActiveImportantDates = function() {
		$http.get(adminUrl + 'getAllActiveImportantDates')
			.then(function(response) {
				$scope.getAllActiveImportantDates = response.data;
			}, function(error) {
				console.error('Error fetching important date:', error);
				alert('Error fetching important date.');
			});
	}

	$scope.getAllActiveImportantDates();

});

app.controller('impDateController', function($scope, $http) {

	$scope.groupedImportantDates = [];

	// Fetch all active important dates
	$scope.getAllActiveImportantDates = function() {
		$http.get(adminUrl + 'getAllActiveImportantDates')
			.then(function(response) {
				const rawData = response.data;
				const grouped = {};

				// Sort the rawData by date
				rawData.sort(function(a, b) {
					const dateA = new Date(a.date);
					const dateB = new Date(b.date);
					return dateA - dateB;  // Compare dates to sort them in ascending order
				});

				// Group dates by festivalName
				rawData.forEach(function(item) {
					if (!grouped[item.festivalName]) {
						grouped[item.festivalName] = [];
					}
					grouped[item.festivalName].push(item);
				});

				// Store all grouped dates
				$scope.groupedImportantDates = Object.keys(grouped).map(function(festival) {
					return {
						festivalName: festival,
						dates: grouped[festival]  // Keep all dates sorted
					};
				});
			}, function(error) {
				console.error('Error fetching important dates:', error);
				alert('Error fetching important dates.');
			});
	};

	// Fetch on page load
	$scope.getAllActiveImportantDates();
});

/*************************************** Admin sidebar  *****************************************/
app.controller('SidebarController', function($scope, $http, $window, pagePermissionService) {

	$scope.adminMasterPages = [];
	$scope.adminNonMasterPages = [];

	$scope.getPagePermission = function() {
		$http.get(adminUrl + 'GetCurrentUserPagePermission')
			.then(function(response) {
				if (response.status === 204) {
					$window.location.href = adminUrl + 'login';
				} else {
					if (response.status === 200) {
						pagePermissionService.addPermitPages(response.data);
						$scope.adminMasterPages = pagePermissionService.getAdminMasterPages();
						$scope.adminNonMasterPages = pagePermissionService.getAdminNonMasterPages();
					}
				}
			})
			.catch(function(error) {
				console.log("Getting some error " + error);
				$scope.adminMasterPages = [];
				$scope.adminNonMasterPages = [];
			});
	};
});

/***************************************Admin Header  *****************************************/
app.controller('headerCtrl', function($scope, $http, $window, $location) {

	/*	var baseUrl = $location.protocol() + "://" + $location.host() + ":" + $location.port() + "/Kuberbhandari/manageKuberbhandari/";
	*/
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
});
