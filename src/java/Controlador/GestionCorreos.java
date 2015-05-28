/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Controlador;

import co.sena.edu.booking.DAO.personasDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author fabian
 */
public class GestionCorreos extends HttpServlet {
FacadePersonas facadeP = new FacadePersonas();
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
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
    response.setContentType("text/html;charset=UTF-8");
        personasDAO pdao = new personasDAO();
        ArrayList<String> correos = new ArrayList();  
        String asunto = request.getParameter("cAsunto");
        String mensaje = request.getParameter("cCuerpo");
        correos = (ArrayList)facadeP.obtenerCorreoPorId();
            StringBuilder email = new StringBuilder("");     
            for (int i = 0; i < correos.size(); i++) {
                email.append(correos.get(i));
                if (i != correos.size() -1 && correos.size() > 0) {
                    email.append(" ,");
                }
            }
         
        if (Correo.sendMail(asunto, mensaje, email.toString())) {
            response.sendRedirect("EnvioCorreoMasivo.jsp?info=<i class='glyphicon glyphicon-ok'></i> <strong>Envio Correctamente</strong> Se logró el envío, se le envió a los siguientes correos: " + email.toString());
        } else {
            response.sendRedirect("EnvioCorreoMasivo.jsp?info=<i class='glyphicon glyphicon-remove'></i> <strong>Envio Fallido</strong> No se logro el envio");
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
    try {
        processRequest(request, response);
    } catch (SQLException ex) {
        Logger.getLogger(GestionCorreos.class.getName()).log(Level.SEVERE, null, ex);
    }
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
    try {
        processRequest(request, response);
    } catch (SQLException ex) {
        Logger.getLogger(GestionCorreos.class.getName()).log(Level.SEVERE, null, ex);
    }
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
