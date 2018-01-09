<%@ page language="java" 
	contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
	import="db_projekt.UserBean"
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Logged In</title>
</head>
<body>
<center>
            <% 
            		UserBean currentUser = ((UserBean) session.getAttribute("currentSessionUser")); 
    				System.out.println("----");
            		System.out.println(currentUser);
    				System.out.println("----");

            	%>
			
            Welcome <%= currentUser.getUserName() + " " + currentUser.getPassWord() %>
         </center>

</body>
</html>