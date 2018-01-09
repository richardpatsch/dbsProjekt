<%@page import="db_projekt.UserDAO, db_projekt.UserBean,java.util.*"%>  
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>  
  
<html>  
<head>  
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">  
<title>View Users</title>  
</head>  
<body>  
  
<h1>Users List</h1>  
  
<%  
List<UserBean> list=UserDAO.getAllRecords();  
request.setAttribute("list",list);  
%>  
  
<table border="1" width="90%">  
<tr><th>Id</th><th>Username</th><th>Password</th><th>Edit</th><th>Delete</th></tr>  
<c:forEach items="${list}" var="u">  
<tr><td>${u.getID()}</td><td>${u.getUserName()}</td><td>${u.getPassWord()}</td>  
<td><a href="editform.jsp?id=${u.getID()}">Edit</a></td>  
<td><a href="deleteuser.jsp?id=${u.getID()}">Delete</a></td></tr>  
</c:forEach>  
</table>  
<br/><a href="adduserform.jsp">Add New User</a>  
  
</body>  
</html>  