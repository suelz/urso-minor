<%@page import="ursoMinor.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
<title>Urso Minor Movies - Sign-up</title>
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
				<a class="navbar-brand" href="index.jsp">Urso Minor Movies</a>
			</div>
			<ul class="nav navbar-nav">
				<li><a href="browse.jsp">Browse</a></li>
				<li><a href="mylist.jsp">My Movie Shelf</a></li>
				<li><a href="myProfile.jsp">My Profile</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
			
				<li><a href="signup.jsp"><span
						class="glyphicon glyphicon-user"></span> Sign Up</a></li>
				
				<li><a href="login.jsp"><span
						class="glyphicon glyphicon-log-in"></span> Login</a></li>
			</ul>
			
		</div>
	</nav>

	<!-- END OF NAV BAR -->
	<div class="container">
		<form action="storeMember" method="post">
			<div class="form-group">
				<h2>General Info</h2>
			</div>
			<br>
			<div class="form-group">
				<label for="firstName">First Name:</label> <input type="text"
					class="form-control" name="firstName" id="firstName">
			</div>
			<div class="form-group">
				<label for="lastName">Last Name:</label> <input type="text"
					class="form-control" name="lastName" id="lastName">
			</div>
			<div class="form-group">
				<label for="userName">Username:</label> <input type="text"
					class="form-control" name="userName" id="userName">
			</div>
			<div class="form-group">
				<label for="memberPassword">Password:</label> <input type="password"
					class="form-control" name="memberPassword" id="memberPassword">
			</div>
			<div class="form-group">
				<label for="emailAddress">Email Address:</label> <input type="email"
					class="form-control" name="emailAddress" id="emailAddress">
			</div>
			<div class="form-group">
				<label for="phoneNumber">Phone Number:</label> <input type="text"
					class="form-control" name="phoneNumber" id="phoneNumber">
			</div>
			<div class="form-group">
				<label for="levelName">Membership Level:</label><br> <input
					type="radio" name="levelName" value="silver"> Silver:
				$3.95/month - 2 movies per account<br> <input
					type="radio" name="levelName" value="gold"> Gold:
				$6.95/month - 4 movies per account<br> <input
					type="radio" name="levelName" value="platinum"> Platinum:
				$9.95/month - 7 movies per account<br>
			</div>
			<div class="form-group">
				<label>Genre Preference:</label> <br> <select size="1" name="genrePreference">
					<option value="comedy">Comedy</option>
					<option value="horror">Horror</option>
					<option value="thriller">Thriller</option>
					<option value="sci-fi">Sci-fi</option>
					<option value="drama">Drama</option>
					<option value="action">Action</option>
				</select>
			</div>

			<div class="form-group">
				<h2>Billing Info</h2>
			</div>
			<br>

			<div class="form-group">
				<label for="cardHolderFirstName">First Name:</label> <input
					type="text" class="form-control" name="cardHolderFirstName" id="cardHolderFirstName">
			</div>
			<div class="form-group">
				<label for="cardHolderLastName">Last Name:</label> <input
					type="text" class="form-control" name="cardHolderLastName" id="cardHolderLastName">
			</div>
			<div class="form-group">
				<label>Card Type:</label> <br> <select size="1" name="ccType">
					<option value="AmericanExpress">American Express</option>
					<option value="Discover">Discover</option>
					<option value="MasterCard">Master Card</option>
					<option value="Visa">Visa</option>
				</select>
			</div>

			<div class="form-group">
				<label for="creditCardNumber">Card Number:</label> <input type="text"
					class="form-control" name="creditCardNumber" id="creditCardNumber">
			</div>
			<div class="form-group">
				<label for="billAddressLine1">Address:</label> <input type="text"
					class="form-control" name="billAddressLine1" id="billAddressLine1">
			</div>
			<div class="form-group">
				<label for="billAddressLine2">Address (optional):</label> <input type="text"
					class="form-control" name="billAddressLine2" id="billAddressLine2">
			</div>
			<div class="form-group">
				<label for="billCity">City:</label> <input type="text"
					class="form-control" name="billCity" id="billCity">
			</div>

			<div class="form-group">
				<label>State:</label> <br> <select size="1" name="billState">
					<option value="AL">Alabama (AL)</option>
					<option value="AK">Alaska (AK)</option>
					<option value="AZ">Arizona (AZ)</option>
					<option value="AR">Arkansas (AR)</option>
					<option value="CA">California (CA)</option>
					<option value="CO">Colorado (CO)</option>
					<option value="CT">Connecticut (CT)</option>
					<option value="DE">Delaware (DE)</option>
					<option value="DC">District Of Columbia (DC)</option>
					<option value="FL">Florida (FL)</option>
					<option value="GA">Georgia (GA)</option>
					<option value="HI">Hawaii (HI)</option>
					<option value="ID">Idaho (ID)</option>
					<option value="IL">Illinois (IL)</option>
					<option value="IN">Indiana (IN)</option>
					<option value="IA">Iowa (IA)</option>
					<option value="KS">Kansas (KS)</option>
					<option value="KY">Kentucky (KY)</option>
					<option value="LA">Louisiana (LA)</option>
					<option value="ME">Maine (ME)</option>
					<option value="MD">Maryland (MD)</option>
					<option value="MA">Massachusetts (MA)</option>
					<option value="MI">Michigan (MI)</option>
					<option value="MN">Minnesota (MN)</option>
					<option value="MS">Mississippi (MS)</option>
					<option value="MO">Missouri (MO)</option>
					<option value="MT">Montana (MT)</option>
					<option value="NE">Nebraska (NE)</option>
					<option value="NV">Nevada (NV)</option>
					<option value="NH">New Hampshire (NH)</option>
					<option value="NJ">New Jersey (NJ)</option>
					<option value="NM">New Mexico (NM)</option>
					<option value="NY">New York (NY)</option>
					<option value="NC">North Carolina (NC)</option>
					<option value="ND">North Dakota (ND)</option>
					<option value="OH">Ohio (OH)</option>
					<option value="OK">Oklahoma (OK)</option>
					<option value="OR">Oregon (OR)</option>
					<option value="PA">Pennsylvania (PA)</option>
					<option value="RI">Rhode Island (RI)</option>
					<option value="SC">South Carolina (SC)</option>
					<option value="SD">South Dakota (SD)</option>
					<option value="TN">Tennessee (TN)</option>
					<option value="TX">Texas (TX)</option>
					<option value="UT">Utah (UT)</option>
					<option value="VT">Vermont (VT)</option>
					<option value="VA">Virginia (VA)</option>
					<option value="WA">Washington (WA)</option>
					<option value="WV">West Virginia (WV)</option>
					<option value="WI">Wisconsin (WI)</option>
					<option value="WY">Wyoming (WY)</option>
				</select>
			</div>

			<div class="form-group">
				<label for="billZipCode">Zip Code:</label> <input type="text"
					class="form-control" name="billZipCode" id="billZipCode">
			</div>

			<div class="form-group">
				<label>Expiration Month:</label> <br> <select size="1" name="expMonth">
					<option value="1">January</option>
					<option value="2">February</option>
					<option value="3">March</option>
					<option value="4">April</option>
					<option value="5">May</option>
					<option value="6">June</option>
					<option value="7">July</option>
					<option value="8">August</option>
					<option value="9">September</option>
					<option value="10">October</option>
					<option value="11">November</option>
					<option value="12">December</option>
				</select>
			</div>
			
			<div class="form-group">
				<label for="expYear">Expiration Year:</label> <input type="text"
					class="form-control" name="expYear" id="expYear">
			</div>
			<div class="form-group">
				<label for="creditCardCCV">CCV:</label> <input type="text"
					class="form-control" name="creditCardCCV" id="creditCardCCV">
			</div>


			<div class="form-group">
				<button style="background-color: #222; border-color: #080808; color: #9D9D9D" type="submit" class="btn btn-primary">Become a Member</button>
				<button style="background-color: #222; border-color: #080808; color: #9D9D9D" type="button" class="btn btn-primary"
					onclick="location.href='signup.jsp'">Reset</button>
			</div>
		</form>
	</div>
</body>
</html>
