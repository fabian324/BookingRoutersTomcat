/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Controlador;

import co.sena.edu.booking.DAO.personareservaDAO;
import co.sena.edu.booking.DTO.personareservaDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
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
public class registroReservas extends HttpServlet {
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
      if (request.getParameter("registroR") != null) {
            personareservaDTO per = new  personareservaDTO();
            personareservaDAO p = new  personareservaDAO();
            
                    
            per.setIdPersona(Long.parseLong(request.getParameter("doc")));
            per.setNombres(request.getParameter("nombrePer"));
            per.setApellidos(request.getParameter("apellidoPer"));
            per.setTelefono(request.getParameter("tel"));
            per.setNacionalidad(request.getParameter("nacio"));
            per.setFechaNaci(request.getParameter("fechNac"));
            per.setIdReserva(Integer.parseInt(request.getParameter("registro")));
            
            int disponible=facadeP.contarRegistrosReservas(per.getIdReserva());
            int cupo=facadeP.contarCupos(per.getIdReserva());
           
            if(disponible<cupo){
           String mensaje = facadeP.creaReser(per);
           //response.sendRedirect("menuCliente.jsp?msgSalida="+mensaje+"&disponible"+disponible+"$cupos"+cupo);
            response.sendRedirect("reservapersonas.jsp?msgSalida="+mensaje+"&idReserva="+per.getIdReserva());
       }else{
               response.sendRedirect("reservapersonas.jsp?noo="+"&idReserva="+per.getIdReserva());
            }
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
        Logger.getLogger(registroReservas.class.getName()).log(Level.SEVERE, null, ex);
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
        Logger.getLogger(registroReservas.class.getName()).log(Level.SEVERE, null, ex);
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
