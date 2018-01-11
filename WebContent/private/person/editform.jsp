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
String id=request.getParameter("SVId");  
PersonenBean u=PersonenDAO.getRecordById(Integer.parseInt(id));  
%>  

<h1>Edit Form</h1>  
<form action="editperson.jsp" method="post">  
<table>  
	<tr>
		<td>SVId:</td>
		<td><input type="text" name="SVId" value="<%= u.getSVId()%>"/></td>
	</tr>  
	<tr>
		<td>Vorname:</td>
		<td><input type="text" name="vorname" value="<%= u.getVorname()%>"/></td>
	</tr>
	<tr>
		<td>Nachname:</td>
		<td><input type="text" name="nachname" value="<%= u.getNachname()%>"/></td>
	</tr>
	<tr>
		<td>PLZ:</td>
		<td><input type="text" name="PLZ" value="<%= u.getPLZ()%>"/></td>
	</tr>
	<tr>
		<td>Ort:</td>
		<td><input type="text" name="ort" value="<%= u.getOrt()%>"/></td>
	</tr>
	<tr>
		<td>Strasse:</td>
		<td><input type="text" name="strasse" value="<%= u.getStrasse()%>"/></td>
	</tr>
	<tr>
		<td>HNr:</td>
		<td><input type="text" name="hNr" value="<%= u.getHNr()%>"/></td>
	</tr>
	<tr>
		<td>Telefonnummer a:</td>
		<td><input type="text" name="telefonnummer_a" value="<%= u.getTelefonnummer_a()%>"/></td>
	</tr>
	<tr>
		<td>Telefonnummer b:</td>
		<td><input type="text" name="telefonnummer_b" value="<%= u.getTelefonnummer_b()%>"/></td>
	</tr>
	<tr>
		<td>Password:</td>
		<td><input type="text" name="passwort" value="<%= u.getPasswort()%>"/></td>
	</tr>
	<tr>
		<td colspan="2"><input type="submit" value="Edit Person"/></td>
	</tr>  
</table>  
</form>  

</body>
</html>