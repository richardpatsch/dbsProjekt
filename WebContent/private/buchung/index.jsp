<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="db_projekt.KontaktpersonDAO, db_projekt.KontaktpersonBean,java.util.*"%>  
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body><h1>Select Kontaktperson</h1>
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

<form method="POST" action="${contextPath}/SelectKontakt">
<select name="SVId">
<c:forEach items="${list}" var ="u">
<option>${u.getSVId()}</option>
</c:forEach>
</select>
<input type="submit" />
</form>
</body>
</html>