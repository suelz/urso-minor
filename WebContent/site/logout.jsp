  <%@ page import = "ursoMinor.*" %>
  <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<jsp:useBean id="loggedInMember" class="ursoMinor.Member"
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
				loggedInMember.getMovieQueue().removeAllElements();
				loggedInMember.getFavoriteQueue().removeAllElements();
				loggedInMember.getWatchLaterQueue().removeAllElements();
				loggedIn.invalidate();
				response.sendRedirect("index.jsp");
			}
			
			
		%>
		</body>
	</html>