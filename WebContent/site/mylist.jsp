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
<html lang="en" dir="ltr">
<head>
<title>Urso Minor Movies - My Movie Shelf</title>
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
	if (loggedInMember.getLevelName().equals("platinum") || loggedInMember.getLevelName().equals("Platinum")) {
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
				<li><a href="browse.jsp">Browse</a></li>
				<li class="active"><a href="mylist.jsp">My Movie Shelf</a></li>
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


	<h1 class="test">My Movie Shelf</h1>

	<%
		if (loggedInMember.getUserName() == null) {
	%>
	<center>
		<h3 style="color: red">Please login or create a membership to
			view your personalized movie shelf.</h3>
	</center>
	<%
		} else {
	%>

	<h3>My Movies</h3>
	<br>
	<!-- 	Code below should be in a .java file but kept getting access/type errors that way-->
	<%
	
			try {
				final Connection connection;
				Class.forName("com.mysql.jdbc.Driver");
				connection = DriverManager.getConnection("jdbc:mysql://localhost/moviestoredb", "root", "sesame");
				for (int i = 0; i < loggedInMember.getMovieQueue().size(); i++) {
					String query = "select * from movie where movieID =" + loggedInMember.getMovieQueue().get(i);
					PreparedStatement mySql = connection.prepareStatement(query);
					ResultSet myMovies = mySql.executeQuery();
					myMovies.next();
	%>
	<div class="gallery">
		<a href="#myModal-<%=i%>" role="button" data-toggle="modal"> <img
			src="../images/<%=myMovies.getString("movieImage")%>">

		</a>
	</div>


	<!-- The Modal -->
	<div class="modal fade" id="myModal-<%=i%>">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h3 class="modal-title test"><%=myMovies.getString("movieTitle")%></h3>
					<br> <img
						src="../images/<%=myMovies.getString("movieImage")%>">
					<h5>
						Release Year:
						<%=myMovies.getString("movieYearReleased")%>
						<br> MPAA rating:
						<%=myMovies.getString("movieMPAARating")%>
						<br> Genre:
						<%=myMovies.getString("movieGenre")%>
						<br> Actors:
						<%=myMovies.getString("actor1")%>,
						<%=myMovies.getString("actor2")%>
						<br> Director:
						<%=myMovies.getString("director")%>
					</h5>
					<br> <a target="_blank"
						href="<%=myMovies.getString("movieTrailer")%>">Watch the
						trailer</a>
						
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<p>
						Description:
						<%=myMovies.getString("movieDescription")%></p>
				</div>


				<!-- Modal footer -->
				<div class="modal-footer">
					<table style="width: 100%" align="left">

						<tr>

							<td>
								<% if(!loggedInMember.getFavoriteQueue().contains(myMovies.getString("movieID"))) { %>
								<form action="addToFavorites.jsp" method="post">
									<input type="hidden" name="movieID"
										value="<%=myMovies.getInt("movieID")%>"> <input
										type="hidden" name="pageRedirect" value="mylist.jsp">
									<input class="btn btn-primary"
										style="background-color: #222; border-color: #080808; color: #9D9D9D"
										type="submit" value="Add to My Favorites">
								</form>
								<% }
								else {
								%>
								<form action="removeFromFavorites.jsp" method="post">
									<input type="hidden" name="movieID"
										value="<%=myMovies.getInt("movieID")%>"> <input
										type="hidden" name="pageRedirect" value="mylist.jsp">
									<input class="btn btn-primary"
										style="background-color: #222; border-color: #080808; color: #9D9D9D"
										type="submit" value="Remove From My Favorites">
								</form>
								<% } %>
							</td>
							<td>
							<% if(!loggedInMember.getWatchLaterQueue().contains(myMovies.getString("movieID"))) { %>
								<form action="addToWatchLater.jsp" method="post">
									<input type="hidden" name="movieID"
										value="<%=myMovies.getInt("movieID")%>"> <input
										type="hidden" name="memberID"
										value="<%=loggedInMember.getMemberID()%>"> <input
										type="hidden" name="pageRedirect" value="mylist.jsp">
									<input class="btn btn-primary"
										style="background-color: #222; border-color: #080808; color: #9D9D9D"
										type="submit" value="Add to My Watch Later">
								</form>
							</td>
								<% }
							else {
								%>
								<form action="removeFromWatchLater.jsp" method="post">
									<input type="hidden" name="movieID"
										value="<%=myMovies.getInt("movieID")%>"> <input
										type="hidden" name="memberID"
										value="<%=loggedInMember.getMemberID()%>"> <input
										type="hidden" name="pageRedirect" value="mylist.jsp">
									<input class="btn btn-primary"
										style="background-color: #222; border-color: #080808; color: #9D9D9D"
										type="submit" value="Remove From My Watch Later">
								</form>
								<% } %>
							<td>
								<form action="removeMovie.jsp" method="post">
									<input type="hidden" name="movieID"
										value="<%=myMovies.getInt("movieID")%>"> <input
										type="hidden" name="pageRedirect" value="mylist.jsp">
									<input class="btn btn-primary"
										style="background-color: #222; border-color: #080808; color: #9D9D9D"
										type="submit" value="Remove from My Shelf">
								</form>
							</td>

						</tr>
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td>
								<button type="button" class="btn btn-primary"
									style="background-color: #222; border-color: #080808; color: #9D9D9D"
									data-dismiss="modal">Close</button>
							</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>

	<%
		}
			} catch (Exception ex) {
				ex.printStackTrace();
				System.out.println(ex);
			}
	%>

	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>

	<h3>My Favorites</h3>

	<%
		try {
			final Connection connection;
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection("jdbc:mysql://localhost/moviestoredb", "root", "sesame");
				for (int i = 0; i < loggedInMember.getFavoriteQueue().size(); i++) {
					String query = "select * from favorites where movieID =" + loggedInMember.getFavoriteQueue().get(i) + " and memberID=" + loggedInMember.getMemberID();
					PreparedStatement mySql = connection.prepareStatement(query);
					ResultSet myFavorites = mySql.executeQuery();
					myFavorites.next();
	%>
	<div class="gallery">
		<a href="#myModal2-<%=i%>" role="button" data-toggle="modal"> <img
			src="../images/<%=myFavorites.getString("movieImage")%>">

		</a>
	</div>


	<!-- The Modal -->
	<div class="modal fade" id="myModal2-<%=i%>">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h3 class="modal-title test"><%=myFavorites.getString("movieTitle")%></h3>
					<br> <img
						src="../images/<%=myFavorites.getString("movieImage")%>">
					<h5>
						Release Year:
						<%=myFavorites.getString("movieYearReleased")%>
						<br> MPAA rating:
						<%=myFavorites.getString("movieMPAARating")%>
						<br> Genre:
						<%=myFavorites.getString("movieGenre")%>
						<br> Actors:
						<%=myFavorites.getString("actor1")%>,
						<%=myFavorites.getString("actor2")%>
						<br> Director:
						<%=myFavorites.getString("director")%>
					</h5>
					<br> <a target="_blank"
						href="<%=myFavorites.getString("movieTrailer")%>">Watch the
						trailer</a>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<p>
						Description:
						<%=myFavorites.getString("movieDescription")%></p>
				</div>


				<!-- Modal footer -->
				<div class="modal-footer">
					<table style="width: 100%" align="left">

						<tr>

							<td>
								<form action="removeFromFavorites.jsp" method="post">
									<input type="hidden" name="movieID"
										value="<%=myFavorites.getInt("movieID")%>"> <input
										type="hidden" name="pageRedirect" value="mylist.jsp">
									<input class="btn btn-primary"
										style="background-color: #222; border-color: #080808; color: #9D9D9D"
										type="submit" value="Remove From My Favorites">
								</form>
							</td>
							<td>
							<% if(!loggedInMember.getWatchLaterQueue().contains(myFavorites.getString("movieID"))) { %>
								<form action="addToWatchLater.jsp" method="post">
									<input type="hidden" name="movieID"
										value="<%=myFavorites.getInt("movieID")%>"> <input
										type="hidden" name="memberID"
										value="<%=loggedInMember.getMemberID()%>"> <input
										type="hidden" name="pageRedirect" value="mylist.jsp">
									<input class="btn btn-primary"
										style="background-color: #222; border-color: #080808; color: #9D9D9D"
										type="submit" value="Add to My Watch Later">
								</form>
							</td>
								<% }
							else {
								%>
								<form action="removeFromWatchLater.jsp" method="post">
									<input type="hidden" name="movieID"
										value="<%=myFavorites.getInt("movieID")%>"> <input
										type="hidden" name="memberID"
										value="<%=loggedInMember.getMemberID()%>"> <input
										type="hidden" name="pageRedirect" value="mylist.jsp">
									<input class="btn btn-primary"
										style="background-color: #222; border-color: #080808; color: #9D9D9D"
										type="submit" value="Remove From My Watch Later">
								</form>
								<% } %>
							<td>
							<% if(loggedInMember.getMovieQueue().contains(myFavorites.getString("movieID"))) { %>
							<form action="removeMovie.jsp" method="post">
									<input type="hidden" name="movieID"
										value="<%=myFavorites.getInt("movieID")%>"> <input
										type="hidden" name="pageRedirect" value="mylist.jsp">
									<input class="btn btn-primary"
										style="background-color: #222; border-color: #080808; color: #9D9D9D"
										type="submit" value="Remove from My Shelf">
								</form>
								<% } 
							else {
								if (maxDownloads > loggedInMember.getMovieQueue().size()) {
								%>
								<form action="addMovie.jsp" method="post">
									<input type="hidden" name="movieID"
										value="<%=myFavorites.getInt("movieID")%>"> <input
										type="hidden" name="pageRedirect" value="mylist.jsp">
									<input class="btn btn-primary"
										style="background-color: #222; border-color: #080808; color: #9D9D9D"
										type="submit" value="Add to My Shelf">
								</form>
								<% 
								}
								else {
									out.print("Max downloads reached");
								}
								} %>
							</td>

						</tr>
						<tr>
							<td></td>
							<td></td>
							
							<td>
								<button type="button" class="btn btn-primary"
									style="background-color: #222; border-color: #080808; color: #9D9D9D"
									data-dismiss="modal">Close</button>
							</td>
						</tr>
					</table>
				</div>
				</form>
			</div>
		</div>
	</div>
	<%
		}
			} catch (Exception ex) {
				ex.printStackTrace();
				System.out.println(ex);
			}
	%>


	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	
	<h3>Watch Later</h3>
	
	<%
		try {
			final Connection connection;
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection("jdbc:mysql://localhost/moviestoredb", "root", "sesame");
				for (int i = 0; i < loggedInMember.getWatchLaterQueue().size(); i++) {
					String query = "select * from watchlater where movieID =" + loggedInMember.getWatchLaterQueue().get(i) + " and memberID=" + loggedInMember.getMemberID();
					PreparedStatement mySql = connection.prepareStatement(query);
					ResultSet myWatchLater = mySql.executeQuery();
					myWatchLater.next();
	%>
	<div class="gallery">
		<a href="#myModal3-<%=i%>" role="button" data-toggle="modal"> <img
			src="../images/<%=myWatchLater.getString("movieImage")%>">
		</a>
	</div>	

	<!-- The Modal -->
	<div class="modal fade" id="myModal3-<%=i%>">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h3 class="modal-title test"><%=myWatchLater.getString("movieTitle")%></h3>
					<br> <img
						src="../images/<%=myWatchLater.getString("movieImage")%>">
					<h5>
						Release Year:
						<%=myWatchLater.getString("movieYearReleased")%>
						<br> MPAA rating:
						<%=myWatchLater.getString("movieMPAARating")%>
						<br> Genre:
						<%=myWatchLater.getString("movieGenre")%>
						<br> Actors:
						<%=myWatchLater.getString("actor1")%>,
						<%=myWatchLater.getString("actor2")%>
						<br> Director:
						<%=myWatchLater.getString("director")%>
					</h5>
					<br> <a target="_blank"
						href="<%=myWatchLater.getString("movieTrailer")%>">Watch the
						trailer</a>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<p>
						Description:
						<%=myWatchLater.getString("movieDescription")%></p>
				</div>


				<!-- Modal footer -->
				<div class="modal-footer">
					<table style="width: 100%" align="left">

						<tr>

							<td>
								<% if(!loggedInMember.getFavoriteQueue().contains(myWatchLater.getString("movieID"))) { %>
								<form action="addToFavorites.jsp" method="post">
									<input type="hidden" name="movieID"
										value="<%=myWatchLater.getInt("movieID")%>"> <input
										type="hidden" name="pageRedirect" value="mylist.jsp">
									<input class="btn btn-primary"
										style="background-color: #222; border-color: #080808; color: #9D9D9D"
										type="submit" value="Add to My Favorites">
								</form>
								<% }
								else {
								%>
								<form action="removeFromFavorites.jsp" method="post">
									<input type="hidden" name="movieID"
										value="<%=myWatchLater.getInt("movieID")%>"> <input
										type="hidden" name="pageRedirect" value="mylist.jsp">
									<input class="btn btn-primary"
										style="background-color: #222; border-color: #080808; color: #9D9D9D"
										type="submit" value="Remove From My Favorites">
								</form>
								<% } %>
							</td>
							<td>
								<form action="removeFromWatchLater.jsp" method="post">
									<input type="hidden" name="movieID"
										value="<%=myWatchLater.getInt("movieID")%>"> <input
										type="hidden" name="memberID"
										value="<%=loggedInMember.getMemberID()%>"> <input
										type="hidden" name="pageRedirect" value="mylist.jsp">
									<input class="btn btn-primary"
										style="background-color: #222; border-color: #080808; color: #9D9D9D"
										type="submit" value="Remove From My Watch Later">
								</form>
							</td>
							<td>
								<% if(loggedInMember.getMovieQueue().contains(myWatchLater.getString("movieID"))) { %>
							<form action="removeMovie.jsp" method="post">
									<input type="hidden" name="movieID"
										value="<%=myWatchLater.getInt("movieID")%>"> <input
										type="hidden" name="pageRedirect" value="mylist.jsp">
									<input class="btn btn-primary"
										style="background-color: #222; border-color: #080808; color: #9D9D9D"
										type="submit" value="Remove from My Shelf">
								</form>
								<% } 
							else {
								if (maxDownloads > loggedInMember.getMovieQueue().size()) {
								%>
								<form action="addMovie.jsp" method="post">
									<input type="hidden" name="movieID"
										value="<%=myWatchLater.getInt("movieID")%>"> <input
										type="hidden" name="pageRedirect" value="mylist.jsp">
									<input class="btn btn-primary"
										style="background-color: #222; border-color: #080808; color: #9D9D9D"
										type="submit" value="Add to My Shelf">
								</form>
								<% 
								}
								else {
									out.print("Max downloads reached");
								}
								} %>
							</td>

						</tr>
						<tr>
							<td></td>
							<td></td>
							
							<td>
								<button type="button" class="btn btn-primary"
									style="background-color: #222; border-color: #080808; color: #9D9D9D"
									data-dismiss="modal">Close</button>
							</td>
						</tr>
					</table>
				</div>
				</form>
			</div>
		</div>
	</div>
	<%
		}
			} catch (Exception ex) {
				ex.printStackTrace();
				System.out.println(ex);
			}
	%>
	
	
	<%}	 %>
</body>
</html>
