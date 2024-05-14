<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
 String teach_id=request.getParameter("teacher_id");
try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/online_student_registration", "root", "root123");
Statement st=conn.createStatement();
int i=st.executeUpdate("DELETE FROM   teacher_info WHERE teacher_id="+teach_id);
out.println("Data Deleted Successfully!");
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>