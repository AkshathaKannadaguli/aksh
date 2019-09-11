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
<h3>Create a view of all books and its number of copies that are currently
available in the Library.</h3>
<%

Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/library","root","root");
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select * from viewcopy");
%>
<h5>Book_id Copy</h5>

<% 
while(rs.next())
{
	String bid=rs.getString("Book_id");		
	int c=rs.getInt("Copy");
%>
<p>
<%=bid%>  &nbsp;&nbsp;&nbsp;
<%=c %>   
</p>
<%}
%>
</body>
</html>