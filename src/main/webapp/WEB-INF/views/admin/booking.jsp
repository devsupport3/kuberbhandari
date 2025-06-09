<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" ng-app="kuberbhandari">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Seva Booked</title>
<%@ include file="/WEB-INF/views/includeCssJs.jsp"%>

<!-- Bootstrap CSS -->
<%-- <link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Font Awesome -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
	rel="stylesheet">
<!-- AngularJS -->
<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.8.2/angular.min.js"></script>
<script
	src="<%=request.getContextPath()%>/resources/admin/js/confAdmin.js"></script> --%>

<style>
.pagination-search-section {
	background-color: #f8f9fa;
	padding: 15px;
	border-radius: 8px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
	margin-bottom: 20px;
}

@media ( max-width : 576px) {
	.order-table th, .order-table td {
		font-size: 12px;
		padding: 6px;
	}
	.pagination-search-section {
		flex-direction: column;
		gap: 10px;
	}
}
</style>
</head>
<body>

	<!-- Header -->
	<%@include file="header.jsp"%>

	<div class="container-fluid" ng-controller="SidebarController">
		<div class="row">
			<%@include file="sidebar.jsp"%>

			<!-- Main Content -->
			<div class="col-12 col-md-10 pt-3" ng-controller="AdminBookingCtrl"
				ng-init="getAllOrderDetails()">

				<div class="table-responsive">
					<table class="table table-bordered">
						<thead>
							<tr>
								<th colspan="6" class="table-header text-center"
									style="background-color: #ffad28;">Order Details</th>
							</tr>
						</thead>
					</table>
				</div>

				<!-- Page Size and Search Section -->
				<div
					class="pagination-search-section d-flex align-items-center justify-content-start flex-wrap gap-2 mb-4">
					<div class="input-group input-group-sm" style="width: auto;">
						<span class="input-group-text"><i class="fa fa-list"></i></span> <select
							ng-model="pageSize" ng-change="setPageSize(pageSize)"
							class="form-select form-select-sm w-auto">
							<option value="5">5</option>
							<option value="10">10</option>
							<option value="15">15</option>
							<option value="20">20</option>
							<option value="0">All</option>
						</select>
					</div>

					<label class="fw-bold mb-0">Entries</label>
				</div>

				<!-- Order Table -->
				<div class="table-responsive">
					<table class="table table-bordered order-table">
						<thead>
							<tr>
								<th class="text-center">Order ID/<br>Trans. Date
								</th>
								<th class="text-center">Order By/<br>Mobile No.
								</th>
								<th class="text-center">Total Amount</th>
								<th class="text-center">Performance Date</th>
								<th class="text-center">Payment Status</th>
							</tr>
						</thead>
						<tbody>
							<tr ng-click="toggleDetails(item)"
								ng-repeat-start="item in filteredOrders"
								ng-class="{'table-warning': item.showDetails}">
								<td class="text-center">
									<div>{{ item.orderNumber }}/</div>
									<div>{{ item.orderDate }}</div>
								</td>
								<td class="text-center">
									<div>{{item.billerName}}/</div>
									<div>{{item.billerMobileno}}</div>
								</td>
								<td class="text-center">{{item.totalAmount}}</td>
								<td class="text-center">{{
									item.orderSevaDetailsList[0].bookingDate }}</td>
								<td class="text-center">{{item.paymentStatus}}</td>
							</tr>
							<tr ng-repeat-end ng-show="item.showDetails">
								<td colspan="6">
									<h5 class="text-center">Booking Summary</h5>
									<div class="table-responsive">
										<table class="table table-bordered text-center mt-3">
											<thead>
												<tr>
													<th>#</th>
													<th>Seva Name</th>
													<th>Variation</th>
													<th>Frequency</th>
													<th>Quantity</th>
													<th>Amount</th>
													<th>Delivery</th>
												</tr>
											</thead>
											<tbody>
												<tr ng-repeat="sevaItem in item.orderSevaDetailsList">
													<td>{{$index + 1}}</td>
													<td>{{sevaItem.orderSevaTitle}}</td>
													<td>{{sevaItem.variationName}}</td>
													<td>{{sevaItem.frequencyName}}</td>
													<td>{{sevaItem.orderSevaQuantity}}</td>
													<td>{{sevaItem.orderSevaPrice}}</td>
													<td>{{sevaItem.orderDelivery}}</td>
												</tr>
											</tbody>
										</table>
									</div>

									<div class="table-responsive mt-3">
										<table class="table table-bordered">
											<tr>
												<td style="width: 50%;"><strong>Payment
														Details:</strong>
													<p class="mb-0">Payment Method: {{item.paymentMode}}</p>
													<p class="mb-0">Transaction ID: {{item.trackingId}}</p></td>
												<td style="width: 50%;"><strong>Bill To:</strong>
													<p class="mb-0">{{item.billerName}}</p>
													<p class="mb-0">{{item.billerAddress1}},
														{{item.billerAddress2}}</p>
													<p class="mb-0">{{item.billerCityName}},
														{{item.billerStateName}}</p>
													<p class="mb-0">{{item.billerCountryName}},
														{{item.billerPincode}}</p>
													<p class="mb-0">Email: {{item.billerEmailid}}</p>
													<p class="mb-0">Phone: {{item.billerMobileno}}</p></td>
											</tr>
										</table>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
				</div>

				<!-- Pagination Controls -->
				<nav aria-label="Page navigation">
					<ul class="pagination justify-content-center">
						<li class="page-item" ng-class="{disabled: currentPage == 1}">
							<a class="page-link" href="" ng-click="setPage(currentPage - 1)">Previous</a>
						</li>
						<li class="page-item"
							ng-repeat="page in [].constructor(totalPages()) track by $index"
							ng-class="{active: currentPage == ($index + 1)}"><a
							class="page-link" href="" ng-click="setPage($index + 1)">{{$index
								+ 1}}</a></li>
						<li class="page-item"
							ng-class="{disabled: currentPage == totalPages()}"><a
							class="page-link" href="" ng-click="setPage(currentPage + 1)">Next</a>
						</li>
					</ul>
				</nav>

			</div>
		</div>
	</div>

	<!-- Footer -->
	<%@include file="footer.jsp"%>

	<!-- Bootstrap JS -->
<!-- 	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script> -->

</body>
</html>
