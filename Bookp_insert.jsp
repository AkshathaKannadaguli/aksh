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
String Book_id = request.getParameter("i");
String Title = request.getParameter("t");
String Publisher_name= request.getParameter("pn");
int Pub_year=Integer.parseInt(request.getParameter("y"));
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/library","root","root");
PreparedStatement ps=con.prepareStatement("insert into BOOKP values(?,?,?,?)");
ps.setString(1, Book_id);
ps.setString(2, Title);
ps.setString(3,Publisher_name);
ps.setInt(4, Pub_year);
int flag=ps.executeUpdate();
%>
<% if(flag>0){ %>
<h3> VALUES INSERTED SUCCESSFULLY</h3>
<p> <a href="Bookp_insert.html" > Back </a></p>
<% } else {%>
<h3> VALUES NOT INSERTED</h3>
<p> <a href="Bookp_insert.html" > Book INSERT </a></p>
 <%} %>
<center>
<h3>
Book ID : <%= Book_id %> <br>
Title : <%= Title %> <br>
Publisher Name : <%= Publisher_name %> <br>
Publication Year : <%= Pub_year %> <br>
</h3>
</center>
</body>
</html>