package org.apache.jsp.Admin;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import kushwant.model.DataFunction;
import java.sql.*;

public final class remove_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<h3>Delete Shop</h3>\n");
      out.write("\n");

   
         DataFunction obj=new DataFunction();
    Connection cn=obj.createConnection();
        
        String s1="select * from books where email=?";
        PreparedStatement p1=cn.prepareStatement(s1);
        ResultSet r1=p1.executeQuery();
        
        if(r1.next())
        {
            
        String name,author,subject,publisher,isbn,price,book_desc,qty;
        name=r1.getString(2);
        author=r1.getString(3);
        subject=r1.getString(4);
        publisher=r1.getString(5);
        isbn=r1.getString(6);
        price=r1.getString(7);
        book_desc=r1.getString(8);
        qty=r1.getString(9);
        String bookid=r1.getString(1);
            
          
                   
      out.write("\n");
      out.write("                   \n");
      out.write("                   <form  method=\"post\" action=\"ShopDelete1.jsp\">\n");
      out.write("            \n");
      out.write("                <p>Shop Name: <input value=\"");
      out.print( name );
      out.write("\" type=\"text\" name=\"T1\" id=\"txt1\"/>\n");
      out.write("                    <span id=\"sp1\"></span>\n");
      out.write("                </p>\n");
      out.write("                <p>Owner Name: <input value=\"");
      out.print( author );
      out.write("\" type=\"text\" name=\"T2\" id=\"txt2\"/>\n");
      out.write("                    <span id=\"sp2\"></span>\n");
      out.write("                </p>\n");
      out.write("                <p>License Number: <input type=\"text\" value=\"");
      out.print( subject );
      out.write("\" name=\"T3\" id=\"txt3\"/>\n");
      out.write("                    <span id=\"sp3\"></span>\n");
      out.write("                </p>\n");
      out.write("                <p>Contact: <input type=\"text\" value=\"");
      out.print( publisher );
      out.write("\" name=\"T4\" id=\"txt4\"/>\n");
      out.write("                    <span id=\"sp4\"></span>\n");
      out.write("                </p>\n");
      out.write("                <p>Address: <input type=\"text\" value=\"");
      out.print( isbn );
      out.write("\" name=\"T5\" id=\"txt5\"/>\n");
      out.write("                    <span id=\"sp5\"></span>\n");
      out.write("                </p>\n");
      out.write("                <p>Email<input readonly value=\"");
      out.print( price );
      out.write("\" type=\"text\" name=\"T6\" id=\"txt6\"/>\n");
      out.write("                    <span id=\"sp6\"></span>\n");
      out.write("                </p>\n");
      out.write("\n");
      out.write("                    <br>\n");
      out.write("            <p>\n");
      out.write("            <input type=\"submit\" name=\"B1\" id=\"btn1\" value=\"Delete\"/>\n");
      out.write("            </p>\n");
      out.write("   </form>\n");
      out.write("    ");

        }
       else
       {
               
      out.write("\n");
      out.write("                   <h3>No Data Found</h3>\n");
      out.write("               ");

       }
     
    
      out.write("\n");
      out.write("    <h2>\n");
      out.write("        <a href=\"AdminHome.jsp\">Back</a>\n");
      out.write("    </h2>\n");
      out.write("   ");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
