<%@page import="java.sql.*"%>
<%@page import="kushwant.model.DataFunction"%>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><!-- InstanceBegin template="/Templates/master.dwt.jsp" codeOutsideHTMLIsLocked="false" -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>


<link rel="stylesheet" type="text/css" href="style/guestmaster.css"/>
<link rel="stylesheet" type="text/css" href="style/style.css"/>
</head>

<body>



<div id="main">
<div id="wrapper">
	<div id="banner">
    	<img class="strip_img" src="images/922671.jpg" width="1000" height="200" />
    </div>
    <div id="menu">
    
    	<!-- Start css3menu.com BODY section -->
        
<ul id="css3menu1" class="topmenu">
	<li class="topmenu"><a href="index.jsp" style="height:32px;line-height:32px;"><img src="styles/home.png" alt=""/>Home</a></li>
	<li class="topmenu"><a href="About.jsp" style="height:32px;line-height:32px;">About</a></li>
	
	<li class="topmenu"><a href="Contact.jsp" style="height:32px;line-height:32px;">Contact</a></li>
	
    <li class="topmenu"><a href="UserReg.jsp" style="height:32px;line-height:32px;">Sign Up</a></li>
    
    <li class="topmenu"><a href="LoginForm.jsp" style="height:32px;line-height:32px;">Sign In</a></li>
    
    
    
    
    
</ul>
<!-- End css3menu.com BODY section -->
    
    </div><!-- end of menu div -->
    <div id="middle">
    	<div id="content">
        <!-- InstanceBeginEditable name="kota" -->
        
        	

<h1>Registration Status</h1>
<%
    String name,add,city,mob,state,pin,email,pass;
    name=request.getParameter("T1");
    add=request.getParameter("T2");
    city=request.getParameter("T3");
    mob=request.getParameter("T6");
    state=request.getParameter("T4");
    pin=request.getParameter("T5");
    email=request.getParameter("T7");
    pass=request.getParameter("T8");
    String usertype="user";
    DataFunction obj=new DataFunction();
    Connection cn=obj.createConnection();  
    
    String s1="insert into userdata values(?,?,?,?,?,?,?)";
    String s2="insert into logindata values(?,?,?)" ;
    
    PreparedStatement p1=cn.prepareStatement(s1);
    PreparedStatement p2=cn.prepareStatement(s2);
    p1.setString(1, name);
    p1.setString(2, add);
    p1.setString(3, city);
    p1.setString(4, state);
    p1.setString(5,pin);
    p1.setString(6, mob);
    p1.setString(7, email);
    
    p2.setString(1, email);
    p2.setString(2, pass);
    p2.setString(3, usertype);
    
    p1.executeUpdate();
    p2.executeUpdate();
    cn.close();
    p1.close();
    p2.close();
%>
            <p>Registration Completed Successfully</p>
            <p>&nbsp;</p>
            <p><a href="LoginForm.jsp">Go To Login</a></p>
            
            <!-- InstanceEndEditable -->        
        </div><!-- end of content -->
        <div id="ad">
        	<img src="images/ad2.jpg" width="190" height="200"  />
                
        </div> <!-- end of ad div -->
    </div> <!-- End of middle -->
    <div id="bottom">
        
    </div>
</div>
</div>


</body>
<!-- InstanceEnd --></html>
