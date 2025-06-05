<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Footer</title>

<style>
html, body {
    height: 100%;
    margin: 0;
    display: flex;
    flex-direction: column;
}

main {
    flex: 1;
}

footer {
	background-color: #ffad28;
	color: #fff;
	text-align: center;
	padding: 16px 0;
	margin-top: auto;
	font-size: 14px;
	position: relative;
	bottom: 0;
	width: 100%;
}
</style>
</head>
<body>

	<footer>
		Copyrights © <span class="current-year"></span> Shree Kubereshwar
		Mahadev. All rights reserved.
	</footer>

	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
		$(document).ready(function() {
			var currentYear = new Date().getFullYear();
			$(".current-year").text(currentYear);
		});
	</script>
</body>
</html>
