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
<h3>Retrieve details of all books in the library  id, title, name of publisher,
authors, number of copies in each branch, etc.<h3>
<%
try{
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/library","root","root");
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select b.Book_id,b.Title,b.Publisher_name,a.Author_name,c.No_of_copies,c.Branch_id from BOOK b,BOOK_AUTHORS a,BOOK_COPIES c where b.Book_id=a.Book_id and b.Book_id=c.Book_id");
%>
<h5>Book id    Title    Publisher name    Author name  No_of_copies  Branch id</h5>
<% 
while(rs.next())
{
	String bid=rs.getString("Book_id");
	String t=rs.getString("Title");		
	String pn=rs.getString("Publisher_name");
	String an=rs.getString("Author_name");
	int nc=rs.getInt("No_of_copies");
	String brid=rs.getString("Branch_id");
	
%>
<p>
<%=bid%>  &nbsp;&nbsp;&nbsp;
<%=t %>   &nbsp;&nbsp;&nbsp;
<%=pn %>  &nbsp;&nbsp;&nbsp;
<%=an %>  &nbsp;&nbsp;&nbsp;
<%=nc %>  &nbsp;&nbsp;&nbsp;
<%=brid %></p>
<% }
}catch(Exception e)
{
	
}
%>
</body>
</html>