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
<h3>Get the particulars of borrowers who have borrowed more than 3 books, but
from Jan 2017 to Jun 2017.</h3>
<%

Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/library","root","root");
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select Card_no from BOOK_LENDING where Date_out between '2017/01/01' and '2017/06/30'  group by Card_no having count(*)>3");
%>
<h5>Card no</h5>
<% 
while(rs.next())
{%>
<%= rs.getInt("Card_no") %>	
<%}
%>
</body>
</html>