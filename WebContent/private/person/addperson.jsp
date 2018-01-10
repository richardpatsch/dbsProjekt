<%@page import="db_projekt.PersonenDAO"%>  
<jsp:useBean id="u" class="db_projekt.PersonenBean"></jsp:useBean>  
<jsp:setProperty property="*" name="u"/>  
  
<%  
System.out.println("###");
System.out.println(u);
System.out.println("###");

int i=PersonenDAO.save(u);  
if (i>0) {  
	response.sendRedirect("addperson-success.jsp");  
} else {  
	response.sendRedirect("addperson-error.jsp");  
}  
%>  