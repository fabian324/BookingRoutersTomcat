/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Controlador;

import co.sena.edu.booking.DTO.personareservaDTO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author fabian
 */
public class modificarAcompanantes extends HttpServlet {
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
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
     if (request.getParameter("registroR") != null) {
           personareservaDTO to = new personareservaDTO();           
           to.setIdreservaPorPersona(Integer.parseInt(request.getParameter("id")));
           to.setNombres(request.getParameter("nombrePer"));
           to.setApellidos(request.getParameter("apellidoPer"));
           to.setTelefono(request.getParameter("tel"));
           to.setFechaNaci(request.getParameter("fechNac"));    
           to.setIdReserva(Integer.parseInt(request.getParameter("idReserva")));
            
            String mensaje = facadeP.actualizarReservaAcompañante(to);
            response.sendRedirect("listarAcompanates.jsp?msgSalida="+mensaje+"&idReserva="+to.getIdReserva());
            
    }else if (request.getParameter("idReserva") != null) {
            personareservaDTO to = new personareservaDTO(); 
            to.setIdReserva(Integer.parseInt(request.getParameter("idReserva")));
            String eliminado = facadeP.eliminarPersonaReserva(Integer.parseInt(request.getParameter("idReserva")));
            response.sendRedirect("ModificarReservas.jsp?msgSalida=" + eliminado+"&idReserva="+to.getIdReserva());
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
