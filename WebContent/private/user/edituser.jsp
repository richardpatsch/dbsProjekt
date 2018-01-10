<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<%@page import="db_projekt.UserDAO"%>  
<jsp:useBean id="u" class="db_projekt.UserBean"></jsp:useBean>  
<jsp:setProperty property="*" name="u"/>  
<%  
	int i=UserDAO.update(u);  
	response.sendRedirect("viewusers.jsp"); 
%>  

</body>
</html>