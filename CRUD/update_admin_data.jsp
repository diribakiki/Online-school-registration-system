<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String admin_id=request.getParameter("admin_id");
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
String sql ="select * from admin where admin_id="+admin_id;
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
<form method="post" action="update-process_admin.jsp">
<input type="hidden" name="id" value="<%=resultSet.getString("admin_id") %>">
<input type="text" name="id" value="<%=resultSet.getString("admin_id") %>">
<br>
Admin_name:<br>
<input type="text" name="admin_name" value="<%=resultSet.getString("admin_name") %>">
<br>
Admin email:<br>
<input type="text" name="admin_email" value="<%=resultSet.getString("admin_email") %>">
<br>
Admin phone:<br>
<input type="text" name="admin_phone" value="<%=resultSet.getString("admin_phone") %>">

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
