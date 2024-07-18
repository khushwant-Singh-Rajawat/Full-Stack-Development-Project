/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mit.kush.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import oracle.jdbc.driver.*;

/**
 *
 * @author acer
 */
public class SaveStudentData extends HttpServlet {

   
    public void service(HttpServletRequest req,HttpServletResponse res)
    {
        res.setContentType("text/html;charset=UTF-8");
        try
        {
            PrintWriter pw=res.getWriter();

                String name,id, address, contact,branch, email;
                id = req.getParameter("T1");
                name=req.getParameter("T2");
                branch = req.getParameter("T3");
                contact = req.getParameter("T4");
                address=req.getParameter("T5");
                email = req.getParameter("T6");

                String msg = "";

                //connect JSP with mysql server
                //load mysql driver
            Class.forName("oracle.jdbc.driver.OracleDriver").newInstance();
            Connection cn=DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:XE","scott","tiger");
      
                //create sql commands
                String s1 = "insert into DB_STUDENT values(?,?,?,?,?,?)";

                //create statement
                PreparedStatement p1=cn.prepareStatement(s1);

                //set data in place of ?
                p1.setString(1, id);
                p1.setString(2, name);
                p1.setString(3, branch);
                p1.setString(4, contact);
                p1.setString(5, address);
                p1.setString(6, email);

                //send data to table
                int a=p1.executeUpdate();

                //create response
                if(a==1)
                {
                    msg="Data save and login created";
                }

                else
                {
                    msg="ERROR: Not data saved and no login created";
                }
                pw.println("<h1>"+msg+"</h1>");
        }
        catch(Exception e)
        {
            try
            {
                PrintWriter pw=res.getWriter();
                pw.println(""+e);
            }
            catch(Exception ee)
            {
                
            }
        }
    }
}