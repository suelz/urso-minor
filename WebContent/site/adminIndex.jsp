<%@page import="ursoMinor.Admin"%>
<%@page import="ursoMinor.Login" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<jsp:useBean id="loggedInAdmin" class="ursoMinor.Admin" scope="session"></jsp:useBean>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Urso Minor Movies</title>
<meta charset="utf-8">
<link rel="stylesheet" href="main.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<%
	loggedInAdmin = (Admin)session.getAttribute("loggedInAdmin");
%>
</head>
<body>
	<!--- Nav Bar -->

	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="adminIndex.jsp">Urso Minor Movies</a>
			</div>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="adminLogout.jsp"><span
						class="glyphicon glyphicon-log-in"></span> Log Out</a></li>
			</ul>
		</div>
	</nav>

	<!-- END OF NAV BAR -->
	<h1 class="test">Urso Minor Movies - Movie Management</h1>
	<form action = "storeMovie" method="post">
		<div class="form-group">
				<h3>Add a Movie</h3>
			</div>
			<br>
			<div class="form-group">
				<label for="movieGenre">Genre:</label> <input type="text"
					class="form-control" name="movieGenre" id="movieGenre">
			</div>
			<div class="form-group">
				<label for="movieTitle">Title:</label> <input type="text"
					class="form-control" name="movieTitle" id="movieTitle">
			</div>
			<div class="form-group">
				<label for="movieDescription">Movie Description:</label> <input type="text"
					class="form-control" name="movieDescription" id="movieDescription">
			</div>
				<div class="form-group">
				<label for="movieYearReleased">Year Released:</label> <input type="text"
					class="form-control" name="movieYearReleased" id="movieYearReleased">
			</div>
			<div class="form-group">
				<label for="movieImage">Movie Image URL:</label> <input type="text"
					class="form-control" name="movieImage" id="movieImage">
			</div>
			<div class="form-group">
				<label for="movieTrailer">Movie Trailer URL:</label> <input type="text"
					class="form-control" name="movieTrailer" id="movieTrailer">
			</div>
				<div class="form-group">
				<label for="movieReleaseDate">Release Date:</label> <input type="text"
					class="form-control" name="movieReleaseDate" id="movieReleaseDate" placeholder="YYYY-MM-DD">
			</div>
			<div class="form-group">
				<label for="movieMPAARating">MPAA Rating:</label> <input type="text"
					class="form-control" name="movieMPAARating" id="movieMPAARating">
			</div>
			<div class="form-group">
				<label for="director">Director:</label> <input type="text"
					class="form-control" name="director" id="director">
			</div>
			<div class="form-group">
				<label for="actor1">Actor 1:</label> <input type="text"
					class="form-control" name="actor1" id="actor1">
			</div>
			<div class="form-group">
				<label for="actor2">Actor 2:</label> <input type="text"
					class="form-control" name="actor2" id="actor2">
			</div>
			
				<div class="form-group">
				<button style="background-color: #222; border-color: #080808; color: #9D9D9D" type="submit" class="btn btn-primary">Add Movie</button>
				<button style="background-color: #222; border-color: #080808; color: #9D9D9D" type="button" class="btn btn-primary"
					onclick="location.href='adminIndex.jsp'">Reset</button>
			</div>
	</form>
	
	<form method="post" action="removeMovieMySQL">
	<div class="form-group">
				<h3>Remove a Movie</h3>
			</div>
			<div class="form-group">
				<label for="movieTitle">Movie title to be removed:</label> <input type="text"
					class="form-control" name="movieTitle" id="movieTitle">
			</div>
				<div class="form-group">
				<button style="background-color: #222; border-color: #080808; color: #9D9D9D" type="submit" class="btn btn-primary">Remove Movie</button>
				<button style="background-color: #222; border-color: #080808; color: #9D9D9D" type="button" class="btn btn-primary"
					onclick="location.href='adminIndex.jsp'">Reset</button>
			</div>
	</form>

</body>
</html>
