package ursoMinor;

import java.io.IOException;
import java.sql.*;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ursoMinor.*;

@WebServlet("/site/storeMovie")
public class storeMovie extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public storeMovie() {
		super();
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());		//for trouble shooting errors
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		doGet(request, response);
		
		movie m = new movie();
		
		m.setGenre(request.getParameter("movieGenre"));
		m.setTitle(request.getParameter("movieTitle"));
		m.setDescription(request.getParameter("movieDescription"));
		m.setYearReleased(request.getParameter("movieYearReleased"));
		m.setMovieImage(request.getParameter("movieImage"));
		m.setMovieTrailer(request.getParameter("movieTrailer"));
		m.setDate(request.getParameter("movieReleaseDate"));
		m.setMPAARating(request.getParameter("movieMPAARating"));
		m.setDirector(request.getParameter("director"));
		m.setActor1(request.getParameter("actor1"));
		m.setActor2(request.getParameter("actor2"));
		
		HttpSession adminSession = request.getSession();
		adminSession.setAttribute("newMovie", m);
		adminSession.setAttribute("newMovieAdded", "true");
		response.sendRedirect("getMovieData.jsp");
	}
}
