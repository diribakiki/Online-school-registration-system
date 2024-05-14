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
<td>S_id</td>
<td>S_name</td>
<td>C_id</td>
<td>Roll_id</td>
<td>sess_id</td>
<td>Gender</td>
<td>dob</td>
<td>age</td>
<td>f_name</td>
<td>m_name</td>
<td>telephone_no</td>
<td>mobile_no</td>
<td>email</td>
<td>Pre_address</td>
<td>per_address</td>
<td>Action</td>
</tr>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from student_info";
resultSet = statement.executeQuery(sql);
int i=0;
while(resultSet.next()){
%>
<tr>
<td><%=resultSet.getString("S_id") %></td>
<td><%=resultSet.getString("S_name") %></td>
<td><%=resultSet.getString("C_id") %></td>
<td><%=resultSet.getString("Roll_id") %></td>
<td><%=resultSet.getString("sess_id") %></td>
<td><%=resultSet.getString("Gender") %></td>
<td><%=resultSet.getString("dob") %></td>
<td><%=resultSet.getString("age") %></td>
<td><%=resultSet.getString("f_name") %></td>
<td><%=resultSet.getString("m_name") %></td>
<td><%=resultSet.getString("telephone_no") %></td>
<td><%=resultSet.getString("mobile_no") %></td>
<td><%=resultSet.getString("email") %></td>
<td><%=resultSet.getString("Pre_address") %></td>
<td><%=resultSet.getString("per_address") %></td>
<td><a href="delete_student_data.jsp?id=<%=resultSet.getString("S_id") %>"><button type="button"  class="delete">Delete</button></a></td>
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