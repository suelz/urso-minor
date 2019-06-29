package ursoMinor;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
//import java.util.Date;
import java.util.Date;
import java.util.Vector;

public class Member implements Serializable {
	private static final long serialVersionUID = 1L; // just to get rid of warning

	private int memberID;
	private String levelName;
	private String userName;
	private String firstName;
	private String lastName;
	private String billAddressLine1;
	private String billAddressLine2;
	private String billCity;
	private String billState;
	private String billZipCode;
	private String shipAddressLine1;
	private String shipAddressLine2;
	private String shipCity;
	private String shipState;
	private String shipZipCode;
	private String phoneNumber;
	private String emailAddress;
	private String memberPassword;
	private Date memberSince;
	private int activeStatus;
	private String genrePreference;
	private int creditCardCCV;
	private String creditCardNumber; //stored as a string in the datatable so easier to keep it that way
	private String cardHolderFirstName;
	private String cardHolderLastName;
	private int expYear;
	private int expMonth;
	private String ccType;
	private static Vector<String> movieQueue = new Vector<String>();
	private static Vector<String> favoriteQueue = new Vector<String>();
	private static Vector<String> watchLaterQueue = new Vector<String>();

	public Connection getConnection() {
		Connection connection = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection("jdbc:mysql://localhost/moviestoredb", "root", "sesame");
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return connection;
	}

	public Member() {
	}

	public Member(int memberID) {
		this.memberID = memberID;
	}

	public int getMemberID() {
		return memberID;
	}

	public void setMemberID(int memberID) {
		this.memberID = memberID;
	}

	public void setLevelName(String levelName) {
		this.levelName = levelName;
	}

