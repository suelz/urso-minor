<%@page import="ursoMinor.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<jsp:useBean id = "loggedInMember" class = "ursoMinor.Member" scope = "session"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Urso Minor Movies - My Profile</title>
<link rel="stylesheet" href="main.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<%
	loggedInMember = (Member)session.getAttribute("loggedInMember");
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
								<h4>My Profile</h4>
								<hr>
								<h5>Any changes will appear next time you log in.</h5><br>
							</div>
						</div>
						<%
							if (loggedInMember.getUserName() == null) {
						%>
						<h5 style="color: red">Please login or create a membership to
							view your profile information.</h5>
						<% } %>

						<div class="row">
							<div class="col-md-12">
								<form>
									<div class="form-group row">
										<label for="userName" name="userName" class="col-4 col-form-label">
										<% 
											if(loggedInMember.getUserName() != null) { 
										%>
										Username: <%= loggedInMember.getUserName() %></label>
										<% } else {
											out.print("Username:");}
										%>	
									</div>
									<div class="form-group row">
										<label for="firstName" name="firstName"  class="col-4 col-form-label">
										<% 
											if(loggedInMember.getFirstName() != null) {
										%>
										First Name: <%= loggedInMember.getFirstName() %></label>
										<% } else {
											out.print("First Name:");}	
										%>
										
									</div>
									<div class="form-group row">
										<label for="lastname" name="lastName" class="col-4 col-form-label">
										<% 
											if(loggedInMember.getLastName() != null) {
										%>
										Last Name: <%= loggedInMember.getLastName() %></label>
										<% } else {
											out.print("Last Name:");}
										%>
				
									</div>
									<div class="form-group row">
										<label for="levelName name="
											levelName" class="col-4 col-form-label"> 
											<%
 												if (loggedInMember.getLevelName() != null) {
 											%> 
 													Membership Level: <%=loggedInMember.getLevelName()%></label>
										<%
											} else {
												out.print("Membership Level:");
											}
										%>
									</div>
									<div class="form-group row">
										<label for="memberSince" name="memberSince" class="col-4 col-form-label">
										<% 
											if(loggedInMember.getLastName() != null) {		
										%>
										Member Since: <%= loggedInMember.getMemberSince() %></label>
										<% } else {
											out.print("Member Since:");}
										%>
									</div>
									<br>
									<div class="form-group row">
										<label for="emailAddress" name="emailAddress" class="col-4 col-form-label">
										<% 
											if(loggedInMember.getEmailAddress() != null) {
										%>
										Email Address: <%= loggedInMember.getEmailAddress() %></label>
										<% } else {
											out.print("Email Address:");}
										%>
									</div>
									<div class="form-group row">
										<label for="phoneNumber" name="phoneNumber" class="col-4 col-form-label">
										<% 
											if(loggedInMember.getLastName() != null) {
										%>
										Phone Number: <%= loggedInMember.getPhoneNumber() %></label>
										<% } else {
											out.print("Phone number:");}
										%>
									</div>
										<div class="form-group row">
										<label for="genrePreference" name="genrePreference" class="col-4 col-form-label">
										<% 
											if(loggedInMember.getGenrePreference() != null) {
										%>
										Genre Preference: <%= loggedInMember.getGenrePreference() %></label>
										<% } else {
											out.print("Genre Preference:");}
										%>
									</div>
									
									<%if(loggedInMember.getUserName() != null) {
									%>
									<div class="form-group row">
										<div class="offset-4 col-8">
											<button class="btn btn-primary"
												style="background-color: #222; border-color: #080808; color: #9D9D9D"
												onclick="location.href='editMyProfile.jsp'" type="button">Edit
												My Profile</button>
										</div>
									</div>
									<%} %>
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