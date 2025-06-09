<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" ng-app="kuberbhandari">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Daily Darshan</title>
<%@ include file="/WEB-INF/views/includeCssJs.jsp"%>
<!-- Add Bootstrap and Font Awesome CSS -->
<%-- <link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
	rel="stylesheet">

<!-- AngularJS -->
<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.8.2/angular.min.js"></script>

<script
	src="<%=request.getContextPath()%>/resources/admin/js/confAdmin.js"></script> --%>

<!-- CKEditor Start-->
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/admin/ckeditor/ckeditor.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/admin/ckfinder/ckfinder.js"></script>

<!-- Jcrop -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/admin/jcrop/css/jquery.Jcrop.css"
	type="text/css" />

<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f8f9fa;
	margin-top: 60px;
}

.card-header {
	background-color: #ffad28;
	color: white;
	font-weight: bold;
}

.card {
	margin: -29px 0;
}

.card-body {
	padding: 20px;
}

.card-footer {
	background-color: #f1f1f1;
}

.icon {
	font-size: 3rem;
	color: #007bff;
}

.bg-dark {
	background-color: #ffad28 !important;
}

.btn-primary {
	color: #fff;
	background-color: #ffad28;
	border-color: #007bff;
}

@media ( max-width : 768px) {
	.card {
		margin: 10px 0;
	}
}

/* Form styles */
.form-container {
	margin: 50px 0;
	padding: 20px;
}

.form-group {
	margin-bottom: 1.5rem;
}

.form-control {
	width: 100%;
	padding: 10px;
	margin-top: 10px;
	border: 1px solid #ccc;
	border-radius: 4px;
}

.card .card-header[data-toggle=collapse].collapsed::after {
	content: '\f105';
}

.card .card-header[data-toggle=collapse]::after {
	position: absolute;
	right: 0;
	top: 0;
	padding-right: 1.725rem;
	line-height: 51px;
	font-weight: 900;
	content: '\f107';
	font-family: 'Font Awesome 5 Free';
	color: black;
}

/* Parent container for the row */
.form-group.row {
	display: flex;
	flex-wrap: nowrap;
	gap: 1rem;
	align-items: center;
}

/* Child elements */
.form-group.row>div {
	flex: 1;
}

/* Adjust for small screens */
@media ( max-width : 768px) {
	.form-group.row {
		flex-wrap: wrap;
	}
	.form-group.row>div {
		flex: 100%;
		margin-bottom: 1rem;
	}
}

/* General form styles */
.form-control {
	width: 100%;
	padding: 0.5rem;
	font-size: 1rem;
}

/* Main container styling */
.pagination-container {
	display: flex;
	justify-content: center;
	align-items: center;
	margin: 30px 0;
	font-family: Arial, sans-serif;
}

/* Button styling */
.pagination-btn {
	display: flex;
	align-items: center;
	justify-content: center;
	width: 50px;
	height: 50px;
	border: none;
	background-color: #007bff;
	color: white;
	font-size: 18px;
	font-weight: bold;
	border-radius: 50%;
	margin: 0 10px;
	box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.15);
	cursor: pointer;
	transition: all 0.3s ease;
}

.pagination-btn:hover {
	background-color: #0056b3;
	transform: translateY(-3px);
}

.pagination-btn:disabled {
	background-color: #d6d6d6;
	color: #aaa;
	cursor: not-allowed;
	box-shadow: none;
}

/* SVG Arrow Styling */
.pagination-btn svg {
	width: 20px;
	height: 20px;
	fill: white;
	transition: transform 0.2s ease;
}

.pagination-btn:hover svg {
	transform: scale(1.2);
}

/* Page number styling */
.page-numbers {
	font-size: 18px;
	font-weight: bold;
	color: #333;
}

.page-numbers .current-page {
	color: #007bff;
}

.page-numbers .total-pages {
	color: #666;
}

/* Custom Arrow for Select Dropdown */
select.custom-select {
	appearance: none;
	-webkit-appearance: none;
	-moz-appearance: none;
	background-image:
		url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24"><path fill="gray" d="M7 10l5 5 5-5z"/></svg>');
	background-repeat: no-repeat;
	background-position: right 10px center;
	background-size: 18px 26px;
	padding-right: 30px;
}

.loader-overlay {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(255, 255, 255, 0.7);
	display: flex;
	justify-content: center;
	align-items: center;
	z-index: 9999;
}

