<%@page import="kushwant.model.DataFunction" %> 
<%@page import="java.sql.*" %>
<h1>All Books</h1>
<% 
    String nm=request.getParameter("q");
    if(nm==null) nm=" ";
DataFunction obj=new DataFunction();
Connection cn=obj.createConnection();
String s1="Select * from books where book_name like '%"+nm+"%' ";
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
    <h3><%=name %></h3>
        &nbsp;&nbsp;[<%= bookid %>]
<p>
    <b> Subject: </b><%= sub %></p>
<p>
    <b> Author:</b> <%= author %></p>
<p> <b>Publisher: </b><%= publ %></p>
<p><b> ISBN:   </b><%= isbn %></p>
<p> <b> Price: </b> <%= price %></p>
<p> <b>Description:</b>    <%= book_desc %></p>
<p><b> Avaliable Quantity: </b> <%= qty %></p>
<p><a href="AddToCart.jsp?bookid=<%=bookid%>">Order Now</a></p>
<%
String photo=obj.getPhoto(Integer.parseInt(bookid));
%>
<img src="#<%= photo %>" />
<%
}
%>