package ursoMinor;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Admin {
	private int adminID;
	private String userName;
	private String password;
	
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	} 
	
	public int getAdminID() {
		return adminID;
	}
	public void setAdminID(int adminID) {
		this.adminID = adminID;
	}

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
	
	public static int login(String userName, String password) throws SQLException {
		int loggedInAdmin = 0;
		String adminLoginQuery = "select adminID from admin where userName = ? and password = ?";
		PreparedStatement mySql = connection.prepareStatement(adminLoginQuery);
		mySql.setString(1, userName);
		mySql.setString(2, password);
		ResultSet returnedPassword = mySql.executeQuery();
		if (returnedPassword.next()) {
			loggedInAdmin = returnedPassword.getInt("adminID");
		} else {
			loggedInAdmin = -1;
		}
		return loggedInAdmin;
	}
	
	public static Admin adminInfo(int adminID) throws SQLException {
		Admin a = new Admin();
		String adminInfoQuery = "select * from admin where adminID = ?";
		PreparedStatement mySql = connection.prepareStatement(adminInfoQuery);
		mySql.setInt(1, adminID);
		ResultSet returnedAdmin = mySql.executeQuery();
		returnedAdmin.next(); // would prefer a while but then return type error

		a.setAdminID(adminID);
		a.setUserName(returnedAdmin.getString(2));
		a.setPassword(returnedAdmin.getString(3));
		return a;
	}
}
