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
<h3>Partition the BOOK table based on year of publication. Demonstrate its
working with a simple query.</h3>
<%
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/library","root","root");
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select * from BOOKP partition(p1)");

%>
<h5>Book_id   Title  Publisher name  Publication year</h5>

<% 
while(rs.next())
{
	int bid=rs.getInt("Book_id");
	String t=rs.getString("Title");		
	String pn=rs.getString("Pub_name");
	int py=rs.getInt("Pub_year");
%>
<p>
<%=bid%>  &nbsp;&nbsp;&nbsp;
<%=t %>   &nbsp;&nbsp;&nbsp;
<%=pn %>  &nbsp;&nbsp;&nbsp;
<%=py%> 
</p>
<%}
%>
</body>
</html>