<%@page import="ursoMinor.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<jsp:useBean id = "loggedInMember" class = "ursoMinor.Member" scope = "session"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Urso Minor Movies - End My Subscription</title>
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
								<h4>Delete My Profile</h4>
								<hr>
							</div>
						</div>
						<%
							if (loggedInMember.getUserName() == null) {
						%>
						<h5 style="color: red">You must login to end your subscription to Urso Minor Movies.</h5>
						<% } %>

						<div class="row">
							<div class="col-md-12">
								<form method="post" action="DeleteMyProfile">
									
									
									<%if(loggedInMember.getUserName() != null) {
									%>
									<input type="hidden" id="memberID" name="memberID"
										value=<%=loggedInMember.getMemberID()%>>
									
									<div class="form-group row">
										<div class="offset-4 col-8">
											<input class="btn btn-primary"
												style="background-color: #222; border-color: #080808; color: #9D9D9D"
												type="submit" name="Submit" value="End My Subscription" />
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