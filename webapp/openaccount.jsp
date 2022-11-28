<!-- import is used to others java classes to use them -->

<%@ page import ="java.sql.*" language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>


<!--  the code inside will endeup inside the server -->
<%!
Connection con;
PreparedStatement ps;


/* This methods are created by the container */
 public void jspInit() {
	 try {
	 DriverManager.getConnection("com.mysql.jdbc.Driver");
	 con = DriverManager.getConnection("jdbc:mysql://localhost/mydb", "root", "test");
	 ps = con.prepareStatement("insert into account value(?, ?, ?, ?)");
	 }catch(Exception e) {
		 e.printStackTrace();
	 }
 }
 
 
 public void jspDestroy() {
	 try {
		 ps.close();
		 con.close();
	 } catch(Exception e){
		 e.printStackTrace();
	 }
 }
%>

<!-- Logic to retrieve information from user  -->
<%
int accno = Integer.parseInt(request.getParameter("accno"));
String lastName = request.getParameter("lastName");
String firstName = request.getParameter("firstName");
int bal = Integer.parseInt(request.getParameter("bal"));

ps.setInt(1, accno);
ps.setString(2, lastName);
ps.setString(3, firstName);
ps.setInt(4, bal);


ps.executeUpdate();

%>
