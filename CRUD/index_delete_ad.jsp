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
        <title>delete Page</title>
    </head>
    <body>
        <h1>Retrieve data from database Online Student Registration</h1>
<table border="1">
<tr>
<td>admin_id</td>
<td>admin_name</td>
<td>admin_email</td>
<td>admin_phone</td>
<td>Action</td>

</tr>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from admin";
resultSet = statement.executeQuery(sql);
int i=0;
while(resultSet.next()){
%>
<tr>
<td><%=resultSet.getString("admin_id") %></td>
<td><%=resultSet.getString("admin_name") %></td>
<td><%=resultSet.getString("admin_email") %></td>
<td><%=resultSet.getString("admin_phone") %></td>
<td><a href="delete_admin_data.jsp?id=<%=resultSet.getString("admin_id") %>"><button type="button"  class="delete">Delete</button></a></td>
</tr>
<%
i++;
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
    </body>
</html>
