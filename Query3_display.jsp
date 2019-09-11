<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
        <%@page import="java.io.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h3>Delete a book in BOOK table. Update the contents of other tables to reflect
this data manipulation operation.</h3>
<%

Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/library","root","root");
Statement st=con.createStatement();
st.executeUpdate("delete from BOOK where Book_id='4'");
ResultSet rs=st.executeQuery("select * from BOOK");
%>
<h5>Book_id   Title  Publisher name  Publication year</h5>

<% 
while(rs.next())
{
	String bid=rs.getString("Book_id");
	String t=rs.getString("Title");		
	String pn=rs.getString("Publisher_name");
	int py=rs.getInt("Pub_year");
%>
<p>
<%=bid%>  &nbsp;&nbsp;&nbsp;
<%=t %>   &nbsp;&nbsp;&nbsp;
<%=pn %>  &nbsp;&nbsp;&nbsp;
<%=py%> 
</p>
<%}
%>
</body>
</html>