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
String Branch_id = request.getParameter("bid");
String Branch_name = request.getParameter("bn");
String Address= request.getParameter("ad");
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/library","root","root");
PreparedStatement ps=con.prepareStatement("insert into LIBRARY_BRANCH values(?,?,?)");
ps.setString(1, Branch_id);
ps.setString(2, Branch_name);
ps.setString(3,Address);
int flag=ps.executeUpdate();
%>
<% if(flag>0){ %>
<h3> VALUES INSERTED SUCCESSFULLY</h3>
<p> <a href="Librarybranch_insert.html" > Back </a></p>
<% } else {%>
<h3> VALUES NOT INSERTED</h3>
<p> <a href="Librarybranch_insert.html" > Library Branch INSERT </a></p>
 <%} %>
<center>
<h3>
Branch ID : <%= Branch_id %> <br>
Branch Name : <%= Branch_name %> <br>
Address : <%= Address %> <br>
</h3>
</center>
</body>
</html>