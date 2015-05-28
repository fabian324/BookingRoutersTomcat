<%-- 
    Document   : exportarConductores
    Created on : 13/05/2015, 11:38:22 AM
    Author     : Sergio
--%>

<%@page import="co.sena.edu.booking.DTO.listarConductoresDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
</head>
    <body>
        
 <%
            if (request.getAttribute("conductores") != null) {
                ArrayList<listarConductoresDTO > conduc = (ArrayList<listarConductoresDTO>) request.getAttribute("conductores");
                if (conduc.size() == 0) {
        %>

         
        <%
        } else {
        %>    
        <center>
        <div class="row text-right">
            <div class="col-md-6"><h2 class="text-center">Resultados de los conductores</h2></div>                         
        </div>
                </center>
            <br>
        <table class="table table-bordered table-striped table-hover"> 
            <thead>
            <td>Nombres</td>
            <td>apellidos</td>
            <td>Responsable</td>
            <td>Fecha Reserva</td>
            <td>Direccion Destino</td>
            <td>Servicio</td>
        </thead>
        <%
            for (listarConductoresDTO  nombre : conduc) {
        %>

        <tr>

            <td><%=nombre.getNombres()%></td>
            <td><%=nombre.getApellidos()%></td>
            <td><%=nombre.getResponsable()%></td>
            <td><%=nombre.getFechaReserva()%></td>
            <td><%=nombre.getDireccionDestino()%></td>
            <td><%=nombre.getServicio()%></td>
        </tr>
        <%
            }
        %>
    </table>
    <%
            }
        String nombreArchivo = "Reporte Conductores"+".xls";
                    response.setHeader("Content-Disposition", "attachment; filename=\"" + nombreArchivo + "\"");
            
            }
    %>

</body>
</html>
