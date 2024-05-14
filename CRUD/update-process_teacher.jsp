<%@ page import="java.sql.*" %>
<%! String driverName = "com.mysql.jdbc.Driver";%>
<%!String url = "jdbc:mysql://localhost:3306/online_student_registration";%>
<%!String user = "root";%>
<%!String psw = "root123";%>
<%
String teach_id=request.getParameter("teacher_id");
String teach_name=request.getParameter("teacher_name");
String teach_eamil=request.getParameter("teacher_eamil");
String gender=request.getParameter("gender");
String phone_number=request.getParameter("phone_number");
String addr=request.getParameter("address");
String subj_id=request.getParameter("subj_id");
String join_date=request.getParameter("join_date");
if(teach_id!= null)

{
Connection con = null;
PreparedStatement ps = null;
//String admin_id=request.getParameter("admin_id");
try
{
Class.forName(driverName);
con = DriverManager.getConnection(url,user,psw);
String sql="Update teacher_info set teacher_id=?,teacher_name=?,teacher_eamil=?,gender=?,phone_number=?,address=?,subj_id=?,join_date=? where teacher_id="+teach_id;
ps = con.prepareStatement(sql);
ps.setString(1,teach_id);
ps.setString(2, teach_name);
ps.setString(3, teach_eamil);
ps.setString(4, gender);
ps.setString(5, phone_number);
ps.setString(6, addr);
ps.setString(7, subj_id);
ps.setString(8, join_date);
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