<%@page import="kushwant.model.DataFunction"%>
<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><!-- InstanceBegin template="/Templates/master.dwt.jsp" codeOutsideHTMLIsLocked="false" -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!-- InstanceBeginEditable name="doctitle" -->
<title>Untitled Document</title>


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
    <li class="topmenu"><a href="AdminHome.jsp" style="height:32px;line-height:32px;"><img src="../styles/home.png" alt=""/>Home</a></li>
	
	
    <li class="topmenu"><a href="BookUpload.jsp" style="height:32px;line-height:32px;">Add Book</a></li>
    <li class="topmenu"><a href="ManageBooks.jsp" style="height:32px;line-height:32px;">Manage Books</a></li>
    <li class="topmenu"><a href="ConfirmDelivery.jsp" style="height:32px;line-height:32px;">Confirm Orders</a></li>
    
    
    <li class="topmenu"><a href="ChangePassword1.jsp" style="height:32px;line-height:32px;">Change Password</a></li>
    
    <li class="topmenu"><a href="../Logout.jsp" style="height:32px;line-height:32px;">Logout</a></li>
</ul>
<!-- End css3menu.com BODY section -->
    
    </div><!-- end of menu div -->
    <div id="middle">
    	<div id="content">
        <!-- InstanceBeginEditable name="kota" -->
        
        	
<%
    DataFunction obj=new DataFunction();
    Connection cn=obj.createConnection();
    String orderid=request.getParameter("q");

    String sql="select * from book_orders where orderid="+orderid;
    PreparedStatement p1=cn.prepareStatement(sql);
    ResultSet r1=p1.executeQuery();
    while(r1.next())
    {
        String del_date,del_status,order_date,bookid;
        orderid=r1.getString(1);
        order_date=r1.getString(5);
        del_date=r1.getString(6);
        del_status=r1.getString(7);
        int ds=Integer.parseInt(del_status);
        bookid=r1.getString(2);

        String sql2="select * from books where bookid="+bookid;
        //out.println(sql2);
        PreparedStatement p2=cn.prepareStatement(sql2);
        ResultSet r2=p2.executeQuery();
		
        String name="",author="",subject="",publisher="",isbn="",price="",book_desc="";
        if(r2.next())
	{
            name=r2.getString(2);
            author=r2.getString(3);
            subject=r2.getString(4);
            publisher=r2.getString(5);
            isbn=r2.getString(6);
            price=r2.getString(7);
            book_desc=r2.getString(8);
        
	}
        String photo=obj.getPhoto(Integer.parseInt(bookid));
        
        
		%>
    
      <h3>Book Name : <%= name %> 
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        Book ID : <%= bookid %>
        </h3>
    <p>Subject : <%= subject %><br />
        Author : <%= author %><br />
        Publisher : <%= publisher %><br />
        ISBN : <%= isbn %><br />
        Price : <%= price %><br />
        Description : <%= book_desc %>
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
        <img src="photos/<%= photo %>" width="150" height="150" />
       
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
