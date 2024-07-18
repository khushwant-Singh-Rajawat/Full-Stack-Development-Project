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
            session=request.getSession(false);
            if(session==null)
            {
                    response.sendRedirect("../AuthError.jsp");
            }
            String username,usertype;
            username=session.getAttribute("email").toString();
            usertype=session.getAttribute("usertype").toString();
            if(usertype==null || usertype.equals("admin")==false)
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
        
        	
        <h1>Add New Book Status</h1>
    <%
    DataFunction obj=new DataFunction();
    Connection cn=obj.createConnection();
    String sql="insert into books values(0,?,?,?,?,?,?,?,?,?)";
    String name,author,subject,publisher,isbn,price,book_desc,qty;
    name=request.getParameter("T1");
    author=request.getParameter("T2");
    subject=request.getParameter("T3");
    publisher=request.getParameter("T4");
    isbn=request.getParameter("T5");
    price=request.getParameter("T6");
    book_desc=request.getParameter("T7");
    qty=request.getParameter("T8");
    
    PreparedStatement p1=cn.prepareStatement(sql);
    
    p1.setString(1, name);
    p1.setString(2, author);
    p1.setString(3, subject);
    p1.setString(4, publisher);
    p1.setString(5, isbn);
    p1.setInt(6, Integer.parseInt(price));
    p1.setString(7, book_desc);
    p1.setInt(8, Integer.parseInt(qty));
    p1.setString(9, "nophoto");
    p1.executeUpdate();
    %>
    <h3>Book added to database and ID is <%= name %></h3>
    <p><a href="BookUpload.jsp">Add More</a></p>
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

