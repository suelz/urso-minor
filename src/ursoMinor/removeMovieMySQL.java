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

@WebServlet("/site/removeMovieMySQL")
public class removeMovieMySQL extends HttpServlet{
	private static final long serialVersionUID = 1L;
	private static Connection connection;
	
	public removeMovieMySQL() {
		super();
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
		String movieTitle = request.getParameter("movieTitle");
		
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection("jdbc:mysql://localhost/moviestoredb", "root", "sesame");
		 
		
		String updateMoviesQuery = "Delete from movie where movieTitle=?";
		PreparedStatement mySql = connection.prepareStatement(updateMoviesQuery);
		mySql.setString(1, movieTitle);
		mySql.executeUpdate();
	
		response.sendRedirect("deleteMovieConfirmation.jsp");
		}
		catch (Exception ex) {
			ex.printStackTrace();
			System.out.println(ex);
		}
	}
}
