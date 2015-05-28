/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

/**
 *
 * @author fabian
 */
public class poolBooking extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
      try {
      out.println("<html>");
      out.println("<head>");
      out.println("<link rel=\"shortcut icon\" href=\"imagenes/br.ico\" />");
      out.println("<title>PRUEBA DEL POOL</title>");
      out.println("</head>");
      out.println("<body>");
      out.println("<img src=\"imagenes/Logo.png\" alt=\"Booking Routers\" width=\"1360\" height=\"126\" title=\"Forget the rest, call the best\"  />");
      out.println("<center>");
      out.println("<h1>POOL BOOKING </h1>");
      Context ctx = new InitialContext();
      DataSource ds = (DataSource) ctx.lookup("jdbc/mydb2");
      Connection cn = ds.getConnection();
      out.println("<p style='color:blue'>" + "Conexión ok." + "</p>");
      cn.close();
      out.println("</center>");
   } catch (Exception e) {
   out.println("<p style='color:red'>Error: " + e.getMessage() + "</p>");
   } finally {
    out.println("</body>");
   out.println("</html>");
     out.close();
      }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
