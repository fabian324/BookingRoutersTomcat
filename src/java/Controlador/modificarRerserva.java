/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Controlador;

import co.sena.edu.booking.DAO.reserDAO;
import co.sena.edu.booking.DTO.reserDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author fabian
 */
public class modificarRerserva extends HttpServlet {
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
     if (request.getParameter("registro") != null) {

           reserDTO to = new reserDTO();
           reserDAO dao = new reserDAO();
           
           to.setIdReserva(Integer.parseInt(request.getParameter("reser")));
           to.setIdServicio(Integer.parseInt(request.getParameter("ser")));
           to.setIdTransporteLlegada(Integer.parseInt(request.getParameter("aer")));
           to.setResponsable(request.getParameter("res"));
           to.setFechaReserva(request.getParameter("fec"));
           to.setHoraReserva(request.getParameter("hora"));
           to.setDireccionDestino(request.getParameter("aerop"));
            
            String mensaje = facadeP.actualizarReserva(to);
            
            response.sendRedirect("menuCliente.jsp?msgSalida="+mensaje);
    }
          else if(request.getParameter("idReserva")!= null){
            reserDAO pdao = new reserDAO();
            reserDTO eliminado= new reserDTO();
            eliminado= facadeP.ListarUnaReserva(Integer.parseInt(request.getParameter("idReserva")));
            HttpSession misesion =request.getSession(false);
            misesion.setAttribute("logueado", eliminado);
            response.sendRedirect("modificarReserva.jsp?msgSalida="+eliminado);
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
        Logger.getLogger(modificarRerserva.class.getName()).log(Level.SEVERE, null, ex);
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
        Logger.getLogger(modificarRerserva.class.getName()).log(Level.SEVERE, null, ex);
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
