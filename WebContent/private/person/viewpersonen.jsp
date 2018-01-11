<%@page import="db_projekt.PersonenDAO, db_projekt.PersonenBean,java.util.*"%>  
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>  
  
<html>  
<head>  
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">  
<title>View Personen</title>  
</head>  
<body>  
  
<h1>Personen List</h1>  
  
<%  
List<PersonenBean> list=PersonenDAO.getAllRecords();  
request.setAttribute("list",list);  
%>  
  
<table border="1" width="90%">  
<tr>
	<th>SVId</th>
	<th>Vorname</th>
	<th>Nachname</th>
	<th>PLZ</th>
	<th>Ort</th>
	<th>Strasse</th>
	<th>HNr</th>
	<th>Telefonnummer_a</th>
	<th>Telefonnummer_b</th>
	<th>Password</th>
	<th>Edit</th>
	<th>Delete</th>
</tr>  
<c:forEach items="${list}" var="u">  
	<tr>
		<td>${u.getSVId()}</td>
		<td>${u.getVorname()}</td>
		<td>${u.getNachname()}</td>  
		<td>${u.getPLZ()}</td>  
		<td>${u.getOrt()}</td>  
		<td>${u.getStrasse()}</td>  
		<td>${u.getHNr()}</td>  
		<td>${u.getTelefonnummer_a()}</td>  
		<td>${u.getTelefonnummer_b()}</td>
		<td>${u.getPasswort()}</td>  
		<td><a href="editform.jsp?SVId=${u.getSVId()}">Edit</a></td>  
		<td><a href="deleteperson.jsp?SVId=${u.getSVId()}">Delete</a></td>
	</tr>  
</c:forEach>  
</table>  

<br/><a href="addpersonform.jsp">Add New User</a>  
  
</body>  
</html>  