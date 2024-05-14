

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.sql.*,java.util.*"%>
<%
String userid=request.getParameter("userid"); 
session.putValue("userid",userid); 
String password=request.getParameter("password"); 
Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/online_student_registration","root","root123"); 
Statement st= con.createStatement(); 
ResultSet rs=st.executeQuery("select * from register where userid='"+userid+"' and password='"+password+"'"); 
try{
	rs.next();
	        if(rs.getString("password").equals(password)&&rs.getString("userid").equals(userid)) 
			{ 
			      out.println("Welcome "  +userid); 
			} 
		else{
			 out.println("Invalid password or username.");
		    }
}
catch (Exception e) {
e.printStackTrace();
}
%>
