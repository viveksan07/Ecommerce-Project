
<%@page import="packag.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%
String email=session.getAttribute("email").toString();
String address=request.getParameter("address");
String city=request.getParameter("city");
String state=request.getParameter("state");
String country=request.getParameter("country");
String mobileNumber=request.getParameter("mobileNumber");
String paymentMethod=request.getParameter("paymentMethod");
String transactionID="";
transactionID=request.getParameter("transactionID");
String status="bill";

try
{
	Connection con=ConnectionProvider.getCon();
	PreparedStatement stmt =con.prepareStatement("update users set address=?, city=?,state=?,country=?,mobileNumber=? where email=?");
	stmt.setString(1, address);
	stmt.setString(2, city);
	stmt.setString(3, state);
	stmt.setString(4, country);
	stmt.setString(5, mobileNumber);
	stmt.setString(6, email);
	stmt.executeUpdate();
	
	PreparedStatement st =con.prepareStatement("update cart set address=?, city=?,state=?,country=?,mobileNumber=? ,orderDate=now(),deliveryDate=DATE_ADD(orderDate,INTERVAL 7 DAY),paymentMethod=?,transactionId=?,status=? where email=? and address is NULL");
	st.setString(1, address);
	st.setString(2, city);
	st.setString(3, state);
	st.setString(4, country);
	st.setString(5, mobileNumber);
	st.setString(6, paymentMethod);
	st.setString(7, transactionID);
	st.setString(8, status);
	st.setString(9, email);
	st.executeUpdate();
	response.sendRedirect("bill.jsp");
}
catch(Exception e)
{
	System.out.println(e);
}
%>