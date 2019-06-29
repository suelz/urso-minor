package ursoMinor;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/site/EditMyProfile")
public class EditMyProfile extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	
	private static Connection connection;
	
	public EditMyProfile() {
		super();
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
		int memberID = Integer.parseInt(request.getParameter("memberID"));
		String updatedUserName = request.getParameter("userName");
		String updatedFirstName = request.getParameter("firstName");
		String updatedLastName = request.getParameter("lastName");
		String updatedLevelName = request.getParameter("levelName");
		String updatedEmailAddress = request.getParameter("emailAddress");
		String updatedPhoneNumber = request.getParameter("phoneNumber");
		String updatedGenrePreference = request.getParameter("genrePreference");
		
		
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection("jdbc:mysql://localhost/moviestoredb", "root", "sesame");
		 
		
		String updateInfoQuery = "Update member set userName=?, firstName=?, lastName=?, levelName=? ,emailAddress=?,phoneNumber=?,genrePreference=? where memberID=" +memberID;
		PreparedStatement mySql = connection.prepareStatement(updateInfoQuery);
		mySql.setString(1, updatedUserName);
		mySql.setString(2, updatedFirstName);
		mySql.setString(3, updatedLastName);
		mySql.setString(4, updatedLevelName);
		mySql.setString(5, updatedEmailAddress);
		mySql.setString(6, updatedPhoneNumber);
		mySql.setString(7, updatedGenrePreference);
		mySql.executeUpdate();
		
		response.sendRedirect("myProfile.jsp");
		}
		catch (Exception ex) {
			ex.printStackTrace();
			System.out.println(ex);
		}
	}
}

