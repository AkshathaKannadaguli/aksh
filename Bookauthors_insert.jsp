<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
    <%@ page import="java.io.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String Book_id = request.getParameter("id");
String Author_name= request.getParameter("an");
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/library","root","root");
PreparedStatement ps=con.prepareStatement("insert into BOOK_AUTHORS values(?,?)");
ps.setString(1, Book_id);
ps.setString(2, Author_name);
int flag=ps.executeUpdate();
%>
<% if(flag>0){ %>
<h3> VALUES INSERTED SUCCESSFULLY</h3>
<p> <a href="Bookauthors_insert.html" > Back </a></p>
<% } else {%>
<h3> VALUES NOT INSERTED</h3>
<p> <a href="Bookauthors_insert.html" > Author INSERT </a></p>
 <%} %>
<center>
<h3>
Book ID : <%= Book_id %> <br>
Author Name : <%= Author_name %> <br>
</h3>
</center>
</body>
</html>