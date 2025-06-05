<!DOCTYPE html>
<html lang="en" ng-app="kuberbhandari">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Seva Booked</title>

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Font Awesome for Icons -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
	rel="stylesheet">
<!-- AngularJS -->
<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.8.2/angular.min.js"></script>

<script
	src="<%=request.getContextPath()%>/resources/admin/js/confAdmin.js"></script>

<style>
/* Add your custom styles here */
.table-header {
	text-align: center;
	font-size: 1.5rem;
	background-color: #ffad28;
	color: white;
	font-weight: bold;
	padding: 15px;
}

.btn-info {
	background-color: #17a2b8;
}

.btn-danger {
	background-color: #dc3545;
}

.pagination-search-section {
	margin-top: 10px;
	margin-bottom: 10px;
}

.pagination-search-section .form-group {
	margin-bottom: 0;
}

.pagination-search-section label {
	font-size: medium;
}

.input-group-addon {
	background-color: #fff;
	border-right: 0;
	color: #555;
}

.input-group .form-control {
	border-left: 0;
}

.pagination-search-section .font-weight-bold {
	font-weight: bold;
	color: #343a40;
}

.pagination-search-section select.form-control {
	padding: 8px 12px;
	font-size: 14px;
}
</style>
</head>
<body ng-controller="AdminBookingCtrl">

	<!-- Header with Navbar -->
	<div class="row">
		<!-- Sidebar -->
		<div class="col-md-2">
			<!-- Include Sidebar Here -->
		</div>

		<!-- Main Content -->
		<div class="col-md-10 content" style="padding-top: 20px;">
			<table class="table table-bordered">
				<thead>
					<tr>
						<th colspan="6" class="table-header">Order Details</th>
					</tr>
				</thead>
			</table>

			<!-- Page Size and Search Section -->
			<div class="pagination-search-section d-flex align-items-center mb-4">
				<div class="page-size-section">
					<div class="input-group">
						<span class="input-group-addon"><i class="fa fa-list"></i></span>
						<select ng-model="pageSize" ng-change="setPageSize(pageSize)"
							class="form-control">
							<option value="5">5</option>
							<option value="10">10</option>
							<option value="15">15</option>
							<option value="20">20</option>
							<option value="0">All</option>
						</select>
					</div>
				</div>
				<div class="entries-section">
					<label class="font-weight-bold" style="margin-left: 10px;">Entries</label>
				</div>
			</div>

			<!-- Order Table -->
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>Order ID/Trans. Date</th>
						<th>Order By/Mobile No.</th>
						<th>Total Amount</th>
						<th>Performance date</th>
						<th>Payment Status</th>
					</tr>
				</thead>
				<tbody>
					<tr ng-click="toggleDetails(item)"
						ng-repeat="item in filteredOrders"
						ng-class="{'table-warning': item.showDetails}">
						<td>{{ item.orderNumber }}/{{ item.orderDate }}</td>
						<td>{{ item.billerName }}/{{ item.billerMobileno }}</td>
						<td>{{ item.totalAmount }}</td>
						<td>{{ item.orderSevaDetailsList[0].bookingDate }}</td>
						<td>{{ item.paymentStatus }}</td>
					</tr>
					<tr ng-if="item.showDetails" ng-repeat-end>
						<td colspan="5">
							<table class="table">
								<tr>
									<th>#</th>
									<th>Seva Name</th>
									<th>Variation</th>
									<th>Frequency</th>
									<th>Quantity</th>
									<th>Amount</th>
									<th>Delivery</th>
								</tr>
								<tr ng-repeat="sevaItem in item.orderSevaDetailsList">
									<td>{{$index + 1}}</td>
									<td>{{ sevaItem.orderSevaTitle }}</td>
									<td>{{ sevaItem.variationName }}</td>
									<td>{{ sevaItem.frequencyName }}</td>
									<td>{{ sevaItem.orderSevaQuantity }}</td>
									<td>{{ sevaItem.orderSevaPrice }}</td>
									<td>{{ sevaItem.orderDelivery }}</td>
								</tr>
							</table>
						</td>
					</tr>
				</tbody>
			</table>

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

	<!-- Footer -->
	<div>
		<!-- Include footer here -->
	</div>

	<!-- Bootstrap JS and jQuery -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
