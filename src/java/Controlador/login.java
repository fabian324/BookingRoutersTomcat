/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Controlador;

import co.sena.edu.booking.DTO.personasDTO;
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
public class login extends HttpServlet {
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
       if (request.getParameter("submit10") != null) {
                long idPersona =(Integer.parseInt(request.getParameter("idPersona").trim()));
                String contrasena = request.getParameter("contrasena").trim();
                FacadePersonas facadeP = new FacadePersonas();
                personasDTO datosUsuario = null;
                
                long cc = facadeP.login(contrasena, idPersona);
                if (cc != 0) {
                    //datosUsuario =  new personasDTO();
                    datosUsuario = facadeP.ListarUnaPersona(cc);
                    int numerorol = facadeP.getRol(datosUsuario);
                    if(datosUsuario.getNombres() !=null && numerorol==2 ){ 
                        
                        HttpSession miSesion = request.getSession(true);
                        miSesion.setAttribute("logueado", datosUsuario);
                        miSesion.setAttribute("rol", numerorol);
                        response.sendRedirect("menuCliente.jsp?msg="+cc); 
                    }else{
                        HttpSession miSesion = request.getSession(true);
                        miSesion.setAttribute("logueado", datosUsuario);
                        miSesion.setAttribute("rol", numerorol);
                        response.sendRedirect("verificarRegistro.jsp");
                    }              
                }else{
                      response.sendRedirect("ingreso.jsp?invalida="+cc);
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
        Logger.getLogger(login.class.getName()).log(Level.SEVERE, null, ex);
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
        Logger.getLogger(login.class.getName()).log(Level.SEVERE, null, ex);
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
