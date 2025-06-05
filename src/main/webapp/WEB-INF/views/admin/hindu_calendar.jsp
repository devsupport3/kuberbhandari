<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" ng-app="kuberbhandari">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Daily Darshan</title>

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
		<div class="col-md-10" ng-controller="hinduCalendarCtrl">
			<div class="card-body">
				<div class="container-fluid">
					<div class="row">
						<div class="col-lg-4 col-md-4  col-sm-12 col-xl-12">
							<div class="card shadow mb-4">
								<!-- Card Header - Accordion -->
								<a href="#collapseCardFestival" class="d-block card-header py-3"
									data-toggle="collapse" role="button" aria-expanded="true"
									aria-controls="collapseCardExampleFestival"
									style="background-color: #ffad28; !important">
									<h6 class="m-0 font-weight-bold text-primary"
										style="color: black !important;">Festivals</h6>
								</a>
								<!-- Card Content - Collapse -->
								<div class="collapse" id="collapseCardFestival">
									<div class="card-body">
										<form class="" name="myForm_festival">
											<div class="form-group row">
												<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
													<input class="form-control" placeholder="Festival Name"
														type="text" ng-model="newFestival.festivalName">
												</div>
												<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
													<input class="form-control" placeholder="Description"
														type="text" ng-model="newFestival.description">
												</div>
												<!-- Image Upload -->
												<!-- <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
													<input type="file" id="samvatImage" name="samvatImage"
														class="form-control">
												</div> -->
												<!-- <div class="col-md-3 col-sm-8">
													<div class="form-check form-switch">
														<input class="form-check-input" type="checkbox"
															id="samvatSwitch" ng-model="isSamvatActive"
															ng-change="samvatToggle()"> <label
															class="form-check-label" for="samvatSwitch">
															Active/Inactive </label>
													</div>
												</div> -->
											</div>
											<!-- <div class="row text-center">
												<div class="col-md-4">
													<img src="" id="target" /> <input type="hidden" name="x"
														id="valuex" ng-model="valuex" /> <input type="hidden"
														name="y" id="valuey" ng-model="valuey" /> <input
														type="hidden" name="w" id="valuew" ng-model="valuew" /> <input
														type="hidden" name="h" id="valueh" ng-model="valueh" />
												</div>
											</div> -->
											<br>
											<div>
												<button type="button" class="btn btn-success"
													style="background-color: #444; border-color: #444;"
													ng-click="newFestival.festivalId > 0 ? updateFestival() : addFestival()">Submit</button>
											</div>
										</form>
										<!-- Seva Type Table -->
										<div class="card">
											<div class="card-header" style="background-color: #ffad28;">
												<h5 style="color: black !important;">Festival List</h5>
											</div>
											<div class="card-body">
												<div class="table-responsive">
													<table class="table table-bordered">
														<thead>
															<tr>
																<th>#</th>
																<th>Festival Name</th>
																<th>Description</th>
																<!-- <th>Image</th> -->
																<th></th>
															</tr>
														</thead>
														<tbody>
															<tr ng-repeat="festival in festivalList"
																style="cursor: pointer">
																<td ng-click="GetFestivalById(festival)"
																	title="Update Festival" data-toggle="modal"
																	data-target="#updateModal">{{$index + 1}}</td>
																<td ng-click="GetFestivalById(festival)"
																	title="Update Festival" data-toggle="modal"
																	data-target="#updateModal">{{festival.festivalName}}</td>
																<td ng-click="GetFestivalById(festival)"
																	title="Update Festival" data-toggle="modal"
																	data-target="#updateModal">{{festival.description}}</td>
																<%-- <td>
																<div class="widget-thumb">
																	<a href="#" ng-click="GetSamvatById(samvat)"> <img
																		ng-src="<%=request.getContextPath()%>/resources/front/img/DailyDarshan/{{samvat.image}}"
																		alt="image" class="img-thumbnail"
																		style="width: 50px; height: 50px;">
																	</a>
																</div>
															</td> --%>
																<td class="text-center" style="vertical-align: middle;">
																	<input type="checkbox" ng-model="festival.selected">
																</td>
															</tr>
														</tbody>
													</table>
												</div>
												<div class="form-group" style="float: right;">
													<button type="button" id="Delete" name="submit"
														class="btn btn-danger" ng-click="deleteFestival()">
														<i class="fas fa-trash"></i>
													</button>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-4 col-md-4  col-sm-12 col-xl-12">
							<div class="card shadow mb-4">
								<!-- Card Header - Accordion -->
								<a href="#collapseCardSamvat" class="d-block card-header py-3"
									data-toggle="collapse" role="button" aria-expanded="true"
									aria-controls="collapseCardExampleSamvat"
									style="background-color: #ffad28; !important">
									<h6 class="m-0 font-weight-bold text-primary"
										style="color: black !important;">Samvat</h6>
								</a>
								<!-- Card Content - Collapse -->
								<div class="collapse" id="collapseCardSamvat">
									<div class="card-body">
										<form class="" name="myForm_samvat">
											<div class="form-group row">
												<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
													<input class="form-control" placeholder="Samvat Name"
														type="text" ng-model="newSamvat.samvatName">
												</div>
												<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
													<input class="form-control" placeholder="Description"
														type="text" ng-model="newSamvat.description">
												</div>
												<!-- Image Upload -->
												<!-- <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
													<input type="file" id="samvatImage" name="samvatImage"
														class="form-control">
												</div> -->
												<!-- <div class="col-md-3 col-sm-8">
													<div class="form-check form-switch">
														<input class="form-check-input" type="checkbox"
															id="samvatSwitch" ng-model="isSamvatActive"
															ng-change="samvatToggle()"> <label
															class="form-check-label" for="samvatSwitch">
															Active/Inactive </label>
													</div>
												</div> -->
											</div>
											<!-- <div class="row text-center">
												<div class="col-md-4">
													<img src="" id="target" /> <input type="hidden" name="x"
														id="valuex" ng-model="valuex" /> <input type="hidden"
														name="y" id="valuey" ng-model="valuey" /> <input
														type="hidden" name="w" id="valuew" ng-model="valuew" /> <input
														type="hidden" name="h" id="valueh" ng-model="valueh" />
												</div>
											</div> -->
											<br>
											<div>
												<button type="button" class="btn btn-success"
													style="background-color: #444; border-color: #444;"
													ng-click="newSamvat.samvatId > 0 ? updateSamvat() : addSamvat()">Submit</button>
											</div>
										</form>
										<!-- Seva Type Table -->
										<div class="card">
											<div class="card-header" style="background-color: #ffad28;">
												<h5 style="color: black !important;">Samvat List</h5>
											</div>
											<div class="card-body">
												<div class="table-responsive">
													<table class="table table-bordered">
														<thead>
															<tr>
																<th>#</th>
																<th>Samvat Name</th>
																<th>Description</th>
																<!-- <th>Image</th> -->
																<th></th>
															</tr>
														</thead>
														<tbody>
															<tr ng-repeat="samvat in samvatList"
																style="cursor: pointer">
																<td ng-click="GetSamvatById(samvat)"
																	title="Update Samvat" data-toggle="modal"
																	data-target="#updateModal">{{$index + 1}}</td>
																<td ng-click="GetSamvatById(samvat)"
																	title="Update Samvat" data-toggle="modal"
																	data-target="#updateModal">{{samvat.samvatName}}</td>
																<td ng-click="GetSamvatById(samvat)"
																	title="Update Samvat" data-toggle="modal"
																	data-target="#updateModal">{{samvat.description}}</td>
																<%-- <td>
																<div class="widget-thumb">
																	<a href="#" ng-click="GetSamvatById(samvat)"> <img
																		ng-src="<%=request.getContextPath()%>/resources/front/img/DailyDarshan/{{samvat.image}}"
																		alt="image" class="img-thumbnail"
																		style="width: 50px; height: 50px;">
																	</a>
																</div>
															</td> --%>
																<td class="text-center" style="vertical-align: middle;">
																	<input type="checkbox" ng-model="samvat.selected">
																</td>
															</tr>
														</tbody>
													</table>
												</div>
												<div class="form-group" style="float: right;">
													<button type="button" id="Delete" name="submit"
														class="btn btn-danger" ng-click="deleteSamvat()">
														<i class="fas fa-trash"></i>
													</button>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-4 col-md-4  col-sm-12 col-xl-12">
							<div class="card shadow mb-4">
								<!-- Card Header - Accordion -->
								<a href="#collapseCardHinduPaksh"
									class="d-block card-header py-3" data-toggle="collapse"
									role="button" aria-expanded="true"
									aria-controls="collapseCardExampleHinduPaksh"
									style="background-color: #ffad28;">
									<h6 class="m-0 font-weight-bold text-primary"
										style="color: black !important;">Hindu Paksh</h6>
								</a>
								<!-- Card Content - Collapse -->
								<div class="collapse" id="collapseCardHinduPaksh">
									<div class="card-body">
										<form class="" name="myForm_hinduPaksh">
											<div class="form-group row">
												<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
													<input class="form-control" placeholder="Hindu Paksh Name"
														type="text" ng-model="newHinduPaksh.pakshName">
												</div>
												<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
													<input class="form-control"
														placeholder="Hindu Paksh Alias Name" type="text"
														ng-model="newHinduPaksh.pakshNameAlias">
												</div>
												<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
													<input class="form-control" placeholder="Description"
														type="text" ng-model="newHinduPaksh.description">
												</div>
											</div>
											<!-- 	<div class="form-group row">
												Image Upload
												<div class="col-lg-4 col-md-3 col-sm-12 col-xs-12"
													style="margin-right: 21px; max-width: 32.333333%;">
													<input type="file" id="hinduPakshImage"
														name="hinduPakshImage" class="form-control">
												</div>
												<div class="col-md-3 col-sm-8">
													<div class="form-check form-switch">
														<input class="form-check-input" type="checkbox"
															id="hinduPakshSwitch" ng-model="isHinduPakshActive"
															ng-change="hinduPakshToggle()"> <label
															class="form-check-label" for="hinduPakshSwitch">
															Active/Inactive </label>
													</div>
												</div>
											</div> -->
											<!-- 		<div class="row text-center">
												<div class="col-md-4">
													<img src="" id="target1" /> <input type="hidden" name="x1"
														id="valuex1" ng-model="valuex1" /> <input type="hidden"
														name="y1" id="valuey1" ng-model="valuey1" /> <input
														type="hidden" name="w1" id="valuew1" ng-model="valuew1" />
													<input type="hidden" name="h1" id="valueh1"
														ng-model="valueh1" />
												</div>
											</div> -->
											<br>
											<div>
												<button type="button" class="btn btn-success"
													style="background-color: #444; border-color: #444;"
													ng-click="newHinduPaksh.hinduPakshId > 0 ? updateHinduPaksh() : addHinduPaksh()">Submit</button>
											</div>
										</form>
										<!-- Hindu Paksh Table -->
										<div class="card">
											<div class="card-header" style="background-color: #ffad28;">
												<h5 style="color: black !important;">Hindu Paksh List</h5>
											</div>
											<div class="card-body">
												<div class="table-responsive">
													<table class="table table-bordered">
														<thead>
															<tr>
																<th>#</th>
																<th>Hindu Paksh Name</th>
																<th>Hindu Paksh Alias Name</th>
																<th>Description</th>
																<!-- <th>Images</th> -->
																<th></th>
															</tr>
														</thead>
														<tbody>
															<tr ng-repeat="hinduPaksh in hinduPakshList"
																style="cursor: pointer">
																<td ng-click="GetHinduPakshById(hinduPaksh)"
																	title="Update Hindu Paksh" data-toggle="modal"
																	data-target="#updateModal">{{$index + 1}}</td>
																<td ng-click="GetHinduPakshById(hinduPaksh)"
																	title="Update Hindu Paksh" data-toggle="modal"
																	data-target="#updateModal">
																	{{hinduPaksh.pakshName}}</td>
																<td ng-click="GetHinduPakshById(hinduPaksh)"
																	title="Update Hindu Paksh" data-toggle="modal"
																	data-target="#updateModal">
																	{{hinduPaksh.pakshNameAlias}}</td>
																<td ng-click="GetHinduPakshById(hinduPaksh)"
																	title="Update Hindu Paksh" data-toggle="modal"
																	data-target="#updateModal">
																	{{hinduPaksh.description}}</td>
																<%-- <td>
																<div class="widget-thumb">
																	<a href="#" ng-click="GetHinduPakshById(hinduPaksh)">
																		<img
																		ng-src="<%=request.getContextPath()%>/resources/front/img/DailyDarshan/{{hinduPaksh.image}}"
																		alt="image" class="img-thumbnail"
																		style="width: 50px; height: 50px;">
																	</a>
																</div>
															</td> --%>
																<td class="text-center" style="vertical-align: middle;">
																	<input type="checkbox" ng-model="hinduPaksh.selected">
																</td>
															</tr>
														</tbody>
													</table>
												</div>
												<div class="form-group" style="float: right;">
													<button type="button" id="Delete" class="btn btn-danger"
														ng-click="deleteHinduPaksh()">
														<i class="fas fa-trash"></i>
													</button>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-4 col-md-4  col-sm-12 col-xl-12">
							<div class="card shadow mb-4">
								<!-- Card Header - Accordion -->
								<a href="#collapseHinduYear" class="d-block card-header py-3"
									data-toggle="collapse" role="button" aria-expanded="true"
									aria-controls="collapseCardExampleHinduYear"
									style="background-color: #ffad28;">
									<h6 class="m-0 font-weight-bold text-primary"
										style="color: black !important;">Hindu Year</h6>
								</a>
								<!-- Card Content - Collapse -->
								<div class="collapse" id="collapseHinduYear">
									<div class="card-body">
										<form class="" name="myForm_hinduYear">
											<div class="form-group row">
												<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
													<input class="form-control" placeholder="Hindu Year"
														type="text" ng-model="newHinduYear.hinduYear">
												</div>
												<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
													<input class="form-control" placeholder="Description"
														type="text" ng-model="newHinduYear.description">
												</div>
												<!-- Image Upload -->
												<!-- <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
													<input type="file" id="hinduYearImage"
														name="hinduYearImage" class="form-control">
												</div> -->
												<!-- <div class="col-md-3 col-sm-8">
													<div class="form-check form-switch">
														<input class="form-check-input" type="checkbox"
															id="hinduYearSwitch" ng-model="isHinduYearActive"
															ng-change="hinduYearToggle()"> <label
															class="form-check-label" for="hinduYearSwitch">
															Active/Inactive </label>
													</div>
												</div> -->
											</div>
											<!-- <div class="row text-center">
												<div class="col-md-4">
													<img src="" id="target2" /> <input type="hidden" name="x2"
														id="valuex2" ng-model="valuex2" /> <input type="hidden"
														name="y2" id="valuey2" ng-model="valuey2" /> <input
														type="hidden" name="w2" id="valuew2" ng-model="valuew2" />
													<input type="hidden" name="h2" id="valueh2"
														ng-model="valueh2" />
												</div>
											</div> -->
											<br>
											<div>
												<button type="button" class="btn btn-success"
													style="background-color: #444; border-color: #444;"
													ng-click="newHinduYear.hinduYearId > 0 ? updateHinduYear() : addHinduYear()">Submit</button>
											</div>
										</form>
										<!-- Hindu Year Table -->
										<div class="card">
											<div class="card-header" style="background-color: #ffad28;">
												<h5 style="color: black !important;">Hindu Year List</h5>
											</div>
											<div class="card-body">
												<div class="table-responsive">
													<table class="table table-bordered">
														<thead>
															<tr>
																<th>#</th>
																<th>Hindu Year</th>
																<th>Description</th>
																<!-- <th>Images</th> -->
																<th></th>
															</tr>
														</thead>
														<tbody>
															<tr ng-repeat="hinduYear in hinduYearList"
																style="cursor: pointer">
																<td ng-click="GetHinduYearById(hinduYear)"
																	title="Update Hindu Year" data-toggle="modal"
																	data-target="#updateModal">{{$index + 1}}</td>
																<td ng-click="GetHinduYearById(hinduYear)"
																	title="Update Hindu Year" data-toggle="modal"
																	data-target="#updateModal">{{hinduYear.hinduYear}}</td>
																<td ng-click="GetHinduYearById(hinduYear)"
																	title="Update Hindu Year" data-toggle="modal"
																	data-target="#updateModal">
																	{{hinduYear.description}}</td>
																<%-- <td>
																<div class="widget-thumb">
																	<a href="#" ng-click="GetHinduYearById(hinduYear)">
																		<img
																		ng-src="<%=request.getContextPath()%>/resources/front/img/DailyDarshan/{{hinduYear.image}}"
																		alt="image" class="img-thumbnail"
																		style="width: 50px; height: 50px;">
																	</a>
																</div>
															</td> --%>
																<td class="text-center" style="vertical-align: middle;">
																	<input type="checkbox" ng-model="hinduYear.selected">
																</td>
															</tr>
														</tbody>
													</table>
												</div>
												<div class="form-group" style="float: right;">
													<button type="button" id="Delete" class="btn btn-danger"
														ng-click="deleteHinduYear()">
														<i class="fas fa-trash"></i>
													</button>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-4 col-md-4  col-sm-12 col-xl-12">
							<div class="card shadow mb-4">
								<!-- Card Header - Accordion -->
								<a href="#collapseHinduMonth" class="d-block card-header py-3"
									data-toggle="collapse" role="button" aria-expanded="true"
									aria-controls="collapseCardExampleHinduMonth"
									style="background-color: #ffad28;">
									<h6 class="m-0 font-weight-bold text-primary"
										style="color: black !important;">Hindu Month</h6>
								</a>
								<!-- Card Content - Collapse -->
								<div class="collapse" id="collapseHinduMonth">
									<div class="card-body">
										<form class="" name="myForm_hinduMonth">
											<div class="form-group row">
												<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
													<input class="form-control" placeholder="Hindu Month Name"
														type="text" ng-model="newHinduMonth.hinduMonthName">
												</div>
												<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
													<input class="form-control"
														placeholder="Hindu Month Alias Name" type="text"
														ng-model="newHinduMonth.hinduMonthNameAlias">
												</div>
												<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
													<input class="form-control" placeholder="Description"
														type="text" ng-model="newHinduMonth.description">
												</div>
											</div>
											<!-- 	<div class="form-group row">
												Image Upload
												<div class="col-lg-4 col-md-3 col-sm-12 col-xs-12"
													style="margin-right: 21px; max-width: 32.333333%;">
													<input type="file" id="hinduMonthImage"
														name="hinduMonthImage" class="form-control">
												</div>
												<div class="col-md-3 col-sm-8">
													<div class="form-check form-switch">
														<input class="form-check-input" type="checkbox"
															id="hinduMonthSwitch" ng-model="isHinduMonthActive"
															ng-change="hinduMonthToggle()"> <label
															class="form-check-label" for="hinduMonthSwitch">
															Active/Inactive </label>
													</div>
												</div>
											</div> -->
											<!-- <div class="row text-center">
												<div class="col-md-4">
													<img src="" id="target3" /> <input type="hidden" name="x3"
														id="valuex3" ng-model="valuex3" /> <input type="hidden"
														name="y3" id="valuey3" ng-model="valuey3" /> <input
														type="hidden" name="w3" id="valuew3" ng-model="valuew3" />
													<input type="hidden" name="h3" id="valueh3"
														ng-model="valueh3" />
												</div>
											</div> -->
											<br>
											<div>
												<button type="button" class="btn btn-success"
													style="background-color: #444; border-color: #444;"
													ng-click="newHinduMonth.hinduMonthId > 0 ? updateHinduMonth() : addHinduMonth()">Submit</button>
											</div>
										</form>
										<!-- Hindu Month Table -->
										<div class="card">
											<div class="card-header" style="background-color: #ffad28;">
												<h5 style="color: black !important;">Hindu Month List</h5>
											</div>
											<div class="card-body">
												<div class="table-responsive">
													<table class="table table-bordered">
														<thead>
															<tr>
																<th>#</th>
																<th>Hindu Month Name</th>
																<th>Hindu Month Alias Name</th>
																<th>Description</th>
																<!-- <th>Images</th> -->
																<th></th>
															</tr>
														</thead>
														<tbody>
															<tr ng-repeat="hinduMonth in hinduMonthList"
																style="cursor: pointer">
																<td ng-click="GetHinduMonthById(hinduMonth)"
																	title="Update Hindu Month" data-toggle="modal"
																	data-target="#updateModal">{{$index + 1}}</td>
																<td ng-click="GetHinduMonthById(hinduMonth)"
																	title="Update Hindu Month" data-toggle="modal"
																	data-target="#updateModal">
																	{{hinduMonth.hinduMonthName}}</td>
																<td ng-click="GetHinduMonthById(hinduMonth)"
																	title="Update Hindu Month" data-toggle="modal"
																	data-target="#updateModal">
																	{{hinduMonth.hinduMonthNameAlias}}</td>
																<td ng-click="GetHinduMonthById(hinduMonth)"
																	title="Update Hindu Month" data-toggle="modal"
																	data-target="#updateModal">
																	{{hinduMonth.description}}</td>
																<%-- <td>
																<div class="widget-thumb">
																	<a href="#" ng-click="GetHinduMonthById(hinduMonth)">
																		<img
																		ng-src="<%=request.getContextPath()%>/resources/front/img/DailyDarshan/{{hinduMonth.image}}"
																		alt="image" class="img-thumbnail"
																		style="width: 50px; height: 50px;">
																	</a>
																</div>
															</td> --%>
																<td class="text-center" style="vertical-align: middle;">
																	<input type="checkbox" ng-model="hinduMonth.selected">
																</td>
															</tr>
														</tbody>
													</table>
												</div>
												<div class="form-group" style="float: right;">
													<button type="button" id="Delete" name="submit"
														class="btn btn-danger" ng-click="deleteHinduMonth()">
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
						<div class="col-lg-4 col-md-4  col-sm-12 col-xl-12">
							<div class="card shadow mb-4">
								<!-- Card Header - Accordion -->
								<a href="#collapseHinduTithi" class="d-block card-header py-3"
									data-toggle="collapse" role="button" aria-expanded="true"
									aria-controls="collapseCardExampleHinduTithi"
									style="background-color: #ffad28;">
									<h6 class="m-0 font-weight-bold text-primary"
										style="color: black !important;">Hindu Tithi</h6>
								</a>
								<!-- Card Content - Collapse -->
								<div class="collapse" id="collapseHinduTithi">
									<div class="card-body">
										<form class="" name="myForm_hinduTithi">
											<div class="form-group row">
												<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
													<input class="form-control" placeholder="Hindu Tithi Name"
														type="text" ng-model="newHinduTithi.tithiName">
												</div>
												<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
													<input class="form-control"
														placeholder="Hindu Tithi Alias Name" type="text"
														ng-model="newHinduTithi.tithiNameAlias">
												</div>
												<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
													<input class="form-control" placeholder="Description"
														type="text" ng-model="newHinduTithi.description">
												</div>
											</div>
											<!-- <div class="form-group row">
												Image Upload
												<div class="col-lg-4 col-md-3 col-sm-12 col-xs-12"
													style="margin-right: 21px; max-width: 32.333333%;">
													<input type="file" id="hinduTithiImage"
														name="hinduTithiImage" class="form-control">
												</div>
												<div class="col-md-3 col-sm-8">
													<div class="form-check form-switch">
														<input class="form-check-input" type="checkbox"
															id="hinduTithiSwitch" ng-model="isHinduTithiActive"
															ng-change="hinduTithiToggle()"> <label
															class="form-check-label" for="hinduTithiSwitch">
															Active/Inactive </label>
													</div>
												</div>
											</div> -->
											<!-- <div class="row text-center">
												<div class="col-md-4">
													<img src="" id="target4" /> <input type="hidden" name="x4"
														id="valuex4" ng-model="valuex4" /> <input type="hidden"
														name="y4" id="valuey4" ng-model="valuey4" /> <input
														type="hidden" name="w4" id="valuew4" ng-model="valuew4" />
													<input type="hidden" name="h4" id="valueh4"
														ng-model="valueh4" />
												</div>
											</div> -->
											<br>
											<div>
												<button type="button" class="btn btn-success"
													style="background-color: #444; border-color: #444;"
													ng-click="newHinduTithi.hinduTithiId > 0 ? updateHinduTithi() : addHinduTithi()">Submit</button>
											</div>
										</form>
										<!-- Hindu Tithi Table -->
										<div class="card">
											<div class="card-header" style="background-color: #ffad28;">
												<h5 style="color: black !important;">Hindu Tithi List</h5>
											</div>
											<div class="card-body">
												<div class="table-responsive">
													<table class="table table-bordered">
														<thead>
															<tr>
																<th>#</th>
																<th>Hindu Tithi Name</th>
																<th>Hindu Tithi Alias Name</th>
																<th>Description</th>
																<!-- <th>Images</th> -->
																<th></th>
															</tr>
														</thead>
														<tbody>
															<tr ng-repeat="hinduTithi in hinduTithiList"
																style="cursor: pointer">
																<td ng-click="GetHinduTithiById(hinduTithi)"
																	title="Update Hindu Tithi" data-toggle="modal"
																	data-target="#updateModal">{{$index + 1}}</td>
																<td ng-click="GetHinduTithiById(hinduTithi)"
																	title="Update Hindu Tithi" data-toggle="modal"
																	data-target="#updateModal">
																	{{hinduTithi.tithiName}}</td>
																<td ng-click="GetHinduTithiById(hinduTithi)"
																	title="Update Hindu Tithi" data-toggle="modal"
																	data-target="#updateModal">
																	{{hinduTithi.tithiNameAlias}}</td>
																<td ng-click="GetHinduTithiById(hinduTithi)"
																	title="Update Hindu Tithi" data-toggle="modal"
																	data-target="#updateModal">
																	{{hinduTithi.description}}</td>
																<%-- <td>
																<div class="widget-thumb">
																	<a href="#" ng-click="GetHinduTithiById(hinduTithi)">
																		<img
																		ng-src="<%=request.getContextPath()%>/resources/front/img/DailyDarshan/{{hinduTithi.image}}"
																		alt="image" class="img-thumbnail"
																		style="width: 50px; height: 50px;">
																	</a>
																</div>
															</td> --%>
																<td class="text-center" style="vertical-align: middle;">
																	<input type="checkbox" ng-model="hinduTithi.selected">
																</td>
															</tr>
														</tbody>
													</table>
												</div>
												<div class="form-group" style="float: right;">
													<button type="button" id="Delete" name="submit"
														class="btn btn-danger" ng-click="deleteHinduTithi()">
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
						<div class="col-lg-4 col-md-4  col-sm-12 col-xl-12">
							<div class="card shadow mb-4">
								<!-- Card Header - Accordion -->
								<a href="#collapseHinduMonthType"
									class="d-block card-header py-3" data-toggle="collapse"
									role="button" aria-expanded="true"
									aria-controls="collapseCardExampleHinduMonthType"
									style="background-color: #ffad28;">
									<h6 class="m-0 font-weight-bold text-primary"
										style="color: black !important;">Hindu Month Type</h6>
								</a>
								<!-- Card Content - Collapse -->
								<div class="collapse" id="collapseHinduMonthType">
									<div class="card-body">
										<form class="" name="myForm_hinduMonthType">
											<div class="form-group row">
												<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
													<input class="form-control" placeholder="Hindu Month Type"
														type="text" ng-model="newHinduMonthType.hinduMonthType">
												</div>
												<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
													<input class="form-control" placeholder="Description"
														type="text" ng-model="newHinduMonthType.description">
												</div>
												<!-- Image Upload -->
												<!-- <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
													<input type="file" id="hinduMonthTypeImage"
														name="hinduMonthTypeImage" class="form-control">
												</div> -->
												<!-- <div class="col-md-3 col-sm-8">
													<div class="form-check form-switch">
														<input class="form-check-input" type="checkbox"
															id="hinduMonthTypeSwitch"
															ng-model="isHinduMonthTypeActive"
															ng-change="hinduMonthTypeToggle()"> <label
															class="form-check-label" for="hinduMonthTypeSwitch">
															Active/Inactive </label>
													</div>
												</div> -->
											</div>
											<!-- <div class="row text-center">
												<div class="col-md-4">
													<img src="" id="target5" /> <input type="hidden" name="x5"
														id="valuex5" ng-model="valuex5" /> <input type="hidden"
														name="y5" id="valuey5" ng-model="valuey5" /> <input
														type="hidden" name="w5" id="valuew5" ng-model="valuew5" />
													<input type="hidden" name="h5" id="valueh5"
														ng-model="valueh5" />
												</div>
											</div> -->
											<br>
											<div>
												<button type="button" class="btn btn-success"
													style="background-color: #444; border-color: #444;"
													ng-click="newHinduMonthType.hinduMonthTypeId > 0 ? updateHinduMonthType() : addHinduMonthType()">Submit</button>
											</div>
										</form>
										<!-- Hindu Month Type Table -->
										<div class="card">
											<div class="card-header" style="background-color: #ffad28;">
												<h5 style="color: black !important;">Hindu Month Type
													List</h5>
											</div>
											<div class="card-body">
												<div class="table-responsive">
													<table class="table table-bordered">
														<thead>
															<tr>
																<th>#</th>
																<th>Hindu Month Type</th>
																<th>Description</th>
																<!-- <th>Images</th> -->
																<th></th>
															</tr>
														</thead>
														<tbody>
															<tr ng-repeat="hinduMonthType in hinduMonthTypeList"
																style="cursor: pointer">
																<td ng-click="GetHinduMonthTypeById(hinduMonthType)"
																	title="Update Hindu Month Type" data-toggle="modal"
																	data-target="#updateModal">{{$index + 1}}</td>
																<td ng-click="GetHinduMonthTypeById(hinduMonthType)"
																	title="Update Hindu Month Type" data-toggle="modal"
																	data-target="#updateModal">
																	{{hinduMonthType.hinduMonthType}}</td>
																<td ng-click="GetHinduMonthTypeById(hinduMonthType)"
																	title="Update Hindu Month Type" data-toggle="modal"
																	data-target="#updateModal">
																	{{hinduMonthType.description}}</td>
																<%-- <td>
																<div class="widget-thumb">
																	<a href="#"
																		ng-click="GetHinduMonthTypeById(hinduMonthType)">
																		<img
																		ng-src="<%=request.getContextPath()%>/resources/front/img/DailyDarshan/{{hinduMonthType.image}}"
																		alt="image" class="img-thumbnail"
																		style="width: 50px; height: 50px;">
																	</a>
																</div>
															</td> --%>
																<td class="text-center" style="vertical-align: middle;">
																	<input type="checkbox"
																	ng-model="hinduMonthType.selected">
																</td>
															</tr>
														</tbody>
													</table>
												</div>
												<div class="form-group" style="float: right;">
													<button type="button" id="Delete" name="submit"
														class="btn btn-danger" ng-click="deleteHinduMonthType()">
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
				$("#samvatImage").change(function() {
					readURL(this);
				});
				$("#samvatImage").click(function() {
					this.value = null;
				});
			});

			function setCoordinates(c) {
				document.myForm_samvat.x.value = Math.round(c.x);
				document.myForm_samvat.y.value = Math.round(c.y);
				document.myForm_samvat.w.value = Math.round(c.w);
				document.myForm_samvat.h.value = Math.round(c.h);
			};

			function checkCoordinates() {
				if (document.myForm_samvat.x.value == ""
						|| document.myForm_samvat.y.value == "") {
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
				$("#hinduPakshImage").change(function() {
					readURL1(this);
				});
				$("#hinduPakshImage").click(function() {
					this.value = null;
				});
			});

			function setCoordinates1(c) {
				document.myForm_hinduPaksh.x1.value = Math.round(c.x);
				document.myForm_hinduPaksh.y1.value = Math.round(c.y);
				document.myForm_hinduPaksh.w1.value = Math.round(c.w);
				document.myForm_hinduPaksh.h1.value = Math.round(c.h);
			};

			function checkCoordinates1() {
				if (document.myForm_hinduPaksh.x1.value == ""
						|| document.myForm_hinduPaksh.y1.value == "") {
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
				$("#hinduYearImage").change(function() {
					readURL2(this);
				});
				$("#hinduYearImage").click(function() {
					this.value = null;
				});
			});

			function setCoordinates2(c) {
				document.myForm_hinduYear.x2.value = Math.round(c.x);
				document.myForm_hinduYear.y2.value = Math.round(c.y);
				document.myForm_hinduYear.w2.value = Math.round(c.w);
				document.myForm_hinduYear.h2.value = Math.round(c.h);
			};

			function checkCoordinates2() {
				if (document.myForm_hinduYear.x2.value == ""
						|| document.myForm_hinduYear.y2.value == "") {
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
				$("#hinduMonthImage").change(function() {
					readURL3(this);
				});
				$("#hinduMonthImage").click(function() {
					this.value = null;
				});
			});

			function setCoordinates3(c) {
				document.myForm_hinduMonth.x3.value = Math.round(c.x);
				document.myForm_hinduMonth.y3.value = Math.round(c.y);
				document.myForm_hinduMonth.w3.value = Math.round(c.w);
				document.myForm_hinduMonth.h3.value = Math.round(c.h);
			};

			function checkCoordinates3() {
				if (document.myForm_hinduMonth.x3.value == ""
						|| document.myForm_hinduMonth.y3.value == "") {
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
				$("#hinduTithiImage").change(function() {
					readURL3(this);
				});
				$("#hinduTithiImage").click(function() {
					this.value = null;
				});
			});

			function setCoordinates4(c) {
				document.myForm_hinduTithi.x4.value = Math.round(c.x);
				document.myForm_hinduTithi.y4.value = Math.round(c.y);
				document.myForm_hinduTithi.w4.value = Math.round(c.w);
				document.myForm_hinduTithi.h4.value = Math.round(c.h);
			};

			function checkCoordinates4() {
				if (document.myForm_hinduTithi.x4.value == ""
						|| document.myForm_hinduTithi.y4.value == "") {
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
							if ($('#target5').data('Jcrop')) {
								$('#target5').data('Jcrop').destroy();
								$('#target5').removeAttr('style');
							}

							var u = URL.createObjectURL(input.files[0]);
							var img = new Image;
							img.onload = function() {
								/* if (img.width < 600 || img.height < 900) {
									alert("Minimum image size should be 600px X 900px");
									$('#target').attr('src', "");
									document.getElementById("sevaImage").value = null;
								} else { */
								$('#target5').css("min-height", "208px");
								$('#target5').css("min-width", "337px");

								$('#target5').attr('src', e.target.result);
								$('#target5').Jcrop({
									aspectRatio : 1 / 1.5,
									boxWidth : 600,
									boxHeight : 600,
									minSize : [ 100, 100 ],
									setSelect : [ 100, 100, 400, 400 ],
									onChange : setCoordinates5,
									onSelect : setCoordinates5
								});
								/* } */
							};

							img.src = u;
						}
						reader.readAsDataURL(input.files[0]);
					}
				}
				$("#hinduMonthTypeImage").change(function() {
					readURL3(this);
				});
				$("#hinduMonthTypeImage").click(function() {
					this.value = null;
				});
			});

			function setCoordinates5(c) {
				document.myForm_hinduMonthType.x5.value = Math.round(c.x);
				document.myForm_hinduMonthType.y5.value = Math.round(c.y);
				document.myForm_hinduMonthType.w5.value = Math.round(c.w);
				document.myForm_hinduMonthType.h5.value = Math.round(c.h);
			};

			function checkCoordinates5() {
				if (document.myForm_hinduMonthType.x5.value == ""
						|| document.myForm_hinduMonthType.y5.value == "") {
					alert("Please select a crop region");
					return false;
				} else {
					return true;
				}
			};
		</script>
</body>
</html>