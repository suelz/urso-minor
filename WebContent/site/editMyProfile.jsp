<%@page import="ursoMinor.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<jsp:useBean id="loggedInMember" class="ursoMinor.Member"
	scope="session"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Urso Minor Movies - Edit My Profile</title>
<link rel="stylesheet" href="main.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<%
	loggedInMember = (Member) session.getAttribute("loggedInMember");
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
				<li><a href="mylist.jsp">My Movie Shelf</a></li>
				<li class="active"><a href="myProfile.jsp">My Profile</a></li>
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
		<div class="row">
			<div class="col-md-3 ">
				<div class="list-group ">
					<a href="myProfile.jsp" onMouseOver="this.style.color='white'"
						onMouseOut="this.style.color='#9D9D9D'"
						style="background-color: #222; border-color: #080808; color: #9D9D9D;"
						class="list-group-item list-group-item-action active myprofilenav">My
						Profile</a> <a href="paymentMethods.jsp"
						onMouseOver="this.style.color='white'"
						onMouseOut="this.style.color='#9D9D9D'"
						style="background-color: #222; border-color: #080808; color: #9D9D9D;"
						class="list-group-item list-group-item-action">Payment Method</a>
					<a href="deleteMyProfile.jsp" onMouseOver="this.style.color='white'"
						onMouseOut="this.style.color='#9D9D9D'"
						style="background-color: #222; border-color: #080808; color: #9D9D9D;"
						class="list-group-item list-group-item-action">Delete My Profile</a>
				</div>
			</div>
			<div class="col-md-9">
				<div class="card">
					<div class="card-body">
						<div class="row">
							<div class="col-md-12">
								<h4>Edit My Profile</h4>
								<hr>
							</div>
						</div>


						<div class="row">
							<div class="col-md-12">
								<form method="post" action="EditMyProfile">
									<div class="form-group row">
										<label for="userName" class="col-4 col-form-label">User
											Name</label>
										<div class="col-8">
											<input id="userName" name="userName"
												value="<%=loggedInMember.getUserName()%>"
												class="form-control here" type="text">
										</div>
										<input type="hidden" id="memberID" name="memberID" value=<%=loggedInMember.getMemberID() %>>
										
									</div>
									<div class="form-group row">
										<label for="firstName" class="col-4 col-form-label">First
											Name</label>
										<div class="col-8">
											<input id="firstName" name="firstName"
												value="<%=loggedInMember.getFirstName()%>"
												class="form-control here" type="text">
										</div>
									</div>
									<div class="form-group row">
										<label for="lastName" class="col-4 col-form-label">Last
											Name</label>
										<div class="col-8">
											<input id="lastName" name="lastName"
												value="<%=loggedInMember.getLastName()%>"
												class="form-control here" type="text">
										</div>
									</div>
									<div class="form-group row">
										<label for="levelName" class="col-4 col-form-label">Membership
											Level</label>
										<div class="col-8">
											<input id="levelName" name="levelName"
												value="<%=loggedInMember.getLevelName()%>"
												class="form-control here" type="text">
										</div>
									</div>
									<br>
									<div class="form-group row">
										<label for="emailAddress" class="col-4 col-form-label">Email</label>
										<div class="col-8">
											<input id="emailAddress" name="emailAddress"
												value="<%=loggedInMember.getEmailAddress()%>"
												class="form-control here" type="email">
										</div>
									</div>
									<div class="form-group row">
										<label for="phoneNumber" class="col-4 col-form-label">Phone
											Number</label>
										<div class="col-8">
											<input id="phoneNumber" name="phoneNumber"
												value="<%=loggedInMember.getPhoneNumber()%>"
												class="form-control here" type="text">
										</div>
									</div>
									<div class="form-group row">
										<label for="genrePreference" class="col-4 col-form-label">Genre
											Preference</label>
										<div class="col-8">
											<input id="genrePreference" name="genrePreference"
												value="<%=loggedInMember.getGenrePreference()%>"
												class="form-control here" type="text">
										</div>
									</div>

									<div class="form-group row">
										<div class="offset-4 col-8">
											<input class="btn btn-primary"
												style="background-color: #222; border-color: #080808; color: #9D9D9D"
												type="submit" name="Submit" value="Update My Profile" />
											<button class="btn btn-primary"
												style="background-color: #222; border-color: #080808; color: #9D9D9D"
												onclick="location.href='myProfile.jsp'" type="button">Cancel</button>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>