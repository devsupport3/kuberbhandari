app.factory('commonService', function(toaster,cfpLoadingBar) {
	return {
		//for toaster 
		notify: {
			success: function(title, message) {
				toaster.pop('success', title || 'Success', message || '');
			},
			error: function(title, message) {
				toaster.pop('error', title || 'Error', message || '');
			},
			info: function(title, message) {
				toaster.pop('info', title || 'Info', message || '');
			},
			warning: function(title, message) {
				toaster.pop('warning', title || 'Warning', message || '');
			}
		},

		// Run a promise with loading bar + interaction block
		runWithLoader: function(promiseFn) {
			document.body.classList.add('loading-active');
			cfpLoadingBar.start();

			return promiseFn()
				.finally(() => {
					cfpLoadingBar.complete();
					document.body.classList.remove('loading-active');
				});
		},
		//auto touch  on submit 
		touchAllFields: function(form) {
			angular.forEach(form, function(field) {
				if (field && field.$setTouched && typeof field.$setTouched === 'function') {
					field.$setTouched();
				}
			});
		},
		
	
	};
});
