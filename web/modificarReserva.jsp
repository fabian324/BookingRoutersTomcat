<%-- 
    Document   : modificarReserva
    Created on : 22/01/2015, 12:58:50 PM
    Author     : fabian
--%>

<%@page import="Controlador.FacadePersonas"%>
<%@page import="co.sena.edu.booking.DAO.reserDAO"%>
<%@page import="co.sena.edu.booking.DTO.reserDTO"%>
<%@page import="co.sena.edu.booking.DAO.personasDAO"%>
<%@page import="co.sena.edu.booking.DTO.personasDTO"%> 	
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
         <%
            response.setHeader("Cache-Control", "no-cache");
            response.setHeader("Cache-Control", "no-store");
            response.setDateHeader("Expires", 0);
        %>
    <meta charset="utf-8" />
    <title>Booking Routers</title>
    <link type="text/css" rel="stylesheet" href="css/css.css" />
    <link type="text/css" rel="stylesheet" href="bootstrap-3.2.0-dist/bootstrap-3.2.0-dist/css/bootstrap.css">
    <link rel="shortcut icon" href="imagenes/br.ico" />
    <script src="scripts/bookclient.js" type="text/javascript">
    </script>
</head>
<body>
    <div class ="contenedor">
        <div class="banner"> 
            <p><a href="index.jsp"><img src="imagenes/Logo.png" alt="Booking Routers" width="1360" height="126" title="Forget the rest, call the best"  /></a></p>
        </div>
        <nav> 
            <ul id="main">  
                <li><a align="center" href="index.jsp" style="text-decoration: none;"><span class="glyphicon glyphicon-home"></span> Inicio</a></li>
                <li><a align="center" href="#" style="text-decoration: none;"><span class="glyphicon glyphicon-plane"></span> Reservas</a>
                    <ul class="submain">
                        <li><a href="reserva.jsp" style="text-decoration: none;">Solicitar Reservas </a></li>
                        <li><a href="ModificarReservas.jsp" style="text-decoration: none;">Modificar Reserva</a> </li>
                        <li><a href="CancelarR.jsp" style="text-decoration: none;">Cancelar Reserva</a></li>
                    </ul>
                </li>                       
                <li><div align="center"><a href="menuCliente.jsp" style="text-decoration: none;"><span class="glyphicon glyphicon-list"></span> Menu</a> 
                </li>
               <li><a href="Controlador?action=logout"><span class="glyphicon glyphicon-remove-sign"></span> Cerrar sesion</a></li>
                </li>
            </ul> 
        </nav>

        <%
            HttpSession misesion = request.getSession(false);

            if (misesion.getAttribute("logueado") != null) {

        %>
        <div class="ba">
            <h1><center>Modificar Reservas</center></h1>
        </div>
        
        <%
            reserDAO queryReser = new reserDAO();
            reserDTO miReserva = new reserDTO();
            FacadePersonas facadeP = new FacadePersonas();
            miReserva = facadeP.ListarUnaReserva(Integer.parseInt(request.getParameter("idReserva")));
        %>
        <form name="form1" action="ModificarReserva" method="post" > 
            <table width="744" align="center" id="registro">
                <tr>
                    <td><label for="reser" class="labele"><strong>idReserva<font color="#FF0000">*</strong></label></font></td>
                    <td><input name="reser" type="text" id="reser" value="<%= miReserva.getIdReserva()%>" style="width:250px; height:25px"  readonly="readonly"  placeholder="Responsable" autofocus  required class="form-control inputtext"></td>   
                    
                    <td><label for="registros" class="labele">Numero de personas</label><br></td>
                    <td><select  id="registros" name="registros"  autofocus required class="form-control inputtext" list="servis" tabindex="9" style="width:250px; height:35px">
                    <option value="0">Ninguna ---></option>      
                    <option value="1"<% if (miReserva.getCupo() == 1) out.print("selected"); %>>1 Persona</option>
                    <option value="2"<% if (miReserva.getCupo() == 2) out.print("selected"); %> >2 Personas</option>
                    <option value="3"<% if (miReserva.getCupo() == 3) out.print("selected"); %> >3 Personas</option>
                    <option value="4"<% if (miReserva.getCupo() == 4) out.print("selected"); %> >4 Personas</option>
                    <option value="5"<% if (miReserva.getCupo() == 5) out.print("selected"); %> >5 Personas</option>
                    <option value="6"<% if (miReserva.getCupo() == 6) out.print("selected"); %> >6 Personas</option>
      
      </select> </td>
                </tr>    
                <tr>
                    <td><label for="ser" class="labele"><strong>Servicio<font color="#FF0000">*</strong></label></font></td>
                    <td>

                       <select  id="ser" name="ser" id="ser" autofocus required class="form-control inputtext" list="servis" tabindex="11" style="width:250px; height:35px">     
                           <option value="">Escoja su el servicio que desea ---></option>      
                           <option value="1" <% if (miReserva.getIdServicio() == 1) out.print("selected"); %>>Aeropuerto y Centros de aviación Jet</option>
                            <option value="2"<% if (miReserva.getIdServicio() == 2) out.print("selected"); %> >Puerto y barco de cruceros de Transporte</option>
                            <option value="3"<% if (miReserva.getIdServicio() == 3) out.print("selected"); %> >Hotel y museor</option>
                            <option value="4"<% if (miReserva.getIdServicio() == 4) out.print("selected"); %>>Trabajo</option>
                            <option value="5"<% if (miReserva.getIdServicio() == 5) out.print("selected"); %> >Eventos</option>
                            <option value="6"<% if (miReserva.getIdServicio() == 6) out.print("selected"); %> >Turs</option>
                            <option value="7"<% if (miReserva.getIdServicio() == 7) out.print("selected"); %>>Vacaciones</option>
                        </select> 
                    </td>
                    </select>                                        
                    <td><label for="aer" class="labele"><strong>Aerolineas<font color="#FF0000">*</strong></label></font></td>
                    <td>

                        <select  name="aer" id="aer" style="width:250px; height:35px" autofocus required class="form-control inputtext" list="aero">
                            <option value="">Escoja la aerolinea ---></option>      
                            <option value="1"<% if (miReserva.getIdTransporteLlegada() == 1) out.print("selected"); %>>Avianca</option>
                            <option value="2"<% if (miReserva.getIdTransporteLlegada() == 2) out.print("selected"); %>>LAN</option>
                            <option value="3"<% if (miReserva.getIdTransporteLlegada() == 3) out.print("selected"); %>>US Airways</option>
                            <option value="4"<% if (miReserva.getIdTransporteLlegada() == 4) out.print("selected"); %>>American Airline</option>
                        </select> 
                    </td>
                </tr>
                <tr>
                    <td><label for="res" class="labele"><strong>Titular de la Reserva<font color="#FF0000">*</strong></label></font></td>
                    <td><input name="res" type="text" id="res" value="<%= miReserva.getResponsable()%>" style="width:250px; height:25px" placeholder="Responsable" autofocus  required class="form-control inputtext"></td>   
                    <td><label for="fec" class="labele"><strong>Fecha Reserva<font color="#FF0000">* </strong></label></font></td>
                    <td><input name="fec" type="date" id="fec" value="<%= miReserva.getFechaReserva()%>" style="width:250px; height:25px" required class="form-control inputtext" tabindex="4" onChange="edad()"></td>    
                </tr> 
                <tr>
                    <td><label for="hora" class="labele">Hora de Vuelo</label></td>
                    <td><input type="time" name="hora" id="hora" value="<%= miReserva.getHoraReserva()%>" style="width:250px; height:25px" class="form-control" required></td>
                    <td><label for="aerop" class="labele">Aeropuesto Destino</label></td>
                    <td><select type="time" name="aerop" id="aerop" style="width:250px; height:30px" placeholder="Aeropuerto" autofocus  required class="form-control inputtext">
                            <option>Escoja su aeropuerto destino --></option>                        
                            <option value="Fort Louderdale"<% if (miReserva.getDireccionDestino().equals("Fort Louderdale")) out.print("selected"); %>>Fort Louderdale</option>
                             <option value="Miami International Airport"<% if (miReserva.getDireccionDestino().equals("Miami International Airport")) out.print("selected"); %>>Miami International Airport</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td><input type="submit" name="registro"  id="registro" class="btn btn-success"  value="Actualizar"  style="position:relative; left:330px">
                </tr>
            </table>
            </fieldset>
            <%
                } else {
                misesion.removeAttribute("logueado");
                misesion.invalidate();
                response.sendRedirect("index.jsp?msg= Sesion cerrada");
            }
            %>
        </form>
    </div> 



</div>

<div style="width:100%; background: #0C4391; height: 30px; margin-top:10px; padding-top:5px; border-radius:3px;color:#e2c60f; margin-bottom:1%; float:left; text-align: center;height:70px;color:white;">
    <span>Booking Routers &copy; 2015</span><br>
    Integrantes :<span class="glyphicon glyphicon-user" style="padding-top: 4px;"></span> Yilber Hernandez 
    <span class="glyphicon glyphicon-user" style="padding-top: 4px;"></span> Cristian Moreno 
    <span class="glyphicon glyphicon-user" style="padding-top: 4px;"></span> Sergio Stiven Urbiba
    <span class="glyphicon glyphicon-user" style="padding-top: 4px;"></span> Andres Feipe Guerrero<br>
    <img src="imagenes/dddd.png"><a href="modificarReserva1.jsp" style=" color: #ffffff; text-decoration: none;"  >English</a> --  <img src="imagenes/original.jpg"><a href="modificarReserva.jsp" style=" color: #ffffff; text-decoration: none;" >Spanish</a>

</div>
</body>
</html>