<%@page import="ursoMinor.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<jsp:useBean id="loggedInAdmin" class="ursoMinor.Admin" scope="session"></jsp:useBean>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
<title>Urso Minor Movies - Delete Movie</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="main.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>
<html>
<body>
	<!--- Nav Bar -->

	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="adminIndex.jsp">Urso Minor Movies</a>
			</div>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="adminLogout.jsp"><span
						class="glyphicon glyphicon-log-in"></span> Logout</a></li>
			</ul>
		</div>
	</nav>

	<!-- END OF NAV BAR -->
	<h2>
		<center> Movie has been successfully removed! <br></center>
	</h2>
	<br>
	<br>
</body>
</html>