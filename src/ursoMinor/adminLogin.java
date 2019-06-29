package ursoMinor;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/site/adminLogin")
public class adminLogin extends HttpServlet {
	private static final long serialVersionUID = 1L; // just to get rid of warning

	public adminLogin() {		
		super();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession adminSession;
		int adminID = -1;
		
		try {
			adminID = Admin.login(request.getParameter("userName"), request.getParameter("password"));
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		if (adminID <= 0) { // If username and password do not match a pair in the database
			request.setAttribute("adminLoggedIn", "false");
			response.sendRedirect("adminLoginError.jsp");
		} 
		else { // Else username and password match up and a session should be started
			Admin loggedInAdmin = new Admin();
			try {
				loggedInAdmin = Admin.adminInfo(adminID);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			adminSession = request.getSession();
			adminSession.setAttribute("loggedInAdmin", loggedInAdmin); // loggedInMember's session should carry over to
																		// other pages
			request.setAttribute("adminLoggedIn", "true");
			response.sendRedirect("adminIndex.jsp");
		}
	}
}