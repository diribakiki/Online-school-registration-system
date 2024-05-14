<%@ page import="java.sql.*" %>
<%! String driverName = "com.mysql.jdbc.Driver";%>
<%!String url = "jdbc:mysql://localhost:3306/online_student_registration";%>
<%!String user = "root";%>
<%!String psw = "root123";%>
<%
       String Stu_id=request.getParameter("Stu_id");
       String s_name=request.getParameter("S_name");
       String c_id=request.getParameter("C_id");
       String roll_id=request.getParameter("Roll_id");
       String sess_id=request.getParameter("sess_id");
       String gender=request.getParameter("Gender");
       String dob=request.getParameter("dob");
       String age=request.getParameter("age");
       String f_name=request.getParameter("f_name");
       String m_name=request.getParameter("m_name");
       String telephone_no=request.getParameter("telephone_no");
       String mobile_no=request.getParameter("mobile_no");
       String email=request.getParameter("email");
       String pre_addre=request.getParameter("Pre_address");
       String per_add=request.getParameter("per_address");
if(Stu_id!= null)
{
Connection con = null;
PreparedStatement ps = null;
//String admin_id=request.getParameter("admin_id");
try
{
Class.forName(driverName);
con = DriverManager.getConnection(url,user,psw);
String sql="Update student_info set Stu_id=?,S_name=?,C_id=?,Roll_id=?,sess_id=?,Gender=?,dob=?,age=?,f_name=?,m_name=?,telephone_no=?,mobile_no=?,email=?,Pre_address=?,per_address=?where Stu_id="+Stu_id;
ps = con.prepareStatement(sql);
ps.setString(1,Stu_id);
ps.setString(2, s_name);
ps.setString(3, c_id);
ps.setString(4, roll_id);
ps.setString(5, sess_id);
ps.setString(6, gender);
ps.setString(7, dob);
ps.setString(8, age);
ps.setString(9, f_name);
ps.setString(10, m_name);
ps.setString(11, telephone_no);
ps.setString(12, mobile_no);
ps.setString(13, email);
ps.setString(14, pre_addre);
ps.setString(15, per_add);
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