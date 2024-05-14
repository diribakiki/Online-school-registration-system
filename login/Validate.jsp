<%@page import="java.sql.ResultSet"%>
<%@page import="com.mysql.jdbc.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>validate</title>
    </head>
     <%
           try{
       String username=request.getParameter("username");
       String password=request.getParameter("password");
       Class.forName("com.mysql.jdbc.Driver");
       Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/online_student_registration" ,"root", "root123");
       PreparedStatement pst= con.prepareStatement("Select username,password from login where username=? and password=?");
       pst.setString(1,username);
       pst.setString(2,password);
       ResultSet rs=pst.executeQuery();
       if(rs.next())
           out.println("valid login");
       else
           out.println("invalid logi");
           
 

       }catch(Exception e){
       out.println("please try again!");
       }
%>
</html>
