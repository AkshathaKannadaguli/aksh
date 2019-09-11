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
<%
String Book_id = request.getParameter("i");
String Branch_id = request.getParameter("id");
int Card_no=Integer.parseInt(request.getParameter("cn"));
Date Date_out=Date.valueOf(request.getParameter("do"));
Date Due_date=Date.valueOf(request.getParameter("dd"));

Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/library","root","root");
PreparedStatement ps=con.prepareStatement("insert into BOOK_LENDING values(?,?,?,?,?)");
ps.setString(1, Book_id);
ps.setString(2, Branch_id);
ps.setInt(3, Card_no);
ps.setDate(4, Date_out);
ps.setDate(5,Due_date);
int flag=ps.executeUpdate();
%>
<% if(flag>0){ %>
<h3> VALUES INSERTED SUCCESSFULLY</h3>
<p> <a href="Booklending_insert.html" > Back </a></p>
<% } else {%>
<h3> VALUES NOT INSERTED</h3>
<p> <a href="Booklending_insert.html" > Book INSERT </a></p>
 <%} %>
<center>
<h3>
Book ID : <%= Book_id %> <br>
Branch ID : <%= Branch_id %> <br>
Card Number : <%= Card_no %> <br>
Date Out : <%= Date_out %> <br>
Due Date : <%= Due_date %> <br>
</h3>
</center>
</body>
</html>