	public String getLevelName() {
		return levelName;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getBillAddressLine1() {
		return billAddressLine1;
	}

	public void setBillAddressLine1(String billAddressLine1) {
		this.billAddressLine1 = billAddressLine1;
	}

	public String getBillAddressLine2() {
		return billAddressLine2;
	}

	public void setBillAddressLine2(String billAddressLine2) {
		this.billAddressLine2 = billAddressLine2;
	}

	public String getBillCity() {
		return billCity;
	}

	public void setBillCity(String billCity) {
		this.billCity = billCity;
	}

	public String getBillState() {
		return billState;
	}

	public void setBillState(String billState) {
		this.billState = billState;
	}

	public String getBillZipCode() {
		return billZipCode;
	}

	public void setBillZipCode(String billZipCode) {
		this.billZipCode = billZipCode;
	}

	public String getShipAddressLine1() {
		return shipAddressLine1;
	}

	public void setShipAddressLine1(String shipAddressLine1) {
		this.shipAddressLine1 = getBillAddressLine1();
	}

	public String getShipAddressLine2() {
		return shipAddressLine2;
	}

	public void setShipAddressLine2(String shipAddressLine2) {
		this.shipAddressLine2 = getBillAddressLine2();
	}

	public String getShipCity() {
		return shipCity;
	}

	public void setShipCity(String shipCity) {
		this.shipCity = getBillCity();
	}

	public String getShipState() {
		return shipState;
	}

	public void setShipState(String shipState) {
		this.shipState = getBillState();
	}

	public String getShipZipCode() {
		return shipZipCode;
	}

	public void setShipZipCode(String shipZipCode) {
		this.shipZipCode = getBillZipCode();
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getEmailAddress() {
		return emailAddress;
	}

	public void setEmailAddress(String emailAddress) {
		this.emailAddress = emailAddress;
	}

	public String getMemberPassword() {
		return memberPassword;
	}

	public void setMemberPassword(String memberPassword) {
		this.memberPassword = memberPassword;
	}

	public boolean isCorrectPassword(String enteredPassword) {
		if (this.memberPassword.equals(enteredPassword)) {
			return true;
		}
		return false;
	}

	public String getGenrePreference() {
		return genrePreference;
	}

	public void setGenrePreference(String genrePreference) {
		this.genrePreference = genrePreference;
	}

	public int getCreditCardCCV() {
		return creditCardCCV;
	}

	public void setCreditCardCCV(int creditCardCCV) {
		this.creditCardCCV = creditCardCCV;
	}

	public String getCreditCardNumber() {
		return creditCardNumber;
	}

	public void setCreditCardNumber(String creditCardNumber) {
		this.creditCardNumber = creditCardNumber;
	}

	public String getCardHolderFirstName() {
		return cardHolderFirstName;
	}

	public void setCardHolderFirstName(String cardHolderFirstName) {
		this.cardHolderFirstName = cardHolderFirstName;
	}

	public String getCardHolderLastName() {
		return cardHolderLastName;
	}

	public void setCardHolderLastName(String cardHolderLastName) {
		this.cardHolderLastName = cardHolderLastName;
	}

	public int getExpYear() {
		return expYear;
	}

	public void setExpYear(int expYear) {
		this.expYear = expYear;
	}

	public int getExpMonth() {
		return expMonth;
	}

	public void setExpMonth(int expMonth) {
		this.expMonth = expMonth;
	}

	public String getCcType() {
		return ccType;
	}

	public void setCcType(String ccType) {
		this.ccType = ccType;
	}

	public Date getMemberSince() {
		return memberSince;
	}

	public void setMemberSince(Date memberSince) {
		this.memberSince = memberSince;
	}

	public int getActiveStatus() {
		return activeStatus;
	}

	public void setActiveStatus(int activeStatus) {
		this.activeStatus = activeStatus;
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
		int loggedInMember = 0;
		String memberLoginQuery = "select memberID from member where userName = ? and memberPassword = ?";
		PreparedStatement mySql = connection.prepareStatement(memberLoginQuery);
		mySql.setString(1, userName);
		mySql.setString(2, password);
		ResultSet returnedPassword = mySql.executeQuery();
		if (returnedPassword.next()) {
			loggedInMember = returnedPassword.getInt("memberID");
		} else {
			loggedInMember = -1;
		}
		String movieQuery = "select movieID from queue where memberID=" + loggedInMember + " order by queueSequence";
		mySql = connection.prepareStatement(movieQuery);
		ResultSet userMovies = mySql.executeQuery();
		while (userMovies.next()) {
			movieQueue.addElement(Integer.toString(userMovies.getInt("movieID")));
		}
		String favoriteMovieQuery = "select movieID from favorites where memberID=" + loggedInMember + " order by queueSequence";
		mySql = connection.prepareStatement(favoriteMovieQuery);
		ResultSet favoriteMovies = mySql.executeQuery();
		while (favoriteMovies.next()) {
			favoriteQueue.addElement(Integer.toString(favoriteMovies.getInt("movieID")));
		}
		String watchLaterMovieQuery = "select movieID from watchlater where memberID=" + loggedInMember + " order by queueSequence";
		mySql = connection.prepareStatement(watchLaterMovieQuery);
		ResultSet watchLaterMovies = mySql.executeQuery();
		while (watchLaterMovies.next()) {
			watchLaterQueue.addElement(Integer.toString(watchLaterMovies.getInt("movieID")));
		}
		
		return loggedInMember;
	}

	public Vector<String> getMovieQueue() {
		return movieQueue;
	}

	public void setMovieQueue(Vector<String> movieQueue) {
		this.movieQueue = movieQueue;
	}
	
	public boolean addMovie(int movieID) throws SQLException {
		if(!movieQueue.contains(Integer.toString(movieID))){
			movieQueue.add(Integer.toString(movieID));
		}
		String findTitleQuery = "select * from movie where movieID=" + movieID;	
		PreparedStatement mySql = connection.prepareStatement(findTitleQuery);	
		ResultSet movie = mySql.executeQuery();
		String title = "";
		if (movie.next()) {
			title = movie.getString("movieTitle");
		}
		String insertMovieQuery = "insert into queue (memberID, movieID, queueSequence, movieTitle) values(?, ?, ?, ?)";
		mySql = connection.prepareStatement(insertMovieQuery);
		mySql.setInt(1, memberID);
		mySql.setInt(2, movieID);
		mySql.setInt(3, movieQueue.size());
		mySql.setString(4, title);
		mySql.executeUpdate();
		
		String checkQuery = "select * from queue where movieID =" + movieID;
		mySql = connection.prepareStatement(checkQuery);
		ResultSet doubleCheck = mySql.executeQuery();
		if (doubleCheck.next()) {
			return true;
		}
		
		return false;
	}
	
	public boolean removeMovie(int movieID) throws SQLException {
		if (movieQueue.contains(Integer.toString(movieID)))	{		//converted to String to avoid warning
			movieQueue.remove(Integer.toString(movieID));		//need to remove from user's queue as well as database
		}		
		
		String removeQuery = "delete from queue where movieID =" + movieID;
		String checkQuery = "select * from queue where movieID =" + movieID;		
		PreparedStatement mySql = connection.prepareStatement(removeQuery);
		mySql.executeUpdate();
		mySql = connection.prepareStatement(checkQuery);
		ResultSet doubleCheck = mySql.executeQuery();	//checks if queue table still has movie "checked out" to user
		if (!doubleCheck.next()) {
			return true;			//movie successfully removed
		}
		
		return false;
	}

	public static Vector<String> getFavoriteQueue() {
		return favoriteQueue;
	}

	public static void setFavoriteQueue(Vector<String> favoriteQueue) {
		Member.favoriteQueue = favoriteQueue;
	}

	public static Vector<String> getWatchLaterQueue() {
		return watchLaterQueue;
	}

	public static void setWatchLaterQueue(Vector<String> watchLaterQueue) {
		Member.watchLaterQueue = watchLaterQueue;
	}
	
	public static boolean addMovieToFavorites(int movieID, int memberID) throws SQLException {
		if(!favoriteQueue.contains(Integer.toString(movieID))) {
			favoriteQueue.add(Integer.toString(movieID));		//add movie to favorites queue if not already in there
		}
		
		String findTitleQuery = "select * from movie where movieID=" + movieID;	
		PreparedStatement mySql = connection.prepareStatement(findTitleQuery);
		ResultSet title = mySql.executeQuery();
		String movieGenre = "";
		String selectedTitle = "";
		String movieDescription = "";
		String movieYearReleased = "";
		String imageURL = "";
		String movieTrailer ="";
		String movieMPAARating = "";
		String director = "";
		String actor1 = "";
		String actor2 = "";
		if (title.next()) {
			movieGenre = title.getString("movieGenre");
			selectedTitle = title.getString("movieTitle");
			movieDescription = title.getString("movieDescription");
			movieYearReleased = title.getString("movieYearReleased");
			imageURL = title.getString("movieImage");
			movieTrailer = title.getString("movieTrailer");
			movieMPAARating = title.getString("movieMPAARating");
			director = title.getString("director");
			actor1 = title.getString("actor1");
			actor2 = title.getString("actor2");
		}

		String addFavoritesQuery = "insert into favorites (memberID, movieID, queueSequence, movieGenre, movieTitle, movieDescription, movieYearReleased, movieImage, movieTrailer, movieMPAARating, director, actor1, actor2) values (?,?,?,?,?,?,?,?,?,?,?,?,?)";
		mySql = connection.prepareStatement(addFavoritesQuery);
		mySql.setInt(1, memberID);
		mySql.setInt(2, movieID);
		mySql.setInt(3, favoriteQueue.size() + 1);		//not really needed
		mySql.setString(4, movieGenre);
		mySql.setString(5, selectedTitle);
		mySql.setString(6, movieDescription);
		mySql.setString(7, movieYearReleased);
		mySql.setString(8, imageURL);
		mySql.setString(9, movieTrailer);
		mySql.setString(10, movieMPAARating);
		mySql.setString(11, director);
		mySql.setString(12, actor1);
		mySql.setString(13, actor2);
		mySql.executeUpdate();
		
		String checkQuery = "select * from favorites where movieID=" + movieID + " and memberID=" + memberID;
		mySql = connection.prepareStatement(checkQuery);
		ResultSet doubleCheck = mySql.executeQuery();	//checks if movie is in favorites queue
		if (doubleCheck.next()) {
			return true;			//movie successfully added
		}
		
		return false;
	}
	
	public boolean removeMovieFromFavorites(int movieID, int memberID) throws SQLException {
		if (favoriteQueue.contains(Integer.toString(movieID)))	{		//converted to String to avoid warning
			favoriteQueue.remove(Integer.toString(movieID));		//need to remove from user's queue as well as database
		}		
		
		String removeQuery = "delete from favorites where movieID=" + movieID + " and memberID=" + memberID;
		String checkQuery = "select * from favorites where movieID=" + movieID + " and memberID=" + memberID;		
		PreparedStatement mySql = connection.prepareStatement(removeQuery);
		mySql.executeUpdate();
		mySql = connection.prepareStatement(checkQuery);
		ResultSet doubleCheck = mySql.executeQuery();	//checks if queue table still has movie "checked out" to user
		if (!doubleCheck.next()) {
			return true;			//movie successfully removed
		}
		
		return false;
	}
	
	public static boolean addMovieToWatchLater(int movieID, int memberID) throws SQLException {
		if(!watchLaterQueue.contains(Integer.toString(movieID))) {
			watchLaterQueue.add(Integer.toString(movieID));		//add movie to favorites queue if not already in there
		}
		
		String findTitleQuery = "select * from movie where movieID=" + movieID;	
		PreparedStatement mySql = connection.prepareStatement(findTitleQuery);
		ResultSet title = mySql.executeQuery();
		String movieGenre = "";
		String selectedTitle = "";
		String movieDescription = "";
		String movieYearReleased = "";
		String imageURL = "";
		String movieTrailer ="";
		String movieMPAARating = "";
		String director = "";
		String actor1 = "";
		String actor2 = "";
		if (title.next()) {
			movieGenre = title.getString("movieGenre");
			selectedTitle = title.getString("movieTitle");
			movieDescription = title.getString("movieDescription");
			movieYearReleased = title.getString("movieYearReleased");
			imageURL = title.getString("movieImage");
			movieTrailer = title.getString("movieTrailer");
			movieMPAARating = title.getString("movieMPAARating");
			director = title.getString("director");
			actor1 = title.getString("actor1");
			actor2 = title.getString("actor2");
		}

		String addWatchLaterQuery = "insert into watchlater (memberID, movieID, queueSequence, movieGenre, movieTitle, movieDescription, movieYearReleased, movieImage, movieTrailer, movieMPAARating, director, actor1, actor2) values (?,?,?,?,?,?,?,?,?,?,?,?,?)";
		mySql = connection.prepareStatement(addWatchLaterQuery);
		mySql.setInt(1, memberID);
		mySql.setInt(2, movieID);
		mySql.setInt(3, watchLaterQueue.size() + 1);		//not really needed
		mySql.setString(4, movieGenre);
		mySql.setString(5, selectedTitle);
		mySql.setString(6, movieDescription);
		mySql.setString(7, movieYearReleased);
		mySql.setString(8, imageURL);
		mySql.setString(9, movieTrailer);
		mySql.setString(10, movieMPAARating);
		mySql.setString(11, director);
		mySql.setString(12, actor1);
		mySql.setString(13, actor2);
		mySql.executeUpdate();
		
		String checkQuery = "select * from watchlater where movieID=" + movieID + " and memberID=" + memberID;
		mySql = connection.prepareStatement(checkQuery);
		ResultSet doubleCheck = mySql.executeQuery();	//checks if movie is in favorites queue
		if (doubleCheck.next()) {
			return true;			//movie successfully added
		}
		
		return false;
	}
	
	public boolean removeMovieFromWatchLater(int movieID, int memberID) throws SQLException {
		if (watchLaterQueue.contains(Integer.toString(movieID)))	{		//converted to String to avoid warning
			watchLaterQueue.remove(Integer.toString(movieID));		//need to remove from user's queue as well as database
		}		
		
		String removeQuery = "delete from watchlater where movieID=" + movieID + " and memberID=" + memberID;
		String checkQuery = "select * from watchlater where movieID=" + movieID + " and memberID=" + memberID;		
		PreparedStatement mySql = connection.prepareStatement(removeQuery);
		mySql.executeUpdate();
		mySql = connection.prepareStatement(checkQuery);
		ResultSet doubleCheck = mySql.executeQuery();	//checks if queue table still has movie "checked out" to user
		if (!doubleCheck.next()) {
			return true;			//movie successfully removed
		}
		
		return false;
	}
}