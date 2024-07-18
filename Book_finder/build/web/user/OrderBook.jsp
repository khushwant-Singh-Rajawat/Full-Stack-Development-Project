<%@page import="kushwant.model.DataFunction" %>
<%@page import="java.sql.*" %>
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
        
        	<h1>Order complete</h1>
                <img class="strip_img" src="../images/blue_strip.jpg" width="600" height="4" />
            
<%
String cartid,bookid,price;
cartid=request.getParameter("cartid");
bookid=request.getParameter("bookid");
price=request.getParameter("price");
DataFunction obj=new DataFunction();
Connection cn=obj.createConnection();
String sql="insert into book_cart(orderid,bookid,cartid,amount,order_date,email,del_status) values(?,?,?,?,?,?,?)";
PreparedStatement p1=cn.prepareStatement(sql);
int orderid=obj.generateId("book_cart", 1);
java.sql.Date dt=new java.sql.Date(new java.util.Date().getTime());
p1.setInt(1, orderid);
p1.setInt(2, Integer.parseInt(bookid));
p1.setInt(3, Integer.parseInt(cartid));
p1.setInt(4, Integer.parseInt(price));
p1.setDate(5,dt);
p1.setString(6, username);
p1.setInt(7,0);
p1.executeUpdate();
cn.close();
p1.close();
obj.updateOrderInCart(cartid);
%>
<h2>Order Completed and Book will be sent to following address in 4-5 days.</h2>

<%
sql="select * from userdata where email='"+username+"'";
ResultSet r1=obj.fetchData(sql);
if(r1.next())
{
    String name,address,city,state,pin,mobile;
    name=r1.getString(1);
    address=r1.getString(2);
    city=r1.getString(3);
    state=r1.getString(4);
    pin=r1.getString(5);
    mobile=r1.getString(6);
    %>
    <h3>Name : <%= name %></h3>
    <p>Address : <%= address %></p>
    <p>City : <%= city %></p>
    <p>State : <%= state %></p>
    <p>PIN : <%= pin %></p>
    <p>Mobile Number : <%= mobile %></p>
<%
}
%>
<h2>Cash on Delivery : INR <%= price %></h2>
<h3>Thankyou for shopping</h3>
<p><a href="Showbooks.jsp">Continue Shopping</a></p>    

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

