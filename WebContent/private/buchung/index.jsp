<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="db_projekt.KontaktpersonDAO, db_projekt.KontaktpersonBean,java.util.*, db_projekt.BuchungsBean, db_projekt.BuchungsDAO"%>  
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1><marquee behavior="alternate" scrollamount=100>Buchungen</marquee></h1>
<%  
List<BuchungsBean> bu=BuchungsDAO.getAllRecords();  
request.setAttribute("buchungen",bu);  
%>  

<table border="1" width="90%">  
<tr>
	<th>Kontaktperson</th>
	<th>Schneisennummer</th>
	<th>Buchungsnummer</th>
	<th>Buchungsdatum</th>
	<th>Beginnzeit</th>
	<th>Endzeit</th>
</tr>  
<c:forEach items="${buchungen}" var="u">  
	<tr>
		<td>${u.getSVId()}</td>
		<td>${u.getSchneisennummer()}</td>
		<td>${u.getBuchungsnummer()}</td>  
		<td>${u.getBuchungsdatum()}</td>  
		<td>${u.getBeginnzeit()}</td>  
		<td>${u.getEndzeit()}</td>  
	</tr>  
</c:forEach>  
</table> 

<hr />

<h1><marquee scrollamount=200>Select Kontaktperson</marquee></h1>

<%  
List<KontaktpersonBean> list=KontaktpersonDAO.getAllRecords();  
request.setAttribute("list",list);  
%>  

<table border="1" width="90%">  
<tr>
	<th>SVId</th>
	<th>Kundennummer</th>
	<th>Name</th>
</tr>  
<c:forEach items="${list}" var="u">  
	<tr>
		<td>${u.getSVId()}</td>
		<td>${u.getKundennummer()}</td>
		<td>${u.getName()}</td>  
	</tr>  
</c:forEach>  
</table> 

<form method="POST" action="../../SelectKontakt">
<select name="SVId">
<c:forEach items="${list}" var ="u">
<option>${u.getSVId()}</option>
</c:forEach>
</select>
<input type="submit" />
</form>
</body>
</html>