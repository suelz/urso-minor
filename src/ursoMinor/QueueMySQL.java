package ursoMinor;

import java.sql.*;
import java.util.*;

public class QueueMySQL {
	private static Connection connection;

	static {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection("jdbc:mysql://localhost/moviestoredb", "root", "sesame");
		} catch (Exception ex) {
			ex.printStackTrace();
			System.out.println(ex);
		}
	}

	public static Vector<String> memberMovies(int memberID) throws SQLException {
		Vector<String> movieQueue = new Vector<String>();
		String movieQueueQuery = "select movieTitle from queue where memberID=" + memberID + " order by queueSequence";
		PreparedStatement mySql = connection.prepareStatement(movieQueueQuery);
		ResultSet returnedQueue = mySql.executeQuery();
		while (returnedQueue.next()) {
			movieQueue.addElement(returnedQueue.getString("movieTitle").toString().replace("[","").replace("]",""));
		}
		
		return movieQueue;
	}
	
	public static String convertTitleToImage(String movieTitle) throws SQLException {
		//String imageURL;
		String imageQuery = "select movieImage from movie where movieTitle=" + movieTitle;
		PreparedStatement mySql = connection.prepareStatement(imageQuery);
		ResultSet returnedImageURL = mySql.executeQuery();
		returnedImageURL.next();
		return returnedImageURL.getString("movieImage").toString().replace("[","").replace("]","");
	}
}
