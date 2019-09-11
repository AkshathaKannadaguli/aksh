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
<center>
<%
//String c_id = request.getParameter("id");
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/library","root","root");
PreparedStatement ps=con.prepareStatement("select * from PUBLISHER");
//ps.setString(1, c_id);
ResultSet rs=ps.executeQuery();

%>
<br>
<% while(rs.next())  { %>
<%=rs.getString(1) %>
<%=rs.getString(2) %>
<%=rs.getString(3)%>
<br>
<%} %>

<p>  <a href="Ldisplay.html"> back </a></p>
</center>
</body>
</html>