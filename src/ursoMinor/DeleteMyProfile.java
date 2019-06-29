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

@WebServlet("/site/DeleteMyProfile")
public class DeleteMyProfile extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	
	private static Connection connection;
	
	public DeleteMyProfile() {
		super();
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
		int memberID = Integer.parseInt(request.getParameter("memberID"));
		
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection("jdbc:mysql://localhost/moviestoredb", "root", "sesame");
		 
		
		String updateInfoQuery = "Delete from member where memberID=?";
		PreparedStatement mySql = connection.prepareStatement(updateInfoQuery);
		mySql.setInt(1, memberID);
		mySql.executeUpdate();
	
		response.sendRedirect("deleteConfirmation.jsp");
		}
		catch (Exception ex) {
			ex.printStackTrace();
			System.out.println(ex);
		}
	}
}