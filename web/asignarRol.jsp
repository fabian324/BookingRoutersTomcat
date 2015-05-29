<%-- 
    Document   : asignarRol
    Created on : 4/02/2015, 06:32:15 PM
    Author     : fabian
--%>

<%@page import="co.sena.edu.booking.DTO.rolusuarioDTO"%>
<%@page import="co.sena.edu.booking.DTO.rolesDTO"%>
<%@page import="Controlador.FacadePersonas"%>
<%@page import="co.sena.edu.booking.DTO.reserDTO"%>
<%@page import="co.sena.edu.booking.DAO.personasDAO"%>
<%@page import="co.sena.edu.booking.DTO.personasDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <link rel="shortcut icon" href="imagenes/br.ico" />
        <title>Booking Routers</title>
        <link type="text/css" rel="stylesheet" href="css/css.css" />
        <link type="text/css" rel="stylesheet" href="bootstrap-3.2.0-dist/bootstrap-3.2.0-dist/css/bootstrap.css"> 
        <script src="scripts/bookclient.js" type="text/javascript"></script>        
        <script type="text/javascript" src="js/jquery-1.11.2.min.js"></script>
<script src="scripts/reservas.js" type="text/javascript"></script>
<script src="bootstrap-3.2.0-dist/bootstrap-3.2.0-dist/js/bootstrap.js"></script>
<script>
$(function () {
  $('[data-toggle="popover"]').popover()
})
</script>
<style type="text/css">
    span:hover{
        cursor:pointer
    } 
    span.ayudas{       
        position:relative;
        left:450px;
    }
    
</style> 
</head>
<body>
<div class ="contenedor">
<div class="banner"> 
<p><a href="index1.jsp"><img src="imagenes/Logo.png" alt="Booking Routers" width="1360" height="126" title="Forget the rest, call the best"  /></a></p>
</div>
               <nav>
  <ul id="main">
  <li><div align="center"><a href="#" style="text-decoration: none;"><span class="glyphicon glyphicon-send"></span> Gestion Rutas</a>
  <ul class="submain">
  <li><a href="CreaRuta.jsp?msj=" style="text-decoration: none;">Creación de Rutas</a></li>
  <li><a href="ModRuta.jsp?msj=" style="text-decoration: none;">Modificación de Rutas</a> </li>
  </ul>
  </div>  
  </li>  
  <li><div align="center"><a href="#" style="text-decoration: none;"><span class="glyphicon glyphicon-folder-open"></span> Reportes</a> 
  <ul class="submain">  
  <li><div align="center"><a href="Filtro.jsp" style="text-decoration: none;">Clientes</a></div></li>
  <li><div align="center"><a href="filtroConductores.jsp" style="text-decoration: none;">Conductores</a></div></li>
  <li><div align="center"><a href="EnvioCorreoMasivo.jsp" style="text-decoration: none;">Envio de correos masivos</a></div></li>

  </ul>
</li>
  <li><a href="Controlador?action=logout"><span class="glyphicon glyphicon-remove-sign"></span> Cerrar sesion</a></li> 
 </ul>
  </nav>
</div>              
                    
      <%
                                    HttpSession misesion = request.getSession(false);

                                    if (misesion.getAttribute("logueado") != null) {
                                        rolusuarioDTO r= new rolusuarioDTO();
                                        personasDTO pdto = null;
                                        personasDTO persona = null;
                                        FacadePersonas facadeP = new FacadePersonas();
                                        pdto = (personasDTO) misesion.getAttribute("logueado");
                                        
                                        persona = facadeP.ListarUnaPersona(pdto.getIdPersona());
                                      

                                %>
                              
                                 <form id="registro" action="modificarRol" method="post">
                                <table align="center" id="registro" >
                                 <div class="ba">
                                       <h1>Cambiar Rol</h1>
                                        </div>
                                         <tr>
                                            <td><label for="nombre" class="labele">Nombres</label></td>
                                            <td><input name="nombres" type="text" id="nombre" value="<%=persona.getNombres()%>" style="width:250px; height:25px " readonly="readonly" autofocus required class="form-control inputtext"></td>
                                       
                                            <td><label for="ape" class="labele">Apellidos<font color="#FF0000"></label></td>
                                            <td><input name="apellidos" type="text" id="ape" value="<%=persona.getApellidos()%>" style="width:250px; height:25px" readonly="readonly" autofocus required class="form-control inputtext"></td>
                                         </tr> 
                                         <tr>
                                             <td><label for="doc" class="labele">Documento <font color="#FF0000"></label></td>
                                             <td><input name="doc" type="number"  id="doc" value="<%=persona.getIdPersona()%>" style="width:250px; height:30px" readonly="readonly" autofocus required class="form-control inputtext"></td>    
                                       
                                             <td><label for="date" class="labele">Fecha Nacimiento<font color="#FF0000"></label></td>
                                             <td><input name="date" type="text" id="date" value="<%=persona.getFechaNto()%>" style="width:250px; height:25px" readonly="readonly"  autofocus required class="form-control inputtext"></td>   
                                         </tr>
                                         <tr>
                                         <td><label for="tel" class="labele">Telefono <font color="#FF0000"></label></td>
                                         <td><input name="tel" type="text" id="tel" value="<%=persona.getTelefono()%>" style="width:250px; height:25px" readonly="readonly"  autofocus required class="form-control inputtext"></td>   
                                        
                                         <td><label for="cor" class="labele">Correo<font color="#ff0000"></label></td>
                                         <td><input name="cor" type="email" id="cor" value="<%=persona.getCorreoElectronico()%>" style="width:250px; height:25px" readonly="readonly"  autofocus required class="form-control inputtext"></td>
                              
                                         <tr><td><span class="glyphicon glyphicon-question-sign ayudas" data-container="body"data-toggle="popover" data-placement="right"data-content="Para el cambio de roles: Debe digitar 1. Para administrador y  2. Para usuario."></span>
                                         <label for="rol" class="labele">Rol<font color="#ff0000"></label></td>
                                         <td><input name="rol" type="text" id="rol" value="<%=persona.getRolus().getRolesIdRol()%>" style="width:250px; height:25px" autofocus required class="form-control inputtext"></td>
                                        </table> 
                                       <br>
                                        <center>                                    
                                      <input name="submit10" class="btn btn-success" type="submit" id="submit10" value="Guardar Cambios">
                                        </center>                                        
                                        </form>
                                        <br><br><br>
                                <div style="width:100%; background: #0C4391; height: 30px; margin-top:10px; padding-top:5px; border-radius:3px;color:#e2c60f; margin-bottom:1%; float:left; text-align: center;height:70px;color:white;">
                                <span>Booking Routers &copy; 2015</span><br>
                                Integrantes :<span class="glyphicon glyphicon-user" style="padding-top: 4px;"></span> Yilber Hernandez 
                                <span class="glyphicon glyphicon-user" style="padding-top: 4px;"></span> Cristian Moreno 
                                <span class="glyphicon glyphicon-user" style="padding-top: 4px;"></span> Sergio Stiven Urbiba
                                <span class="glyphicon glyphicon-user" style="padding-top: 4px;"></span> Andres Feipe Guerrero<br>
                                <img src="imagenes/dddd.png"><a href="reserva1.jsp" style=" color: #ffffff; text-decoration: none;"  >English</a> --  <img src="imagenes/original.jpg"><a href="reserva.jsp" style=" color: #ffffff; text-decoration: none;" >Spanish</a>

                            </div>
         <%
       }else{
       response.sendRedirect("index.jsp");
         }
       %>
                            
    </body>
</html>
