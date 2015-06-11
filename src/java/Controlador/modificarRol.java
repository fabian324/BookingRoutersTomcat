/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Controlador;

import co.sena.edu.booking.DAO.personasDAO;
import co.sena.edu.booking.DTO.personasDTO;
import co.sena.edu.booking.DTO.rolusuarioDTO;
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
public class modificarRol extends HttpServlet {
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
       //         if (request.getParameter("submit10") != null) {
//
            personasDTO pdto = new personasDTO();
//            personasDAO pdao = new personasDAO();
//          
//            pdto.setIdPersona(Long.parseLong(request.getParameter("doc")));
//            pdto.setNombres(request.getParameter("nombres"));
//            pdto.setApellidos(request.getParameter("apellidos"));
//            pdto.setCorreoElectronico(request.getParameter("cor"));
//            pdto.setFechaNto(request.getParameter("date"));
//            pdto.setIdNacionalidad(Integer.parseInt(request.getParameter("paisnac")));
//            pdto.setIdCiudad(Integer.parseInt(request.getParameter("ciunac")));
//            pdto.setTelefono(Integer.parseInt(request.getParameter("tel")));
//            pdto.setContraseña(request.getParameter("tel"));          
//            pdto.setObservaciones(request.getParameter("info"));
//          
//           String mensaje = facadeP.actualizarRegistro(pdto);
//           response.sendRedirect("verificarRegistro.jsp?msg="+mensaje);
//    }
         if(request.getParameter("submit10") != null){
              rolusuarioDTO r= new rolusuarioDTO();
              personasDAO pdao = new personasDAO();
              r.setRolesIdRol(Integer.parseInt(request.getParameter("rol")));
              r.setUsuarioIdUsuario(Integer.parseInt(request.getParameter("doc")));
              String m= facadeP.actualizarRol(r);
              response.sendRedirect("verificarRegistro.jsp?msgSalida="+m);
              
         } else if(request.getParameter("registro") != null){
              personasDTO r= new personasDTO();
              personasDAO pdao = new personasDAO();
              r.setIdPersona(Long.parseLong(request.getParameter("doc")));
              r.setNombres(request.getParameter("nombres"));
              r.setApellidos(request.getParameter("apellidos"));
              r.setFechaNto(request.getParameter("date"));
              r.setTelefono(Integer.parseInt(request.getParameter("tel")));
              r.setCorreoElectronico(request.getParameter("cor"));
              String m= facadeP.actualizarConductores(r);
              response.sendRedirect("modificarConductor.jsp?msgSalida="+m);
         }
         else if (request.getParameter("idcon") != null) {
            personasDAO pdao = new personasDAO();
            personasDTO eliminado = new personasDTO();
            eliminado = facadeP.ListarUnaPersona(Long.parseLong(request.getParameter("idcon")));
            HttpSession misesion = request.getSession(true);
            misesion.setAttribute("logueado", eliminado);
            response.sendRedirect("modificarcond.jsp?eliminado=" + eliminado);
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
        Logger.getLogger(modificarRol.class.getName()).log(Level.SEVERE, null, ex);
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
        Logger.getLogger(modificarRol.class.getName()).log(Level.SEVERE, null, ex);
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
