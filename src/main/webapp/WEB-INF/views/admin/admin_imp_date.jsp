<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" ng-app="kuberbhandari">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Important Dates</title>

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

.radio-group {
	display: flex;
	gap: 15px;
	align-items: center;
	margin-top: 17px;
	margin-left: 18px;
}

.radio-group input {
	margin-right: 5px;
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
			ng-controller="AdminManageImpDatesController">
			<div class="card-body">
				<div class="container-fluid">
					<div class="row">
						<div class="col-lg-12 col-md-12  col-sm-12 col-xl-12">
							<div class="card shadow mb-4">
								<!-- Card Header - Accordion -->
								<a href="#collapseCardImpDates" class="d-block card-header py-3"
									data-toggle="collapse" role="button" aria-expanded="true"
									aria-controls="collapseCardExampleImpDates"
									style="background-color: #ffad28;">
									<h6 class="m-0 font-weight-bold text-primary"
										style="color: black !important;">Important Dates</h6>
								</a>
								<!-- Card Content - Collapse -->
								<div class="collapse" id="collapseCardImpDates">
									<div class="card-body" style="margin-top: -45px;">

										<!-- Main Form -->
										<form class="needs-validation" name="myForm"
											style="margin-top: 32px;">
											<div class="container-fluid py-4">
												<div class="form-group row">

													<!-- Title -->
													<div class="col-md-4 col-sm-12 mb-3">
														<div class="d-flex" style="position: relative;">
															<select id="festival" name="festival"
																class="form-control mr-2 custom-select"
																ng-model="date.festivalId">
																<option value="" disabled selected>Select
																	Festivals</option>
																<option ng-repeat="festival in festivalList"
																	ng-value="{{festival.festivalId}}">{{festival.festivalName}}</option>
															</select>
															<button type="button" class="btn btn-info"
																data-toggle="modal" data-target="#festivalModal"
																style="margin-top: 10px; background-color: #444; border-color: #444;">+</button>
														</div>
													</div>

													<!-- Modal for Festival -->
													<div class="modal fade" id="festivalModal" tabindex="-1"
														role="dialog" aria-labelledby="festivalModalLabel"
														aria-hidden="true">
														<div class="modal-dialog" role="document">
															<div class="modal-content">
																<div class="modal-header">
																	<h5 class="modal-title" id="festivalModalLabel">Add
																		Festival</h5>
																	<button type="button" class="close"
																		data-dismiss="modal" aria-label="Close">
																		<span aria-hidden="true">&times;</span>
																	</button>
																</div>
																<div class="modal-body">
																	<form>
																		<div class="form-group">
																			<label for="festivalName">Festival Name</label> <input
																				type="text" class="form-control" id="festivalName"
																				placeholder="Enter Festival Name"
																				ng-model="newFestival.festivalName">
																		</div>
																		<div class="form-group">
																			<label for="festivalDescription">Description</label>
																			<textarea class="form-control"
																				id="festivalDescription" rows="3"
																				placeholder="Enter Festival Description"
																				ng-model="newFestival.description"></textarea>
																		</div>
																	</form>
																</div>
																<div class="modal-footer">
																	<button type="button" class="btn btn-secondary"
																		data-dismiss="modal" ng-click="festivalCloseModal()">Close</button>
																	<button type="button" class="btn btn-primary"
																		style="background-color: #6c757d; border-color: #6c757d;"
																		data-dismiss="modal" ng-click="addFestival()">Submit</button>
																</div>
															</div>
														</div>
													</div>

													<!-- Date Selection -->
													<div class="col-md-4 col-sm-12 mb-3">
														<input type="date" class="form-control" id="englishDate"
															ng-model="date.englishDate" min="{{minDate}}" required
															ng-change="updateDay()">
													</div>

													<!-- Display Selected Day -->
													<div class="col-md-4 col-sm-12 mb-3">
														<input type="text" class="form-control" id="englishDay"
															ng-model="date.englishDay" placeholder="Day" readonly>
													</div>
												</div>

												<div class="form-group row">
													<!-- Samvat -->
													<div class="col-md-4 col-sm-12 mb-3">
														<div class="d-flex" style="position: relative;">
															<select id="samvat" name="samvat"
																class="form-control mr-2 custom-select"
																ng-model="date.samvatId">
																<option value="" disabled selected>Select
																	Samvat</option>
																<option ng-repeat="samvat in samvatList"
																	ng-value="{{samvat.samvatId}}">{{samvat.samvatName}}</option>
															</select>
															<button type="button" class="btn btn-info"
																data-toggle="modal" data-target="#samvatModal"
																style="margin-top: 10px; background-color: #444; border-color: #444;">+</button>
														</div>
													</div>

													<!-- Modal for Samvat -->
													<div class="modal fade" id="samvatModal" tabindex="-1"
														role="dialog" aria-labelledby="samvatModalLabel"
														aria-hidden="true">
														<div class="modal-dialog" role="document">
															<div class="modal-content">
																<div class="modal-header">
																	<h5 class="modal-title" id="samvatModalLabel">Add
																		Samvat</h5>
																	<button type="button" class="close"
																		data-dismiss="modal" aria-label="Close">
																		<span aria-hidden="true">&times;</span>
																	</button>
																</div>
																<div class="modal-body">
																	<form>
																		<div class="form-group">
																			<label for="samvatName">Samvat Name</label> <input
																				type="text" class="form-control" id="samvatName"
																				placeholder="Enter Samvat Name"
																				ng-model="newSamvat.samvatName">
																		</div>
																		<div class="form-group">
																			<label for="samvatDescription">Description</label>
																			<textarea class="form-control" id="samvatDescription"
																				rows="3" placeholder="Enter Samvat Description"
																				ng-model="newSamvat.description"></textarea>
																		</div>
																	</form>
																</div>
																<div class="modal-footer">
																	<button type="button" class="btn btn-secondary"
																		data-dismiss="modal" ng-click="samvatCloseModal()">Close</button>
																	<button type="button" class="btn btn-primary"
																		style="background-color: #6c757d; border-color: #6c757d;"
																		data-dismiss="modal" ng-click="addSamvat()">Submit</button>
																</div>
															</div>
														</div>
													</div>

													<div class="col-md-4 col-sm-12 mb-3">
														<div class="d-flex" style="position: relative;">
															<select id="hinduYear" name="hinduYear"
																class="form-control mr-2 custom-select"
																ng-model="date.hinduYearId">
																<option value="" disabled selected>Select Hindu
																	Year</option>
																<option ng-repeat="hinduYear in hinduYearList"
																	ng-value="{{hinduYear.hinduYearId}}">{{hinduYear.hinduYear}}</option>
															</select>
															<button type="button" class="btn btn-info"
																data-toggle="modal" data-target="#hinduYearModal"
																style="margin-top: 10px; background-color: #444; border-color: #444;">+</button>
														</div>
													</div>

													<!-- Modal for Hindu Year -->
													<div class="modal fade" id="hinduYearModal" tabindex="-1"
														role="dialog" aria-labelledby="hinduYearModalLabel"
														aria-hidden="true">
														<div class="modal-dialog" role="document">
															<div class="modal-content">
																<div class="modal-header">
																	<h5 class="modal-title" id="hinduYearModalLabel">Add
																		Hindu Year</h5>
																	<button type="button" class="close"
																		data-dismiss="modal" aria-label="Close">
																		<span aria-hidden="true">&times;</span>
																	</button>
																</div>
																<div class="modal-body">
																	<form>
																		<div class="form-group">
																			<label for="hinduYearName">Hindu Year</label> <input
																				type="text" class="form-control" id="hinduYearName"
																				placeholder="Enter Hindu Year"
																				ng-model="newHinduYear.hinduYear">
																		</div>
																		<div class="form-group">
																			<label for="hinduYearDescription">Description</label>
																			<textarea class="form-control"
																				id="hinduYearDescription" rows="3"
																				placeholder="Enter Hindu Year Description"
																				ng-model="newHinduYear.description"></textarea>
																		</div>
																	</form>
																</div>
																<div class="modal-footer">
																	<button type="button" class="btn btn-secondary"
																		data-dismiss="modal" ng-click="hinduYearCloseModal()">Close</button>
																	<button type="button" class="btn btn-primary"
																		style="background-color: #6c757d; border-color: #6c757d;"
																		data-dismiss="modal" ng-click="addHinduYear()">Submit</button>
																</div>
															</div>
														</div>
													</div>

													<div class="col-md-4 col-sm-12 mb-3">
														<div class="d-flex" style="position: relative;">
															<select id="hinduMonth" name="hinduMonth"
																class="form-control mr-2 custom-select"
																ng-model="date.hinduMonthId">
																<option value="" disabled selected>Select Hindu
																	Month</option>
																<option ng-repeat="hinduMonth in hinduMonthList"
																	ng-value="{{hinduMonth.hinduMonthId}}">{{hinduMonth.hinduMonthName}}</option>
															</select>
															<button type="button" class="btn btn-info"
																data-toggle="modal" data-target="#hinduMonthModal"
																style="margin-top: 10px; background-color: #444; border-color: #444;">+</button>
														</div>
													</div>

													<!-- Modal for Hindu Month -->
													<div class="modal fade" id="hinduMonthModal" tabindex="-1"
														role="dialog" aria-labelledby="hinduMonthModalLabel"
														aria-hidden="true">
														<div class="modal-dialog" role="document">
															<div class="modal-content">
																<div class="modal-header">
																	<h5 class="modal-title" id="hinduMonthModalLabel">Add
																		Hindu Month</h5>
																	<button type="button" class="close"
																		data-dismiss="modal" aria-label="Close">
																		<span aria-hidden="true">&times;</span>
																	</button>
																</div>
																<div class="modal-body">
																	<form>
																		<div class="form-group">
																			<label for="hinduMonthName">Hindu Month Name</label>
																			<input type="text" class="form-control"
																				id="hinduMonth" placeholder="Enter Hindu Month Name"
																				ng-model="newHinduMonth.hinduMonthName">
																		</div>
																		<div class="form-group">
																			<label for="hinduMonthDescription">Description</label>
																			<textarea class="form-control"
																				id="hinduMonthDescription" rows="3"
																				placeholder="Enter Hindu Month Description"
																				ng-model="newHinduMonth.description"></textarea>
																		</div>
																	</form>
																</div>
																<div class="modal-footer">
																	<button type="button" class="btn btn-secondary"
																		data-dismiss="modal" ng-click="hinduMonthcloseModal()">Close</button>
																	<button type="button" class="btn btn-primary"
																		style="background-color: #6c757d; border-color: #6c757d;"
																		data-dismiss="modal" ng-click="addHinduMonth()">Submit</button>
																</div>
															</div>
														</div>
													</div>
												</div>

												<div class="form-group row">
													<div class="col-md-4 col-sm-12 mb-3">
														<div class="d-flex" style="position: relative;">
															<select id="hinduPaksh" name="hinduPaksh"
																class="form-control mr-2 custom-select"
																ng-model="date.hinduPakshId">
																<option value="" disabled selected>Select Hindu
																	Paksh</option>
																<option ng-repeat="hinduPaksh in hinduPakshList"
																	ng-value="{{hinduPaksh.hinduPakshId}}">{{hinduPaksh.pakshName}}</option>
															</select>
															<button type="button" class="btn btn-info"
																data-toggle="modal" data-target="#hinduPakshModal"
																style="margin-top: 10px; background-color: #444; border-color: #444;">+</button>
														</div>
													</div>

													<!-- Modal for paksh -->
													<div class="modal fade" id="hinduPakshModal" tabindex="-1"
														role="dialog" aria-labelledby="hinduPakshModalLabel"
														aria-hidden="true">
														<div class="modal-dialog" role="document">
															<div class="modal-content">
																<div class="modal-header">
																	<h5 class="modal-title" id="hinduPakshModalLabel">Add
																		Hindu Paksh</h5>
																	<button type="button" class="close"
																		data-dismiss="modal" aria-label="Close">
																		<span aria-hidden="true">&times;</span>
																	</button>
																</div>
																<div class="modal-body">
																	<form>
																		<div class="form-group">
																			<label for="hinduPakshName">Hindu Paksh Name</label>
																			<input type="text" class="form-control"
																				id="hinduPakshName"
																				placeholder="Enter Hindu Paksh Name"
																				ng-model="newHinduPaksh.pakshName">
																		</div>
																		<div class="form-group">
																			<label for="hinduPakshDescription">Description</label>
																			<textarea class="form-control"
																				id="hinduPakshDescription" rows="3"
																				placeholder="Enter Hindu Paksh Description"
																				ng-model="newHinduPaksh.description"></textarea>
																		</div>
																	</form>
																</div>
																<div class="modal-footer">
																	<button type="button" class="btn btn-secondary"
																		data-dismiss="modal" ng-click="hinduPakshcloseModal()">Close</button>
																	<button type="button" class="btn btn-primary"
																		style="background-color: #6c757d; border-color: #6c757d;"
																		data-dismiss="modal" ng-click="addHinduPaksh()">Submit</button>
																</div>
															</div>
														</div>
													</div>

													<!-- Tithi Number Dropdown -->
													<div class="col-md-4 col-sm-12 mb-3">
														<div class="d-flex" style="position: relative;">
															<select id="tithiNumber" name="tithiNumber"
																class="form-control mr-2 custom-select"
																ng-model="date.tithiNumber">
																<option value="" disabled selected>Select Tithi
																	Number</option>
																<option
																	ng-repeat="num in [].constructor(30) track by $index"
																	ng-value="$index + 1">{{$index + 1}}</option>
															</select>
														</div>
													</div>

													<div class="col-md-4 col-sm-12 mb-3">
														<div class="d-flex" style="position: relative;">
															<select id="hinduTithi" name="hinduTithi"
																class="form-control mr-2 custom-select"
																ng-model="date.hinduTithiId">
																<option value="" disabled selected>Select Hindu
																	Tithi</option>
																<option ng-repeat="hinduTithi in hinduTithiList"
																	ng-value="{{hinduTithi.hinduTithiId}}">{{hinduTithi.tithiName}}</option>
															</select>
															<button type="button" class="btn btn-info"
																data-toggle="modal" data-target="#hinduTithiModal"
																style="margin-top: 10px; background-color: #444; border-color: #444;">+</button>
														</div>
													</div>

													<!-- Modal for tithi -->
													<div class="modal fade" id="hinduTithiModal" tabindex="-1"
														role="dialog" aria-labelledby="hinduTithiModalLabel"
														aria-hidden="true">
														<div class="modal-dialog" role="document">
															<div class="modal-content">
																<div class="modal-header">
																	<h5 class="modal-title" id="hinduTithiModalLabel">Add
																		Hindu Tithi</h5>
																	<button type="button" class="close"
																		data-dismiss="modal" aria-label="Close">
																		<span aria-hidden="true">&times;</span>
																	</button>
																</div>
																<div class="modal-body">
																	<form>
																		<div class="form-group">
																			<label for="hinduTithiName">Hindu Tithi Name</label>
																			<input type="text" class="form-control"
																				id="hinduTithiName"
																				placeholder="Enter Hindu Tithi Name"
																				ng-model="newHinduTithi.tithiName">
																		</div>
																		<div class="form-group">
																			<label for="hinduTithiDescription">Description</label>
																			<textarea class="form-control"
																				id="hinduTithiDescription" rows="3"
																				placeholder="Enter Hindu Tithi Description"
																				ng-model="newHinduTithi.description"></textarea>
																		</div>
																	</form>
																</div>
																<div class="modal-footer">
																	<button type="button" class="btn btn-secondary"
																		data-dismiss="modal" ng-click="hinduTithiCloseModal()">Close</button>
																	<button type="button" class="btn btn-primary"
																		style="background-color: #6c757d; border-color: #6c757d;"
																		data-dismiss="modal" ng-click="addHinduTithi()">Submit</button>
																</div>
															</div>
														</div>
													</div>
												</div>
												<div class="form-group row">
													<div class="col-md-4 col-sm-12 mb-3">
														<div class="d-flex" style="position: relative;">
															<label style="margin-top: 17px;">Select Month
																Type</label>
															<div class="radio-group">
																<label><input type="radio" name="monthType"
																	ng-model="date.hinduMonthTypeId"
																	ng-checked="date.hinduMonthTypeId == 1" value="1">
																	Normal</label> <label><input type="radio"
																	name="monthType" ng-model="date.hinduMonthTypeId"
																	ng-checked="date.hinduMonthTypeId == 2" value="2">
																	Adhik</label>
															</div>
														</div>
													</div>
												</div>
											</div>

											<br>

											<!-- Description -->
											<div class="form-group row">
												<div class="col-md-12 mb-3">
													<textarea class="form-control mr-2" id="impDateDescription"
														name="impDateDescription" placeholder="Description"
														rows="4" ng-model="date.impDateDescription"></textarea>
												</div>
											</div>

											<!-- Submit Button -->
											<div class="form-group">
												<button type="back" class="btn btn-success"
													style="background-color: #444; border-color: #444; text-align: center;"
													ng-click="backImpDateData()">Back</button>
												<button type="submit" class="btn btn-success"
													style="background-color: #444; border-color: #444;"
													ng-click="date.importantDateId > 0 ? updateImpDate() : addAllImpDate()">Submit</button>
												<button type="clear" class="btn btn-success"
													style="background-color: #444; border-color: #444;"
													ng-click="clearImpDateData()">Clear</button>
											</div>
									</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- Imp Date List Table -->
			<div class="card mt-4" style="margin: 37px;">
				<div class="card-header"
					style="background-color: #ffad28; color: white; height: 50px;">
					<h3 style="font-size: 1.30rem; color: black !important;">Important
						Dates List</h3>
				</div>
				<div class="card-body">
					<div class="table-responsive">
						<table class="table table-bordered">
							<thead>
								<tr>
									<th>#</th>
									<th>Festival Name</th>
									<th>Date</th>
									<th>Samvat</th>
									<th>Hindu Year</th>
									<th>Hindu Month</th>
									<th>Hindu Paksh</th>
									<th>Hindu Tithi</th>
									<th>Hindu Month Type</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<tr ng-repeat="date in dateList" ng-click="editImpDate(date)"
									style="cursor: pointer">
									<td ng-click="GetImportantDateById(date); openCollapse()"
										title="Update date" data-toggle="modal"
										data-target="#updateModal">{{$index + 1}}</td>
									<td ng-click="GetImportantDateById(date); openCollapse()"
										title="Update date" data-toggle="modal"
										data-target="#updateModal">{{date.festivalName}}</td>
									<td ng-click="GetImportantDateById(date); openCollapse()"
										title="Update date" data-toggle="modal"
										data-target="#updateModal">{{date.englishDate}}</td>
									<td ng-click="GetImportantDateById(date); openCollapse()"
										title="Update date" data-toggle="modal"
										data-target="#updateModal">{{date.samvatName}}</td>
									<td ng-click="GetImportantDateById(date); openCollapse()"
										title="Update date" data-toggle="modal"
										data-target="#updateModal">{{date.hinduYear}}</td>
									<td ng-click="GetImportantDateById(date); openCollapse()"
										title="Update date" data-toggle="modal"
										data-target="#updateModal">{{date.hinduMonthName}}</td>
									<td ng-click="GetImportantDateById(date); openCollapse()"
										title="Update date" data-toggle="modal"
										data-target="#updateModal">{{date.pakshName}}</td>
									<td ng-click="GetImportantDateById(date); openCollapse()"
										title="Update date" data-toggle="modal"
										data-target="#updateModal">{{date.tithiName}}</td>
									<td ng-click="GetImportantDateById(date); openCollapse()"
										title="Update date" data-toggle="modal"
										data-target="#updateModal">{{date.hinduMonthType}}</td>
									<td class="text-center align-middle"><input
										type="checkbox" ng-model="date.selected"></td>
								</tr>
							</tbody>
						</table>
					</div>

					<div class="form-group" style="float: right;">
						<button type="button" id="Delete" name="submit"
							class="btn btn-danger" ng-click="deleteImpDates()">
							<i class="fas fa-trash"></i>
						</button>
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

	<!-- Script For CKEditor Start -->
	<script>
		//Initialize the Editor
		initEditor();

		//Replace the <textarea id="editor1"> with an CKEditor instance.  
		function initEditor() {
			CKEDITOR.replace('impDateDescription', {
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
							$('#target').css("min-height", "245px");
							$('#target').css("min-width", "300px");

							$('#target').attr('src', e.target.result);
							$('#target').Jcrop({
								aspectRatio : 300 / 245,
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
			$("#eventImage").change(function() {
				readURL(this);
			});
			$("#eventImage").click(function() {
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
						img.src = e.target.result;
						img.onload = function() {
							var imgWidth = img.width;
						    var imgHeight = img.height;

								$('#target').css("width", imgWidth);
								$('#target').css("height", imgHeight);

								$('#target').attr('src', e.target.result);
								$('#target').Jcrop({
									aspectRatio : 1 / 1.5,
									boxWidth : imgWidth,
									boxHeight : imgHeight,
									minSize : [ imgWidth, imgHeight ],
									setSelect : [ 0, 0,imgWidth, imgHeight],
									onChange : setCoordinates,
									onSelect : setCoordinates
								});
							
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
	</script> -->
	<!-- Script For jcrop End -->
</body>
</html>