<%@ page language="java" 
	contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
	import="db_projekt.PersonenBean"
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
            		PersonenBean currentUser = ((PersonenBean) session.getAttribute("currentSessionUser")); 
    				System.out.println("----");
            		System.out.println(currentUser);
    				System.out.println("----");
            	%>
			
            Welcome <%= currentUser.getVorname() + " " + currentUser.getNachname() %>
     
    <br />       
<a href="person/addpersonform.jsp">Add Person</a>  <br/>
<a href="person/viewpersonen.jsp">View Personen</a> <br/>
<a href="buchung/index.jsp">Buchung</a>
         </center>

</body>
</html>