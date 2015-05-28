<%-- 
    Document   : listarPersonas
    Created on : 6/03/2015, 09:18:56 PM
    Author     : fabian
--%>

<%@page import="co.sena.edu.booking.DTO.listarPersonasDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="co.sena.edu.booking.DTO.personasDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link type="text/css" rel="stylesheet" href="bootstrap-3.2.0-dist/bootstrap-3.2.0-dist/css/bootstrap.css">
        <link type="text/css" rel="stylesheet" href="css/css.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" href="imagenes/br.ico" />

<title>..::Booking Routers::..</title>
    </head>
    <body>
        <div class ="contenedor">
            <div class="banner"> 
                <p><img src="imagenes/Logo.png" alt="Booking Routers" width="1360" height="126" title="Forget the rest, call the best"  /></p>
            </div>
            <center>
                <form action="buscarPersona" method="post">

                    <label>Nombres</label><br>
                    <input type="text" name="producto"><br>
                    <label>Pais</label><br>
                    <input type="text" name="categoria"><br><br>
                    <input type="submit" name="buscar" value="Buscar" class="btn btn-success">         
                </form>
            </center>
            <%

                if (request.getAttribute("productos") != null) {

                    ArrayList<listarPersonasDTO> productos = (ArrayList<listarPersonasDTO>) request.getAttribute("productos");

                    if (productos.size() == 0) {
            %>
            <div>
                <div ><h1>No hay Registros </h1></div>
            </div>         
            <%
            } else {
            %>
            <center>
                <div class="row text-right">
                    <div><h1>Resultados</h1></div>                         
                </div>
                <br>


                <table border="1"  class="paginated" id="divTabla"> 
                    <thead>
                        <tr id="titulo">
                            <td>NOMBRE</td>
                            <td>APELLIDO</td>
                            <td>NACIONALIDAD</td>
                        </tr>
                    </thead>
                    <%            for (listarPersonasDTO producto: productos) {
                        

                    %>
                    <tr>
                        <td><%=producto.getNombres()%></td>
                        <td><%=producto.getApellidos()%></td>
                        <td><%=producto.getNacionalidad()%></td>

                    </tr>
                    <%            }
                    %>
                </table>
            </center>
            <%
                    }
                }
            %>
    </body>
</html>
