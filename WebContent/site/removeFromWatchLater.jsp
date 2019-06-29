<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <jsp:useBean id="loggedInMember" class="ursoMinor.Member"
	scope="session"></jsp:useBean>
<!DOCTYPE html>

<!-- This also should have probably been in a servlet/.java file but again kept going type issues-->
<% 
if (loggedInMember.removeMovieFromWatchLater(Integer.parseInt(request.getParameter("movieID")), loggedInMember.getMemberID())) {
	request.getRequestDispatcher(request.getParameter("pageRedirect")).forward(request, response);
}
else {	
	request.getRequestDispatcher(request.getParameter("pageRedirect")).forward(request, response);
}
%>