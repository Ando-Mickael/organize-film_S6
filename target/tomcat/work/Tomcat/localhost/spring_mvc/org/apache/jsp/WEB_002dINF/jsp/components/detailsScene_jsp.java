/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.47
 * Generated at: 2023-03-29 17:59:35 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.jsp.components;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import mg.ando.model.Personnage;
import mg.ando.dao.HibernateDao;
import mg.ando.model.Expression;
import mg.ando.model.DetailsScene;
import java.util.List;

public final class detailsScene_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private javax.el.ExpressionFactory _el_expressionfactory;
  private org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
    _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
        throws java.io.IOException, javax.servlet.ServletException {

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


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

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");

    HibernateDao dao = (HibernateDao) request.getAttribute("dao");
    List<DetailsScene> listDetailsScene = (List<DetailsScene>) request.getAttribute("detailsScene");

      out.write("\r\n");
      out.write("\r\n");
      out.write("<main id=\"main\" class=\"main\">\r\n");
      out.write("\r\n");
      out.write("    <div class=\"pagetitle\">\r\n");
      out.write("        <h1>Liste des details scene</h1>\r\n");
      out.write("    </div>\r\n");
      out.write("\r\n");
      out.write("    <section class=\"section\">\r\n");
      out.write("        <div class=\"row\">\r\n");
      out.write("\r\n");
      out.write("            <div class=\"col-lg-12\">\r\n");
      out.write("                <div class=\"card\">\r\n");
      out.write("                    <div class=\"card-body\">\r\n");
      out.write("                        <h5 class=\"card-title\">Details scenes</h5>\r\n");
      out.write("\r\n");
      out.write("                        <table class=\"table\">\r\n");
      out.write("                            <thead>\r\n");
      out.write("                                <tr>\r\n");
      out.write("                                    <th scope=\"col\">#</th>\r\n");
      out.write("                                    <th scope=\"col\">Personnage</th>\r\n");
      out.write("                                    <th scope=\"col\">Expression</th>\r\n");
      out.write("                                    <th scope=\"col\">Action</th>\r\n");
      out.write("                                    <th scope=\"col\">Texte</th>\r\n");
      out.write("                                    <th scope=\"col\">Debut</th>\r\n");
      out.write("                                    <th scope=\"col\">Fin</th>\r\n");
      out.write("                                </tr>\r\n");
      out.write("                            </thead>\r\n");
      out.write("                            <tbody>\r\n");
      out.write("                                ");
for (DetailsScene detail : listDetailsScene) {
                                    Expression e = dao.findById(Expression.class, detail.getExpressionid());
                                    Personnage p = dao.findById(Personnage.class, detail.getPersonnageid());
                                
      out.write("\r\n");
      out.write("\r\n");
      out.write("                                <tr>\r\n");
      out.write("                                    <th scope=\"row\">");
      out.print((detail.getId()));
      out.write("</th>\r\n");
      out.write("                                    <td>");
      out.print((p.getPseudo()));
      out.write("</td>\r\n");
      out.write("                                    <td>");
      out.print((e.getExpression()));
      out.write("</td>\r\n");
      out.write("                                    <td>");
      out.print((detail.getAction()));
      out.write("</td>\r\n");
      out.write("                                    <td>\"");
      out.print((detail.getTexte()));
      out.write("\"</td>\r\n");
      out.write("                                    <td>");
      out.print((detail.getDebut()));
      out.write(" min</td>\r\n");
      out.write("                                    <td>");
      out.print((detail.getFin()));
      out.write(" min</td>\r\n");
      out.write("                                </tr>\r\n");
      out.write("\r\n");
      out.write("                                ");
 }
      out.write("\r\n");
      out.write("                            </tbody>\r\n");
      out.write("                        </table>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("\r\n");
      out.write("        </div>\r\n");
      out.write("    </section>\r\n");
      out.write("\r\n");
      out.write("</main>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try { out.clearBuffer(); } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
