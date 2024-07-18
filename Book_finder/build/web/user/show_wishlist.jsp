<%@page import="java.sql.*" %>
<%@page import="kushwant.model.DataFunction" %>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><!-- InstanceBegin template="/Templates/master.dwt.jsp" codeOutsideHTMLIsLocked="false" -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>


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
        
        	<h1>My Wishlist</h1>
            <img class="strip_img" src="../images/blue_strip.jpg" width="600" height="4" />
            <%
    DataFunction obj=new DataFunction();
    String sql="select * from mywishlist where order_status=0 and  email='"+username+"'";
    
    ResultSet r1=obj.fetchData(sql);
    
    int f=0;
    while(r1.next())
    {
        f=1;
        String name,bookid,author,sub,email,pub,isbn,price,des,qty,bdate,ostatus,wishid;
        name=r1.getString(2);
        author=r1.getString(3);
        des=r1.getString(5);
        sub=r1.getString(4);
        pub=r1.getString(8);
        qty=r1.getString(9);
        bdate=r1.getString(11);
        ostatus=r1.getString(12);
        isbn=r1.getString(6);
        price=r1.getString(7);
        wishid =r1.getString(10);
        bookid=r1.getString(1);
        email=r1.getString(13);
        String cartid="1";
		%>
    
    <div style="width:700px; height:auto; float:left">
    <div style="width:500px; height:auto; float:left">
        <h3>Wish Id : <%= wishid %> 
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        Book ID : <%= bookid %>
</h3>
        <p>Book Name : <%= name %> </p>
        <p>Subject : <%= sub %></p>
        <p>Description: <%= des %></p>
        <p>Author : <%= author %></p>
        <p>Publisher : <%= pub %></p>
        <p>ISBN : <%= isbn %></p>
        <p>Price : <%= price %></p>
        <p>Quantity: <%= qty %></p>
        <h4>Booking Date: <%= bdate %></h4>
        
        
        
        <p><a href="OrderBook.jsp?bookid=<%= bookid %>&amp;cartid=<%= cartid %>&amp;price=<%= price %>">Make Order</a>
      
            &nbsp;&nbsp;&nbsp;&nbsp;<a class="link_style1" href="RemoveBook.jsp?bookid=<%= bookid %>">Remove</a></p>
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
        
        <%
    }
    if(f==0)
    {
        %>
        <h2>No Books in wishlist Continue Shopping</h2>
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
