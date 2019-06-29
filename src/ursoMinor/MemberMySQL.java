package ursoMinor;

import java.sql.*;

public class MemberMySQL {
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

	

	public static Member memberInfo(int memberID) throws SQLException {
		Member m = new Member();
		String memberInfoQuery = "select * from member where memberID = ?";
		PreparedStatement mySql = connection.prepareStatement(memberInfoQuery);
		mySql.setInt(1, memberID);
		ResultSet returnedMember = mySql.executeQuery();
		returnedMember.next(); // would prefer a while but then return type error

		m.setMemberID(memberID);
		m.setLevelName(returnedMember.getString(2));
		m.setUserName(returnedMember.getString(3));
		m.setFirstName(returnedMember.getString(4));
		m.setLastName(returnedMember.getString(5));
		m.setBillAddressLine1(returnedMember.getString(6));
		m.setBillAddressLine2(returnedMember.getString(7));
		m.setBillCity(returnedMember.getString(8));
		m.setBillState(returnedMember.getString(9));
		m.setBillZipCode(returnedMember.getString(10));
		m.setShipAddressLine1(returnedMember.getString(11));
		m.setShipAddressLine2(returnedMember.getString(12));
		m.setShipCity(returnedMember.getString(13));
		m.setShipState(returnedMember.getString(14));
		m.setShipZipCode(returnedMember.getString(15));
		m.setPhoneNumber(returnedMember.getString(16));
		m.setEmailAddress(returnedMember.getString(17));
		m.setMemberPassword(returnedMember.getString(18));
		m.setMemberSince(returnedMember.getDate(19));
		m.setActiveStatus(returnedMember.getInt(20));
		m.setGenrePreference(returnedMember.getString(21));
		m.setCreditCardCCV(returnedMember.getInt(22));
		m.setCreditCardNumber(returnedMember.getString(23));
		m.setCardHolderFirstName(returnedMember.getString(24));
		m.setCardHolderLastName(returnedMember.getString(25));
		m.setExpYear(returnedMember.getInt(26));
		m.setExpMonth(returnedMember.getInt(27));
		m.setCcType(returnedMember.getString(28));
		return m;
	}

	public static void addNewMember(Member newMember) throws SQLException {
		String findMaxMemberID = "select MAX(memberID) from member";
		PreparedStatement mySql2 = connection.prepareStatement(findMaxMemberID);
		ResultSet returnedMaxMemberID = mySql2.executeQuery();
		returnedMaxMemberID.next();
		newMember.setMemberID(returnedMaxMemberID.getInt(1) + 1);		//+1 to get value one greater than previous max
		String addNewMemberQuery = "insert into member (memberID,levelName, userName, firstName, lastName, billAddressLine1, billAddressLine2, billCity, billState, billZipCode, shipAddressLine1, shipAddressLine2, shipCity, shipState, shipZipCode, phoneNumber, emailAddress, memberPassword, memberSince, activeStatus, genrePreference, creditCardCCV, creditCardNumber, cardHolderFirstName, cardHolderLastName, expYear, expMonth, ccType)"
				+ "					values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		
		mySql2 = connection.prepareStatement(addNewMemberQuery);
		mySql2.setInt(1, newMember.getMemberID()); 
		mySql2.setString(2, newMember.getLevelName()); 
		mySql2.setString(3, newMember.getUserName());
		mySql2.setString(4, newMember.getFirstName());
		mySql2.setString(5, newMember.getLastName());
		mySql2.setString(6, newMember.getBillAddressLine1()); 
		mySql2.setString(7, newMember.getBillAddressLine2());
		mySql2.setString(8, newMember.getBillCity());
		mySql2.setString(9, newMember.getBillState());
		mySql2.setString(10, newMember.getBillZipCode());
		mySql2.setString(11, newMember.getShipAddressLine1());
		mySql2.setString(12, newMember.getShipAddressLine2());
		mySql2.setString(13, newMember.getShipCity());
		mySql2.setString(14, newMember.getShipState());
		mySql2.setString(15, newMember.getShipZipCode());
		mySql2.setString(16, newMember.getPhoneNumber());
		mySql2.setString(17, newMember.getEmailAddress());
		mySql2.setString(18, newMember.getMemberPassword());
	
		java.util.Date currentDate = new java.util.Date();
		mySql2.setDate(19, new java.sql.Date(currentDate.getTime()));
		mySql2.setInt(20, newMember.getActiveStatus());
		mySql2.setString(21, newMember.getGenrePreference());
		mySql2.setInt(22, newMember.getCreditCardCCV());
		mySql2.setString(23, newMember.getCreditCardNumber());
		mySql2.setString(24, newMember.getCardHolderFirstName());
		mySql2.setString(25, newMember.getCardHolderLastName());
		mySql2.setInt(26, newMember.getExpYear());
		mySql2.setInt(27, newMember.getExpMonth());
		mySql2.setString(28, newMember.getCcType());
		mySql2.executeUpdate();
	}

}