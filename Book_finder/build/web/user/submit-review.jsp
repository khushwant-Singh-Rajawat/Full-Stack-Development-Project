<%@page import="java.sql.*"%>
<%@page import="kushwant.model.DataFunction"%>
<%
    String review = request.getParameter("review");
    int rating = Integer.parseInt(request.getParameter("rating"));
    
    DataFunction cn = new DataFunction();
    Connection connection = cn.createConnection();

    String s1 = "INSERT INTO reviews ( review, rating) VALUES (?, ?)";
    PreparedStatement preparedStatement = connection.prepareStatement(s1);
    preparedStatement.setString(1, review);
    preparedStatement.setInt(2, rating);
 

    int rowsAffected = preparedStatement.executeUpdate();
    if (rowsAffected == 1) 
    {
        out.println("<p>Review submitted successfully!</p>");
    } 
    else
    {
        out.println("<p>Error submitting review. Please try again.</p>");
    }
    
%>
<h3>Thankyou for shopping</h3>
<p><a href="Showbooks.jsp">Continue Shopping</a></p>