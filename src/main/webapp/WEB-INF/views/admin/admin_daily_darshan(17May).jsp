<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en" ng-app="kuberbhandari">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>Kuber Bhandari - Shree Kubereshwar Mahadev</title>

<!-- AngularJS -->
<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.8.2/angular.min.js"></script>
<script
	src="<%=request.getContextPath()%>/resources/admin/js/confAdmin.js"></script>

<!-- CKEditor -->
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/admin/ckeditor/ckeditor.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/admin/ckfinder/ckfinder.js"></script>

<!-- Jcrop -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/admin/jcrop/css/jquery.Jcrop.css"
	type="text/css" />

<style>
/* Daily Darshan Styles */
.container {
	margin: 24px auto;
	background: white;
	border-radius: 8px;
	box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
	padding: 16px;
	width: 95%;
	max-width: 1200px;
	box-sizing: border-box;
}

/* Collapsible Card Header */
.card-header {
	font-weight: 600;
	padding: 12px 16px !important;
	cursor: pointer;
	user-select: none;
	border-radius: 6px 6px 0 0;
	display: flex;
	justify-content: space-between;
	align-items: center;
	background-color: #ffad28;
	color: white;
}

.arrow {
	transition: transform 0.3s ease;
}

.collapsed .arrow {
	transform: rotate(0deg);
}

#darshanCard:not(.collapsed) .arrow {
	transform: rotate(180deg);
}

#darshanCard .card-body {
	padding: 16px;
	border-top: none;
	border-radius: 0 0 6px 6px;
	display: none;
}

#darshanCard:not(.collapsed) .card-body {
	display: block;
}

/* Form Rows - Responsive */
.form-row, .upload-row {
	display: flex;
	/* flex-wrap: wrap; */
	gap: 10px;
	margin-bottom: 12px;
	box-sizing: border-box;
	width: 100%;
}

/* Form Row Description Adjustment */
.form-row.description-row {
	flex-direction: column;
	width: 100%;
}

/* Form Inputs and Textarea */
textarea, input[type="text"], input[type="date"], input[type="file"] {
	width: 100% !important;
	padding: 8px 10px;
	border: 1px solid #ccc;
	border-radius: 4px;
	font-size: 14px;
	font-family: inherit;
	box-sizing: border-box;
	resize: vertical;
}

textarea {
	min-height: 120px;
}

.upload-row input[type="file"] {
	padding: 10px;
}

/* Fix for small screens <= 767px */
@media ( max-width : 767px) {
	/* Make sure form inputs and buttons stretch fully */
	.form-row, .upload-row {
		flex-direction: column;
	}
	.form-row input, .upload-row input, textarea {
		width: 100% !important;
	}
	.button-group button {
		width: 100%;
		padding: 12px;
	}
}

/* Responsive Breakpoints for Medium and Larger Screens */
@media ( min-width : 600px) {
	.form-row input[type="text"], .form-row input[type="date"], .upload-row input[type="text"]
		{
		flex: 1 1 calc(50% - 10px);
	}
}

@media ( min-width : 900px) {
	.form-row input[type="text"], .form-row input[type="date"], .upload-row input[type="text"]
		{
		flex: 1 1 calc(25% - 10px);
	}
}

.upload-row button {
	flex: 1 1 auto;
	max-width: 150px;
	align-self: stretch;
	background-color: #ffad28;
	border: none;
	padding: 8px 14px;
	color: #fff;
	border-radius: 4px;
	cursor: pointer;
	font-weight: 600;
	transition: background-color 0.3s ease;
}

.upload-row button:hover {
	background-color: #e89f00;
}

/* Section Title */
.section-title {
	font-weight: 600;
	margin: 16px 0 8px 0;
	font-size: 1.1rem;
	color: #444;
}

/* Table Styles */
.table-wrapper {
	overflow-x: auto;
	margin-top: 12px;
}

table {
	width: 100%;
	border-collapse: collapse;
	font-size: 14px;
	min-width: 600px;
}

th, td {
	padding: 10px 8px;
	border: 1px solid #ddd;
	text-align: left;
	vertical-align: middle;
}

th {
	background-color: #ffad28;
	color: white;
	font-weight: 600;
}

