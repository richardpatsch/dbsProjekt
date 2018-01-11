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
    				System.out.println("----");
            		System.out.println(currentKP);
    				System.out.println("----");
            	%>
			
            Welcome <%= currentKP.getSVId() + " " + currentKP.getKundennummer() + " " + currentKP.getName() %>
            
<%  
List<AnflugschneisenBean> liste=AnflugschneisenDAO.getAllRecords();  
System.out.println(liste.size());
request.setAttribute("liste",liste);  
%>  

<table border="1" width="90%">  
<tr>
	<th>schneisennummer</th>
</tr>  
<c:forEach items="${liste}" var="a">  
	<tr>
		<td>${a.getSchneisennummer()}1
	</tr>  
</c:forEach>  
</table> 

<form method="POST" action="../../SelectAnflugschneise">
<select name="schneisennummer">
<c:forEach items="${liste}" var ="a">
<option>${a.getSchneisennummer()}</option>
</c:forEach>
</select>
<input type="submit" />
</form>
</body>
</html>