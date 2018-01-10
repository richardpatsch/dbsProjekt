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
<tr><td>${u.getId()}</td><td>${u.getUsername()}</td><td>${u.getPassword()}</td>  
<td><a href="editform.jsp?id=${u.getId()}">Edit</a></td>  
<td><a href="deleteuser.jsp?id=${u.getId()}">Delete</a></td></tr>  
</c:forEach>  
</table>  
<br/><a href="adduserform.jsp">Add New User</a>  
  
</body>  
</html>  