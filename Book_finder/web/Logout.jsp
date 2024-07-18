<%@page import="java.sql.*" %>
<%
    session=request.getSession(false); //Open only existing session for current user
	if(session==null)
	{
		response.sendRedirect("LoginForm.jsp");
	}
	session.removeAttribute("role");
	session.removeAttribute("email");
	session.invalidate(); //remove session
	response.sendRedirect("LoginForm.jsp");
%>