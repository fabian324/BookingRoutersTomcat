/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Controlador;

import co.sena.edu.booking.DAO.personasDAO;
import co.sena.edu.booking.DAO.reserDAO;
import co.sena.edu.booking.DTO.personasDTO;
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

/**
 *
 * @author fabian
 */
public class Reserva extends HttpServlet {
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

            reserDTO to = new reserDTO();
            reserDAO dao = new reserDAO();
            long t = facadeP.validarReservas(Integer.parseInt(request.getParameter("doc")));
            if (t >= 5) {
                response.sendRedirect("reserva.jsp?noo=" + t);
            } else if (t < 5) {
                to.setIdpersona(Integer.parseInt(request.getParameter("doc")));
                to.setIdEstadoReserva(1);
                to.setIdServicio(Integer.parseInt(request.getParameter("ser")));
                to.setIdTransporteLlegada(Integer.parseInt(request.getParameter("aer")));
                to.setResponsable(request.getParameter("res"));
                to.setFechaReserva(request.getParameter("fecNac"));
                to.setHoraReserva(request.getParameter("hora"));
                to.setDireccionDestino(request.getParameter("aerop"));
                to.setCupo(Integer.parseInt(request.getParameter("registros")));
                to.setNromaletas(Integer.parseInt(request.getParameter("NumeroEquipaje")));
                to.setNrovuelo(request.getParameter("NumeroV"));
                to.setPaisorigen(request.getParameter("OrigenPais"));
                
                String mensaje = facadeP.insertar(to);
                int idReserva = facadeP.obtenerUltimaReserva(Integer.parseInt(request.getParameter("doc")));
                personasDAO persona = new personasDAO();
                personasDTO pdto = new personasDTO();
                pdto = facadeP.ListarUnaPersona(Long.parseLong(request.getParameter("doc")));
                String asunto = "Datos Reserva";
                String cuerpomsj = "<!DOCTYPE html>";
                cuerpomsj += "<br>";
                cuerpomsj += "<br>";
                cuerpomsj += "<br>";
                cuerpomsj += "<body>";
                cuerpomsj += "<center>";
                cuerpomsj += "<div style=\" border-radius: 25px; color: black; \">";
                cuerpomsj += "<h1><Strong style=\"color: #0C4391   \" >Los datos de la reserva  " + pdto.getNombres() + " son</Strong></h1>";
                cuerpomsj += "<h3><Strong style=\"color: black   \"  >Sus datos  reserva </Strong></h3>";
                cuerpomsj += "<table border='1' borderColor='#819FF7' style=\" background-color: #D8CBCB; \">";
                cuerpomsj += "<tr>";
                cuerpomsj += "<th bgColor='#0C4391' style=\"color: white; \">Documento";
                cuerpomsj += "</th>";
                cuerpomsj += "<th bgColor='#0C4391' style=\"color: white; \">Reponsable (Titular) ";
                cuerpomsj += "</th>";
                cuerpomsj += "<th bgColor='#0C4391' style=\"color: white; \">Numero Vuelo";
                cuerpomsj += "</th>";
                cuerpomsj += "<th bgColor='#0C4391' style=\"color: white; \">Hora ";
                cuerpomsj += "</th>";
                cuerpomsj += "<th bgColor='#0C4391' style=\"color: white; \">Fecha";
                cuerpomsj += "</th>";
                cuerpomsj += "<th bgColor='#0C4391' style=\"color: white; \">Numero Equipaje";
                cuerpomsj += "</th>";
                cuerpomsj += "<th bgColor='#0C4391' style=\"color: white; \">Direccion Origen";
                cuerpomsj += "</th>";
                cuerpomsj += "<th bgColor='#0C4391' style=\"color: white; \">Direccion Destino";
                cuerpomsj += "</th>";
                cuerpomsj += "<th bgColor='#0C4391' style=\"color: white; \">Numero Acompañantes";
                cuerpomsj += "</th>";
                cuerpomsj += "</tr>";
                cuerpomsj += "<tr>";
                cuerpomsj += "<th bgColor='white' style=\"color: black;\">" + pdto.getIdPersona();
                cuerpomsj += "</th>";
                cuerpomsj += "<th bgColor='white' style=\"color: black;\">" + to.getResponsable();
                cuerpomsj += "</th>";
                cuerpomsj += "<th bgColor='white' style=\"color: black; \">" + to.getNrovuelo();
                cuerpomsj += "</th>";
                cuerpomsj += "<th bgColor='white' style=\"color: black; \">" + to.getHoraReserva();
                cuerpomsj += "</th>";
                cuerpomsj += "<th bgColor='white' style=\"color: black;\">" + to.getFechaReserva();
                cuerpomsj += "</th>";
                cuerpomsj += "<th bgColor='white' style=\"color: black;\">" + to.getNromaletas();
                cuerpomsj += "</th>";
                cuerpomsj += "<th bgColor='white' style=\"color: black; \">" + to.getPaisorigen();
                cuerpomsj += "</th>";
                cuerpomsj += "<th bgColor='white' style=\"color: black; \">" + to.getDireccionDestino();
                cuerpomsj += "</th>";
                cuerpomsj += "<th bgColor='white' style=\"color: black; \">" + to.getCupo();
                cuerpomsj += "</th>";
                cuerpomsj += "</tr>";
                cuerpomsj += "</table>";
                cuerpomsj += "</div>";
                cuerpomsj += "<br>";
                cuerpomsj += "<br>";
                cuerpomsj += "<a align=\"center\" href=\"http://localhost:8080/Com.Booking/index.jsp\" style=\"text-decoration: none;\">Pagina oficial de Booking Routers</a>";
                cuerpomsj += "<br>";
                cuerpomsj += "<span>Booking Routers &copy; 2015</span>";
                String para = pdto.getCorreoElectronico();
                Correo.sendMail(asunto, cuerpomsj, para);
                if (Integer.parseInt(request.getParameter("registros")) == 0) {
                    response.sendRedirect("menuCliente.jsp?msgSalida="+mensaje);
                } else {
                    response.sendRedirect("reservapersonas.jsp?msgSalida=" + mensaje + "&idReserva=" + idReserva);
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
        Logger.getLogger(Reserva.class.getName()).log(Level.SEVERE, null, ex);
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
        Logger.getLogger(Reserva.class.getName()).log(Level.SEVERE, null, ex);
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
