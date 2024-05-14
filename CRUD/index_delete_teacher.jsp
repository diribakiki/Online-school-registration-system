<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
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

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <h1>Retrieve data from database Online Student Registration</h1>
<table border="1">
<tr>
<td>teacher_id</td>
<td>teacher_name</td>
<td>teacher_eamil</td>
<td>gender</td>
<td>phone_number</td>
<td>address</td>
<td>subj_id</td>
<td>join_date</td>
<td>Action</td>
</tr>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from teacher_info";
resultSet = statement.executeQuery(sql);
int i=0;
while(resultSet.next()){
%>
<tr>
<td><%=resultSet.getString("teacher_id") %></td>
<td><%=resultSet.getString("teacher_name") %></td>
<td><%=resultSet.getString("teacher_eamil") %></td>
<td><%=resultSet.getString("gender") %></td>
<td><%=resultSet.getString("phone_number") %></td>
<td><%=resultSet.getString("address") %></td>
<td><%=resultSet.getString("subj_id") %></td>
<td><%=resultSet.getString("join_date") %></td>
<td><a href="delete_teacher_data.jsp?id=<%=resultSet.getString("teacher_id") %>"><button type="button"  class="delete">Delete</button></a></td>
</tr>
<%
i++;
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
    </body>
</html>
