<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" ng-app="kuberbhandari">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Gallery</title>

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
			ng-controller="AdminManageGalleryCtrl">
			<div class="card-body">
				<div class="container-fluid">
					<div class="row">
						<div class="col-lg-12 col-md-12  col-sm-12 col-xl-12">
							<div class="card shadow mb-4">
								<!-- Card Header - Accordion -->
								<a href="#collapseCardGallery" class="d-block card-header py-3"
									data-toggle="collapse" role="button" aria-expanded="true"
									aria-controls="collapseCardExampleGallery"
									style="background-color: #ffad28;">
									<h6 class="m-0 font-weight-bold text-primary"
										style="color: black !important;">Gallery</h6>
								</a>
								<!-- Card Content - Collapse -->
								<div class="collapse" id="collapseCardGallery">
									<div class="card-body" style="margin-top: -45px;">

										<!-- Main Form -->
										<form class="needs-validation" name="myForm"
											style="margin-top: 32px;">
											<div class="container-fluid py-4">

												<div class="form-group row">
													<!--Title -->
													<div class="col-md-4">
														<input class="form-control" placeholder="Album Title"
															type="text" ng-model="album.albumTitle">
													</div>

													<!-- Sub-Title -->
													<div class="col-md-4">
														<input class="form-control" placeholder="Sub-Title"
															type="text" ng-model="album.albumSubtitle">
													</div>

													<!-- Date Selection -->
													<div class="col-md-4">
														<!-- <input type="date" class="form-control" id="albumDate"
															ng-model="album.albumDate"> -->
														<input type="date" class="form-control" id="albumDate"
															ng-model="album.albumDate" min="{{minDate}}" required
															ng-change="updateDay()">
													</div>
												</div>

												<!-- Description -->
												<div class="form-group row">
													<div class="col-md-12 mb-3">
														<textarea class="form-control mr-2"
															id="galleryDescription" name="galleryDescription"
															placeholder="Description" rows="4"
															ng-model="album.description"></textarea>
													</div>
												</div>

												<div class="col-md-12" align="center">
													<div class="panel"
														style="background-color: #C0C0C0; border-radius: 25px; margin-left: -17px; margin-right: -15px;">
														<div class="panel-heading" style="padding: 0px 15px;">
															<h4>Album Images</h4>
														</div>
													</div>
												</div>

												<div class="form-group row">
													<div class="col-md-4 col-sm-12 mb-3">
														<input class="form-control"
															placeholder="Enter Image Title" type="text"
															ng-model="albumImages.imageTitle">
													</div>

													<div class="col-md-4 col-sm-12 mb-3">
														<input class="form-control"
															placeholder="Enter Image Description" type="text"
															ng-model="albumImages.imageDescription">
													</div>

													<div
														class="col-md-4 col-sm-12 mb-3 d-flex align-items-center">
														<input type="file" id="AlbumImage" name="AlbumImage"
															class="form-control me-2">
														<button type="button" class="btn btn-primary"
															ng-click="addAlbumImages()"
															style="background-color: #444; border-color: #444; height: fit-content; margin-top: 8px;">Add</button>
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

												<div class="row">
													<div class="col-12">
														<div class="table-responsive">
															<table class="table table-striped w-100">
																<tbody>
																	<tr>
																		<th>#</th>
																		<th>Image Title</th>
																		<th>Image Description</th>
																		<th>Image</th>
																		<th>Del</th>
																	</tr>
																	<tr ng-repeat="item in albumimagelist">
																		<td>{{$index + 1}}</td>
																		<td>{{item.imageTitle}}</td>
																		<td>{{item.imageDescription}}</td>
																		<td><img ng-if="item.isNew"
																			ng-src="{{item.image}}" alt="Album Image" class="img"
																			style="width: 50px; height: 50px; padding: 0; margin: 0; border: none;">
																			<img ng-if="!item.isNew"
																			ng-src="<%=request.getContextPath()%>/resources/front/images/gallery/{{item.image}}"
																			alt="Album Image" class="img"
																			style="width: 50px; height: 50px; padding: 0; margin: 0; border: none;">
																		</td>
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
														ng-click="backAlbumData()">Back</button>
													<button type="submit" class="btn btn-success"
														style="background-color: #444; border-color: #444;"
														ng-click="album.albumId > 0 ? updateAlbum() : addAllAlbum()">Submit</button>
													<button type="clear" class="btn btn-success"
														style="background-color: #444; border-color: #444;"
														ng-click="clearAlbumData()">Clear</button>
												</div>
											</div>
										</form>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

				<!-- Gallery List Table -->
				<div class="card mt-4" style="margin: 16px;">
					<div class="card-header"
						style="background-color: #ffad28; color: white; height: 50px;">
						<h3 style="font-size: 1.30rem; color: black !important;">Gallery
							List</h3>
					</div>
					<div class="card-body">
						<div class="table-responsive">
							<table class="table table-bordered">
								<thead>
									<tr>
										<th>#</th>
										<th>Title</th>
										<th>Sub Title</th>
										<th>Description</th>
										<th>Date</th>
										<th></th>
									</tr>
								</thead>
								<tbody>
									<tr ng-repeat="album in albumList" ng-click="editAlbum(album)"
										style="cursor: pointer">
										<td ng-click="GetGalleryById(album); openCollapse()"
											title="Update gallery" data-toggle="modal"
											data-target="#updateModal">{{$index + 1}}</td>
										<td ng-click="GetGalleryById(album); openCollapse()"
											title="Update gallery" data-toggle="modal"
											data-target="#updateModal">{{album.albumTitle}}</td>
										<td ng-click="GetGalleryById(album); openCollapse()"
											title="Update gallery" data-toggle="modal"
											data-target="#updateModal">{{album.albumSubtitle}}</td>
										<td ng-click="GetGalleryById(album); openCollapse()"
											title="Update gallery" data-toggle="modal"
											data-target="#updateModal">
											<p ng-bind-html="album.description | to_trusted "></p>
										</td>
										<td ng-click="GetGalleryById(album); openCollapse()"
											title="Update gallery" data-toggle="modal"
											data-target="#updateModal">{{album.albumDate}}</td>
										<td class="text-center" style="vertical-align: middle;">
											<input type="checkbox" ng-model="album.selected">
										</td>
									</tr>
								</tbody>
							</table>
						</div>

						<div class="form-group" style="float: right;">
							<button type="button" id="Delete" name="submit"
								class="btn btn-danger" ng-click="deleteGallery()">
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
			CKEDITOR.replace('galleryDescription', {
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
								document.getElementById("AlbumImage").value = null;
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
			$("#AlbumImage").change(function() {
				readURL(this);
			});
			$("#AlbumImage").click(function() {
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
	<!-- Script For jcrop start -->

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
								$('#target1').attr('src', "");
								document.getElementById("thumbnailImage").value = null;
							} else {
								$('#target1').css("max-width", "100%");
								//$('#target').css("width", "500px");

								$('#target1').attr('src', e.target.result);
								$('#target1').Jcrop({
									//aspectRatio : 192 / 85,
									//boxWidth : 840,
									//boxHeight : 400,
									//minSize : [ 600, 765 ],
									//maxSize : [ 1200, 1530 ],
									//setSelect : [ 0, 0, 600, 765 ],
									onChange : setCoordinates1,
									onSelect : setCoordinates1,
									trueSize : [ img.width, img.height ]
								});

							}
						};

						img.src = u;
					}
					reader.readAsDataURL(input.files[0]);
				}
			}
			$("#thumbnailImage").change(function() {
				readURL(this);
			});
			$("#thumbnailImage").click(function() {
				this.value = null;
			});
		});

		function setCoordinates1(c) {
			document.myForm.x1.value = Math.round(c.x1);
			document.myForm.y1.value = Math.round(c.y1);
			document.myForm.w1.value = Math.round(c.w1);
			document.myForm.h1.value = Math.round(c.h1);
		};

		function checkCoordinates1() {
			if (document.myForm.x1.value == ""
					|| document.myForm.y1.value == "") {
				alert("Please select a crop region");
				return false;
			} else {
				return true;
			}
		};
	</script>
</body>
</html>