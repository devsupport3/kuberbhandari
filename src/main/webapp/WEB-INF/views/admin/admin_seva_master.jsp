<!DOCTYPE html>
<html lang="en" ng-app="kuberbhandari">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Seva</title>

<!-- Add Bootstrap and Font Awesome CSS -->
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
	src="<%=request.getContextPath()%>/resources/admin/js/confAdmin.js"></script>

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
	margin: 20px 0;
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

/* Styling for the container of the label and toggle switch */
.toggle-container {
	display: flex;
	align-items: center;
	gap: 10px;
}

/* Styling for the label */
.toggle-label {
	font-size: 16px;
	font-weight: 600;
}

/* Styling for the toggle switch */
.toggle-switch {
	width: 75px;
	height: 35px;
	background: grey;
	border-radius: 35px;
	position: relative;
	cursor: pointer;
	transition: background 0.3s ease;
}

/* Slider inside the toggle switch */
.toggle-switch .slider {
	position: absolute;
	top: 5px;
	left: 5px;
	width: 25px;
	height: 25px;
	background: #fff;
	border-radius: 25px;
	transition: transform 0.3s ease;
}

/* Active state */
.toggle-switch.active {
	background: #28a745;
}

.toggle-switch.active .slider {
	transform: translateX(40px);
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
		<div class="col-md-10" ng-controller="AdminSevaController">
			<div class="card-body">
				<div class="container-fluid">
					<div class="row">
						<div class="col-lg-12 col-md-12  col-sm-12 col-xl-12">
							<div class="card shadow mb-4">
								<!-- Card Header - Accordion -->
								<a href="#collapseCardSevaTypes"
									class="d-block card-header py-3" data-toggle="collapse"
									role="button" aria-expanded="true"
									aria-controls="collapseCardExampleSevaTypes"
									style="background-color: #ffad28; !important">
									<h6 class="m-0 font-weight-bold text-primary"
										style="color: black !important;">Seva Types</h6>
								</a>
								<!-- Card Content - Collapse -->
								<div class="collapse" id="collapseCardSevaTypes">
									<div class="card-body">
										<form class="" name="myForm_sevaType">
											<div class="form-group row">
												<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
													<input class="form-control" placeholder="Seva Type Name"
														type="text" ng-model="newSevaType.sevaTypeName">
												</div>
												<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
													<input class="form-control" placeholder="Description"
														type="text" ng-model="newSevaType.description">
												</div>
												<!-- Image Upload -->
												<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
													<input type="file" id="sevaTypeImage" name="sevaTypeImage"
														class="form-control">
												</div>
												<div class="col-md-3 col-sm-8" style="margin-left: 25px;">
													<div class="form-check form-switch">
														<input class="form-check-input" type="checkbox"
															id="sevaTypeSwitch" ng-model="isSevaTypeActive"
															ng-change="sevaTypeToggle()"> <label
															class="form-check-label" for="sevaTypeSwitch">
															Active/Inactive </label>
													</div>
												</div>
											</div>
											<div class="row text-center">
												<div class="col-md-4">
													<img src="" id="target" /> <input type="hidden" name="x"
														id="valuex" ng-model="valuex" /> <input type="hidden"
														name="y" id="valuey" ng-model="valuey" /> <input
														type="hidden" name="w" id="valuew" ng-model="valuew" /> <input
														type="hidden" name="h" id="valueh" ng-model="valueh" />
												</div>
											</div>
											<br>
											<div>
												<button type="button" class="btn btn-success"
													style="background-color: #444; border-color: #444;"
													ng-click="newSevaType.sevaTypeId > 0 ? updateSevaType() : addSevaType()">Submit</button>
											</div>
										</form>
										<!-- Seva Type Table -->
										<div class="card">
											<div class="card-header" style="background-color: #ffad28;">
												<h5 style="color: black !important;">Seva Type List</h5>
											</div>
											<div class="card-body">
												<div class="table-responsive">
													<table class="table table-bordered">
														<thead>
															<tr>
																<th>#</th>
																<th>Seva Type Name</th>
																<th>Description</th>
																<th>Image</th>
																<th></th>
															</tr>
														</thead>
														<tbody>
															<tr ng-repeat="sevaType in sevaTypeList"
																style="cursor: pointer">
																<td ng-click="GetSevaTypeById(sevaType)"
																	title="Update Seva Type" data-bs-toggle="modal"
																	data-bs-target="#updateModal">{{$index + 1}}</td>
																<td ng-click="GetSevaTypeById(sevaType)"
																	title="Update Seva Type" data-bs-toggle="modal"
																	data-bs-target="#updateModal">{{sevaType.sevaTypeName}}</td>
																<td ng-click="GetSevaTypeById(sevaType)"
																	title="Update Seva Type" data-bs-toggle="modal"
																	data-bs-target="#updateModal">{{sevaType.description}}</td>
																<td>
																	<div class="widget-thumb">
																		<a href="#" ng-click="GetSevaTypeById(sevaType)">
																			<img
																			ng-src="<%=request.getContextPath()%>/resources/front/demo-images/imgseva/{{sevaType.image}}"
																			alt="image" class="img-thumbnail"
																			style="width: 50px; height: 50px;">
																		</a>
																	</div>
																</td>
																<td class="text-center align-middle"><input
																	type="checkbox" ng-model="sevaType.selected"></td>
															</tr>
														</tbody>
													</table>
												</div>
												<div class="form-group" style="float: right;">
													<button type="button" id="Delete" name="submit"
														class="btn btn-danger" ng-click="deleteSevaType()">
														<i class="fas fa-trash"></i>
													</button>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-12 col-md-12  col-sm-12 col-xl-12">
							<div class="card shadow mb-4">
								<!-- Card Header - Accordion -->
								<a href="#collapseCardSevaCategory"
									class="d-block card-header py-3" data-toggle="collapse"
									role="button" aria-expanded="true"
									aria-controls="collapseCardExampleSevaCategory"
									style="background-color: #ffad28;">
									<h6 class="m-0 font-weight-bold text-primary"
										style="color: black !important;">Seva Category</h6>
								</a>
								<!-- Card Content - Collapse -->
								<div class="collapse" id="collapseCardSevaCategory">
									<div class="card-body">
										<form class="" name="myForm_sevaCategory">
											<div class="form-group row">
												<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
													<input class="form-control"
														placeholder="Seva Category Name" type="text"
														ng-model="newSevaCategory.sevaCategoryName">
												</div>
												<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
													<input class="form-control" placeholder="Description"
														type="text" ng-model="newSevaCategory.description">
												</div>
												<!-- Image Upload -->
												<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
													<input type="file" id="sevaCategoryImage"
														name="sevaCategoryImage" class="form-control">
												</div>
												<div class="col-md-3 col-sm-8" style="margin-left: 25px;">
													<div class="form-check form-switch">
														<input class="form-check-input" type="checkbox"
															id="sevaCategorySwitch" ng-model="isSevaCategoryActive"
															ng-change="sevaCategoryToggle()"> <label
															class="form-check-label" for="sevaCategorySwitch">
															Active/Inactive </label>
													</div>
												</div>
											</div>
											<div class="row text-center">
												<div class="col-md-4">
													<img src="" id="target1" /> <input type="hidden" name="x1"
														id="valuex1" ng-model="valuex1" /> <input type="hidden"
														name="y1" id="valuey1" ng-model="valuey1" /> <input
														type="hidden" name="w1" id="valuew1" ng-model="valuew1" />
													<input type="hidden" name="h1" id="valueh1"
														ng-model="valueh1" />
												</div>
											</div>
											<br>
											<div>
												<button type="button" class="btn btn-success"
													style="background-color: #444; border-color: #444;"
													ng-click="newSevaCategory.sevaCategoryId > 0 ? updateSevaCategory() : addSevaCategory()">Submit</button>
											</div>
										</form>
										<!-- Seva Category Table -->
										<div class="card">
											<div class="card-header" style="background-color: #ffad28;">
												<h5 style="color: black !important;">Seva Category List</h5>
											</div>
											<div class="card-body">
												<div class="table-responsive">
													<table class="table table-bordered">
														<thead>
															<tr>
																<th>#</th>
																<th>Seva Category Name</th>
																<th>Description</th>
																<th>Images</th>
																<th></th>
															</tr>
														</thead>
														<tbody>
															<tr ng-repeat="sevaCategory in sevaCategoriesList"
																style="cursor: pointer">
																<td ng-click="GetSevaCategoryById(sevaCategory)"
																	title="Update Seva Category" data-toggle="modal"
																	data-target="#updateModal">{{$index + 1}}</td>
																<td ng-click="GetSevaCategoryById(sevaCategory)"
																	title="Update Seva Category" data-toggle="modal"
																	data-target="#updateModal">
																	{{sevaCategory.sevaCategoryName}}</td>
																<td ng-click="GetSevaCategoryById(sevaCategory)"
																	title="Update Seva Category" data-toggle="modal"
																	data-target="#updateModal">
																	{{sevaCategory.description}}</td>
																<td>
																	<div class="widget-thumb">
																		<a href="#"
																			ng-click="GetsevaCategoryById(sevaCategory)"> <img
																			ng-src="<%=request.getContextPath()%>/resources/front/demo-images/imgseva/{{sevaCategory.image}}"
																			alt="image" class="img-thumbnail"
																			style="width: 50px; height: 50px;">
																		</a>
																	</div>
																</td>
																<td class="text-center" style="vertical-align: middle;">
																	<input type="checkbox" ng-model="sevaCategory.selected">
																</td>
															</tr>
														</tbody>
													</table>
												</div>
												<div class="form-group" style="float: right;">
													<button type="button" id="Delete" class="btn btn-danger"
														ng-click="deleteSevaCategory()">
														<i class="fas fa-trash"></i>
													</button>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-12 col-md-12  col-sm-12 col-xl-12">
							<div class="card shadow mb-4">
								<!-- Card Header - Accordion -->
								<a href="#collapseVariation" class="d-block card-header py-3"
									data-toggle="collapse" role="button" aria-expanded="true"
									aria-controls="collapseCardExampleVariation"
									style="background-color: #ffad28;">
									<h6 class="m-0 font-weight-bold text-primary"
										style="color: black !important;">Variation</h6>
								</a>
								<!-- Card Content - Collapse -->
								<div class="collapse" id="collapseVariation">
									<div class="card-body">
										<form class="" name="myForm_variation">
											<div class="form-group row">
												<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
													<input class="form-control" placeholder="Variation Name"
														type="text" ng-model="newVariation.variationName">
												</div>
												<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
													<input class="form-control" placeholder="Description"
														type="text" ng-model="newVariation.description">
												</div>
												<!-- Image Upload -->
												<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
													<input type="file" id="variationImage"
														name="variationImage" class="form-control">
												</div>
												<div class="col-md-3 col-sm-8" style="margin-left: 25px;">
													<div class="form-check form-switch">
														<input class="form-check-input" type="checkbox"
															id="variationSwitch" ng-model="isVariationActive"
															ng-change="variationToggle()"> <label
															class="form-check-label" for="variationSwitch">
															Active/Inactive </label>
													</div>
												</div>
											</div>
											<div class="row text-center">
												<div class="col-md-4">
													<img src="" id="target2" /> <input type="hidden" name="x2"
														id="valuex2" ng-model="valuex2" /> <input type="hidden"
														name="y2" id="valuey2" ng-model="valuey2" /> <input
														type="hidden" name="w2" id="valuew2" ng-model="valuew2" />
													<input type="hidden" name="h2" id="valueh2"
														ng-model="valueh2" />
												</div>
											</div>
											<br>
											<div>
												<button type="button" class="btn btn-success"
													style="background-color: #444; border-color: #444;"
													ng-click="newVariation.variationId > 0 ? updateVariation() : addVariation()">Submit</button>
											</div>
										</form>
										<!-- Variation Table -->
										<div class="card">
											<div class="card-header" style="background-color: #ffad28;">
												<h5 style="color: black !important;">Variation List</h5>
											</div>
											<div class="card-body">
												<div class="table-responsive">
													<table class="table table-bordered">
														<thead>
															<tr>
																<th>#</th>
																<th>Variation Name</th>
																<th>Description</th>
																<th>Images</th>
																<th></th>
															</tr>
														</thead>
														<tbody>
															<tr ng-repeat="variation in variationList"
																style="cursor: pointer">
																<td ng-click="GetVariationById(variation)"
																	title="Update Variation" data-toggle="modal"
																	data-target="#updateModal">{{$index + 1}}</td>
																<td ng-click="GetVariationById(variation)"
																	title="Update Variation" data-toggle="modal"
																	data-target="#updateModal">
																	{{variation.variationName}}</td>
																<td ng-click="GetVariationById(variation)"
																	title="Update Variation" data-toggle="modal"
																	data-target="#updateModal">
																	{{variation.description}}</td>
																<td>
																	<div class="widget-thumb">
																		<a href="#" ng-click="GetVariationById(variation)">
																			<img
																			ng-src="<%=request.getContextPath()%>/resources/front/demo-images/imgseva/{{variation.image}}"
																			alt="image" class="img-thumbnail"
																			style="width: 50px; height: 50px;">
																		</a>
																	</div>
																</td>
																<td class="text-center" style="vertical-align: middle;">
																	<input type="checkbox" ng-model="variation.selected">
																</td>
															</tr>
														</tbody>
													</table>
												</div>
												<div class="form-group" style="float: right;">
													<button type="button" id="Delete" class="btn btn-danger"
														ng-click="deleteVariation()">
														<i class="fas fa-trash"></i>
													</button>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-12 col-md-12  col-sm-12 col-xl-12">
							<div class="card shadow mb-4">
								<!-- Card Header - Accordion -->
								<a href="#collapseFrequency" class="d-block card-header py-3"
									data-toggle="collapse" role="button" aria-expanded="true"
									aria-controls="collapseCardExampleFrequency"
									style="background-color: #ffad28;">
									<h6 class="m-0 font-weight-bold text-primary"
										style="color: black !important;">Frequency</h6>
								</a>
								<!-- Card Content - Collapse -->
								<div class="collapse" id="collapseFrequency">
									<div class="card-body">
										<form class="" name="myForm_frequency">
											<div class="form-group row">
												<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
													<input class="form-control" placeholder="Frequency Name"
														type="text" ng-model="newFrequency.frequencyName">
												</div>
												<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
													<input class="form-control" placeholder="Description"
														type="text" ng-model="newFrequency.description">
												</div>
												<!-- Image Upload -->
												<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
													<input type="file" id="frequencyImage"
														name="frequencyImage" class="form-control">
												</div>
												<div class="col-md-3 col-sm-8" style="margin-left: 25px;">
													<div class="form-check form-switch">
														<input class="form-check-input" type="checkbox"
															id="frequencySwitch" ng-model="isFrequencyActive"
															ng-change="frequencyToggle()"> <label
															class="form-check-label" for="frequencySwitch">
															Active/Inactive </label>
													</div>
												</div>
											</div>
											<div class="row text-center">
												<div class="col-md-4">
													<img src="" id="target3" /> <input type="hidden" name="x3"
														id="valuex3" ng-model="valuex3" /> <input type="hidden"
														name="y3" id="valuey3" ng-model="valuey3" /> <input
														type="hidden" name="w3" id="valuew3" ng-model="valuew3" />
													<input type="hidden" name="h3" id="valueh3"
														ng-model="valueh3" />
												</div>
											</div>
											<br>
											<div>
												<button type="button" class="btn btn-success"
													style="background-color: #444; border-color: #444;"
													ng-click="newFrequency.frequencyId > 0 ? updateFrequency() : addFrequency()">Submit</button>
											</div>
										</form>
										<!-- frequency Table -->
										<div class="card">
											<div class="card-header" style="background-color: #ffad28;">
												<h5 style="color: black !important;">Frequency List</h5>
											</div>
											<div class="card-body">
												<div class="table-responsive">
													<table class="table table-bordered">
														<thead>
															<tr>
																<th>#</th>
																<th>Frequency Name</th>
																<th>Description</th>
																<th>Images</th>
																<th></th>
															</tr>
														</thead>
														<tbody>
															<tr ng-repeat="frequency in frequencyList"
																style="cursor: pointer">
																<td ng-click="GetFrequencyById(frequency)"
																	title="Update frequency" data-toggle="modal"
																	data-target="#updateModal">{{$index + 1}}</td>
																<td ng-click="GetFrequencyById(frequency)"
																	title="Update frequency" data-toggle="modal"
																	data-target="#updateModal">
																	{{frequency.frequencyName}}</td>
																<td ng-click="GetFrequencyById(frequency)"
																	title="Update frequency" data-toggle="modal"
																	data-target="#updateModal">
																	{{frequency.description}}</td>
																<td>
																	<div class="widget-thumb">
																		<a href="#" ng-click="GetFrequencyById(frequency)">
																			<img
																			ng-src="<%=request.getContextPath()%>/resources/front/demo-images/imgseva/{{frequency.image}}"
																			alt="image" class="img-thumbnail"
																			style="width: 50px; height: 50px;">
																		</a>
																	</div>
																</td>
																<td class="text-center" style="vertical-align: middle;">
																	<input type="checkbox" ng-model="frequency.selected">
																</td>
															</tr>
														</tbody>
													</table>
												</div>
												<div class="form-group" style="float: right;">
													<button type="button" id="Delete" name="submit"
														class="btn btn-danger" ng-click="deleteFrequency()">
														<i class="fas fa-trash"></i>
														<!-- Trash (delete) icon -->
													</button>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
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
							/* if (img.width < 600 || img.height < 900) {
								alert("Minimum image size should be 600px X 900px");
								$('#target').attr('src', "");
								document.getElementById("sevaImage").value = null;
							} else { */
							$('#target').css("min-height", "208px");
							$('#target').css("min-width", "337px");

							$('#target').attr('src', e.target.result);
							$('#target').Jcrop({
								aspectRatio : 1 / 1.5,
								boxWidth : 600,
								boxHeight : 600,
								minSize : [ 100, 100 ],
								setSelect : [ 100, 100, 400, 400 ],
								onChange : setCoordinates,
								onSelect : setCoordinates
							});
							/* } */
						};

						img.src = u;
					}
					reader.readAsDataURL(input.files[0]);
				}
			}
			$("#sevaTypeImage").change(function() {
				readURL(this);
			});
			$("#sevaTypeImage").click(function() {
				this.value = null;
			});
		});

		function setCoordinates(c) {
			document.myForm_sevaType.x.value = Math.round(c.x);
			document.myForm_sevaType.y.value = Math.round(c.y);
			document.myForm_sevaType.w.value = Math.round(c.w);
			document.myForm_sevaType.h.value = Math.round(c.h);
		};

		function checkCoordinates() {
			if (document.myForm_sevaType.x.value == ""
					|| document.myForm_sevaType.y.value == "") {
				alert("Please select a crop region");
				return false;
			} else {
				return true;
			}
		};
	</script>
	<script>
		jQuery(function($) {
			function readURL1(input) {
				if (input.files && input.files[0]) {
					var reader = new FileReader();
					reader.onload = function(e) {
						if ($('#target1').data('Jcrop')) {
							$('#target1').data('Jcrop').destroy();
							$('#target1').removeAttr('style');
						}

						var u = URL.createObjectURL(input.files[0]);
						var img = new Image;
						img.onload = function() {
							/* if (img.width < 600 || img.height < 900) {
								alert("Minimum image size should be 600px X 900px");
								$('#target').attr('src', "");
								document.getElementById("sevaImage").value = null;
							} else { */
							$('#target1').css("min-height", "208px");
							$('#target1').css("min-width", "337px");

							$('#target1').attr('src', e.target.result);
							$('#target1').Jcrop({
								aspectRatio : 1 / 1.5,
								boxWidth : 600,
								boxHeight : 600,
								minSize : [ 100, 100 ],
								setSelect : [ 100, 100, 400, 400 ],
								onChange : setCoordinates1,
								onSelect : setCoordinates1
							});
							/* } */
						};

						img.src = u;
					}
					reader.readAsDataURL(input.files[0]);
				}
			}
			$("#sevaCategoryImage").change(function() {
				readURL1(this);
			});
			$("#sevaCategoryImage").click(function() {
				this.value = null;
			});
		});

		function setCoordinates1(c) {
			document.myForm_sevaCategory.x1.value = Math.round(c.x);
			document.myForm_sevaCategory.y1.value = Math.round(c.y);
			document.myForm_sevaCategory.w1.value = Math.round(c.w);
			document.myForm_sevaCategory.h1.value = Math.round(c.h);
		};

		function checkCoordinates1() {
			if (document.myForm_sevaCategory.x1.value == ""
					|| document.myForm_sevaCategory.y1.value == "") {
				alert("Please select a crop region");
				return false;
			} else {
				return true;
			}
		};
	</script>
	<script>
		jQuery(function($) {
			function readURL2(input) {
				if (input.files && input.files[0]) {
					var reader = new FileReader();
					reader.onload = function(e) {
						if ($('#target2').data('Jcrop')) {
							$('#target2').data('Jcrop').destroy();
							$('#target2').removeAttr('style');
						}

						var u = URL.createObjectURL(input.files[0]);
						var img = new Image;
						img.onload = function() {
							/* if (img.width < 600 || img.height < 900) {
								alert("Minimum image size should be 600px X 900px");
								$('#target').attr('src', "");
								document.getElementById("sevaImage").value = null;
							} else { */
							$('#target2').css("min-height", "208px");
							$('#target2').css("min-width", "337px");

							$('#target2').attr('src', e.target.result);
							$('#target2').Jcrop({
								aspectRatio : 1 / 1.5,
								boxWidth : 600,
								boxHeight : 600,
								minSize : [ 100, 100 ],
								setSelect : [ 100, 100, 400, 400 ],
								onChange : setCoordinates2,
								onSelect : setCoordinates2
							});
							/* } */
						};

						img.src = u;
					}
					reader.readAsDataURL(input.files[0]);
				}
			}
			$("#variationImage").change(function() {
				readURL2(this);
			});
			$("#variationImage").click(function() {
				this.value = null;
			});
		});

		function setCoordinates2(c) {
			document.myForm_variation.x2.value = Math.round(c.x);
			document.myForm_variation.y2.value = Math.round(c.y);
			document.myForm_variation.w2.value = Math.round(c.w);
			document.myForm_variation.h2.value = Math.round(c.h);
		};

		function checkCoordinates2() {
			if (document.myForm_variation.x2.value == ""
					|| document.myForm_variation.y2.value == "") {
				alert("Please select a crop region");
				return false;
			} else {
				return true;
			}
		};
	</script>
	<script>
		jQuery(function($) {
			function readURL3(input) {
				if (input.files && input.files[0]) {
					var reader = new FileReader();
					reader.onload = function(e) {
						if ($('#target3').data('Jcrop')) {
							$('#target3').data('Jcrop').destroy();
							$('#target3').removeAttr('style');
						}

						var u = URL.createObjectURL(input.files[0]);
						var img = new Image;
						img.onload = function() {
							/* if (img.width < 600 || img.height < 900) {
								alert("Minimum image size should be 600px X 900px");
								$('#target').attr('src', "");
								document.getElementById("sevaImage").value = null;
							} else { */
							$('#target3').css("min-height", "208px");
							$('#target3').css("min-width", "337px");

							$('#target3').attr('src', e.target.result);
							$('#target3').Jcrop({
								aspectRatio : 1 / 1.5,
								boxWidth : 600,
								boxHeight : 600,
								minSize : [ 100, 100 ],
								setSelect : [ 100, 100, 400, 400 ],
								onChange : setCoordinates3,
								onSelect : setCoordinates3
							});
							/* } */
						};

						img.src = u;
					}
					reader.readAsDataURL(input.files[0]);
				}
			}
			$("#frequencyImage").change(function() {
				readURL3(this);
			});
			$("#frequencyImage").click(function() {
				this.value = null;
			});
		});

		function setCoordinates3(c) {
			document.myForm_frequency.x3.value = Math.round(c.x);
			document.myForm_frequency.y3.value = Math.round(c.y);
			document.myForm_frequency.w3.value = Math.round(c.w);
			document.myForm_frequency.h3.value = Math.round(c.h);
		};

		function checkCoordinates3() {
			if (document.myForm_frequency.x3.value == ""
					|| document.myForm_frequency.y3.value == "") {
				alert("Please select a crop region");
				return false;
			} else {
				return true;
			}
		};
	</script>
</body>
</html>