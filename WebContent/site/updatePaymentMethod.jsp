<%@page import="ursoMinor.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<jsp:useBean id="loggedInMember" class="ursoMinor.Member"
	scope="session"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Urso Minor Movies - Add Payment Method</title>
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
								<h4>Update Payment Method</h4>
								<hr>
							</div>
						</div>

						<div class="row">
							<div class="col-md-12">
								<form method="post" action="UpdatePaymentMethod">
									<div class="form-group row">
										<label for="cardHolderFirstName" class="col-4 col-form-label">First
											Name</label>
										<div class="col-8">
											<input id="cardHolderFirstName" name="cardHolderFirstName"
												value="<%=loggedInMember.getCardHolderFirstName()%>"
												class="form-control here" type="text">
										</div>
									</div>
									<!-- 									Hidden input used so that only current member's info is updated -->
									<input type="hidden" id="memberID" name="memberID"
										value=<%=loggedInMember.getMemberID()%>>
									<div class="form-group row">
										<label for="cardHolderLastName" class="col-4 col-form-label">Last
											Name</label>
										<div class="col-8">
											<input id="cardHolderLastName" name="cardHolderLastName"
												value="<%=loggedInMember.getCardHolderLastName()%>"
												class="form-control here" type="text">
										</div>
									</div>
									<div class="form-group row">
										<label for="ccType" class="col-4 col-form-label">Card
											Type</label>
										<div class="col-8">
											<input id="ccType" name="ccType"
												value="<%=loggedInMember.getCcType()%>"
												class="form-control here" type="text">
										</div>
									</div>
									<div class="form-group row">
										<label for="creditCardNumber" class="col-4 col-form-label">Card
											Number</label>
										<div class="col-8">
											<input id="creditCardNumber" name="creditCardNumber"
												value="<%=loggedInMember.getCreditCardNumber()%>"
												class="form-control here" type="text">
										</div>
									</div>

									<div class="form-group row">
										<label for="expYear" class="col-4 col-form-label">Exp.
											Year</label>
										<div class="col-8">
											<input id="expYear" name="expYear"
												value="<%=loggedInMember.getExpYear()%>"
												class="form-control here" type="text">
										</div>
									</div>
									<!--Wanted to do a dropdown to keep consistent but could not find way to set correct default value based off user info -->
									<div class="form-group row">
										<label for="expMonth" class="col-4 col-form-label">Exp.
											Month</label>
										<div class="col-8">
											<input id="expMonth" name="expMonth"
												value="<%=loggedInMember.getExpMonth()%>"
												class="form-control here" type="text">
										</div>
									</div>
									<div class="form-group row">
										<label for="creditCardCCV" class="col-4 col-form-label">CCV
										</label>
										<div class="col-8">
											<input id="creditCardCCV" name="creditCardCCV"
												value="<%=loggedInMember.getCreditCardCCV()%>"
												class="form-control here" type="text">
										</div>
									</div>
									<br>

									<div class="form-group row">
										<label for="billAddressLine1" class="col-4 col-form-label">Address
										</label>
										<div class="col-8">
											<input id="billAddressLine1" name="billAddressLine1"
												value="<%=loggedInMember.getBillAddressLine1()%>"
												class="form-control here" type="text">
										</div>
									</div>
									<div class="form-group row">
										<label for="billAddressLine2" class="col-4 col-form-label">Address
											(optional) </label>
										<div class="col-8">
											<input id="billAddressLine2" name="billAddressLine2"
												value="<%=loggedInMember.getBillAddressLine2()%>"
												class="form-control here" type="text">
										</div>
									</div>
									<div class="form-group row">
										<label for="billCity" class="col-4 col-form-label">City
										</label>
										<div class="col-8">
											<input id="billCity" name="billCity"
												value="<%=loggedInMember.getBillCity()%>"
												class="form-control here" type="text">
										</div>
									</div>
									<div class="form-group row">
										<label for="billState" class="col-4 col-form-label">State
										</label>
										<div class="col-8">
											<input id="billState" name="billState"
												value="<%=loggedInMember.getBillState()%>"
												class="form-control here" type="text">
										</div>
									</div>
									<div class="form-group row">
										<label for="billZipCode" class="col-4 col-form-label">Zip
											Code </label>
										<div class="col-8">
											<input id="billZipCode" name="billZipCode"
												value="<%=loggedInMember.getBillZipCode()%>"
												class="form-control here" type="text">
										</div>
									</div>

									<div class="form-group row">
										<div class="offset-4 col-8">
											<input class="btn btn-primary"
												style="background-color: #222; border-color: #080808; color: #9D9D9D"
												type="submit" name="Submit" value="Update My Payment Method" />
											<button class="btn btn-primary"
												style="background-color: #222; border-color: #080808; color: #9D9D9D"
												onclick="location.href='paymentMethods.jsp'" type="button">Cancel</button>
										</div>
									</div>
								</form>
							</div>
						</div>

					</div>
				</div>
			</div>
</body>
</html>