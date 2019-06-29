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

@WebServlet("/site/UpdatePaymentMethod")
public class UpdatePaymentMethod extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private static Connection connection;

	public UpdatePaymentMethod() {
		super();
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			int memberID = Integer.parseInt(request.getParameter("memberID"));
			String updatedCardHolderFirstName = request.getParameter("cardHolderFirstName");
			String updatedCardHolderLastName = request.getParameter("cardHolderLastName");
			String updatedCcType = request.getParameter("ccType");
			String updatedCreditCardNumber = request.getParameter("creditCardNumber");
			int updatedExpYear = Integer.parseInt(request.getParameter("expYear"));
			int updatedExpMonth = Integer.parseInt(request.getParameter("expMonth"));
			int updatedCreditCardCCV = Integer.parseInt(request.getParameter("creditCardCCV"));
			String updatedBillAddressLine1 = request.getParameter("billAddressLine1");
			String updatedBillAddressLine2 = request.getParameter("billAddressLine2");
			String updatedBillCity = request.getParameter("billCity");
			String updatedBillState = request.getParameter("billState");
			String updatedBillZipCode = request.getParameter("billZipCode");

			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection("jdbc:mysql://localhost/moviestoredb", "root", "sesame");

			String updateInfoQuery = "Update member set cardHolderFirstName=?, cardHolderLastName=?, ccType=?, creditCardNumber=?, expYear=?, expMonth=?, creditCardCCV=?, billAddressLine1=?, billAddressLine2=?, billCity=?, billState=?, billZipCode=? where memberID="
					+ memberID;
			PreparedStatement mySql = connection.prepareStatement(updateInfoQuery);
			mySql.setString(1, updatedCardHolderFirstName);
			mySql.setString(2, updatedCardHolderLastName);
			mySql.setString(3, updatedCcType);
			mySql.setString(4, updatedCreditCardNumber);
			mySql.setInt(5, updatedExpYear);
			mySql.setInt(6, updatedExpMonth);
			mySql.setInt(7, updatedCreditCardCCV);
			mySql.setString(8, updatedBillAddressLine1);
			mySql.setString(9, updatedBillAddressLine2);
			mySql.setString(10, updatedBillCity);
			mySql.setString(11, updatedBillState);
			mySql.setString(12, updatedBillZipCode);
			mySql.executeUpdate();
		
			response.sendRedirect("paymentMethods.jsp");
		} catch (Exception ex) {
			ex.printStackTrace();
			System.out.println(ex);
		}
	}
}