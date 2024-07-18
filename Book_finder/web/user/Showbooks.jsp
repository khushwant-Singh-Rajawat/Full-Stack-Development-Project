<%@page import="kushwant.model.DataFunction"%>
<%@page import="java.sql.*"%>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><!-- InstanceBegin template="/Templates/master.dwt.jsp" codeOutsideHTMLIsLocked="false" -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>

  <%
    //check session
    String e1="";
    String ut="";
    session=request.getSession(false); //use only existing session
    if(session==null)
    {
        response.sendRedirect("../AuthorisedError.jsp");
    }
    else
    {
        try
        {
            e1=session.getAttribute("email").toString();
            ut=session.getAttribute("usertype").toString();
            if(ut.equalsIgnoreCase("user")==false)
            {
                response.sendRedirect("../AuthorisedError.jsp");
            }
        }
        catch(NullPointerException e)
        {
            response.sendRedirect("../AuthorisedError.jsp");
        }
    }
%> 

<link rel="stylesheet" type="text/css" href="../style/guestmaster.css"/>
<link rel="stylesheet" type="text/css" href="../style/style.css"/>
</head>

<body>



<div id="main">
<div id="wrapper">
	<div id="banner">
    	<img class="strip_img" src="../images/922671.jpg" width="1000" height="200" />
    </div>
    <div id="menu">
    
    	<!-- Start css3menu.com BODY section -->
        
<ul id="css3menu1" class="topmenu">
    <li class="topmenu"><a href="userhome.jsp" style="height:32px;line-height:32px;"><img src="../styles/home.png" alt=""/>Home</a></li>
    <li class="topmenu"><a href="ShowCart.jsp" style="height:32px;line-height:32px;">My Cart</a></li>
    <li class="topmenu"><a href="show_wishlist.jsp" style="height:32px;line-height:32px;">Wishlist</a></li>
    <li class="topmenu"><a href="Showbooks.jsp" style="height:32px;line-height:32px;"><span>Books</span></a></li>
    <li class="topmenu"><a href="MyAccount.jsp" style="height:32px;line-height:32px;">My Account</a></li>
    <li class="topmenu"><a href="ChangePassword.jsp" style="height:32px;line-height:32px;">Change Password</a></li>
    <li class="topmenu"><a href="../Logout.jsp" style="height:32px;line-height:32px;">Logout</a></li>
    
</ul>
<!-- End css3menu.com BODY section -->
    
    </div><!-- end of menu div -->
    <div id="middle">
    	<div id="content">
        <!-- InstanceBeginEditable name="kota" -->
        
        	
<h1>All Books</h1>
<% 
DataFunction obj=new DataFunction();
Connection cn=obj.createConnection();
String s1="Select * from books";
PreparedStatement p1=cn.prepareStatement(s1);
ResultSet r1=p1.executeQuery();
while(r1.next())
{
    String bookid,name,author,sub,publ,isbn,price,book_desc,qty;
    bookid=r1.getString("bookid");
    name=r1.getString("book_name");
    author=r1.getString("author");
    sub=r1.getString("book_subject");
    publ=r1.getString("publisher");
    isbn=r1.getString("isbn");
    price=r1.getString("price");
    book_desc=r1.getString("book_des");
    qty=r1.getString("qty");
    %>
    <div style="width:700px; height:auto; float:left">
    <div style="width:500px; height:auto; float:left">
    <h3><%=name %></h3>
        &nbsp;&nbsp;[<%= bookid %>]
<p>
    Subject: <%= sub %><br>
        Author: <%= author %><br>
            Publisher: <%= publ %><br>
                ISBN:   <%= isbn %><br>
                    Price:  <%= price %><br>
                        Description:    <%= book_desc %><br>
                            Avaliable Quantity: <%= qty %><br>
<p> <a href="AddToCart.jsp?bookid=<%=bookid%>">Order Now</a>
    &nbsp;&nbsp;&nbsp;<a href="wishlist.jsp?bookid=<%=bookid%>">wishlist</a></p>
    </div>
<div style="width:200px; height:auto; float:right">
<%
String photo=obj.getPhoto(Integer.parseInt(bookid));
%>

<img src="../Admin/photos/<%= photo %>" width="150" height="150"/>
</div>
    </div>
<%
}
%>
<!-- InstanceEndEditable -->        
        </div><!-- end of content -->
        <div id="ad">
        	<img src="../images/ad2.jpg" width="190" height="200"  />
                
        </div> <!-- end of ad div -->
    </div> <!-- End of middle -->
    <div id="bottom">
        
    </div>
</div>
</div>


</body>
<!-- InstanceEnd --></html>
