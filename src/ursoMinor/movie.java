package ursoMinor;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Vector;

public class movie implements Serializable {
	private static final long serialVersionUID = 1L;
	private int movieID;
	private String genre, title;
	private String description, yearReleased, movieImage, movieTrailer;
	private String director, actor1, actor2, MPAARating;
	private String date;
	private int views, ratingSum, ratingCount;
	private double ratingAvg;
	
	private Vector<String> movieQueue;
	
	public int getMovieID() {
		return movieID;
	}
	
	public void setMovieID(int movieID) {
		this.movieID = movieID;
	}
	
	public String getGenre() {
		return genre;
	}
	
	public void setGenre(String genre) {
		this.genre = genre;
	}
	
	public String getTitle() {
		return title;
	}
	
	public void setTitle(String title) {
		this.title = title;
	}
	
	public String getDescription() {
		return description;
	}
	
	public void setDescription(String description) {
		this.description = description;
	}
	
	public String getYearReleased() {
		return yearReleased;
	}

	public void setYearReleased(String yearReleased) {
		this.yearReleased = yearReleased;
	}

	public String getMovieImage() {
		return movieImage;
	}
	
	public void setMovieImage(String movieImage) {
		this.movieImage = movieImage;
	}
	
	public String getMovieTrailer() {
		return movieTrailer;
	}
	
	public void setMovieTrailer(String movieTrailer) {
		this.movieTrailer = movieTrailer;
	}
	
	public String getDirector() {
		return director;
	}
	
	public void setDirector(String director) {
		this.director = director;
	}
	
	public String getActor1() {
		return actor1;
	}
	
	public void setActor1(String actor1) {
		this.actor1 = actor1;
	}
	public String getActor2() {
		return actor2;
	}
	
	public void setActor2(String actor2) {
		this.actor2 = actor2;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String string) {
		this.date = string;
	}
	public String getMPAARating() {
		return MPAARating;
	}
	public void setMPAARating(String MPAARating) {
		this.MPAARating = MPAARating;
	}
	public int getViews() {
		return views;
	}
	public void setViews(int views) {
		this.views = views;
	}
	public int getRatingSum() {
		return ratingSum;
	}
	public void setRatingSum(int ratingSum) {
		this.ratingSum = ratingSum;
	}
	public int getRatingCount() {
		return ratingCount;
	}
	public void setRatingCount(int ratingCount) {
		this.ratingCount = ratingCount;
	}
	public double getRatingAvg() {
		return ratingAvg;
	}
	public void setRatingAvg(double ratingAvg) {
		this.ratingAvg = ratingAvg;
	}

	public Vector<String> getMovieQueue() {
		return movieQueue;
	}

	public void setMovieQueue(Vector<String> movieQueue) {
		this.movieQueue = movieQueue;
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
	
	public static void addNewMovie(movie newMovie) throws SQLException, ParseException {
		String findMaxMovieID = "select MAX(movieID) from movie";
		PreparedStatement mySql = connection.prepareStatement(findMaxMovieID);
		ResultSet returnedMaxMovieID = mySql.executeQuery();
		returnedMaxMovieID.next();
		newMovie.setMovieID(returnedMaxMovieID.getInt(1) + 1);		//+1 to get value one greater than previous max
		String addNewMovieQuery = "insert into movie (movieID,movieGenre, movieTitle, movieDescription, movieYearReleased, movieImage, movieTrailer, movieReleaseDate, movieMPAARating, director, actor1, actor2)"
				+ "					values (?,?,?,?,?,?,?,?,?,?,?,?)";
		
		mySql = connection.prepareStatement(addNewMovieQuery);
		mySql.setInt(1, newMovie.getMovieID()); 
		mySql.setString(2, newMovie.getGenre()); 
		mySql.setString(3, newMovie.getTitle());
		mySql.setString(4, newMovie.getDescription());
		mySql.setString(5, newMovie.getYearReleased());
		mySql.setString(6, newMovie.getMovieImage()); 
		mySql.setString(7, newMovie.getMovieTrailer());
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Date parsed = format.parse(newMovie.getDate());
		java.sql.Date mySqlDate = new java.sql.Date(parsed.getTime());
		mySql.setDate(8, mySqlDate);
		mySql.setString(9, newMovie.getMPAARating());
		mySql.setString(10, newMovie.getDirector());
		mySql.setString(11, newMovie.getActor1());
		mySql.setString(12, newMovie.getActor2());
		mySql.executeUpdate();
	}
	
}
