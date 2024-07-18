<%@page import="kushwant.model.DataFunction"%>
<%@page import="java.sql.*" %>
<%
    String email,password;
    email=request.getParameter("T1");
    password=request.getParameter("T2");
    if(email==null || password==null)
    {
        response.sendRedirect("LoginForm.jsp");
    }
    else
    {
        DataFunction obj=new DataFunction();
        Connection cn=obj.createConnection();
        
        String sql="select * from logindata where email=? and pass=?";
        PreparedStatement p1=cn.prepareStatement(sql);
        p1.setString(1, email);
        p1.setString(2, password);
        
        ResultSet r1=p1.executeQuery();
        if(r1.next())
        {
            //fetch usertype of logged-in user
            String ut=r1.getString("usertype");
            //create session for user
            session=request.getSession(true);//create new if does not exist
            //add some data to session for identification of user
            session.setAttribute("email", email);
            session.setAttribute("usertype", ut);

             //send to authorized page
            if(ut.equalsIgnoreCase("Admin"))
            {
                response.sendRedirect("Admin/AdminHome.jsp");
            }
            else if(ut.equalsIgnoreCase("user"))
            {
                response.sendRedirect("user/userhome.jsp");
            }
        }
        else
        {
            response.sendRedirect("LoginError.jsp");
        }
    }
    %>