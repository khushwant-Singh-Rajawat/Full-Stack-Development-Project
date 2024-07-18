<%@page import="java.io.File"%>
<%@page import="kushwant.model.DataFunction"%>
<%@page import="java.sql.*"%>

    <head> </head> <h1>Delete Book Status</h1> 
    <% 
        DataFunction obj=new DataFunction();
    Connection cn=obj.createConnection(); 
    String sql="delete from books where bookid=?";
    String msg=" ";

    int bookid=Integer.parseInt(request.getParameter("bookid")); 
    PreparedStatement p1=cn.prepareStatement(sql); 
    p1.setInt(1, bookid);

    int a=p1.executeUpdate(); 
    if(a==1) 
    {
        %>

    <h3>Data deleted successfully</h3> 
    <% String photoPath = request.getParameter("photoPath");
    if (photoPath != null && !photoPath.isEmpty())
    { File photoFile = new File(photoPath);
    if (photoFile.exists() && photoFile.isFile())
    {
        photoFile.delete(); 
    }
    }
    %> 
    <% 
    }
    else
    {
        %>
        <h3>Error: Unable to delete, try again</h3> 
        <p>
        <%

    }
    %>
        <h3><%= msg %></h3> 
        <h2><a href="AdminHome.jsp">Continue</a></h2>
