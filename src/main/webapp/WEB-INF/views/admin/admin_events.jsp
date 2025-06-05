<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" ng-app="kuberbhandari">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Events</title>

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

	<!-- Sidebar -->
	<div class="row" ng-controller="SidebarController">
		<%@include file="sidebar.jsp"%>

		<!-- Form Container -->
		<div class="col-md-10" style="margin-top: 30px;"
			ng-controller="AdminManageEventsController">
			<div class="card-body">
				<div class="container-fluid">
					<div class="row">
						<div class="col-lg-12 col-md-12  col-sm-12 col-xl-12">
							<div class="card shadow mb-4">
								<!-- Card Header - Accordion -->
								<a href="#collapseCardEvents" class="d-block card-header py-3"
									data-toggle="collapse" role="button" aria-expanded="true"
									aria-controls="collapseCardExampleEvents"
									style="background-color: #ffad28;">
									<h6 class="m-0 font-weight-bold text-primary"
										style="color: black !important;">Events</h6>
								</a>
								<!-- Card Content - Collapse -->
								<div class="collapse" id="collapseCardEvents">
									<div class="card-body" style="margin-top: -45px;">

										<!-- Main Form -->
										<form class="needs-validation" name="myForm"
											style="margin-top: 32px;">
											<div class="container-fluid py-4">
												<div class="form-group row">

													<!-- Title -->
													<div class="col-md-4 col-sm-12 mb-3">
														<input class="form-control" placeholder="Title"
															type="text" ng-model="event.eventTitle">
													</div>

													<!-- Location -->
													<div class="col-md-4 col-sm-12 mb-3">
														<input class="form-control" placeholder="Location"
															type="text" ng-model="event.eventLocation">
													</div>

													<!-- Date Selection -->
													<div class="col-md-4 col-sm-12 mb-3">
														<!-- <input type="date" class="form-control" id="eventDate"
															ng-model="event.eventDate"> -->
														<input type="date" class="form-control" id="eventDate"
															ng-model="event.eventDate" min="{{minDate}}" required
															ng-change="updateDay()">
													</div>
												</div>

												<div class="form-group row">
													<div class="col-md-4 col-sm-12 mb-3">
														<input class="form-control" placeholder="Image Title"
															type="text" ng-model="eventImages.eventImageTitle">
													</div>
													<div class="col-md-4 col-sm-12 mb-3">
														<input class="form-control"
															placeholder="Image Description" type="text"
															ng-model="eventImages.eventImageDescription">
													</div>
													<div class="col-md-4 col-sm-12 mb-3">
														<input type="file" id="eventImage" name="eventImage"
															class="form-control">
													</div>
												</div>
												<div class="row justify-content-center text-center">
													<div class="col-md-4">
														<img src="" id="target" />
														<!-- <form name="myForm"> -->
														<input type="hidden" name="x" id="valuex"
															ng-model="valuex" /> <input type="hidden" name="y"
															id="valuey" ng-model="valuey" /> <input type="hidden"
															name="w" id="valuew" ng-model="valuew" /> <input
															type="hidden" name="h" id="valueh" ng-model="valueh" />
														<!-- </form> -->
													</div>
												</div>
											</div>

											<br>

											<!-- Description -->
											<div class="form-group row">
												<div class="col-md-12 mb-3">
													<textarea class="form-control mr-2" id="eventDescription"
														name="eventDescription" placeholder="Description" rows="4"
														ng-model="event.eventDescription"></textarea>
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
					<div class="table-responsive">
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
										ng-bind-html="event.eventDescription | to_trusted"></span></td>
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
					</div>
					<div class="form-group" style="float: right;">
						<button type="button" id="Delete" name="submit"
							class="btn btn-danger" ng-click="deleteEvent()">
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
			CKEDITOR.replace('eventDescription', {
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