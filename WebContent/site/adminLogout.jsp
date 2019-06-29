  <%@ page import = "ursoMinor.*" %>
  <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<jsp:useBean id="loggedInAdmin" class="ursoMinor.Admin"
	scope="session"></jsp:useBean>
<!DOCTYPE html>
 
  <html>
	<head>
	<title>DBLogout</title>
	</head>
	<body>
		<%
			HttpSession loggedIn = request.getSession(false);
			if (loggedIn != null) {
				loggedIn.invalidate();
				response.sendRedirect("adminLogin.jsp");
			}
			
			
		%>
		</body>
	</html>