td button.btn-danger {
	font-size: 14px;
	padding: 4px 8px;
}

/* Button Group */
.button-group {
	margin-top: 16px;
	display: flex;
	flex-wrap: wrap;
	gap: 12px;
}

.button-group button {
	padding: 8px 16px;
	font-size: 14px;
	font-weight: 600;
	border-radius: 4px;
	border: none;
	cursor: pointer;
	background-color: #ffad28;
	color: white;
	transition: background-color 0.3s ease;
}

.button-group button:hover {
	background-color: #e89f00;
}

.button-group .btn-danger {
	background-color: #d9534f;
}

.button-group .btn-danger:hover {
	background-color: #c9302c;
}

/* Responsive Image in Table */
table img.img-thumbnail {
	padding: 0;
	margin: 0;
	border: none;
	width: 50px;
	height: 50px;
	object-fit: cover;
}

/* Pagination Buttons */
.d-flex {
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.mt-3 {
	margin-top: 1rem;
}

.btn-secondary {
	background-color: #6c757d;
	color: white;
	border: none;
	padding: 6px 12px;
	border-radius: 4px;
	cursor: pointer;
}

.btn-secondary:hover {
	background-color: #5a6268;
}

.upload-row {
	display: flex;
	align-items: center;
	gap: 20px;
	flex-wrap: nowrap;
	overflow-x: auto;
	white-space: nowrap;
	padding: 5px;
}

.radio-options {
	display: flex;
	gap: 20px;
	flex-shrink: 0;
}

.form-check {
	display: flex;
	align-items: center;
	gap: 8px;
	white-space: nowrap;
	min-width: 120px;
	flex-shrink: 0;
}

button {
	background-color: #444;
	border-color: #444;
	color: #fff;
	padding: 6px 12px;
	border-radius: 4px;
	white-space: nowrap;
	flex-shrink: 0;
	cursor: pointer;
}
</style>
</head>
<body>

	<!-- Header with Navbar -->
	<%@include file="header.jsp"%>

	<!-- Daily Darshan Content -->
	<main ng-controller="AdminManageDailyDarshanCtrl">
		<div class="container collapsed" id="darshanCard">
			<div class="card-header" onclick="toggleCollapse()"
				style="background-color: #ffad28; border-radius: 6px;">
				<span>Daily Darshan</span> <span class="arrow" id="arrow">▼</span>
			</div>

			<div class="card-body" id="cardBody">
				<div class="form-row">
					<input id="titleInput" type="text" placeholder="Title"
						ng-model="dailyDarshan.dailyDarshanTitle" /> <input
						id="subtitleInput" type="text" placeholder="Sub-Title"
						ng-model="dailyDarshan.dailyDarshanSubtitle" /> <input
						id="dailyDarshanDate" type="date"
						ng-model="dailyDarshan.dailyDarshanDate" min="{{minDate}}"
						required ng-change="updateDay()" /> <input id="dailyDarshanDay"
						type="text" placeholder="Day"
						ng-model="dailyDarshan.dailyDarshanDay" readonly />
				</div>

				<div class="form-row description-row">
					<textarea id="dailyDarshanDescription" placeholder="Description"
						ng-model="dailyDarshan.dailyDarshanDescription"></textarea>
				</div>

				<div class="section-title">Daily Darshan Images</div>

				<div class="upload-row">
					<input id="imageTitleInput" type="text"
						placeholder="Enter Image Title"
						ng-model="dailyDarshanImages.imageTitle" /> <input
						id="imageDescInput" type="text"
						placeholder="Enter Image Description"
						ng-model="dailyDarshanImages.imageDescription" /> <input
						id="youtubeUrlInput" type="text" placeholder="Enter YouTube URL"
						ng-model="dailyDarshanImages.youTubeUrl" />
				</div>

				<div class="upload-row">
					<div class="radio-options">
						<div class="form-check">
							<input type="radio" name="uploadMethod" id="uploadMultiple"
								value="multiple" /> <label for="uploadMultiple">Upload
								Multiple Images</label>
						</div>
						<div class="form-check">
							<input type="radio" name="uploadMethod" id="captureImage"
								value="capture" /> <label for="captureImage">Capture
								Image</label>
						</div>
					</div>
					<button type="button" ng-click="addDailyDarshan()">Add</button>
				</div>

				<div class="row text-center" style="margin-top: 20px;">
					<div class="col-md-4">
						<img src="" id="target" alt="Preview Image" /> <input
							type="hidden" name="x" id="valuex" ng-model="valuex" /> <input
							type="hidden" name="y" id="valuey" ng-model="valuey" /> <input
							type="hidden" name="w" id="valuew" ng-model="valuew" /> <input
							type="hidden" name="h" id="valueh" ng-model="valueh" />
					</div>
				</div>

				<div class="table-wrapper">
					<table>
						<thead>
							<tr>
								<th style="background-color: #444; border-color: #444;">#</th>
								<th style="background-color: #444; border-color: #444;">Image
									Title</th>
								<th style="background-color: #444; border-color: #444;">Image
									Description</th>
								<th style="background-color: #444; border-color: #444;">YouTube
									URL</th>
								<th style="background-color: #444; border-color: #444;">Image</th>
								<th style="background-color: #444; border-color: #444;">Del</th>
							</tr>
						</thead>
						<tbody id="imageTableBody">
							<tr ng-repeat="item in dailydarshanimagelist">
								<td>{{$index + 1}}</td>
								<td>{{item.imageTitle}}</td>
								<td>{{item.imageDescription}}</td>
								<td>{{item.youTubeUrl}}</td>
								<td><img ng-if="item.isNew" ng-src="{{item.image}}"
									alt="Daily Darshan Image" class="img-thumbnail" /> <img
									ng-if="!item.isNew"
									ng-src="/resources/front/img/DailyDarshan/{{item.dailyDarshanImages}}"
									alt="Daily Darshan Image" class="img-thumbnail" /></td>
								<td>
									<button type="button" class="btn btn-danger"
										ng-click="deleteItem(item)">
										<i class="fas fa-trash"></i>
									</button>
								</td>
							</tr>
						</tbody>
					</table>
				</div>

				<div class="button-group">
					<button type="button" ng-click="backDailyDarshanData()"
						style="background-color: #444; border-color: #444;">Back</button>
					<button type="button"
						ng-click="dailyDarshan.dailyDarshanId > 0 ? updateDailyDarshan() : addAllDailyDarshan()"
						style="background-color: #444; border-color: #444;">Submit</button>
					<button type="button" id="Delete" name="submit"
						class="btn btn-danger" ng-click="clearDailyDarshanData()"
						style="background-color: #444; border-color: #444;">
						<i class="fas fa-trash"></i> Clear
					</button>
				</div>
			</div>
		</div>

		<!-- Daily Darshan List -->
		<div class="container">
			<div class="card-header"
				style="background-color: #ffad28; border-radius: 6px;">
				<span>Daily Darshan List</span>
			</div>
			<div class="card-body">
				<div class="table-wrapper">
					<table>
						<thead>
							<tr>
								<th style="background-color: #444; border-color: #444;">#</th>
								<th style="background-color: #444; border-color: #444;">Title</th>
								<th style="background-color: #444; border-color: #444;">Sub-Title</th>
								<th style="background-color: #444; border-color: #444;">Date</th>
								<th style="background-color: #444; border-color: #444;">Day</th>
								<th style="background-color: #444; border-color: #444;">Description</th>
								<th style="background-color: #444; border-color: #444;">Action</th>
							</tr>
						</thead>
						<tbody id="darshanListBody">
							<tr ng-repeat="dailyDarshan in dailyDarshanList"
								style="cursor: pointer"
								ng-click="GetDailyDarshanById(dailyDarshan)">
								<td>{{$index + 1}}</td>
								<td>{{dailyDarshan.dailyDarshanTitle}}</td>
								<td>{{dailyDarshan.dailyDarshanSubtitle}}</td>
								<td>{{dailyDarshan.dailyDarshanDate | dateFormat1}}</td>
								<td>{{dailyDarshan.dailyDarshanDay}}</td>
								<td><p
										ng-bind-html="dailyDarshan.dailyDarshanDescription | to_trusted"></p></td>
								<td>
									<button type="button" class="btn btn-danger"
										ng-click="deleteDailyDarshan(dailyDarshan, $event)">
										<i class="fas fa-trash"></i>
									</button>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>

			<div class="d-flex justify-content-between align-items-center mt-3">
				<button class="btn btn-secondary" ng-click="changePage(-1)">Previous</button>
				<span>Page {{page}} of {{pageCount}}</span>
				<button class="btn btn-secondary" ng-click="changePage(1)">Next</button>
			</div>
		</div>
	</main>

	<!-- Footer -->
	<%@include file="footer.jsp"%>

	<!-- FontAwesome CDN -->
	<link
		href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
		rel="stylesheet" />

	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<!-- Jcrop -->
	<script
		src="<%=request.getContextPath()%>/resources/admin/jcrop/js/jquery.Jcrop.js"></script>

	<!-- Script For CKEditor Start -->
	<script>
		//Initialize the Editor
		initEditor();

		//Replace the <textarea id="editor1"> with an CKEditor instance.  
		function initEditor() {
			CKEDITOR.replace('dailyDarshanDescription', {
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
								document.getElementById("dailyDarshanImage").value = null;
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
			$("#dailyDarshanImage").change(function() {
				readURL(this);
			});
			$("#dailyDarshanImage").click(function() {
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
	<!-- Script For jcrop End -->

	<!-- Dropdown Toggle Script -->
	<script>
	// Collapse toggle for Daily Darshan card
	function toggleCollapse() {
	  const card = document.getElementById("darshanCard");
	  card.classList.toggle("collapsed");
	}
	
	 /*  document.addEventListener("DOMContentLoaded", function () {
	    const rows = document.querySelectorAll("#darshanListBody tr");
	
	    rows.forEach(row => {
	      row.addEventListener("click", function (event) {
	        // Skip scroll if a delete button was clicked
	        if (event.target.closest("button")) return;
	
	        const darshanCard = document.getElementById("darshanCard");
	        const main = document.querySelector("main");
	
	        // Expand if collapsed
	        darshanCard.classList.remove("collapsed");
	
	        // Scroll to a position ABOVE the <main> element
	        const yOffset = -100; // Adjust this offset to move further up or down
	        const y = main.getBoundingClientRect().top + window.pageYOffset + yOffset;
	        window.scrollTo({ top: y, behavior: "smooth" });
	
	        // Autofill form
	        const cells = row.querySelectorAll("td");
	        if (cells.length >= 6) {
	          document.getElementById("titleInput").value = cells[1].textContent.trim();
	          document.getElementById("subtitleInput").value = cells[2].textContent.trim();
	          document.getElementById("dateInput").value = cells[3].textContent.trim();
	          document.getElementById("dayInput").value = cells[4].textContent.trim();
	          document.getElementById("descInput").value = cells[5].textContent.trim();
	        }
	      });
	    });
	  }); */
	
	const rowsPerPage = 15;
	let currentPage = 1;
	
	function paginateDarshanTable() {
	  const tbody = document.getElementById("darshanListBody");
	  const rows = Array.from(tbody.querySelectorAll("tr"));
	
	  const totalPages = Math.ceil(rows.length / rowsPerPage);
	  const startIndex = (currentPage - 1) * rowsPerPage;
	  const endIndex = startIndex + rowsPerPage;
	
	  rows.forEach((row, index) => {
	    row.style.display = index >= startIndex && index < endIndex ? "" : "none";
	  });
	
	  document.getElementById("pageInfo").textContent = `Page ${currentPage} of ${totalPages}`;
	
	  document.getElementById("prevPageBtn").disabled = currentPage === 1;
	  document.getElementById("nextPageBtn").disabled = currentPage === totalPages;
	}
	
	function changePage(direction) {
	  const tbody = document.getElementById("darshanListBody");
	  const totalRows = tbody.querySelectorAll("tr").length;
	  const totalPages = Math.ceil(totalRows / rowsPerPage);
	
	  currentPage += direction;
	
	  if (currentPage < 1) currentPage = 1;
	  if (currentPage > totalPages) currentPage = totalPages;
	
	  paginateDarshanTable();
	}
	
	// Call this once DOM is ready
	document.addEventListener("DOMContentLoaded", function () {
	  paginateDarshanTable();
	});
</script>

</body>
</html>
