
<%@ page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>forget password</title>
    </head>
    <body>
       <%
try
{
Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ online_student_registration","root","root123"); 
Statement st=con.createStatement();
String email=request.getParameter("email");
String strQuery = "SELECT password FROM register where email='"+email+"'";
ResultSet rs = st.executeQuery(strQuery);
rs.next();
String Countrow = rs.getString(1);
if(Countrow.equals("1")){
	/*mail code
	paste your mail code here
	------------------
	Mail code*/
	out.println("Password send to your email id successfully !");
}
else{
	out.println("Invalid Email Id !");
}
}
catch (Exception e){
e.printStackTrace();
}
%>
</body>
</html>