.dynamic-spinner {
	width: 60px;
	height: 60px;
	animation: spin 1s linear infinite;
}

@
keyframes spin {from { transform:rotate(0deg);
	
}

to {
	transform: rotate(360deg);
}
}
</style>
</head>
<body>

	<!-- Header with Navbar -->
	<%@include file="header.jsp"%>

	<!-- Sidebar -->
	<div class="row" ng-controller="SidebarController">
		<%@include file="sidebar.jsp"%>

		<!-- Form Container -->
		<div class="col-md-10" style="margin-top: 30px;"
			ng-controller="AdminManageDailyDarshanCtrl">

			<div class="card-body">
				<div class="container-fluid">
					<div class="row">
						<div class="col-lg-12 col-md-12  col-sm-12 col-xl-12">
							<div class="card shadow mb-4">
								<!-- Card Header - Accordion -->
								<a href="#collapseCardDailyDarshan"
									class="d-block card-header py-3" data-toggle="collapse"
									role="button" aria-expanded="true"
									aria-controls="collapseCardExampleDailyDarshan"
									style="background-color: #ffad28;">
									<h6 class="m-0 font-weight-bold text-primary"
										style="color: black !important;">Daily Darshan</h6>
								</a>

								<!-- Card Content - Collapse -->
								<div class="collapse" id="collapseCardDailyDarshan">
									<div class="card-body" style="margin-top: -45px;">

										<!-- Main Form -->
										<form class="needs-validation" name="myForm">
											<div class="container-fluid py-4">
												<!-- Hindu Month -->
												<div class="form-group row">

													<!-- 	Title -->
													<div class="col-md-4 col-sm-12 mb-3">
														<input class="form-control" placeholder="Title"
															type="text" ng-model="dailyDarshan.dailyDarshanTitle">
													</div>

													<!-- Sub-Title -->
													<div class="col-md-4 col-sm-12 mb-3">
														<input class="form-control" placeholder="Sub-Title"
															type="text" ng-model="dailyDarshan.dailyDarshanSubtitle">
													</div>

													<!-- Date Selection -->
													<div class="col-md-4 col-sm-12 mb-3">
														<input type="date" class="form-control"
															id="dailyDarshanDate"
															ng-model="dailyDarshan.dailyDarshanDate"
															min="{{minDate}}" required ng-change="updateDay()">
													</div>

													<!-- Display Selected Day -->
													<div class="col-md-4 col-sm-12 mb-3">
														<input type="text" class="form-control"
															id="dailyDarshanDay"
															ng-model="dailyDarshan.dailyDarshanDay" placeholder="Day"
															readonly>
													</div>
												</div>

												<!-- Description -->
												<div class="form-group row">
													<!-- <div class="col-md-12 mb-3 d-flex align-items-start"> -->
													<div class="col-md-12 mb-3">
														<textarea class="form-control mr-2"
															id="dailyDarshanDescription"
															name="dailyDarshanDescription" placeholder="Description"
															rows="4" ng-model="dailyDarshan.dailyDarshanDescription"></textarea>
													</div>
												</div>

												<div class="col-md-12" align="center">
													<div class="panel"
														style="background-color: #C0C0C0; border-radius: 25px; margin-left: -17px; margin-right: -15px;">
														<div class="panel-heading" style="padding: 0px 15px;">
															<h4>Daily Darshan Images</h4>
														</div>
													</div>
												</div>

												<div class="form-group row" style="margin-top: 18px;">
													<div class="col-md-4 col-sm-12 mb-3">
														<input class="form-control"
															placeholder="Enter Image Title" type="text"
															ng-model="dailyDarshanImages.imageTitle">
													</div>
													<div class="col-md-4 col-sm-12 mb-3">
														<input class="form-control"
															placeholder="Enter Image Description" type="text"
															ng-model="dailyDarshanImages.imageDescription">
													</div>
													<div class="col-md-4 col-sm-12 mb-3">
														<input class="form-control"
															placeholder="Enter YouTube URL" type="text"
															ng-model="dailyDarshanImages.youTubeUrl">
													</div>
												</div>

												<!-- <div class="row">
													<div class="col-md-12">
														<div class="form-group d-flex align-items-center"
															style="margin-top: -16px;">
															<input type="file" id="dailyDarshanImage"
																name="dailyDarshanImage" class="form-control">
															<button type="button" class="btn btn-primary ms-2"
																ng-click="addDailyDarshan()"
																style="background-color: #444; border-color: #444; height: fit-content; margin-top: 8px;">Add</button>
														</div>
													</div>
													<br>
												</div> -->
												<div class="row">
													<div class="col-12">
														<div class="d-flex flex-wrap align-items-center gap-2"
															style="margin-top: -16px;">

															<!-- Radio Buttons for choosing input mode -->
															<div
																class="d-flex align-items-center me-3 flex-grow-1 flex-sm-grow-0">
																<label class="me-3"> <input type="radio"
																	ng-model="dailyDarshanImages.imageInputType" value="upload"
																	ng-change="toggleInput()" checked> Upload
																	Images
																</label> <label> <input type="radio"
																	ng-model="dailyDarshanImages.imageInputType" value="capture"
																	ng-change="toggleInput()"> Capture Image
																</label>
															</div>

															<!-- Multiple Upload Input -->
															<input type="file" id="dailyDarshanUploadImage"
																name="dailyDarshanUploadImage"
																class="form-control flex-grow-1 flex-sm-grow-0" multiple
																accept="image/*" ng-show="dailyDarshanImages.imageInputType === 'upload'"
																onchange="angular.element(this).scope().previewImages(this.files)"
																style="min-width: 200px; max-width: 300px;">

															<!-- Capture Image Input -->
															<input type="file" id="dailyDarshanImage"
																name="dailyDarshanImage"
																class="form-control flex-grow-1 flex-sm-grow-0"
																accept="image/*" capture="environment"
																ng-show="dailyDarshanImages.imageInputType === 'capture'"
																style="min-width: 200px; max-width: 300px;">

															<button type="button" class="btn btn-primary ms-2"
																ng-click="addDailyDarshan()"
																style="background-color: #444; border-color: #444; height: fit-content; margin-top: 8px;">
																Add</button>

														</div>
													</div>
												</div>

												<div class="row text-center">
													<div class="col-md-4" ng-if="dailyDarshanImages.imageInputType === 'capture'">
														<img src="" id="target" /> <input type="hidden" name="x"
															id="valuex" ng-model="valuex" /> <input type="hidden"
															name="y" id="valuey" ng-model="valuey" /> <input
															type="hidden" name="w" id="valuew" ng-model="valuew" />
														<input type="hidden" name="h" id="valueh"
															ng-model="valueh" />
													</div>
													<div class="preview-container row mt-3"
														ng-if="dailyDarshanImages.imageInputType === 'upload'">
														<div class="col-6 col-sm-4 col-md-3 col-lg-2 mb-3"
															ng-repeat="img in imagePreviews">
															<div
																class="img-wrapper border rounded shadow-sm p-1 h-100">
																<img ng-src="{{img}}" class="img-fluid rounded w-100"
																	style="object-fit: cover;">
															</div>
														</div>
													</div>
												</div>
											</div>

											<div class="row">
												<div class="col-md-12">
													<div class="table-responsive">
														<table class="table table-striped" width="100%">
															<tbody>
																<tr>
																	<th>#</th>
																	<th>Image Title</th>
																	<th>Image Description</th>
																	<th>YouTube Url</th>
																	<th ng-if="item.isNew">Image</th>
																	<th ng-if="!item.isNew">Image</th>
																	<th>Image Type </th>
																	<th>Del</th>
																</tr>
																<tr ng-repeat="item in dailydarshanimagelist">
																	<td>{{$index + 1}}</td>
																	<td>{{item.imageTitle}}</td>
																	<td>{{item.imageDescription}}</td>
																	<td>{{item.youTubeUrl}}</td>
																	<td ng-if="item.isNew"><img
																		ng-src="{{item.image}}" alt="Daily Darshan Image"
																		class="img-thumbnail"
																		style="padding: 0; margin: 0; border: none; width: 50px; height: 50px;">
																	</td>
																	<td ng-if="!item.isNew"><img
																		ng-src="<%=request.getContextPath()%>/resources/front/img/DailyDarshan/{{item.dailyDarshanImages}}"
																		alt="Daily Darshan Image" class="img-thumbnail"
																		style="padding: 0; margin: 0; border: none; width: 50px; height: 50px;">
																	</td>
																	<td>{{item.imageInputType}}</td>
																	<td>
																		<button type="button" class="btn btn-danger"
																			ng-click="deleteItem(item)">
																			<i class="fa fa-trash"></i>
																		</button>
																	</td>
																</tr>
															</tbody>
														</table>
													</div>
												</div>
											</div>

											<!-- Submit Button -->
											<div class="form-group" style="margin-top: 12px;">
												<button type="back" class="btn btn-success"
													style="background-color: #444; border-color: #444; text-align: center;"
													ng-click="backDailyDarshanData()">Back</button>
												<button type="submit" class="btn btn-success"
													style="background-color: #444; border-color: #444;"
													ng-click="dailyDarshan.dailyDarshanId > 0 ? updateDailyDarshan() : addAllDailyDarshan()">Submit</button>
												<button type="clear" class="btn btn-success"
													style="background-color: #444; border-color: #444;"
													ng-click="clearDailyDarshanData()">Clear</button>
											</div>
									</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- Daily Darshan List Table -->
			<div class="card mt-4" style="margin: 37px;">
				<div class="card-header"
					style="background-color: #ffad28; color: white; height: 50px;">
					<h3 style="font-size: 1.30rem; color: black !important;">Daily
						Darshan List</h3>
				</div>
				<div class="card-body">
					<div class="table-responsive">
						<table class="table table-bordered table-hover">
							<thead class="thead-light">
								<tr>
									<th>#</th>
									<th>Title</th>
									<th>Sub Title</th>
									<th>Description</th>
									<th>Date</th>
									<th>Day</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<tr ng-repeat="dailyDarshan in dailyDarshanList"
									ng-click="editDailyDarshan(darshan)" style="cursor: pointer;">
									<td
										ng-click="GetDailyDarshanById(dailyDarshan); openCollapse()"
										title="Update daily darshan" data-toggle="modal"
										data-target="#updateModal">{{$index + 1}}</td>
									<td
										ng-click="GetDailyDarshanById(dailyDarshan); openCollapse()"
										title="Update daily darshan" data-toggle="modal"
										data-target="#updateModal">
										{{dailyDarshan.dailyDarshanTitle}}</td>
									<td
										ng-click="GetDailyDarshanById(dailyDarshan); openCollapse()"
										title="Update daily darshan" data-toggle="modal"
										data-target="#updateModal">
										{{dailyDarshan.dailyDarshanSubtitle}}</td>
									<td
										ng-click="GetDailyDarshanById(dailyDarshan); openCollapse()"
										title="Update daily darshan" data-toggle="modal"
										data-target="#updateModal">
										<p class="mb-0"
											ng-bind-html="dailyDarshan.dailyDarshanDescription | to_trusted"></p>
									</td>
									<td
										ng-click="GetDailyDarshanById(dailyDarshan); openCollapse()"
										title="Update daily darshan" data-toggle="modal"
										data-target="#updateModal">
										{{dailyDarshan.dailyDarshanDate | dateFormat1}}</td>
									<td
										ng-click="GetDailyDarshanById(dailyDarshan); openCollapse()"
										title="Update daily darshan" data-toggle="modal"
										data-target="#updateModal">
										{{dailyDarshan.dailyDarshanDay}}</td>
									<td class="text-center align-middle"><input
										type="checkbox" ng-model="dailyDarshan.selected"></td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="form-group" style="float: right;">
						<button type="button" id="Delete" name="submit"
							class="btn btn-danger" ng-click="deleteDailyDarshan()">
							<i class="fas fa-trash"></i>
						</button>
					</div>
				</div>
			</div>
		</div>
		<!-- <div ng-show="loading" class="loader-overlay">
			<div class="spinner-border text-primary" role="status">
				<span class="visually-hidden">Loading...</span>
			</div>
		</div> -->
	</div>



	<!--Footer-->
	<%@include file="footer.jsp"%>

	<!-- Add Bootstrap and necessary scripts -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

	<!-- Jcrop -->
	<script
		src="<%=request.getContextPath()%>/resources/admin/jcrop/js/jquery.Jcrop.js"></script>

	<!-- Script For CKEditor Start -->
	<script>
		//Initialize the Editor
		initEditor();

		//Replace the <textarea id="editor1"> with an CKEditor instance.  
		function initEditor() {
			CKEDITOR.replace('dailyDarshanDescription', {
				pluginsLoaded : function(evt) {
					var doc = CKEDITOR.document, ed = evt.editor;
					if (!ed.getCommand('bold'))
						doc.getById('exec-bold').hide();
					if (!ed.getCommand('link'))
						doc.getById('exec-link').hide();
				}
			});
		}
	</script>
	<!-- Script For CKEditor End -->

	<!-- Script For jcrop start -->
	<!-- <script>
		jQuery(function($) {
			function readURL(input) {
				if (input.files && input.files[0]) {
					var reader = new FileReader();
					reader.onload = function(e) {
						if ($('#target').data('Jcrop')) {
							$('#target').data('Jcrop').destroy();
							$('#target').removeAttr('style');
						}

						var u = URL.createObjectURL(input.files[0]);
						var img = new Image;
						img.onload = function() {
							if (img.width < 716 || img.height < 1600) {
								alert("Minimum image size should be 716px X 1600px");
								$('#target').attr('src', "");
								document.getElementById("dailyDarshanImage").value = null;
							} else {
								$('#target').css("min-height", "289px");
								$('#target').css("min-width", "129px");

								$('#target').attr('src', e.target.result);
								$('#target').Jcrop({
									aspectRatio : 129 / 289,
									boxWidth : 600,
									boxHeight : 600,
									minSize : [ 100, 100 ],
									setSelect : [ 100, 100, 400, 400 ],
									onChange : setCoordinates,
									onSelect : setCoordinates,
									bgColor : '',
								});
							}
						};

						img.src = u;
					}
					reader.readAsDataURL(input.files[0]);
				}
			}
			$("#dailyDarshanImage").change(function() {
				readURL(this);
			});
			$("#dailyDarshanImage").click(function() {
				this.value = null;
			});
		});

		function setCoordinates(c) {
			document.myForm.x.value = Math.round(c.x);
			document.myForm.y.value = Math.round(c.y);
			document.myForm.w.value = Math.round(c.w);
			document.myForm.h.value = Math.round(c.h);
		};

		function checkCoordinates() {
			if (document.myForm.x.value == "" || document.myForm.y.value == "") {
				alert("Please select a crop region");
				return false;
			} else {
				return true;
			}
		};
	</script> -->
	<!-- Script For jcrop start -->
	<script>
		jQuery(function($) {
			function readURL(input) {
				if (input.files && input.files[0]) {
					var reader = new FileReader();
					reader.onload = function(e) {
						if ($('#target').data('Jcrop')) {
							$('#target').data('Jcrop').destroy();
							$('#target').removeAttr('style');
						}

						var u = URL.createObjectURL(input.files[0]);
						var img = new Image;
						img.onload = function() {
							/* if (img.width < 716 || img.height < 1600) {
								alert("Minimum image size should be 716px X 1600px");
								$('#target').attr('src', "");
								document.getElementById("AlbumImage").value = null;
							} else { */
							/* $('#target').css("min-height", "350px");
							$('#target').css("min-width", "546px");

							$('#target').attr('src', e.target.result);
							$('#target').Jcrop({
								aspectRatio : 546 / 350,
								boxWidth : 600,
								boxHeight : 600,
								minSize : [ 100, 100 ],
								setSelect : [ 100, 100, 400, 400 ],
								onChange : setCoordinates,
								onSelect : setCoordinates,
								bgColor : '',
							}); */
							/* } */
							if (img.width < 100 || img.height < 100) {
								alert("Minimum image size should be 600px X 765px");
								$('#target').attr('src', "");
								document.getElementById("dailyDarshanImage").value = null;
							} else {
								$('#target').css("max-width", "100%");
								//$('#target').css("width", "500px");

								$('#target').attr('src', e.target.result);
								$('#target').Jcrop({
									//aspectRatio : 192 / 85,
									//boxWidth : 840,
									//boxHeight : 400,
									//minSize : [ 600, 765 ],
									//maxSize : [ 1200, 1530 ],
									//setSelect : [ 0, 0, 600, 765 ],
									onChange : setCoordinates,
									onSelect : setCoordinates,
									trueSize : [ img.width, img.height ]
								});

							}
						};

						img.src = u;
					}
					reader.readAsDataURL(input.files[0]);
				}
			}
			$("#dailyDarshanImage").change(function() {
				readURL(this);
			});
			$("#dailyDarshanImage").click(function() {
				this.value = null;
			});
		});

		function setCoordinates(c) {
			document.myForm.x.value = Math.round(c.x);
			document.myForm.y.value = Math.round(c.y);
			document.myForm.w.value = Math.round(c.w);
			document.myForm.h.value = Math.round(c.h);
		};

		function checkCoordinates() {
			if (document.myForm.x.value == "" || document.myForm.y.value == "") {
				alert("Please select a crop region");
				return false;
			} else {
				return true;
			}
		};
	</script>
	<!-- Script For jcrop End -->
</body>
</html>