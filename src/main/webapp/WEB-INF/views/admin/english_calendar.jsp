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
	<div class="row">
		<%@include file="sidebar.jsp"%>

		<!-- Form Container -->
		<div class="col-md-10" ng-controller="englishCalendarCtrl">
			<div class="card-body">
				<div class="container-fluid">
					<div class="row">
						<div class="col-lg-4 col-md-4  col-sm-12 col-xl-12">
							<div class="card shadow mb-4">
								<!-- Card Header - Accordion -->
								<a href="#collapseCardEnglishYear"
									class="d-block card-header py-3" data-toggle="collapse"
									role="button" aria-expanded="true"
									aria-controls="collapseCardExampleEnglishYear"
									style="background-color: #ffad28; !important">
									<h6 class="m-0 font-weight-bold text-primary"
										style="color: black !important;">English Year</h6>
								</a>
								<!-- Card Content - Collapse -->
								<div class="collapse" id="collapseCardEnglishYear">
									<div class="card-body">
										<form class="" name="myForm_englishYear">
											<div class="form-group row">
												<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
													<input class="form-control" placeholder="English Year"
														type="text" ng-model="newEnglishYear.englishYears">
												</div>
												<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
													<input class="form-control" placeholder="Description"
														type="text" ng-model="newEnglishYear.description">
												</div>
												<!-- Image Upload -->
												<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
													<input type="file" id="englishYearImage"
														name="englishYearImage" class="form-control">
												</div>
												<div class="col-md-3 col-sm-8">
													<div class="form-check form-switch">
														<input class="form-check-input" type="checkbox"
															id="englishYearSwitch" ng-model="isEnglishYearActive"
															ng-change="englishYearToggle()"> <label
															class="form-check-label" for="englishYearSwitch">
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
													ng-click="newEnglishYear.englishYearId > 0 ? updateEnglishYear() : addEnglishYear()">Submit</button>
											</div>
										</form>
										<!-- English Year Table -->
										<div class="card">
											<div class="card-header" style="background-color: #ffad28;">
												<h5 style="color: black !important;">English Year List</h5>
											</div>
											<div class="card-body">
												<table class="table table-bordered">
													<thead>
														<tr>
															<th>#</th>
															<th>English Year</th>
															<th>Description</th>
															<th>Image</th>
															<th></th>
														</tr>
													</thead>
													<tbody>
														<tr ng-repeat="englishYear in englishYearList"
															style="cursor: pointer">
															<td ng-click="GetEnglishYearById(englishYear)"
																title="Update English Year" data-toggle="modal"
																data-target="#updateModal">{{$index + 1}}</td>
															<td ng-click="GetEnglishYearById(englishYear)"
																title="Update English Year" data-toggle="modal"
																data-target="#updateModal">
																{{englishYear.englishYears}}</td>
															<td ng-click="GetEnglishYearById(englishYear)"
																title="Update English Year" data-toggle="modal"
																data-target="#updateModal">
																{{englishYear.description}}</td>
															<td>
																<div class="widget-thumb">
																	<a href="#" ng-click="GetEnglishYearById(englishYear)">
																		<img
																		ng-src="<%=request.getContextPath()%>/resources/front/img/DailyDarshan/{{englishYear.image}}"
																		alt="image" class="img-thumbnail"
																		style="width: 50px; height: 50px;">
																	</a>
																</div>
															</td>
															<td class="text-center" style="vertical-align: middle;">
																<input type="checkbox" ng-model="englishYear.selected">
															</td>
														</tr>
													</tbody>
												</table>
												<div class="form-group" style="float: right;">
													<button type="button" id="Delete" name="submit"
														class="btn btn-danger" ng-click="deleteEnglishYear()">
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
								<a href="#collapseCardEnglishMonth"
									class="d-block card-header py-3" data-toggle="collapse"
									role="button" aria-expanded="true"
									aria-controls="collapseCardExampleEnglishMonth"
									style="background-color: #ffad28;">
									<h6 class="m-0 font-weight-bold text-primary"
										style="color: black !important;">English Month</h6>
								</a>
								<!-- Card Content - Collapse -->
								<div class="collapse" id="collapseCardEnglishMonth">
									<div class="card-body">
										<form class="" name="myForm_englishMonth">
											<div class="form-group row">
												<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
													<input class="form-control" placeholder="English Month"
														type="text" ng-model="newEnglishMonth.englishMonths">
												</div>
												<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
													<input class="form-control" placeholder="Description"
														type="text" ng-model="newEnglishMonth.description">
												</div>
												<!-- Image Upload -->
												<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
													<input type="file" id="englishMonthImage"
														name="englishMonthImage" class="form-control">
												</div>
												<div class="col-md-3 col-sm-8">
													<div class="form-check form-switch">
														<input class="form-check-input" type="checkbox"
															id="englishMonthSwitch" ng-model="isEnglishMonthActive"
															ng-change="englishMonthToggle()"> <label
															class="form-check-label" for="englishMonthSwitch">
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
													ng-click="newEnglishMonth.englishMonthId > 0 ? updateEnglishMonth() : addEnglishMonth()">Submit</button>
											</div>
										</form>
										<!-- English Month Table -->
										<div class="card">
											<div class="card-header" style="background-color: #ffad28;">
												<h5 style="color: black !important;">English Month List</h5>
											</div>
											<div class="card-body">
												<table class="table table-bordered">
													<thead>
														<tr>
															<th>#</th>
															<th>English Month</th>
															<th>Description</th>
															<th>Images</th>
															<th></th>
														</tr>
													</thead>
													<tbody>
														<tr ng-repeat="englishMonth in englishMonthList"
															style="cursor: pointer">
															<td ng-click="GetEnglishMonthById(englishMonth)"
																title="Update English Month" data-toggle="modal"
																data-target="#updateModal">{{$index + 1}}</td>
															<td ng-click="GetEnglishMonthById(englishMonth)"
																title="Update English Month" data-toggle="modal"
																data-target="#updateModal">
																{{englishMonth.englishMonths}}</td>
															<td ng-click="GetEnglishMonthById(englishMonth)"
																title="Update English Month" data-toggle="modal"
																data-target="#updateModal">
																{{englishMonth.description}}</td>
															<td>
																<div class="widget-thumb">
																	<a href="#"
																		ng-click="GetEnglishMonthById(englishMonth)"> <img
																		ng-src="<%=request.getContextPath()%>/resources/front/img/DailyDarshan/{{englishMonth.image}}"
																		alt="image" class="img-thumbnail"
																		style="width: 50px; height: 50px;">
																	</a>
																</div>
															</td>
															<td class="text-center" style="vertical-align: middle;">
																<input type="checkbox" ng-model="englishMonth.selected">
															</td>
														</tr>
													</tbody>
												</table>
												<div class="form-group" style="float: right;">
													<button type="button" id="Delete" class="btn btn-danger"
														ng-click="deleteEnglishMonth()">
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
								<a href="#collapseEnglishDay" class="d-block card-header py-3"
									data-toggle="collapse" role="button" aria-expanded="true"
									aria-controls="collapseCardExampleEnglishDay"
									style="background-color: #ffad28;">
									<h6 class="m-0 font-weight-bold text-primary"
										style="color: black !important;">English Day</h6>
								</a>
								<!-- Card Content - Collapse -->
								<div class="collapse" id="collapseEnglishDay">
									<div class="card-body">
										<form class="" name="myForm_englishDay">
											<div class="form-group row">
												<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
													<input class="form-control" placeholder="English Day"
														type="text" ng-model="newEnglishDay.englishDays">
												</div>
												<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
													<input class="form-control" placeholder="Description"
														type="text" ng-model="newEnglishDay.description">
												</div>
												<!-- Image Upload -->
												<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
													<input type="file" id="englishDayImage"
														name="englishDayImage" class="form-control">
												</div>
												<div class="col-md-3 col-sm-8">
													<div class="form-check form-switch">
														<input class="form-check-input" type="checkbox"
															id="englishDaySwitch" ng-model="isEnglishDayActive"
															ng-change="englishDayToggle()"> <label
															class="form-check-label" for="englishDaySwitch">
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
													ng-click="newEnglishDay.englishDayId > 0 ? updateEnglishDay() : addEnglishDay()">Submit</button>
											</div>
										</form>
										<!-- Variation Table -->
										<div class="card">
											<div class="card-header" style="background-color: #ffad28;">
												<h5 style="color: black !important;">English Day List</h5>
											</div>
											<div class="card-body">
												<table class="table table-bordered">
													<thead>
														<tr>
															<th>#</th>
															<th>English Day</th>
															<th>Description</th>
															<th>Images</th>
															<th></th>
														</tr>
													</thead>
													<tbody>
														<tr ng-repeat="englishDay in englishDayList"
															style="cursor: pointer">
															<td ng-click="GetEnglishDayById(englishDay)"
																title="Update English Day" data-toggle="modal"
																data-target="#updateModal">{{$index + 1}}</td>
															<td ng-click="GetEnglishDayById(englishDay)"
																title="Update English Day" data-toggle="modal"
																data-target="#updateModal">
																{{englishDay.englishDays}}</td>
															<td ng-click="GetEnglishDayById(englishDay)"
																title="Update English Day" data-toggle="modal"
																data-target="#updateModal">
																{{englishDay.description}}</td>
															<td>
																<div class="widget-thumb">
																	<a href="#" ng-click="GetEnglishDayById(englishDay)">
																		<img
																		ng-src="<%=request.getContextPath()%>/resources/front/img/DailyDarshan/{{englishDay.image}}"
																		alt="image" class="img-thumbnail"
																		style="width: 50px; height: 50px;">
																	</a>
																</div>
															</td>
															<td class="text-center" style="vertical-align: middle;">
																<input type="checkbox" ng-model="englishDay.selected">
															</td>
														</tr>
													</tbody>
												</table>
												<div class="form-group" style="float: right;">
													<button type="button" id="Delete" class="btn btn-danger"
														ng-click="deleteEnglishDay()">
														<i class="fas fa-trash"></i>
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
				$("#englishYearImage").change(function() {
					readURL(this);
				});
				$("#englishYearImage").click(function() {
					this.value = null;
				});
			});

			function setCoordinates(c) {
				document.myForm_englishYear.x.value = Math.round(c.x);
				document.myForm_englishYear.y.value = Math.round(c.y);
				document.myForm_englishYear.w.value = Math.round(c.w);
				document.myForm_englishYear.h.value = Math.round(c.h);
			};

			function checkCoordinates() {
				if (document.myForm_englishYear.x.value == ""
						|| document.myForm_englishYear.y.value == "") {
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
				$("#englishMonthImage").change(function() {
					readURL1(this);
				});
				$("#englishMonthImage").click(function() {
					this.value = null;
				});
			});

			function setCoordinates1(c) {
				document.myForm_englishMonth.x1.value = Math.round(c.x);
				document.myForm_englishMonth.y1.value = Math.round(c.y);
				document.myForm_englishMonth.w1.value = Math.round(c.w);
				document.myForm_englishMonth.h1.value = Math.round(c.h);
			};

			function checkCoordinates1() {
				if (document.myForm_englishMonth.x1.value == ""
						|| document.myForm_englishMonth.y1.value == "") {
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
				$("#englishDayImage").change(function() {
					readURL2(this);
				});
				$("#englishDayImage").click(function() {
					this.value = null;
				});
			});

			function setCoordinates2(c) {
				document.myForm_englishDay.x2.value = Math.round(c.x);
				document.myForm_englishDay.y2.value = Math.round(c.y);
				document.myForm_englishDay.w2.value = Math.round(c.w);
				document.myForm_englishDay.h2.value = Math.round(c.h);
			};

			function checkCoordinates2() {
				if (document.myForm_englishDay.x2.value == ""
						|| document.myForm_englishDay.y2.value == "") {
					alert("Please select a crop region");
					return false;
				} else {
					return true;
				}
			};
		</script>
</body>
</html>