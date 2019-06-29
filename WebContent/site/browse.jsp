<%@page import="ursoMinor.*"%>
<%@page import="java.util.*"%>
<%@page import="java.io.IOException"%>
<%@page import="java.sql.*"%>
<%@page import="javax.servlet.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<jsp:useBean id="loggedInMember" class="ursoMinor.Member"
	scope="session"></jsp:useBean>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Urso Minor Movies - Browse</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="main.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<%
	loggedInMember = (Member) session.getAttribute("loggedInMember");
	int maxDownloads = 0;
	if (loggedInMember.getLevelName() != null) {
		if (loggedInMember.getLevelName().equals("silver") || loggedInMember.getLevelName().equals("Silver")) {
			maxDownloads = 2;
		}
		if (loggedInMember.getLevelName().equals("gold") || loggedInMember.getLevelName().equals("Gold")) {
			maxDownloads = 4;
		}
		if (loggedInMember.getLevelName().equals("platinum")
				|| loggedInMember.getLevelName().equals("Platinum")) {
			maxDownloads = 7;
		}
	}
%>

</head>
<body>
	<!--- Nav Bar -->

	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="index.jsp">Urso Minor Movies</a>
			</div>
			<ul class="nav navbar-nav">
				<li class="active"><a href="browse.jsp">Browse</a></li>
				<li><a href="mylist.jsp">My Movie Shelf</a></li>
				<li><a href="myProfile.jsp">My Profile</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<%
					if (loggedInMember.getFirstName() == null) {
				%>
				<li><a href=signup.jsp><span
						class="glyphicon glyphicon-user"></span> Sign Up</a></li>
				<%
					}
					if (loggedInMember.getFirstName() != null) {
				%>
				<li><a href="logout.jsp"><span
						class="glyphicon glyphicon-log-in"></span> Log Out</a></li>
				<%
					} else {
				%>
				<li><a href=login.jsp><span
						class="glyphicon glyphicon-log-in"></span> Log In</a></li>
				<%
					}
					;
				%>
			</ul>

		</div>
	</nav>

	<!-- END OF NAV BAR -->
	<div class="container">
    <div class="vertical-center-row">
	<h1 class="test">Browse Movies</h1>

	<br>
	<br>
	
	<form action="searchBrowseResult.jsp" method="post">
		<div class="form-group">
				<label for="search">Search by Description:</label> <input type="text"
					class="form-control" name="search" id="search">
					<input class="btn btn-primary"
				style="background-color: #222; border-color: #080808; color: #9D9D9D"
				type="submit">
			</div>
	</form>

	<form action="sortBrowseResult.jsp" method="post">
		<div class="form-group">
			<label>Sort by:</label> <br> <select size="1"
				name="sortOption">
				<option value="" disabled selected>Choose Sorting Option</option>
				<option value="movieTitle">Title</option>
				<option value="movieGenre">Genre</option>
				<option value="movieReleaseDate">Release Date</option>
				<option value="movieMPAARating">MPAA Rating</option>
				<option value="director">Director (First Name)</option>
				<option value="actor1">Lead Actor (First Name)</option>
			</select><br>
			<input class="btn btn-primary"
				style="background-color: #222; border-color: #080808; color: #9D9D9D"
				type="submit">
		</div>
	</form>
	<br>


	<form action="genreBrowseResult.jsp" method="post">
		<div class="form-group">
			<label>Filter by Genre:</label> <br> <select size="1"
				name="genreChosen">
				<option value="" disabled selected>Choose Genre</option>
				<option value="comedy">Comedy</option>
				<option value="horror">Horror</option>
				<option value="sci-fi">Sci-fi</option>
				<option value="drama">Drama</option>
				<option value="action">Action</option>
			</select><br>
			<input class="btn btn-primary"
				style="background-color: #222; border-color: #080808; color: #9D9D9D"
				type="submit">
		</div>
	</form>
	<br>
	<form action="mpaaBrowseResult.jsp" method="post">
		<div class="form-group">
			<label>Filter by MPAA Rating:</label> <br> <select size="1"
				name="mpaaRating">
				<option value="" disabled selected>Choose MPAA Rating</option>
				<option value="R">R</option>
				<option value="PG-13">PG-13</option>
				<option value="PG">PG</option>
				<option value="G">G</option>
			</select><br>
			<input class="btn btn-primary"
				style="background-color: #222; border-color: #080808; color: #9D9D9D"
				type="submit">
		</div>
	</form>
	<br>
	<form action="directorBrowseResult.jsp" method="post">
		<div class="form-group">
			<label>Filter by Director:</label> <br> <select size="1"
				name="director">
				<option value="" disabled selected>Choose Directors</option>
				<option value="Adam McKay">Adam McKay</option>
				<option value="Alan Parker">Alan Parker</option>
				<option value="Alejandro Gonzalez Inarritu">Alejandro
					González Iñárritu</option>
				<option value="Brian DePalma">Brian DePalma</option>
				<option value="Chris Columbus">Chris Columbus</option>
				<option value="David Fincher">David Fincher</option>
				<option value="Don Roos">Don Roos</option>
				<option value="Dwight Little">Dwight Little</option>
				<option value="Emir Kusturica">Emir Kusturica</option>
				<option value="Fernando Meirelles">Fernando Meirelles</option>
				<option value="Greg Marcks">Greg Marcks</option>
				<option value="Guy Ferland">Guy Ferland</option>
				<option value="Hector Babenco">Hector Babenco</option>
				<option value="Irwin Winkler">Irwin Winkler</option>
				<option value="James Brooks">James Brooks</option>
				<option value="James Cameron">James Cameron</option>
				<option value="Jez Butterworth">Jez Butterworth</option>
				<option value="Joan Chen">Joan Chen</option>
				<option value="Joe Berlinger">Joe Berlinger</option>
				<option value="John McTiernan">John McTiernan</option>
				<option value="Joss Whedon">Joss Whedon</option>
				<option value="Mark Pellington">Mark Pellington</option>
				<option value="Martin Scorsese">Martin Scorsese</option>
				<option value="Michael Apted">Michael Apted</option>
				<option value="Michael Caton-Jones">Michael Caton-Jones</option>
				<option value="Mike Barker">Mike Barker</option>
				<option value="Milos Forman">Milos Forman</option>
				<option value="Oliver Stone">Oliver Stone</option>
				<option value="Paul Verhoeven">Paul Verhoeven</option>
				<option value="Pedro Almodovar">Pedro Almodóvar</option>
				<option value="Penny Marshall">Penny Marshall</option>
				<option value="Peter Segal">Peter Segal</option>
				<option value="Richard Donner">Richard Donner</option>
				<option value="Richard Linklater">Richard Linklater</option>
				<option value="Ridley Scott">Ridley Scott</option>
				<option value="Rob Reiner">Rob Reiner</option>
				<option value="Robert Deniro">Robert Deniro</option>
				<option value="Robert Zemeckis">Robert Zemeckis</option>
				<option value="Roger Michell">Roger Michell</option>
				<option value="Ron Howard">Ron Howard</option>
				<option value="Sam Mendes">Sam Mendes</option>
				<option value="Spike Jonze">Spike Jonze</option>
				<option value="Spike Lee">Spike Lee</option>
				<option value="Steven Spielberg">Steven Spielberg</option>
				<option value="Ted Demme">Ted Demme</option>
				<option value="Tim Burton">Tim Burton</option>
				<option value="Tony Kaye">Tony Kaye</option>
				<option value="Vincent Gallo">Vincent Gallo</option>
			</select><br>
			<input class="btn btn-primary"
				style="background-color: #222; border-color: #080808; color: #9D9D9D"
				type="submit">
		</div>
	</form>
	<br>
	<form action="leadActorBrowseResult.jsp" method="post">
		<div class="form-group">
			<label>Filter by Lead Actor/Actress:</label> <br> <select
				size="1" name="leadActor">
				<option value="" disabled selected>Choose Lead
					Actor/Actress</option>
				<option value="Al Pacino">Al Pacino</option>
				<option value="Alessandro Nivola">Alessandro Nivola</option>
				<option value="Alexandre Rodrigues">Alexandre Rodrigues</option>
				<option value="Angela Alvarado ">Angela Alvarado</option>
				<option value="Arnold Schwarzenegger">Arnold Schwarzenegger</option>
				<option value="Ben Affleck">Ben Affleck</option>
				<option value="Ben Foster">Ben Foster</option>
				<option value="Brad Pitt">Brad Pitt</option>
				<option value="Cameron Diaz">Cameron Diaz</option>
				<option value="Chazz Palminteri">Chazz Palminteri</option>
				<option value="Christina Ricci">Christina Ricci</option>
				<option value="Edward Norton">Edward Norton</option>
				<option value="Emilio Echevarria">Emilio Echevarria</option>
				<option value="Ethan Hawke">Ethan Hawke</option>
				<option value="Ewan McGregor">Ewan McGregor</option>
				<option value="F. Murray Abraham">F. Murray Abraham</option>
				<option value="Henry Thomas">Henry Thomas</option>
				<option value="Jack Nicholson">Jack Nicholson</option>
				<option value="Jeff Bridges">Jeff Bridges</option>
				<option value="John Travolta">John Travolta</option>
				<option value="Johnny Depp">Johnny Depp</option>
				<option value="Kevin Spacey">Kevin Spacey</option>
				<option value="Kim Director">Kim Director</option>
				<option value="Laurence Fishburne">Laurence Fishburne</option>
				<option value="Luis Carlos Vasconelos">Luis Carlos
					Vasconelos</option>
				<option value="Matthew Modine">Matthew Modine</option>
				<option value="Michael Douglas">Michael Douglas</option>
				<option value="Morgan Freeman">Morgan Freeman</option>
				<option value="Nicholas Cage">Nicholas Cage</option>
				<option value="Nicole Kidman">Nicole Kidman</option>
				<option value="Noomi Rapace">Noomi Rapace</option>
				<option value="Penelope Cruz">Penelope Cruz</option>
				<option value="Richard Gere">Richard Gere</option>
				<option value="Robert De Niro">Robert De Niro</option>
				<option value="Robert Downey Jr.">Robert Downey Jr.</option>
				<option value="Robin Williams ">Robin Williams</option>
				<option value="Russell Crowe">Russell Crowe</option>
				<option value="Samuel L. Jackson">Samuel L. Jackson</option>
				<option value="Sean Penn">Sean Penn</option>
				<option value="Sigourney Weaver">Sigourney Weaver</option>
				<option value="Sylvester Stallone">Sylvester Stallone</option>
				<option value="Tom Hanks">Tom Hanks</option>
				<option value="Tom Skerritt">Tom Skerritt</option>
				<option value="Val Kilmer">Val Kilmer</option>
				<option value="Will Ferrell">Will Ferrell</option>
			</select><br>
			<input class="btn btn-primary"
				style="background-color: #222; border-color: #080808; color: #9D9D9D"
				type="submit">
		</div>
	</form>
	<br>
	</div>
	</div>

</body>
</html>
