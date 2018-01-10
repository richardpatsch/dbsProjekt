<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<%@page import="db_projekt.PersonenDAO,db_projekt.PersonenBean"%>  
  
<%  
String id=request.getParameter("id");  
PersonenBean u=PersonenDAO.getRecordById(Integer.parseInt(id));  
%>  

<h1>Edit Form</h1>  
<form action="editperson.jsp" method="post">  
<table>  
<tr><td>Name:</td><td>  
<input type="text" name="username" value="<%= u.getSVId()%>"/></td></tr>  
<tr><td>Password:</td><td>  
<input type="password" name="password" value="<%= u.getVorname()%>"/></td></tr>
<tr><td colspan="2"><input type="submit" value="Edit Person"/></td></tr>  
</table>  
</form>  

</body>
</html>