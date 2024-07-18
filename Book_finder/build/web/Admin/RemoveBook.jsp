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
        
        	
<h1>Delete Book Details</h1>
            <%
    DataFunction obj=new DataFunction();
    String bookid=request.getParameter("bookid");
    String sql="select * from books where bookid="+bookid;
    ResultSet r1=obj.fetchData(sql);
    if(r1.next())
    {
        String name,author,subject,publisher,isbn,price,book_des,qty;
        name=r1.getString(2);
        author=r1.getString(3);
        subject=r1.getString(4);
        publisher=r1.getString(5);
        isbn=r1.getString(6);
        price=r1.getString(7);
        book_des=r1.getString(8);
        qty=r1.getString(9);
        //String bookid=r1.getString(1);
		%>
<h3>Book ID : <%= bookid %></h3>
<form id="form1" name="form1" method="post" action="RemoveBook1.jsp?bookid=<%= bookid %>">
		  <p>Name
		    <label for="T1"></label>
		    <input value="<%= name %>" type="text" name="T1" id="T1" />
		  </p>
		  <p>Author
		    <label for="T2"></label>
            <input  value="<%= author %>" type="text" name="T2" id="T2" />
		  </p>
		  <p>Publisher
		    <label for="T3"></label>
            <input value="<%= publisher %>" type="text" name="T3" id="T3" />
		  </p>
		  <p>Subject
		    <label for="T4"></label>
            <input  value="<%= subject %>" type="text" name="T4" id="T4" />
		  </p>
		  <p>ISBN
		    <label for="T5"></label>
            <input value="<%= isbn %>" type="text" name="T5" id="T5" />
		  </p>
		  <p>Price
		    <label for="T6"></label>
            <input  value="<%= price %>" type="text" name="T6" id="T6" />
		  </p>
		  <p>Description
		    <label for="T7"></label>
            <textarea   name="T7" cols="60" rows="5" id="T7"> <%= book_des %></textarea>
		  </p>
		  <p>Quantity
		    <label for="T8"></label>
            <input  value="<%= qty %>" type="text" name="T8" id="T8" />
		  </p>
		  <p>
		    <input type="submit" name="B1" id="B1" value="Confirm" />
		  </p>
</form>
		<p>&nbsp;</p>
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

