<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en" ng-app="kuberbhandari">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Dashboard</title>
<%@ include file="/WEB-INF/views/includeCssJs.jsp"%>
<link
	href="https://cdn.jsdelivr.net/npm/cropperjs@1.5.13/dist/cropper.min.css"
	rel="stylesheet" />


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
	padding: 10px;
}

.card-footer {
	background-color: #f1f1f1;
}

.icon {
	font-size: 3rem;
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
</style>
</head>

<body ng-cloak>

	<div class="row" ng-controller="headerCtrl">
		<%@include file="header.jsp"%>
	</div>

	<div class="row" ng-controller="SidebarController">
		<%@include file="sidebar.jsp"%>
		<div class="col-md-10" ng-controller="sevaTypeMasterController">
			<div class="card-body">
				<div class="container-fluid">
					<div class="row">
						<div class="card-body">
							<!-- Seva Type Table -->
							<div class="card">
								<div class="d-flex card-header" style="padding: revert-layer;">
									<div class="col-11">
										<div class="" style="background-color: #ffad28;">
											<h5 style="color: black !important;">Seva Type List</h5>
										</div>
									</div>
									<div class="col-1 "
										style="text-align: end; margin: auto; color: black; font-size: x-large;">
										<i class="fas fa-plus" ng-click="openAddModal()"></i>
									</div>
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
													<th><button type="button" id="Delete" name="submit"
											class="btn btn-danger text-danger text-center" style="color:red !important" ng-click="deleteSevaType()">
											<i class="fas fa-trash"></i>
										</button></th>
												</tr>
											</thead>
											<tbody>
												<tr ng-repeat="sevaType in sevaTypeList"
													style="cursor: pointer">
													<td ng-click="GetSevaTypeById(sevaType)"
														title="Update Seva Type">{{$index + 1}}</td>
													<td ng-click="GetSevaTypeById(sevaType)"
														title="Update Seva Type">{{sevaType.name ||
														'-'}}</td>
													<td ng-click="GetSevaTypeById(sevaType)"
														title="Update Seva Type">{{sevaType.description ||
														'-'}}</td>
													<td>
														<div class="widget-thumb">
															<a href="#" ng-click="GetSevaTypeById(sevaType)"> <img
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
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- Reusable Modal for Add/Update -->
			<div class="modal fade" id="sevaTypeModal" tabindex="-1"
				aria-labelledby="sevaTypeModalLabel" aria-hidden="true">
				<div class="modal-dialog modal-dialog-centered modal-lg">
					<div class="modal-content">

						<form name="sevaForm" novalidate ng-submit="save()"
							enctype="multipart/form-data">
							<div class="modal-header">
								<h5 class="modal-title" id="sevaTypeModalLabel">{{
									isEditMode ? 'Update' : 'Add' }} Seva Type</h5>
								<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
							</div>

							<div class="modal-body row">
							<div class="col-12 col-md-6 mb-3">
							<label for="name" class="form-label"> Name<span
										class="text-danger">*</span></label> <input type="text"
										class="form-control" id="name" name="name"
										placeholder="Enter Name" ng-model="entity.name"
										required> <small class="text-danger"
										ng-if="sevaForm.name.$touched && sevaForm.name.$invalid">
										This field is required. </small>
							</div>
							<div class="col-12 col-md-6 mb-3">
							<label for="img" class="form-label">Upload Image</label>
									<image-cropper image-file="entity.imageFile"
										image-preview="entity.imagePreview"
										crop-data="entity.cropData"></image-cropper>
							</div>
								
								<div class="col-12 col-md-6 mb-3">
									<div class="d-flex">
										<div class="col-10">
											<label class="form-label">Is Active?</label>
										</div>
										<div class="col-2">
											<!-- Yes/No Switch -->
											<div class="form-check form-switch float-end">
												<input class="form-check-input m-0" type="checkbox"
													id="statusSwitch" ng-model="entity.isActive"
													ng-change="entity.statusText = entity.isActive ? 'Yes' : 'No'">
											</div>
										</div>
									</div>

									<!-- Read-only Text Field Showing 'Yes' or 'No' Using Expression -->
									<input type="text" class="form-control" placeholder="Status"
										ng-value="entity.isActive ? 'Yes' : 'No'" readonly>
								</div>
								<div class="col-12 col-md-6 mb-3">
									<label for="description" class="form-label">Description</label>
									<textarea class="form-control" id="description"
										placeholder="Enter Description" name="description"
										ng-model="entity.description"></textarea>
								</div>
							</div>

							<div class="modal-footer">
								<button type="submit" class="btn btn-primary"
									style="background-color: #ffa913; border: none;">{{
									isEditMode ? 'Update' : 'Add' }}</button>
								<button type="button" class="btn btn-secondary"
									style="background-color: #ff0a1a; border: none;"
									data-bs-dismiss="modal">Cancel</button>
							</div>
						</form>

					</div>
				</div>
			</div>


		</div>
	</div>

	<%@include file="footer.jsp"%>
	<toaster-container toaster-options="{'time-out': 1000}"></toaster-container>
	<script
		src="https://cdn.jsdelivr.net/npm/cropperjs@1.5.13/dist/cropper.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/admin/js/directives/imageCropper.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/admin/js/services/crudFormService.js"></script>
</body>
</html>
