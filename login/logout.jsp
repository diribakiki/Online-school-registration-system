

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Logout</title>
    </head>
    <body>
        <%
  session.removeAttribute("username");        
  session.removeAttribute("password");        
  session.invalidate();        
  %> 
     <form action="http://localhost:8080/Online%20school%20registration%20system/login/login.jsp" method="POST">
     </form>
   
   
    </body>
</html>
