package ursoMinor;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/site/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L; // just to get rid of warning

	public Login() {		
		super();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession userSession;
		int memberID = -1;
		
		try {
			memberID = Member.login(request.getParameter("userName"), request.getParameter("memberPassword"));
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		if (memberID <= 0) { // If username and password do not match a pair in the database
			request.setAttribute("memberLoggedIn", "false");
//			request.getRequestDispatcher("login.jsp").forward(request, response);
			response.sendRedirect("loginError.jsp");
		} 
		else { // Else username and password match up and a session should be started
			Member loggedInMember = new Member();
			try {
				loggedInMember = MemberMySQL.memberInfo(memberID);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			userSession = request.getSession();
			userSession.setAttribute("loggedInMember", loggedInMember); // loggedInMember's session should carry over to
																		// other pages
			request.setAttribute("memberLoggedIn", "true");
			response.sendRedirect("index.jsp");
		}
	}
}