<%@page import="kushwant.model.DataFunction"%>
<%@page import="java.sql.*" %>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><!-- InstanceBegin template="/Templates/master.dwt.jsp" codeOutsideHTMLIsLocked="false" -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>


<link rel="stylesheet" type="text/css" href="../style/guestmaster.css"/>
<link rel="stylesheet" type="text/css" href="../style/style.css"/>

<%
session=request.getSession(false);
if(session==null)
{
	response.sendRedirect("../AuthError.jsp");
}
String username,usertype;
username=session.getAttribute("email").toString();
usertype=session.getAttribute("usertype").toString();
if(usertype==null || usertype.equals("user")==false)
{
	response.sendRedirect("../AuthError.jsp");
}
%>

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
        <h1>Add to Wishlist Status</h1>
<%
String bookid=request.getParameter("bookid");
DataFunction obj=new DataFunction();
Connection cn=obj.createConnection();

String sql="insert into wishlist values(?,?,?,?,?)";
PreparedStatement p1=cn.prepareStatement(sql);
int cartid=obj.generateId("wishlist",1);
int bid=Integer.parseInt(bookid); 
java.sql.Date dt=new java.sql.Date(new java.util.Date().getTime());

p1.setInt(1, cartid);
p1.setInt(2, bid);
p1.setDate(3, dt);
p1.setInt(4, 0);
p1.setString(5, username);
p1.executeUpdate();

 sql="select * from books where bookid="+bookid;
    ResultSet r1=obj.fetchData(sql);
    if(r1.next())
    {
        String name,author,subject,publisher,isbn,price,book_desc,qty;
        name=r1.getString(2);
        author=r1.getString(3);
        subject=r1.getString(4);
        publisher=r1.getString(5);
        isbn=r1.getString(6);
        price=r1.getString(7);
        book_desc=r1.getString(8);
        qty=r1.getString(9);
        //String bookid=r1.getString(1);
		%>
    
    <div style="width:700px; height:auto; float:left">
    <div style="width:500px; height:auto; float:left">
        <h3>Book Name : <%= name %> 
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        Book ID : <%= bookid %>
</h3>
<p>Subject : <%= subject %></p>
        <p>Author : <%= author %></p>
        <p>Publisher : <%= publisher %></p>
        <p>ISBN : <%= isbn %></p>
        <p>Price : <%= price %></p>
        <p>Description : <%= book_desc %></p>
        <p>Quantity : <%= qty %></p>
        
        
        
        <h1>Book Added to Cart Successfully</h1>
        <p><a href="show_wishlist.jsp">show cart</a></p>
      </div>
        
        <div style="width:200px; height:auto; float:right">
        <%
		String photo=obj.getPhoto(Integer.parseInt(bookid));
                %>
                    <img src="../Admin/photos/<%= photo %>" width="150" height="150" />
                <%
                
		%>
        </div>
        
        </div>
        <hr />
        <%
    }
    %>

</body>
<!-- InstanceEnd --></html>
