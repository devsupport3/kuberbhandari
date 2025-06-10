app.directive('imageCropper', function($timeout) {
    return {
        restrict: 'E',
        scope: {
            imageFile: '=',
            imagePreview: '=',
            cropData: '='
        },
        template: `
            <input type="file" class="form-control" accept="image/*" onchange="angular.element(this).scope().onFileChange(this)">
            <div ng-if="showCropper">
                <img id="imageToCrop" ng-src="{{imagePreview}}" class="img-thumbnail mt-2" style="width: 100%; max-height: 300px;" />
            </div>
        `,
        link: function(scope, element) {
            let cropper;

            scope.onFileChange = function(input) {
                if (input.files && input.files[0]) {
                    const file = input.files[0];
                    const reader = new FileReader();

                    reader.onload = function(e) {
                        scope.$apply(() => {
                            scope.imagePreview = e.target.result;
                            scope.showCropper = true;

                            $timeout(() => {
                                const image = element.find('img')[0];
                                if (cropper) cropper.destroy();

                                cropper = new Cropper(image, {
                                    aspectRatio: 1,
                                    viewMode: 1,
                                    movable: true,
                                    zoomable: true
                                });
                            }, 100);
                        });
                    };
                    reader.readAsDataURL(file);
                }
            };

            scope.reset = function() {
                // Clear preview and cropper UI
                scope.imagePreview = null;
                scope.cropData = null;
                scope.showCropper = false;

                // Destroy cropper instance if exists
                if (cropper) {
                    cropper.destroy();
                    cropper = null;
                }

                // Clear the file input element
                const fileInput = element.find('input')[0];
                if (fileInput) {
                    fileInput.value = null;
                }
            };

            scope.$on('$destroy', function() {
                if (cropper) cropper.destroy();
            });

            scope.getCropBlob = function(callback) {
                if (cropper) {
                    const cropData = cropper.getData();
                    const imgData = cropper.getImageData();
                    scope.cropData = {
                        x: Math.round(cropData.x),
                        y: Math.round(cropData.y),
                        width: Math.round(cropData.width),
                        height: Math.round(cropData.height),
                        naturalWidth: imgData.naturalWidth,
                        naturalHeight: imgData.naturalHeight
                    };
                    cropper.getCroppedCanvas().toBlob(callback, "image/jpeg", 0.9);
                }
            };

			scope.$watch('imagePreview', function(newVal) {
			    if (newVal) {
			        // Set showCropper first to make sure image div is rendered
			        scope.showCropper = true;

			        // Then in the next digest cycle find the image element
			        $timeout(() => {
			            const image = element.find('img')[0];
			            if (!image) {
			                console.warn('Image element not found yet');
			                return;
			            }

			            // Destroy previous cropper if any
			            if (cropper) {
			                cropper.destroy();
			                cropper = null;
			            }

			            // Initialize cropper on image load
			            image.onload = function() {
			                cropper = new Cropper(image, {
			                    aspectRatio: 1,
			                    viewMode: 1,
			                    movable: true,
			                    zoomable: true
			                });
			            };

			            // Note: image.src is set automatically by ng-src binding
			        }, 0);
			    } else {
			        scope.showCropper = false;
			        if (cropper) {
			            cropper.destroy();
			            cropper = null;
			        }
			    }
			});

			
            element[0].getCropBlob = scope.getCropBlob;

            // Expose reset function on the DOM element so parent can call it:
            element[0].resetCropper = scope.reset;
        }
    };
});
