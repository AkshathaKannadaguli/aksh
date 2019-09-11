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
String Name = request.getParameter("n");
String Address = request.getParameter("a");
String Phone = request.getParameter("p");
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/library","root","root");
PreparedStatement ps=con.prepareStatement("insert into PUBLISHER values(?,?,?)");
ps.setString(1, Name);
ps.setString(2, Address);
ps.setString(3,Phone);
int flag=ps.executeUpdate();
%>
<% if(flag>0){ %>
<h3> VALUES INSERTED SUCCESSFULLY</h3>
<p> <a href="Publisher_insert.html" > Back </a></p>
<% } else {%>
<h3> VALUES NOT INSERTED</h3>
<p> <a href="Publisher_insert.html" > Publisher INSERT </a></p>
 <%} %>
<center>
<h3>
Name : <%= Name %> <br>
Address : <%= Address %> <br>
Phone : <%= Phone %> <br>
</h3>
</center>
</body>
</html>