<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="../LoginServlet" method="POST">
		Please enter your username 		
		<input type="text" name="un"/><br>		
		
		Please enter your password
		<input type="text" name="pw"/>
			
		<input type="submit" value="submit">			
	</form>
</body>
</html>