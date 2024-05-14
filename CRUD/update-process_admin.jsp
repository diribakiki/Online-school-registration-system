<%@ page import="java.sql.*" %>
<%! String driverName = "com.mysql.jdbc.Driver";%>
<%!String url = "jdbc:mysql://localhost:3306/online_student_registration";%>
<%!String user = "root";%>
<%!String psw = "root123";%>
<%
String admin_id=request.getParameter("admin_id");
String admin_name=request.getParameter("admin_name");
String admin_email=request.getParameter("admin_email");
String admin_phone=request.getParameter("admin_phone");
if(admin_id != null)
{
Connection con = null;
PreparedStatement ps = null;
//String admin_id=request.getParameter("admin_id");
try
{
Class.forName(driverName);
con = DriverManager.getConnection(url,user,psw);
String sql="Update admin set admin_id=?,admin_name=?,admin_email=?,admin_phone=? where admin_id="+admin_id;
ps = con.prepareStatement(sql);
ps.setString(1,admin_id);
ps.setString(2, admin_name);
ps.setString(3, admin_email);
ps.setString(4, admin_phone);

int i = ps.executeUpdate();
if(i > 0)
{
out.print("Record Updated Successfully");
}
else
{
out.print("There is a problem in updating Record.");
} 
}
catch(SQLException sql)
{
request.setAttribute("error", sql);
out.println(sql);
}
}
%>