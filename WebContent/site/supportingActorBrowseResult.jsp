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
	<h1 class="test">Browse Results</h1>
	<h3 class="test">Movies with <%=request.getParameter("supportingActor") %> as a supporting actor/actress</h3>
	<br>
	<br>
	<%	
		String selectedSupportingActor = request.getParameter("supportingActor");
		try {
			final Connection connection;
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection("jdbc:mysql://localhost/moviestoredb", "root", "sesame");
			
			String numMovies = "select count(*) as count from movie";
			String foundNum = "";
			PreparedStatement numEntries = connection.prepareStatement(numMovies);
			ResultSet count = numEntries.executeQuery();
			while (count.next()) {
				foundNum = count.getString(1); 
			}
			System.out.println(foundNum);
			String query = "select * from movie where actor2='" + selectedSupportingActor + "'";
			PreparedStatement mySql = connection.prepareStatement(query);
			ResultSet myMovies2 = mySql.executeQuery();
			for (int i = 0; i < Integer.parseInt(foundNum); i++) {
				myMovies2.next();
	%>
	<div class="gallery">
		<a href="#myModal-<%=i%>" role="button" data-toggle="modal"> <img
			src="../images/<%=myMovies2.getString("movieImage")%>">

		</a>
	</div>


	<!-- The Modal -->
	<div class="modal fade" id="myModal-<%=i%>">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h3 class="modal-title test"><%=myMovies2.getString("movieTitle")%></h3>
					<br> <img
						src="../images/<%=myMovies2.getString("movieImage")%>">
					<h5>
						Release Year:
						<%=myMovies2.getString("movieYearReleased")%>
						<br> MPAA rating:
						<%=myMovies2.getString("movieMPAARating")%>
						<br> Genre:
						<%=myMovies2.getString("movieGenre")%>
						<br> Actors:
						<%=myMovies2.getString("actor1")%>,
						<%=myMovies2.getString("actor2")%>
						<br> Director:
						<%=myMovies2.getString("director")%>
					</h5>
					<br> <a target="_blank"
						href="<%=myMovies2.getString("movieTrailer")%>">Watch the
						trailer</a>

				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<p>
						Description:
						<%=myMovies2.getString("movieDescription")%></p>
				</div>


				<!-- Modal footer -->
				<div class="modal-footer">
					<table style="width: 100%" align="left">

						<tr>

							<td>
								<%
									if (!loggedInMember.getFavoriteQueue().contains(myMovies2.getString("movieID"))) {
								%>
								<form action="addToFavorites.jsp" method="post">
									<input type="hidden" name="movieID"
										value="<%=myMovies2.getInt("movieID")%>"> <input
										type="hidden" name="pageRedirect" value="mylist.jsp">
									<input class="btn btn-primary"
										style="background-color: #222; border-color: #080808; color: #9D9D9D"
										type="submit" value="Add to My Favorites">
								</form> <%
 	} else {
 %>
								<form action="removeFromFavorites.jsp" method="post">
									<input type="hidden" name="movieID"
										value="<%=myMovies2.getInt("movieID")%>"> <input
										type="hidden" name="pageRedirect" value="mylist.jsp">
									<input class="btn btn-primary"
										style="background-color: #222; border-color: #080808; color: #9D9D9D"
										type="submit" value="Remove From My Favorites">
								</form> <%
 	}
 %>
							</td>
							<td>
								<%
									if (!loggedInMember.getWatchLaterQueue().contains(myMovies2.getString("movieID"))) {
								%>
								<form action="addToWatchLater.jsp" method="post">
									<input type="hidden" name="movieID"
										value="<%=myMovies2.getInt("movieID")%>"> <input
										type="hidden" name="memberID"
										value="<%=loggedInMember.getMemberID()%>"> <input
										type="hidden" name="pageRedirect" value="mylist.jsp">
									<input class="btn btn-primary"
										style="background-color: #222; border-color: #080808; color: #9D9D9D"
										type="submit" value="Add to My Watch Later">
								</form>
							</td>
							<%
								} else {
							%>
							<form action="removeFromWatchLater.jsp" method="post">
								<input type="hidden" name="movieID"
									value="<%=myMovies2.getInt("movieID")%>"> <input
									type="hidden" name="memberID"
									value="<%=loggedInMember.getMemberID()%>"> <input
									type="hidden" name="pageRedirect" value="mylist.jsp"> <input
									class="btn btn-primary"
									style="background-color: #222; border-color: #080808; color: #9D9D9D"
									type="submit" value="Remove From My Watch Later">
							</form>
							<%
								}
							%>
							<td>
								<%
									if (!loggedInMember.getMovieQueue().contains(myMovies2.getString("movieID"))) {
												if (maxDownloads > loggedInMember.getMovieQueue().size()) {
								%>
								<form action="addMovie.jsp" method="post">
									<input type="hidden" name="movieID"
										value="<%=myMovies2.getInt("movieID")%>"> <input
										type="hidden" name="memberID"
										value="<%=loggedInMember.getMemberID()%>"> <input
										type="hidden" name="pageRedirect" value="mylist.jsp">
									<input class="btn btn-primary"
										style="background-color: #222; border-color: #080808; color: #9D9D9D"
										type="submit" value="Add to My Shelf">
								</form>
							</td>
							<%
								} else {

												out.print("Max downloads reached");
											}
										} else {
							%>
							<form action="removeMovie.jsp" method="post">
								<input type="hidden" name="movieID"
									value="<%=myMovies2.getInt("movieID")%>"> <input
									type="hidden" name="pageRedirect" value="mylist.jsp"> <input
									class="btn btn-primary"
									style="background-color: #222; border-color: #080808; color: #9D9D9D"
									type="submit" value="Remove from My Shelf">
							</form>
							<%
								}
							%>
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
	</div>
	</div>

</body>
</html>