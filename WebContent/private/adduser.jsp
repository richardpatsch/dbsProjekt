<%@page import="db_projekt.UserDAO"%>  
<jsp:useBean id="u" class="db_projekt.UserBean"></jsp:useBean>  
<jsp:setProperty property="*" name="u"/>  
  
<%  
int i=UserDAO.save(u);  
if(i>0){  
response.sendRedirect("adduser-success.jsp");  
}else{  
response.sendRedirect("adduser-error.jsp");  
}  
%>  