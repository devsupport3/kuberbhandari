<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>Footer</title>

<!-- Bootstrap CSS -->
<!-- <link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet" />
Font Awesome for Icons
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
	rel="stylesheet" /> -->

<style>
/* Ensure html and body take full height */
html, body {
	height: 100%;
	margin: 0;
}

/* Flex container to push footer to bottom */
body {
	display: flex;
	flex-direction: column;
	min-height: 100vh;
}

/* Content area grows to fill available space */
.content {
	flex: 1 0 auto;
}

/* Footer styles */
.footer {
	background-color: #ffad28;
	color: #fff;
	padding: 15px 0;
	text-align: center;
	font-size: 0.9rem;
	flex-shrink: 0; /* prevent shrinking */
}

.footer a {
	color: #0056b3; /* Link color */
	text-decoration: none;
}

.footer a:hover {
	text-decoration: underline; /* Underline on hover */
}
</style>

<!-- AngularJS -->
<!-- <script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.8.2/angular.min.js"></script> -->

</head>
<body>

	<!-- Your page content goes here -->
	<div class="content container">
		<!-- Example content or leave empty -->
	</div>

	<!-- Footer Section -->
	<footer class="footer">
		<div class="container">
			<p class="mb-0">
				Copyrights © <span class="current-year"></span> ShreeKubereshwar
				Mahadev. All rights reserved | Powered by: <a
					href="http://www.astartechnologies.net/" target="_blank"
					rel="noopener noreferrer">ASTAR Technologies.</a>
			</p>
		</div>
	</footer>

	<!-- Bootstrap JS, Popper.js, and jQuery -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
	<!-- <script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script> -->

	<script>
		$(document).ready(function() {
			var currentYear = new Date().getFullYear();
			$(".current-year").text(currentYear);
		});
	</script>

</body>
</html>
