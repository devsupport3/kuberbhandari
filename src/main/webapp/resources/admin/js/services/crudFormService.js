app.service('crudFormService', function(commonService, $location) {
	return {
		saveEntityWithImage: function(options) {
			// Options destructuring
			const {
				entity,
				isEditMode,
				formRef,
				apiAddFn,
				apiUpdateFn,
				cropperSelector = 'image-cropper',
				onSuccess,
				onError,
				onComplete,
				modalId
			} = options;


			commonService.touchAllFields(formRef);
			if (formRef.$invalid) return;

			const formData = new FormData();
			const payload = angular.copy(entity);

			payload.id = payload.id || null;
			formData.append("sevaTypeStr", JSON.stringify(payload));

			const cropperEl = document.querySelector(cropperSelector);

			const finishSubmit = (blob) => {
				if (blob) {
					formData.append("file", blob, "cropped_image.jpg");
					Object.entries(entity.cropData || {}).forEach(([key, val]) => {
						formData.append(key, val);
					});
				}

				const promise = isEditMode ? apiUpdateFn(formData) : apiAddFn(formData);
				commonService.runWithLoader(() =>
					promise.then(res => {
						if (res.data.success) {
							commonService.notify.success("Success", res.data.message);
							if (modalId) $(`#${modalId}`).modal('hide');
							onSuccess && onSuccess(res.data);
						} else {
							commonService.notify.error("Error", res.data.message);
							onError && onError(res.data);
						}
					}).finally(() => {
						onComplete && onComplete();
					})
				);
			};

			// Handle cropper logic
			if ((!cropperEl || !entity.imageFile) && !entity.imagePreview) {
				finishSubmit(null);
			} else if (cropperEl && cropperEl.getCropBlob) {
				cropperEl.getCropBlob(finishSubmit);
			} else {
				commonService.notify.error("Image is required. Please upload and crop.");
			}
		},

		resetFormAndCropper: function(scope, defaults, cropperSelector = 'image-cropper') {
			scope.entity = angular.extend({
				isActive: true,
				imageFile: null,
				imagePreview: null,
				cropData: null
			}, defaults || {});
			scope.showCropper = !!scope.entity.imagePreview;

			const cropperEl = document.querySelector(cropperSelector);
			if (cropperEl && cropperEl.resetCropper) {
				cropperEl.resetCropper(scope.entity.imagePreview);
			}

			if (scope.sevaForm) {
				scope.sevaForm.$setPristine();
				scope.sevaForm.$setUntouched();
			}
		},
		load: function(scope, apiCall, targetListField) {
			commonService.runWithLoader(() => {
				return apiCall().then(res => {
					if (res.data.success) {
						scope[targetListField] = res.data.data;
					} else {
						commonService.notify.error("Error", res.data.message);
					}
				});
			});
		},
		getImageUrl: function(imageName, folderPath) {
			if (!imageName) return null;
			if (!folderPath.endsWith('/')) folderPath += '/';
			return $location.protocol() + "://" + location.host + "/" + folderPath + imageName;
		},

		getByIdAndOpenModal: function(options) {
			// options: { id, apiFn, $scope, imageFolder, modalId, resetFn }
			commonService.runWithLoader(() => {
				return options.apiFn(options.id).then(res => {
					if (res.status === 200 && res.data) {
						options.$scope.isEditMode = true;
						options.resetFn.call(null, res.data); // Reset the form

						if (res.data.image && options.imageFolder) {
							const timestamp = new Date().getTime(); // cache buster
							options.$scope.entity.imagePreview = this.getImageUrl(res.data.image, options.imageFolder) + '?t=' + timestamp;
						}

						$('#' + options.modalId).modal('show');
					} else {
						commonService.notify.error("Error", "Entity not found.");
					}
				}, err => {
					console.error("Error fetching entity:", err);
					commonService.notify.error("Error", "Unable to load entity.");
				});
			});
		},
		deleteSelected: function($scope, options) {
			const {
				listName = 'sevaTypeList',
				apiDeleteFn, // required: a function like (ids) => apiUrlService.delete('moduleName', ids)
				onSuccess,
				confirmMessage = 'Are you sure you want to delete the selected item(s)?',
				noSelectionMessage = 'Please select at least one item to delete.'
			} = options;

			const selectedItems = $scope[listName].filter(item => item.selected);

			if (selectedItems.length === 0) {
				commonService.notify.warning("Warning", noSelectionMessage);
				return;
			}

			if (!confirm(confirmMessage)) {
				return;
			}

			const ids = selectedItems.map(item => item.id);

			commonService.runWithLoader(() =>
				apiDeleteFn(ids).then(res => {
					if (res.data.success) {
						commonService.notify.success("Success", res.data.message || 'Deleted successfully');
						onSuccess && onSuccess();
					} else {
						commonService.notify.error("Error", res.data.message || 'Delete failed');
					}
				}).catch(err => {
					console.error("Delete error", err);
					commonService.notify.error("Error", "Failed to delete. Try again.");
				})
			);
		}

	};
});
