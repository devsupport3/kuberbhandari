<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
</style>
</head>
<body>

	<!-- Header with Navbar -->
	<%@include file="header.jsp"%>

	<!--  <div class="container-fluid mt-5 sidebar-visible">
      <div class="row"> -->
	<!-- Sidebar -->
	<div class="row" ng-controller="SidebarController">
		<%@include file="sidebar.jsp"%>

		<!-- Form Container -->
		<div class="col-md-10" style="margin-top: 30px;"
			ng-controller="AdminManageSevaController">
			<div class="card-body">
				<div class="container-fluid">
					<div class="row">
						<div class="col-lg-12 col-md-12  col-sm-12 col-xl-12">
							<div class="card shadow mb-4">
								<!-- Card Header - Accordion -->
								<a href="#collapseCardSeva" class="d-block card-header py-3"
									data-toggle="collapse" role="button" aria-expanded="true"
									aria-controls="collapseCardExampleSeva"
									style="background-color: #ffad28;">
									<h6 class="m-0 font-weight-bold text-primary"
										style="color: black !important;">Seva</h6>
								</a>
								<!-- Card Content - Collapse -->
								<div class="collapse" id="collapseCardSeva">
									<div class="card-body" style="margin-top: -45px;">

										<!-- Main Form -->
										<form class="needs-validation" style="margin-top: 32px;">
											<div class="container-fluid py-4">
												<div class="form-group row">
													<!-- Sequence Input -->
													<div class="col-md-4 col-sm-12 mb-3">
														<input class="form-control" placeholder="Sequence"
															type="text" ng-model="seva.sequence">
													</div>

													<!-- Title -->
													<div class="col-md-4 col-sm-12 mb-3">
														<input class="form-control" placeholder="Title"
															type="text" ng-model="seva.sevaTitle">
													</div>

													<!-- Sub-Title -->
													<div class="col-md-4 col-sm-12 mb-3">
														<input class="form-control" placeholder="Sub-Title"
															type="text" ng-model="seva.sevaSubtitle">
													</div>
												</div>

												<div class="form-group row">
													<!-- Seva Type and Seva Type (+) Button -->
													<div class="col-md-4 col-sm-12 mb-3">
														<div class="d-flex" style="position: relative;">
															<!-- Seva Type Select Dropdown -->
															<select id="seva-type" name="seva-type"
																class="form-control mr-2 custom-select"
																ng-model="seva.sevaTypeId">
																<option value="" disabled selected>Select Seva
																	Type</option>
																<option ng-repeat="sevaType in sevaTypeList"
																	ng-value="{{sevaType.sevaTypeId}}">{{sevaType.sevaTypeName}}</option>
															</select>
															<!-- Seva Type (+) Button -->
															<button type="button" class="btn btn-info"
																data-toggle="modal" data-target="#sevaTypeModal"
																style="margin-top: 10px; background-color: #444; border-color: #444;">+</button>
														</div>
													</div>

													<!-- Modal for Seva Type -->
													<div class="modal fade" id="sevaTypeModal" tabindex="-1"
														role="dialog" aria-labelledby="sevaTypeModalLabel"
														aria-hidden="true">
														<div class="modal-dialog" role="document">
															<div class="modal-content">
																<div class="modal-header">
																	<h5 class="modal-title" id="sevaTypeModalLabel">Add
																		Seva Type</h5>
																	<button type="button" class="close"
																		data-dismiss="modal" aria-label="Close">
																		<span aria-hidden="true">&times;</span>
																	</button>
																</div>
																<div class="modal-body">
																	<form class="" name="myForm_sevaType">
																		<div class="form-group">
																			<label for="sevaTypeName">Seva Type Name</label> <input
																				type="text" class="form-control" id="sevaTypeName"
																				placeholder="Enter Seva Type Name"
																				ng-model="newSevaType.sevaTypeName">
																		</div>
																		<div class="form-group">
																			<label for="sevaTypeDescription">Description</label>
																			<textarea class="form-control"
																				id="sevaTypeDescription" rows="3"
																				placeholder="Enter Seva Type Description"
																				ng-model="newSevaType.description"></textarea>
																		</div>
																		<div class="form-group">
																			<input type="file" id="sevaTypeImage"
																				name="sevaTypeImage" class="form-control">
																		</div>
																		<div class="form-group" style="margin-left: 22px;">
																			<input class="form-check-input" type="checkbox"
																				id="sevaTypeSwitch" ng-model="isSevaTypeActive"
																				ng-change="sevaTypeToggle()"> <label
																				class="form-check-label" for="sevaTypeSwitch">
																				Active/Inactive </label>
																		</div>
																		<div class="row text-center">
																			<div class="col-md-4">
																				<img src="" id="target1" /> <input type="hidden"
																					name="x1" id="valuex1" ng-model="valuex1" /> <input
																					type="hidden" name="y1" id="valuey1"
																					ng-model="valuey1" /> <input type="hidden"
																					name="w1" id="valuew1" ng-model="valuew1" /> <input
																					type="hidden" name="h1" id="valueh1"
																					ng-model="valueh1" />
																			</div>
																		</div>
																	</form>
																</div>
																<div class="modal-footer">
																	<button type="button" class="btn btn-secondary"
																		data-dismiss="modal" ng-click="sevaTypeCloseModal()">Close</button>
																	<button type="button" class="btn btn-primary"
																		style="background-color: #6c757d; border-color: #6c757d;"
																		data-dismiss="modal" ng-click="addSevaType()">Submit</button>
																</div>
															</div>
														</div>
													</div>

													<!-- Seva Category and Seva Category (+) Button -->
													<div class="col-md-4 col-sm-12 mb-3">
														<div class="d-flex" style="position: relative;">
															<!-- Seva Category Select Dropdown -->
															<select id="seva-category" name="seva-category"
																class="form-control mr-2 custom-select"
																ng-model="seva.sevaCategoryId">
																<option value="" disabled selected>Select Seva
																	Category</option>
																<option ng-repeat="sevaCategory in sevaCategoriesList"
																	ng-value="{{sevaCategory.sevaCategoryId}}">{{sevaCategory.sevaCategoryName}}</option>
															</select>
															<!-- Seva Category (+) Button -->
															<button type="button" class="btn btn-info"
																data-toggle="modal" data-target="#sevaCategoryModal"
																style="margin-top: 10px; background-color: #444; border-color: #444;">+</button>
														</div>
													</div>

													<!-- Modal for Seva Category -->
													<div class="modal fade" id="sevaCategoryModal"
														tabindex="-1" role="dialog"
														aria-labelledby="sevaCategoryModalLabel"
														aria-hidden="true">
														<div class="modal-dialog" role="document">
															<div class="modal-content">
																<div class="modal-header">
																	<h5 class="modal-title" id="sevaCategoryModalLabel">Add
																		Seva Category</h5>
																	<button type="button" class="close"
																		data-dismiss="modal" aria-label="Close">
																		<span aria-hidden="true">&times;</span>
																	</button>
																</div>
																<div class="modal-body">
																	<form class="" name="myForm_sevaCategory">
																		<div class="form-group">
																			<label for="sevaCategoryName">Seva Category
																				Name</label> <input type="text" class="form-control"
																				id="sevaCategoryName"
																				placeholder="Enter Seva Category Name"
																				ng-model="newSevaCategory.sevaCategoryName">
																		</div>
																		<div class="form-group">
																			<label for="sevaCategoryDescription">Description</label>
																			<textarea class="form-control"
																				id="sevaCategoryDescription" rows="3"
																				placeholder="Enter Seva Category Description"
																				ng-model="newSevaCategory.description"></textarea>
																		</div>
																		<div class="form-group">
																			<input type="file" id="sevaCategoryImage"
																				name="sevaCategoryImage" class="form-control">
																		</div>
																		<div class="form-group" style="margin-left: 22px;">
																			<input class="form-check-input" type="checkbox"
																				id="sevaCategorySwitch"
																				ng-model="isSevaCategoryActive"
																				ng-change="sevaCategoryToggle()"> <label
																				class="form-check-label" for="sevaCategorySwitch">
																				Active/Inactive </label>
																		</div>
																		<div class="row text-center">
																			<div class="col-md-4">
																				<img src="" id="target2" /> <input type="hidden"
																					name="x2" id="valuex2" ng-model="valuex2" /> <input
																					type="hidden" name="y2" id="valuey2"
																					ng-model="valuey2" /> <input type="hidden"
																					name="w2" id="valuew2" ng-model="valuew2" /> <input
																					type="hidden" name="h2" id="valueh2"
																					ng-model="valueh2" />
																			</div>
																		</div>
																	</form>
																</div>
																<div class="modal-footer">
																	<button type="button" class="btn btn-secondary"
																		data-dismiss="modal"
																		ng-click="sevaCategoryCloseModal()">Close</button>
																	<button type="button" class="btn btn-primary"
																		style="background-color: #6c757d; border-color: #6c757d;"
																		data-dismiss="modal" ng-click="addSevaCategory()">Submit</button>
																</div>
															</div>
														</div>
													</div>

													<!-- Variation -->
													<div class="col-md-4 col-sm-12 mb-3">
														<div class="d-flex align-items-center"
															style="position: relative;">
															<!-- Variation Select Dropdown -->
															<select id="variation" name="variation"
																class="form-control mr-2 custom-select"
																ng-model="seva.variationId">
																<option value="" disabled selected>Select
																	Variation</option>
																<option ng-repeat="variation in variationList"
																	ng-value="{{variation.variationId}}">{{variation.variationName}}</option>
															</select>
															<!-- (+) Button for Variation Modal -->
															<button type="button" class="btn btn-info"
																data-toggle="modal" data-target="#variationModal"
																style="margin-top: 10px; background-color: #444; border-color: #444;">+</button>
														</div>
													</div>

													<!-- Modal for Variation -->
													<div class="modal fade" id="variationModal" tabindex="-1"
														role="dialog" aria-labelledby="variationModalLabel"
														aria-hidden="true">
														<div class="modal-dialog" role="document">
															<div class="modal-content">
																<div class="modal-header">
																	<h5 class="modal-title" id="variationModalLabel">Add
																		Variation</h5>
																	<button type="button" class="close"
																		data-dismiss="modal" aria-label="Close">
																		<span aria-hidden="true">&times;</span>
																	</button>
																</div>
																<div class="modal-body">
																	<form class="" name="myForm_variation">
																		<div class="form-group">
																			<label for="variationName">Variation Name</label> <input
																				type="text" class="form-control" id="variationName"
																				placeholder="Enter Variation Name"
																				ng-model="newVariation.variationName">
																		</div>
																		<div class="form-group">
																			<label for="variationDescription">Description</label>
																			<textarea class="form-control"
																				id="variationDescription" rows="3"
																				placeholder="Enter Variation Description"
																				ng-model="newVariation.description"></textarea>
																		</div>
																		<div class="form-group">
																			<input type="file" id="variationImage"
																				name="variationImage" class="form-control">
																		</div>
																		<div class="form-group" style="margin-left: 22px;">
																			<input class="form-check-input" type="checkbox"
																				id="variationSwitch" ng-model="isVariationActive"
																				ng-change="variationToggle()"> <label
																				class="form-check-label" for="variationSwitch">
																				Active/Inactive </label>
																		</div>
																		<div class="row text-center">
																			<div class="col-md-4">
																				<img src="" id="target3" /> <input type="hidden"
																					name="x3" id="valuex3" ng-model="valuex3" /> <input
																					type="hidden" name="y3" id="valuey3"
																					ng-model="valuey3" /> <input type="hidden"
																					name="w3" id="valuew3" ng-model="valuew3" /> <input
																					type="hidden" name="h3" id="valueh3"
																					ng-model="valueh3" />
																			</div>
																		</div>
																	</form>
																</div>
																<div class="modal-footer">
																	<button type="button" class="btn btn-secondary"
																		data-dismiss="modal" ng-click="variationCloseModal()">Close</button>
																	<button type="button" class="btn btn-primary"
																		style="background-color: #6c757d; border-color: #6c757d;"
																		data-dismiss="modal" ng-click="addVariation()">Submit</button>
																</div>
															</div>
														</div>
													</div>
												</div>

												<div class="form-group row">
													<!-- Frequency -->
													<div class="col-md-4 col-sm-12 mb-3">
														<div class="d-flex" style="position: relative;">
															<!-- Frequency Select Dropdown -->
															<select id="frequency" name="frequency"
																class="form-control mr-2 custom-select"
																ng-model="seva.frequencyId">
																<option value="" disabled selected>Select
																	Frequency</option>
																<option ng-repeat="frequency in frequencyList"
																	ng-value="{{frequency.frequencyId}}">{{frequency.frequencyName}}</option>
															</select>
															<!-- Frequency (+) Button -->
															<button type="button" class="btn btn-info"
																data-toggle="modal" data-target="#frequencyModal"
																style="margin-top: 10px; background-color: #444; border-color: #444;">+</button>
														</div>
													</div>

													<!-- Modal for frequency -->
													<div class="modal fade" id="frequencyModal" tabindex="-1"
														role="dialog" aria-labelledby="frequencyModalLabel"
														aria-hidden="true">
														<div class="modal-dialog" role="document">
															<div class="modal-content">
																<div class="modal-header">
																	<h5 class="modal-title" id="frequencyModalLabel">Add
																		Frequency</h5>
																	<button type="button" class="close"
																		data-dismiss="modal" aria-label="Close">
																		<span aria-hidden="true">&times;</span>
																	</button>
																</div>
																<div class="modal-body">
																	<form class="" name="myForm_frequency">
																		<div class="form-group">
																			<label for="frequencyName">Frequency Name</label> <input
																				type="text" class="form-control" id="frequencyName"
																				placeholder="Enter Frequency Name"
																				ng-model="newFrequency.frequencyName">
																		</div>
																		<div class="form-group">
																			<label for="frequencyDescription">Description</label>
																			<textarea class="form-control"
																				id="frequencyDescription" rows="3"
																				placeholder="Enter Frequency Description"
																				ng-model="newFrequency.description"></textarea>
																		</div>
																		<div class="form-group">
																			<input type="file" id="frequencyImage"
																				name="frequencyImage" class="form-control">
																		</div>
																		<div class="form-group" style="margin-left: 22px;">
																			<input class="form-check-input" type="checkbox"
																				id="frequencySwitch" ng-model="isFrequencyActive"
																				ng-change="frequencyToggle()"> <label
																				class="form-check-label" for="frequencySwitch">
																				Active/Inactive </label>
																		</div>
																		<div class="row text-center">
																			<div class="col-md-4">
																				<img src="" id="target4" /> <input type="hidden"
																					name="x4" id="valuex4" ng-model="valuex4" /> <input
																					type="hidden" name="y4" id="valuey4"
																					ng-model="valuey4" /> <input type="hidden"
																					name="w4" id="valuew4" ng-model="valuew4" /> <input
																					type="hidden" name="h4" id="valueh4"
																					ng-model="valueh4" />
																			</div>
																		</div>
																	</form>
																</div>
																<div class="modal-footer">
																	<button type="button" class="btn btn-secondary"
																		data-dismiss="modal" ng-click="frequencyCloseModal()">Close</button>
																	<button type="button" class="btn btn-primary"
																		style="background-color: #6c757d; border-color: #6c757d;"
																		data-dismiss="modal" ng-click="addFrequency()">Submit</button>
																</div>
															</div>
														</div>
													</div>

													<!-- Amount -->
													<div class="col-md-4 col-sm-12 mb-3">
														<div class="input-group">
															<div class="input-group-prepend">
																<span class="input-group-text" style="margin-top: 10px;">₹</span>
															</div>
															<input class="form-control" placeholder="Amount"
																type="text" ng-model="seva.sevaPrice">
														</div>
													</div>

													<!-- Book Before Days -->
													<div class="col-md-4 col-sm-12 mb-3">
														<input class="form-control" placeholder="Book before days"
															type="text" ng-model="seva.bookBeforeDays">
													</div>
												</div>

												<div class="form-group row">
													<div class="col-md-4 col-sm-12 mb-3">
														<input class="form-control" placeholder="Image Title"
															type="text" ng-model="sevaImages.imageTitle">
													</div>
													<div class="col-md-4 col-sm-12 mb-3">
														<input class="form-control"
															placeholder="Image Description" type="text"
															ng-model="sevaImages.imageDescription">
													</div>
													<div class="col-md-4 col-sm-12 mb-3">
														<div class="form-check form-switch">
															<input class="form-check-input" type="checkbox"
																id="sevaDeliverySwitch" ng-model="isSevaDeliveryActive"
																ng-change="sevaDeliveryToggle()"> <label
																class="form-check-label" for="sevaDeliverySwitch">
																Delivery </label>
														</div>
													</div>
												</div>

												<div class="row">
													<div class="col-md-12">
														<div class="form-group">
															<input type="file" id="sevaImage" name="sevaImage"
																class="form-control">
															<p>Upload minimum 600 * 900 size image for better
																appereance</p>
														</div>
														<br>
													</div>
													<div class="row text-center">
														<div class="col-md-4">
															<img src="" id="target" />
															<form name="myForm">
																<input type="hidden" name="x" id="valuex"
																	ng-model="valuex" /> <input type="hidden" name="y"
																	id="valuey" ng-model="valuey" /> <input type="hidden"
																	name="w" id="valuew" ng-model="valuew" /> <input
																	type="hidden" name="h" id="valueh" ng-model="valueh" />
															</form>
														</div>
													</div>
												</div>

												<br>

												<!-- Description -->
												<div class="form-group row">
													<!-- <div class="col-md-12 mb-3 d-flex align-items-start"> -->
													<div class="col-md-12 mb-3">
														<textarea class="form-control mr-2" id="sevaDescription"
															name="sevaDescription" placeholder="Description" rows="4"
															ng-model="seva.sevaDescription"></textarea>
														<!-- Add Button -->
														<!-- <button type="button" class="btn btn-success"
															ng-click="addSeva()"
															style="height: fit-content; margin-top: 45px; background-color: #444; border-color: #444; margin-left: 34px;">Add</button> -->
													</div>
												</div>

												<!-- 	<div class="row">
													<div class="col-md-12">
														<table class="table table-striped" width="100%">
															<tbody>
																<tr>
																	<th>Title</th>
																	<th>Sub-title</th>
																	<th>B.B.D</th>
																	<th>Variation</th>
																	<th>Frequency</th>
																	<th>Amount</th>
																	<th>Description</th>
																	<th>Image</th>
																	<th>Del</th>
																</tr>
																<tr ng-repeat="item in sevas">
																	<td>{{item.sevaTitle}}</td>
																	<td>{{item.sevaSubtitle}}</td>
																	<td>{{item.bookBeforeDays}}</td>
																	<td>{{seva.variationName}}</td>
																	<td>{{seva.frequencyName}}</td>
																	<td>{{item.sevaPrice}}</td>
																	<td>{{item.sevaDescription}}</td>
																	<td><img ng-src="{{item.sevaImages}}" alt="Seva Image"
																		class="img-thumbnail" width="50" height="50"></td>
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
												</div> -->

												<!-- Submit Button -->
												<div class="form-group">
													<button type="back" class="btn btn-success"
														style="background-color: #444; border-color: #444; text-align: center;"
														ng-click="backSevaData()">Back</button>
													<button type="submit" class="btn btn-success"
														style="background-color: #444; border-color: #444;"
														ng-click="seva.sevaId > 0 ? updateSeva() : addAllSeva()">Submit</button>
													<button type="clear" class="btn btn-success"
														style="background-color: #444; border-color: #444;"
														ng-click="clearSevaData()">Clear</button>
												</div>
											</div>
										</form>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

				<!-- Seva List Table -->
				<div class="card mt-4" style="margin: 15px;">
					<div class="card-header"
						style="background-color: #ffad28; color: white; height: 50px;">
						<h3 style="font-size: 1.30rem; color: black !important;">Seva
							List</h3>
					</div>
					<div class="card-body">
						<div class="table-responsive">
							<table class="table table-bordered">
								<thead>
									<tr>
										<th>#</th>
										<th>Title</th>
										<th>Variation</th>
										<th>Frequency</th>
										<th>Description</th>
										<th>Amount(₹)</th>
										<th>B.B.D</th>
										<th>Image</th>
										<th></th>
									</tr>
								</thead>
								<tbody>
									<tr ng-repeat="seva in sevaList" ng-click="editSeva(seva)"
										style="cursor: pointer">
										<td ng-click="GetSevaById(seva); openCollapse()"
											title="Update seva" data-bs-toggle="modal"
											data-bs-target="#updateModal">{{$index + 1}}</td>
										<td ng-click="GetSevaById(seva); openCollapse()"
											title="Update seva" data-bs-toggle="modal"
											data-bs-target="#updateModal">{{seva.sevaTitle}}</td>
										<td ng-click="GetSevaById(seva); openCollapse()"
											title="Update seva" data-bs-toggle="modal"
											data-bs-target="#updateModal">{{seva.variationName}}</td>
										<td ng-click="GetSevaById(seva); openCollapse()"
											title="Update seva" data-bs-toggle="modal"
											data-bs-target="#updateModal">{{seva.frequencyName}}</td>
										<td ng-click="GetSevaById(seva); openCollapse()"
											title="Update seva" data-bs-toggle="modal"
											data-bs-target="#updateModal">
											<p ng-bind-html="seva.sevaDescription | to_trusted"></p>
										</td>
										<td ng-click="GetSevaById(seva); openCollapse()"
											title="Update seva" data-bs-toggle="modal"
											data-bs-target="#updateModal">{{seva.sevaPrice}}</td>
										<td ng-click="GetSevaById(seva); openCollapse()"
											title="Update seva" data-bs-toggle="modal"
											data-bs-target="#updateModal">{{seva.bookBeforeDays}}</td>
										<td>
											<div class="widget-thumb"
												ng-repeat="sevaImage in seva.sevaImages">
												<a href="#" ng-click="GetsevaById(seva); openCollapse()">
													<img
													ng-src="<%=request.getContextPath()%>/resources/front/demo-images/imgseva/{{sevaImage.sevaImages}}"
													alt="image" class="img-thumbnail"
													style="width: 50px; height: 50px;">
												</a>
											</div>
										</td>
										<td class="text-center align-middle"><input
											type="checkbox" ng-model="seva.selected"></td>
									</tr>
								</tbody>
							</table>
						</div>

						<div class="form-group text-end mt-3" style="float: right;">
							<button type="button" id="Delete" name="submit"
								class="btn btn-danger" ng-click="deleteSeva()">
								<i class="fas fa-trash"></i>
							</button>
						</div>
					</div>

					<!-- 	<div class="pagination-container">
						Left button with custom SVG arrow
						<button type="submit" class="pagination-btn"
							ng-disabled="currentPage === 1" ng-click="prevPage()">
							<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                    <path
									d="M15.41 16.59L10.83 12l4.58-4.59L14 6l-6 6 6 6z" />
                  </svg>
						</button>
						Page number display
						<span class="page-numbers"> Page <span class="current-page">{{
								currentPage }}</span> of <span class="total-pages">{{ totalPages
								}}</span>
						</span>
						Right button with custom SVG arrow
						<button type="submit" class="pagination-btn"
							ng-disabled="currentPage === totalPages" ng-click="nextPage()">
							<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                    <path
									d="M8.59 16.59L13.17 12l-4.58-4.59L10 6l6 6-6 6z" />
                  </svg>
						</button>
					</div> -->
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

	<!-- Script For CKEditor Start -->
	<script>
		//Initialize the Editor
		initEditor();

		//Replace the <textarea id="editor1"> with an CKEditor instance.  
		function initEditor() {
			CKEDITOR.replace('sevaDescription', {
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
			$("#sevaImage").change(function() {
				readURL(this);
			});
			$("#sevaImage").click(function() {
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
			$("#sevaTypeImage").change(function() {
				readURL1(this);
			});
			$("#sevaTypeImage").click(function() {
				this.value = null;
			});
		});

		function setCoordinates1(c) {
			document.myForm_sevaType.x1.value = Math.round(c.x);
			document.myForm_sevaType.y1.value = Math.round(c.y);
			document.myForm_sevaType.w1.value = Math.round(c.w);
			document.myForm_sevaType.h1.value = Math.round(c.h);
		};

		function checkCoordinates1() {
			if (document.myForm_sevaType.x1.value == ""
					|| document.myForm_sevaType.y1.value == "") {
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
			$("#sevaCategoryImage").change(function() {
				readURL2(this);
			});
			$("#sevaCategoryImage").click(function() {
				this.value = null;
			});
		});

		function setCoordinates2(c) {
			document.myForm_sevaCategory.x2.value = Math.round(c.x);
			document.myForm_sevaCategory.y2.value = Math.round(c.y);
			document.myForm_sevaCategory.w2.value = Math.round(c.w);
			document.myForm_sevaCategory.h2.value = Math.round(c.h);
		};

		function checkCoordinates2() {
			if (document.myForm_sevaCategory.x2.value == ""
					|| document.myForm_sevaCategory.y2.value == "") {
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
			$("#variationImage").change(function() {
				readURL3(this);
			});
			$("#variationImage").click(function() {
				this.value = null;
			});
		});

		function setCoordinates3(c) {
			document.myForm_variation.x3.value = Math.round(c.x);
			document.myForm_variation.y3.value = Math.round(c.y);
			document.myForm_variation.w3.value = Math.round(c.w);
			document.myForm_variation.h3.value = Math.round(c.h);
		};

		function checkCoordinates3() {
			if (document.myForm_variation.x3.value == ""
					|| document.myForm_variation.y3.value == "") {
				alert("Please select a crop region");
				return false;
			} else {
				return true;
			}
		};
	</script>
	<script>
		jQuery(function($) {
			function readURL4(input) {
				if (input.files && input.files[0]) {
					var reader = new FileReader();
					reader.onload = function(e) {
						if ($('#target4').data('Jcrop')) {
							$('#target4').data('Jcrop').destroy();
							$('#target4').removeAttr('style');
						}

						var u = URL.createObjectURL(input.files[0]);
						var img = new Image;
						img.onload = function() {
							/* if (img.width < 600 || img.height < 900) {
								alert("Minimum image size should be 600px X 900px");
								$('#target').attr('src', "");
								document.getElementById("sevaImage").value = null;
							} else { */
							$('#target4').css("min-height", "208px");
							$('#target4').css("min-width", "337px");

							$('#target4').attr('src', e.target.result);
							$('#target4').Jcrop({
								aspectRatio : 1 / 1.5,
								boxWidth : 600,
								boxHeight : 600,
								minSize : [ 100, 100 ],
								setSelect : [ 100, 100, 400, 400 ],
								onChange : setCoordinates4,
								onSelect : setCoordinates4
							});
							/* } */
						};

						img.src = u;
					}
					reader.readAsDataURL(input.files[0]);
				}
			}
			$("#frequencyImage").change(function() {
				readURL4(this);
			});
			$("#frequencyImage").click(function() {
				this.value = null;
			});
		});

		function setCoordinates4(c) {
			document.myForm_frequency.x4.value = Math.round(c.x);
			document.myForm_frequency.y4.value = Math.round(c.y);
			document.myForm_frequency.w4.value = Math.round(c.w);
			document.myForm_frequency.h4.value = Math.round(c.h);
		};

		function checkCoordinates4() {
			if (document.myForm_frequency.x4.value == ""
					|| document.myForm_frequency.y4.value == "") {
				alert("Please select a crop region");
				return false;
			} else {
				return true;
			}
		};
	</script>
</body>
</html>