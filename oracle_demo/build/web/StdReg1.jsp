<%@page import="java.sql.*" %>
<%@page import="kushwant.model.Myfees" %>
<!doctype html>
<html class="no-js" lang="zxx">
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title> VGT</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">

</head>
<body>
    

<main >
     
<%
   String name,id, address, contact,branch, email;
    id = request.getParameter("T1");
    name=request.getParameter("T2");
    branch = request.getParameter("T3");
    contact = request.getParameter("T4");
    address=request.getParameter("T5");
    email = request.getParameter("T6");
 
    String msg = "";

    //connect JSP with mysql server
    //load mysql driver
     Myfees obj= new Myfees();
    Connection cn=obj.createConnection();

    //create sql commands
    String s1 = "insert into DB_STUDENT values(?,?,?,?,?,?)";
    
    //create statement
    PreparedStatement p1=cn.prepareStatement(s1);
    
    //set data in place of ?
    p1.setString(1, id);
    p1.setString(2, name);
    p1.setString(3, branch);
    p1.setString(4, contact);
    p1.setString(5, address);
    p1.setString(6, email);
    
    //send data to table
    int a=p1.executeUpdate();
    
    //create response
    if(a==1)
    {
        msg="Data save and login created";
    }
    
    else
    {
        msg="ERROR: Not data saved and no login created";
    }
%>
<%= msg %>
<a href="StdReg.jsp">Go To Registration page</a>

    
</main>

</body>
</html>