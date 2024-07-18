package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class StdReg_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write("<!doctype html>\n");
      out.write("<html class=\"no-js\" lang=\"zxx\">\n");
      out.write("<head>\n");
      out.write("    <meta charset=\"utf-8\">\n");
      out.write("    <meta http-equiv=\"x-ua-compatible\" content=\"ie=edge\">\n");
      out.write("    <title> Hosting | Template</title>\n");
      out.write("    <meta name=\"description\" content=\"\">\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n");
      out.write("    <!-- CSS here -->\n");
      out.write("    \n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("    \n");
      out.write("\n");
      out.write("<main>\n");
      out.write("    <!-- Login Admin -->\n");
      out.write("    <form class=\"form-default\" action=\"StdReg1.jsp\" method=\"post\">\n");
      out.write("        \n");
      out.write("        <div>\n");
      out.write("            <!-- logo-login -->\n");
      out.write("            <h2>Student Registration</h2>\n");
      out.write("\n");
      out.write("            <div class=\"form-input\" >\n");
      out.write("                <label for=\"name\">Id Number</label>\n");
      out.write("                <input  type=\"text\" name=\"T1\" placeholder=\"Full name\">\n");
      out.write("            </div>\n");
      out.write("            <div class=\"form-input\" >\n");
      out.write("                <label for=\"name\">Full name</label>\n");
      out.write("                <input  type=\"text\" name=\"T2\" placeholder=\"Id number\">\n");
      out.write("            </div>\n");
      out.write("            <div class=\"form-input\" >\n");
      out.write("                <label for=\"name\">Branch</label>\n");
      out.write("                <input  type=\"text\" name=\"T3\" placeholder=\"Address\">\n");
      out.write("            </div>\n");
      out.write("            <div class=\"form-input\" >\n");
      out.write("                <label for=\"name\">Contact</label>\n");
      out.write("                <input  type=\"text\" name=\"T4\" placeholder=\"Contact\">\n");
      out.write("            </div>\n");
      out.write("            <div class=\"form-input\" >\n");
      out.write("                <label for=\"name\">Address</label>\n");
      out.write("                <input  type=\"text\" name=\"T5\" placeholder=\"Position\">\n");
      out.write("            </div>\n");
      out.write("            <div class=\"form-input\">\n");
      out.write("                <label for=\"name\">Email Address</label>\n");
      out.write("                <input type=\"email\" name=\"T6\" placeholder=\"Email Address\">\n");
      out.write("            </div>\n");
      out.write("            <div class=\"form-input pt-30\">\n");
      out.write("                <input type=\"submit\" name=\"submit\" id=\"B1\" value=\"Registration\">\n");
      out.write("            </div>\n");
      out.write("            <!-- Forget Password -->\n");
      out.write("            <a href=\"../login.jsp\" class=\"registration\">login</a>\n");
      out.write("        </div>\n");
      out.write("    </form>\n");
      out.write("    \n");
      out.write("</main>\n");
      out.write("\n");
      out.write("</body>\n");
      out.write("</html>\n");
      out.write("\n");
      out.write("\n");
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
