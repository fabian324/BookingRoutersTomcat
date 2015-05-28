/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Controlador;

import co.sena.edu.booking.DAO.rutasDAO;
import co.sena.edu.booking.DTO.conductoresDTO;
import co.sena.edu.booking.DTO.personasDTO;
import co.sena.edu.booking.DTO.rutasDTO;
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
public class CreaRuta extends HttpServlet {
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
         rutasDAO cRuta = new rutasDAO();
        rutasDTO objRuta = new rutasDTO();
        String msj = "";

        if (request.getParameter("Placa") != null) {
            objRuta.setPlacaVehiculo(request.getParameter("Placa"));
            if (!"0".equals(request.getParameter("Tipo"))) {
                objRuta.setIdtipoVehiculo(Integer.parseInt(request.getParameter("Tipo")));
                if (!"0".equals(request.getParameter("Cliente"))) {
                    objRuta.setIdPersona(request.getParameter("Cliente"));
                    if (!"0".equals(request.getParameter("Conductor"))) {
                        objRuta.setIdConductor(request.getParameter("Conductor"));
                        if (!"0".equals(request.getParameter("Reserva"))) {

                            objRuta.setidReserva(Integer.parseInt(request.getParameter("Reserva")));
                            objRuta.setIdEstadoRuta(1);
                            
                             personasDTO pdto = new personasDTO();
                conductoresDTO cdto = new conductoresDTO();
                cdto= facadeP.correoConductores(Integer.parseInt(objRuta.getIdConductor()));
                pdto = facadeP.ListarUnaPersona(Long.parseLong(request.getParameter("Cliente")));
                String asunto = "Datos Conductor";
                String cuerpomsj = "<html>\"<body>\"<img src=\"C:\\Users\\andres\\Desktop\\BookingFase5\\web\\imagenes\" alt=\"Booking Routers\" width=\"1360\" height=\"126\" title=\"Forget the rest, call the best\"  />\"</body>\"<html>" + "su conductor es (a)" +cdto.getConductores().getNombres()+" " + cdto.getConductores().getApellidos()+ " "+"su numero de telefono por alguna eventualidad es  " + cdto.getTelContacto();
                String para = pdto.getCorreoElectronico();
                Correo.sendMail(asunto, cuerpomsj, para);    

                            int ru = facadeP.validarruta(Integer.parseInt(request.getParameter("Tipo")));
                            if (ru == 0) {
                                
                              msj = facadeP.crearRuta(objRuta);
                                  response.sendRedirect ("CreaRuta.jsp?msj=" + msj);
                             
                            } else if (ru == 1) {
                                
                                response.sendRedirect("CreaRuta.jsp?no=");

                            }
                        }

                        
                    }
                }
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
         Logger.getLogger(CreaRuta.class.getName()).log(Level.SEVERE, null, ex);
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
         Logger.getLogger(CreaRuta.class.getName()).log(Level.SEVERE, null, ex);
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
