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
String Branch_id = request.getParameter("id");
int No_of_copies= Integer.parseInt(request.getParameter("nc"));
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/library","root","root");
PreparedStatement ps=con.prepareStatement("insert into BOOK_COPIES values(?,?,?)");
ps.setString(1, Book_id);
ps.setString(2, Branch_id);
ps.setInt(3, No_of_copies);
int flag=ps.executeUpdate();
%>
<% if(flag>0){ %>
<h3> VALUES INSERTED SUCCESSFULLY</h3>
<p> <a href="Bookcopies_insert.html" > Back </a></p>
<% } else {%>
<h3> VALUES NOT INSERTED</h3>
<p> <a href="Bookcopies_insert.html" > Book Copies INSERT </a></p>
 <%} %>
<center>
<h3>
Book ID : <%= Book_id %> <br>
Branch ID : <%= Branch_id %> <br>
Number of copies : <%= No_of_copies %> <br>
</h3>
</center>
</body>
</html>