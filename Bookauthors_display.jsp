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
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/library","root","root");
PreparedStatement ps=con.prepareStatement("select * from BOOK_AUTHORS");
ResultSet rs=ps.executeQuery();
%>
<center>
<%while(rs.next()) {%>
<%=rs.getString(1) %>
<%=rs.getString(2) %>
<br>
<%}%>
</center>
<center>
<p>  <a href="Ldisplay.html"> back </a></p>
</center>
</body>
</html>