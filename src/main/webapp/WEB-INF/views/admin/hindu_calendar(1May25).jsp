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

.form-row.three-cols {
  display: flex;
  justify-content: space-between;
  gap: 20px;
  margin-bottom: 20px;
}

.form-group {
  flex: 1;
  min-width: 200px;
}

.form-group label {
  display: block;
  font-weight: bold;
  margin-bottom: 5px;
}

select {
  width: 100%;
  padding: 8px;
  font-size: 14px;
  border: 1px solid #ccc;
  border-radius: 4px;
}

.radio-group {
  display: flex;
  gap: 15px;
  align-items: center;
  margin-top: 5px;
}

.radio-group input {
  margin-right: 5px;
}

.button-group {
  margin-top: 20px;
}

.btn {
  padding: 8px 16px;
  font-size: 14px;
  border: none;
  border-radius: 4px;
  margin-right: 10px;
  cursor: pointer;
  color: #fff;
}

.btn.green {
  background-color: #28a745;
}

.btn.red {
  background-color: #dc3545;
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
		<div class="col-md-10" ng-controller="hinduCalendarCtrl">
			<div class="card-body">
				<div class="container-fluid">
					<div class="row">
						<div class="col-lg-12 col-md-12  col-sm-12 col-xl-12">
							<div class="card shadow mb-4">
								<!-- Card Header - Accordion -->
								<a href="#collapseCardHinduCalendar"
									class="d-block card-header py-3" data-toggle="collapse"
									role="button" aria-expanded="true"
									aria-controls="collapseCardExampleHinduCalendar"
									style="background-color: #ffad28;">
									<h6 class="m-0 font-weight-bold text-primary"
										style="color: black !important;">Hindu Calendar</h6>
								</a>
								<!-- Card Content - Collapse -->
								<div class="collapse" id="collapseCardHinduCalendar" style="margin-top: 36px;">
									<div class="card-body" style="margin-top: -45px;">

										<!-- Main Form -->
										<form>
											<div class="form-row three-cols">
												<div class="form-group">
													<label>Samvat</label> <select>
														<option>---Select Samvat---</option>
													</select>
												</div>
												<div class="form-group">
													<label>Hindu Year</label> <select>
														<option>---Select Hindu Year---</option>
													</select>
												</div>
												<div class="form-group">
													<label>Hindu Month</label> <select>
														<option>---Select Hindu Month---</option>
													</select>
												</div>
											</div>

											<div class="form-row three-cols">
												<div class="form-group">
													<label>Hindu Paksh</label> <select>
														<option>---Select Hindu Paksh---</option>
													</select>
												</div>
												<div class="form-group">
													<label>Hindu Tithi</label> <select>
														<option>---Select Hindu Tithi---</option>
													</select>
												</div>
												<div class="form-group">
													<label>Select Month Type</label>
													<div class="radio-group">
														<label><input type="radio" name="monthType">
															Normal</label> <label><input type="radio"
															name="monthType"> Adhik</label>
													</div>
												</div>
											</div>

											<!-- Submit Button -->
											<div class="form-group">
												<button type="back" class="btn btn-success"
													style="background-color: #444; border-color: #444; text-align: center;"
													ng-click="backEventData()">Back</button>
												<button type="submit" class="btn btn-success"
													style="background-color: #444; border-color: #444;"
													ng-click="event.eventId > 0 ? updateEvent() : addAllEvent()">Submit</button>
												<button type="clear" class="btn btn-success"
													style="background-color: #444; border-color: #444;"
													ng-click="clearEventData()">Clear</button>
											</div>
										</form>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

				<!-- Event List Table -->
				<div class="card mt-4" style="margin: 37px;">
					<div class="card-header"
						style="background-color: #ffad28; color: white; height: 50px;">
						<h3 style="font-size: 1.30rem; color: black !important;">Event
							List</h3>
					</div>
					<div class="card-body">
						<table class="table table-bordered">
							<thead>
								<tr>
									<th>#</th>
									<th>Title</th>
									<th>Location</th>
									<th>Date</th>
									<th>Description</th>
									<th>Image</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<tr ng-repeat="event in eventList" ng-click="editEvent(event)"
									style="cursor: pointer">
									<td ng-click="GetEventById(event); openCollapse()"
										title="Update event" data-toggle="modal"
										data-target="#updateModal">{{$index + 1}}</td>
									<td ng-click="GetEventById(event); openCollapse()"
										title="Update event" data-toggle="modal"
										data-target="#updateModal">{{event.eventTitle}}</td>
									<td ng-click="GetEventById(event); openCollapse()"
										title="Update event" data-toggle="modal"
										data-target="#updateModal">{{event.eventLocation}}</td>
									<td ng-click="GetEventById(event); openCollapse()"
										title="Update event" data-toggle="modal"
										data-target="#updateModal">{{event.eventDate}}</td>
									<td ng-click="GetEventById(event); openCollapse()"
										title="Update event" data-toggle="modal"
										data-target="#updateModal"><span
										ng-bind-html="event.eventDescription | to_trusted "></span></td>
									<td>
										<div class="widget-thumb"
											ng-repeat="eventImage in event.eventsImages">
											<a href="#" ng-click="GetEventById(event); openCollapse()">
												<img
												ng-src="<%=request.getContextPath()%>/resources/front/img/Events/{{eventImage.eventImage}}"
												alt="image" class="img-thumbnail"
												style="width: 50px; height: 50px;">
											</a>
										</div>
									</td>
									<td class="text-center" style="vertical-align: middle;"><input
										type="checkbox" ng-model="event.selected"></td>
								</tr>
							</tbody>
						</table>
						<div class="form-group" style="float: right;">
							<button type="button" id="Delete" name="submit"
								class="btn btn-danger" ng-click="deleteEvent()">
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