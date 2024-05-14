<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String admin_id=request.getParameter("S_id");
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "online_student_registration";
String userid = "root";
String password = "root123";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from student_info where Stu_id="+admin_id;
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>update Page</title>
    </head>
    <body>
       <h1>Update data from database in jsp</h1>
<form method="post" action="update-process_student.jsp">
<input type="hidden" name="id" value="<%=resultSet.getString("Stu_id") %>">
<input type="text" name="id" value="<%=resultSet.getString("Stu_id") %>">
<br>
Student name:<br>
<input type="text" name="S_name" value="<%=resultSet.getString("S_name") %>">
<br>
Course id:<br>
<input type="text" name="C_id" value="<%=resultSet.getString("C_id") %>">
<br>
Roll id:<br>
<input type="text" name="Roll_id" value="<%=resultSet.getString("Roll_id") %>">
session id:<br>
<input type="text" name="sess_id" value="<%=resultSet.getString("sess_id") %>">
Gender:<br>
<input type="text" name="Gender" value="<%=resultSet.getString("Gender") %>">
Date of birth:<br>
<input type="text" name="dob" value="<%=resultSet.getString("dob") %>">
Age:<br>
<input type="text" name="age" value="<%=resultSet.getString("age") %>">
first name:<br>
<input type="text" name="f_name" value="<%=resultSet.getString("f_name") %>">
mother name:<br>
<input type="text" name="m_name" value="<%=resultSet.getString("m_name") %>">
telephone_no:<br>
<input type="text" name="telephone_no" value="<%=resultSet.getString("telephone_no") %>">
mobile_no:<br>
<input type="text" name="mobile_no" value="<%=resultSet.getString("mobile_no") %>">
email:<br>
<input type="text" name="email" value="<%=resultSet.getString("email") %>">
Pre_address:<br>
<input type="text" name="Pre_address" value="<%=resultSet.getString("Pre_address") %>">
per_address:<br>
<input type="text" name="per_address" value="<%=resultSet.getString("per_address") %>">
<br><br>
<input type="submit" value="submit">
</form>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
    </body>
</html>
