<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String teach_id=request.getParameter("teacher_id");
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
String sql ="select * from teacher_info where teacher_id="+teach_id;
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
<form method="post" action="update-process_teacher.jsp">
<input type="hidden" name="id" value="<%=resultSet.getString("teacher_id") %>">
<input type="text" name="id" value="<%=resultSet.getString("teacher_id") %>">
<br>
teacher_name:<br>
<input type="text" name="teacher_name" value="<%=resultSet.getString("teacher_name") %>">
<br>
teacher_eamil:<br>
<input type="text" name="teacher_eamil" value="<%=resultSet.getString("teacher_eamil") %>">
<br>
gender:<br>
<input type="text" name="gender" value="<%=resultSet.getString("gender") %>">
phone_number:<br>
<input type="text" name="phone_number" value="<%=resultSet.getString("phone_number") %>">
address:<br>
<input type="text" name="address" value="<%=resultSet.getString("address") %>">
subj_id:<br>
<input type="text" name="subj_id" value="<%=resultSet.getString("subj_id") %>">
join_date:<br>
<input type="text" name="join_date" value="<%=resultSet.getString("join_date") %>">
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
