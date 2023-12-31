<%@page import="packag.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<% 
String id= request.getParameter("id");
String name= request.getParameter("name");
String category= request.getParameter("category");
String price= request.getParameter("price");
String active=request.getParameter("active");

try
{
	Connection con=ConnectionProvider.getCon();
	PreparedStatement stsmt=con.prepareStatement("insert into product values(?,?,?,?,?)");
	stsmt.setString(1, id);
	stsmt.setString(2, name);
	stsmt.setString(3, category);
	stsmt.setString(4, price);
	stsmt.setString(5, active);
	stsmt.executeUpdate();
	response.sendRedirect("addNewProduct.jsp?msg=done");
}
catch(Exception e)
{
	response.sendRedirect("addNewProduct.jsp?msg=wrong");
	System.out.println(e);
}

%>