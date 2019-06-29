<%@page import="ursoMinor.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<jsp:useBean id="loggedInMember" class="ursoMinor.Member"
	scope="session"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Urso Minor Movies - My Payment Methods</title>
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
					<a href="deleteMyProfile.jsp"
						onMouseOver="this.style.color='white'"
						onMouseOut="this.style.color='#9D9D9D'"
						style="background-color: #222; border-color: #080808; color: #9D9D9D;"
						class="list-group-item list-group-item-action">Delete My
						Profile</a>
				</div>
			</div>
			<div class="col-md-9">
				<div class="card">
					<div class="card-body">
						<div class="row">
							<div class="col-md-12">
								<h4>My Payment Method</h4>
								<hr>
								<h5>Any changes will appear next time you log in.</h5>
								<br>
							</div>
						</div>

						<%
							if (loggedInMember.getUserName() == null) {
						%>
						<h5 style="color: red">Please login or create a membership to
							view your payment method.</h5>
						<%
							}
						%>

						<div class="row">
							<div class="col-md-12">
								<form>
									<div class="form-group row">
										<label for="cardHolderFirstName" name="cardHolderFirstName"
											class="col-4 col-form-label"> <%
 	if (loggedInMember.getCardHolderFirstName() != null) {
 %> First Name: <%=loggedInMember.getCardHolderFirstName()%></label>
										<%
											} else {
												out.print("First Name:");
											}
										%>
									</div>
									<div class="form-group row">
										<label for="cardHolderLastName" name="cardHolderLastName"
											class="col-4 col-form-label"> <%
 	if (loggedInMember.getCardHolderLastName() != null) {
 %> Last Name: <%=loggedInMember.getCardHolderLastName()%></label>
										<%
											} else {
												out.print("Last Name:");
											}
										%>
									</div>
									<div class="form-group row">
										<label for="ccType" name="ccType" class="col-4 col-form-label">
											<%
												if (loggedInMember.getCcType() != null) {
											%> Card Type: <%=loggedInMember.getCcType()%></label>
										<%
											} else {
												out.print("Card Type:");
											}
										%>
									</div>
									<div class="form-group row">
										<label for="creditCardNumber" name="creditCardNumber"
											class="col-4 col-form-label"> <%
 	if (loggedInMember.getCreditCardNumber() != null) {
 %> Card Number: <%=loggedInMember.getCreditCardNumber()%></label>
										<%
											} else {
												out.print("Card Number:");
											}
										%>
									</div>
									<div class="form-group row">
										<label for="expYear" name="expYear"
											class="col-4 col-form-label"> <%
 	if (loggedInMember.getCardHolderFirstName() != null) {
 %> Exp. Year: <%=loggedInMember.getExpYear()%></label>
										<%
											} else {
												out.print("Exp. Year:");
											}
										%>
										<div class="col-8"></div>
									</div>
									<div class="form-group row">
										<label for="expMonth" name="expMonth"
											class="col-4 col-form-label"> <%
 	if (loggedInMember.getCardHolderFirstName() != null) {
 %> Exp. Month: <%=loggedInMember.getExpMonth()%></label>
										<%
											} else {
												out.print("Exp. Month:");
											}
										%>
										<div class="col-8"></div>
									</div>
									<br>
									<div class="form-group row">
										<label for="billAddressLine1" name="billAddressLine1"
											class="col-4 col-form-label"> <%
 	if (loggedInMember.getBillAddressLine1() != null) {
 %> Address: <%=loggedInMember.getBillAddressLine1()%></label>
										<%
											} else {
												out.print("Address:");
											}
										%>
									</div>
									<div class="form-group row">
										<label for="billAddressLine2" name="billAddressLine2"
											class="col-4 col-form-label"> <%
 	if (loggedInMember.getBillAddressLine2() != null) {
 %> Address (optional): <%=loggedInMember.getBillAddressLine2()%></label>
										<%
											} else {
												out.print("Address (optional):");
											}
										%>
									</div>
									<div class="form-group row">
										<label for="billCity" name="billCity"
											class="col-4 col-form-label"> <%
 	if (loggedInMember.getBillCity() != null) {
 %> City: <%=loggedInMember.getBillCity()%></label>
										<%
											} else {
												out.print("City:");
											}
										%>
									</div>
									<div class="form-group row">
										<label for="billState" name="billState"
											class="col-4 col-form-label"> <%
 	if (loggedInMember.getBillState() != null) {
 %> State: <%=loggedInMember.getBillState()%></label>
										<%
											} else {
												out.print("State:");
											}
										%>
									</div>
									<div class="form-group row">
										<label for="billZipCode" name="billZipCode"
											class="col-4 col-form-label"> <%
 	if (loggedInMember.getBillZipCode() != null) {
 %> Zip Code: <%=loggedInMember.getBillZipCode()%></label>
										<%
											} else {
												out.print("Zip Code:");
											}
										%>
									</div>

									<%
										if (loggedInMember.getUserName() != null) {
									%>
									<div class="form-group row">
										<div class="offset-4 col-8">
											<button class="btn btn-primary"
												style="background-color: #222; border-color: #080808; color: #9D9D9D"
												onclick="location.href='updatePaymentMethod.jsp'"
												type="button">Edit Payment Method</button>
										</div>
									</div>
									<%
										}
									%>
								
							</div>
						</div>

					</div>
				</div>
			</div>
</body>
</html>