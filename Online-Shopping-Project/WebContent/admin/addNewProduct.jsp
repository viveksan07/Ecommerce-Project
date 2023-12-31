<%@page import="packag.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@ include file="adminHeader.jsp" %>
<%@ include file="../footer.jsp" %>
<html>
<head>
<link rel="stylesheet" href="../css/addNewProduct-style.css">
<title>Add New Product</title>
</head>
<body>
<%
String msg=request.getParameter("msg");
if("done".equals(msg))
{%>
	<h3 class="alert">Product Added Successfully!</h3>
<%} %>
<% 
if("wrong".equals(msg))
{ %>
	<h3 class="alert">Some thing went wrong! Try Again!</h3>

<%} %>
<%
	int id=1;
	try
	{
		Connection con=ConnectionProvider.getCon();
		Statement stsmt=con.createStatement();
		ResultSet rs=stsmt.executeQuery("select max(id) from product");
		while(rs.next())
		{
			id=rs.getInt(1);
			id=id+1;
		}
	}
	catch(Exception e)
	{
		
	}
%>
<h3 style="color: yellow;">Product ID: <%out.println(id); %> </h3>
<form action="addNewProductAction.jsp" method="post">
<input type="hidden" name="id" value="<%out.println(id);%>">
<div class="left-div">
 <h3>Enter Name</h3>
 <input class="input-style" type="text" name="name" placeholder="Enter Product Name" required="required">
<hr>
</div>

<div class="right-div">
<h3>Enter Category</h3>
<input class="input-style" type="text" name="category" placeholder="Enter Category" required="required">
<hr>
</div>

<div class="left-div">
<h3>Enter Price</h3>
<input class="input-style" type="number" name="price" placeholder="Enter Price" required="required">
<hr>
</div>

<div class="right-div">
<h3>Active</h3>
<select class="input-style" name="active">
<option value="yes">yes</option>
<option value="no">no</option>

</select>  
<hr>
</div>
 <button class="button"> Save <i class='far fa-arrow-alt-circle-right'></i></button>
</form>
</body>
<br><br><br>
</body>
</html>