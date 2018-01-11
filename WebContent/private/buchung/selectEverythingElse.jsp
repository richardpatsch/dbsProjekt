<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="db_projekt.KontaktpersonBean, db_projekt.AnflugschneisenBean, db_projekt.AnflugschneisenDAO, java.util.*"
    %>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
    <% 
    				KontaktpersonBean currentKP = ((KontaktpersonBean) session.getAttribute("currentKbSelection")); 
				AnflugschneisenBean currentA = ((AnflugschneisenBean) session.getAttribute("currentSchneise")); 
    	%>

<%= "Kontaktperson: " + currentKP.getSVId() + " " + currentKP.getKundennummer() + " " + currentKP.getName() %>
<br/>
<%= "Anflugschneise: " + currentA.getSchneisennummer() %>

<form method="POST" action="../../Final">
Buchungsnummer: <input type="text" name="buchungsnummer"/><br />
Buchungsdatum: <input type="text" name="buchungsdatum"/><br />
Beginnzeit: <input type="text" name="beginnzeit"/><br />
Endzeit: <input type="text" name="endzeit"/><br />
<input type="submit">
</form>

</body>
</html>