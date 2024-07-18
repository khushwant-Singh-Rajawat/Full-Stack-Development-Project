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
        
        	<h1>My Shop</h1>
<%
    DataFunction obj=new DataFunction();
    Connection cn=obj.createConnection();
    String s1="Select * from my_orders where email='"+username+"'";
    ResultSet r1=obj.fetchData(s1);
    int f=0;
    while(r1.next())
    {
        f=1;
        String name,author,subject,publisher,isbn,price,book_desc;
        name=r1.getString(2);
        author=r1.getString(3);
        subject=r1.getString(4);
        publisher=r1.getString(5);
        isbn=r1.getString(6);
        price=r1.getString(7);
        book_desc=r1.getString(8);
        String bookid=r1.getString(1);
        String photo=obj.getPhoto(Integer.parseInt(bookid));
        
        String orderid,del_date,del_status,order_date;
        orderid=r1.getString(9);
        order_date=r1.getString(10);
        del_date=r1.getString(11);
        del_status=r1.getString(12);
        int ds=Integer.parseInt(del_status);
        %>
        <h3>Book Name: <%= name %>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            Book Id:<%= bookid %>
        </h3>
            <p>Subject: <%=subject %><br>
                    Author: <%= author %>
                    
                Publisher: <%= publisher %>
                ISBN: <%= isbn %>
                Price: <%= price %>
                Description :<%= book_desc %>
            </p>
            
            <p>
                 Order Id : <%= orderid %><br />
            Order Date : <%= order_date %><br />
            Delivery Date : <% if(del_date==null) out.println("Not Delivered"); else out.println(del_date); %><br />
            Delivery Status : <%
                if(ds==0) out.println("Not Delivered");
                else if(ds==1) out.println("Delivered");
                else out.println("Canceled of Returned");
            %>
            </p>
            <%
	if(f==0)
	{
		%>
		<h2>No orders placed</h2>
		<%
	}
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

