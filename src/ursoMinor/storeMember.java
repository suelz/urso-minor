package ursoMinor;

import java.io.IOException;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/site/storeMember")
public class storeMember extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public storeMember() {
		super();
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());		//for trouble shooting errors
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		doGet(request, response);
		
		Member m = new Member();
		
		m.setLevelName(request.getParameter("levelName"));
		m.setUserName(request.getParameter("userName"));
		m.setFirstName(request.getParameter("firstName"));
		m.setLastName(request.getParameter("lastName"));
		m.setBillAddressLine1(request.getParameter("billAddressLine1"));
		m.setBillAddressLine2(request.getParameter("billAddressLine2"));
		m.setBillCity(request.getParameter("billCity"));
		m.setBillState(request.getParameter("billState"));
		m.setBillZipCode(request.getParameter("billZipCode"));
		m.setShipAddressLine1(request.getParameter("billAddressLine1"));
		m.setShipAddressLine2(request.getParameter("billAddressLine2"));
		m.setShipCity(request.getParameter("billCity"));
		m.setShipState(request.getParameter("billState"));
		m.setShipZipCode(request.getParameter("billZipCode"));
		m.setPhoneNumber(request.getParameter("phoneNumber"));
		m.setEmailAddress(request.getParameter("emailAddress"));
		m.setMemberPassword(request.getParameter("memberPassword"));
		m.setMemberSince(new Date());
		m.setActiveStatus(1);
		m.setGenrePreference(request.getParameter("genrePreference"));
		m.setCreditCardCCV(Integer.parseInt(request.getParameter("creditCardCCV")));
		m.setCreditCardNumber(request.getParameter("creditCardNumber"));
		m.setCardHolderFirstName(request.getParameter("cardHolderFirstName"));
		m.setCardHolderLastName(request.getParameter("cardHolderLastName"));
		m.setExpYear(Integer.parseInt(request.getParameter("expYear")));
		m.setExpMonth(Integer.parseInt(request.getParameter("expMonth")));
		m.setCcType(request.getParameter("ccType"));
		
		HttpSession userSession = request.getSession();
		userSession.setAttribute("newMember", m);
		userSession.setAttribute("newSignUp", "true");
		response.sendRedirect("getRegistrationData.jsp");
	}
}
