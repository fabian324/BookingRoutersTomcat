<%-- 
    Document   : getRuta
    Created on : Jan 25, 2015, 11:00:46 AM
    Author     : pipe0
--%>

<%@page import="Controlador.FacadePersonas"%>
<%@page import="java.util.ArrayList"%>
<%@page import="co.sena.edu.booking.DTO.rutasDTO"%>
<%@page import="co.sena.edu.booking.DAO.estadorutasDAO"%>
<%@page import="co.sena.edu.booking.DAO.conductoresDAO"%>
<%@page import="co.sena.edu.booking.DAO.rutasDAO"%>
<%@page import="co.sena.edu.booking.DAO.reserDAO"%>
<%@page import="co.sena.edu.booking.DAO.tipovehiculosDAO"%>
<%@page import="co.sena.edu.booking.DAO.personasDAO"%>
<%@page import="co.sena.edu.booking.DTO.personasDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link type="text/css" rel="stylesheet" href="bootstrap-3.2.0-dist/bootstrap-3.2.0-dist/css/bootstrap.css">
        <link type="text/css" rel="stylesheet" href="css/css.css">

        <title>JSP Page</title>
    </head>
    <body>
    <%
    HttpSession misesion = request.getSession(false);

    if (misesion.getAttribute("logueado") != null) {
        personasDTO pdto = null;
        personasDTO persona = null;
        personasDAO pdao = new personasDAO();
        tipovehiculosDAO TVDao = new tipovehiculosDAO();
        reserDAO  RDao= new reserDAO();
        FacadePersonas facadeP = new FacadePersonas();
        rutasDTO ruDTO = facadeP.ListarUnaRuta(Integer.parseInt(request.getParameter("id")));
        conductoresDAO conDAO = new conductoresDAO();
        estadorutasDAO estadoDAO =new estadorutasDAO();
        pdto = (personasDTO) misesion.getAttribute("logueado");
        persona = facadeP.ListarUnaPersona(pdto.getIdPersona());                                       
%>
        <center> 
    <table id="Modifica">
        <tr>
            <td>
                <br>
                <strong>Placa Vehículo</strong><font color="#FF0000">*</font>
                <br>
            </td>
            <td><input id="Placa" readonly="readonly" name="Placa" type="text" style="width:250px; height:30px " autofocus  placeholder="usuario" required class="form-control inputtext"  value="<%=ruDTO.getPlacaVehiculo() %>" /> </td>
        </tr>
        <tr>
            <td>
                 <br>
               <strong>Tipo Vehículo </strong><font color="#FF0000">*</font> 
                <br>
            </td>
            <td> 
                <select id="Tipo" name="Tipo" type="text" style="width:250px; height:30px " autofocus  placeholder="usuario" required class="form-control inputtext"  >
                    <%= 
                        facadeP.seleccionTipoV(Integer.toString( ruDTO.getIdtipoVehiculo()))
                    %>
                </select>
            </td>
        </tr>
        <br>
        <tr>
            <td>
                 <br>
              <strong>Cliente </strong><font color="#FF0000">*</font>  
               <br>
            </td>
            <td>
                <select id="Cliente"  readonly="readonly" name ="Cliente" type="text" style="width:250px; height:30px " autofocus  placeholder="usuario" required class="form-control inputtext" >
                    <%= 
                       facadeP.getHTMLAll(ruDTO.getIdPersona())
                    %>
                </select>
            </td>
        </tr>
        <tr>
        <br>
            <td>
                 <br>
                <strong>Conductor </strong><font color="#FF0000">*</font>
                 <br>
            </td>
                <td> 
                <select id="Conductor" name="Conductor" type="text" style="width:250px; height:30px " autofocus  placeholder="usuario" required class="form-control inputtext"  >
                    <%= 
                     facadeP.conductores(ruDTO.getIdConductor())
                    %>
                </select>
            </td>
    </tr>
        <tr>
            <td> 
                 <br>
               <strong>Reserva </strong><font color="#FF0000">*</font> 
                <br>
            </td>
                <td> 
                <select id="Reserva" name="Reserva" type="text" style="width:250px; height:30px " autofocus  placeholder="usuario" required class="form-control inputtext" >
                    <%= 
                       facadeP.reservaPorRuta(Integer.toString( ruDTO.getidReserva()))
                    %>
                </select>
            </td>
    </tr>
    <tr>
        <td>
            <input id="RutaMod" name="Rutamod" type="hidden" style="width:250px; height:30px " autofocus  placeholder="usuario" required class="form-control inputtext"  value="<%=Integer.toString(ruDTO.getIdRuta()) %>" /> 
        </td>

        
    </tr>
    <tr>
        <td colspan="2">
         
            <input class="btn btn-success" name="btnCrea" type="submit" value="Guardar ruta" /> 
        </td>
    </tr>  

    </center> 
       <%
        }
      %>
    </body>
</html>
