<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<jsp:useBean id="loggedInAdmin" class="ursoMinor.Admin" scope="session"></jsp:useBean>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
<title>Urso Minor Movies - Admin Login</title>
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
<body>
	<!--- Nav Bar -->

	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="index.jsp">Urso Minor Movies - User Webpage</a>
			</div>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="adminLogin.jsp"><span
						class="glyphicon glyphicon-log-in"></span> Login</a></li>
			</ul>
		</div>
	</nav>

	<!-- END OF NAV BAR -->
	 
	
	<div class="container">
	<h3>Admin Login</h3><br>
		<form action="adminLogin" method="post">
				Username <input name="userName" id="userName"/><br />
			<br /> Password <input name="password" id="password" type="password" /><br />
			<br /> <input class="btn btn-primary"
							style="background-color: #222; border-color: #080808; color: #9D9D9D" type="submit" name="Submit"
				value="Log In" />
		</form>
	</div>
</body>
</html>