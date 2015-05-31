<%@page import="Controlador.FacadePersonas"%>
<%@page import="co.sena.edu.booking.DAO.estadorutasDAO"%>
<%@page import="co.sena.edu.booking.DAO.conductoresDAO"%>
<%@page import="co.sena.edu.booking.DAO.reserDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="co.sena.edu.booking.DAO.personasDAO"%>
<%@page import="co.sena.edu.booking.DTO.personasDTO"%>
<%@page import="co.sena.edu.booking.DAO.tipovehiculosDAO"%>
<%@page import="co.sena.edu.booking.DTO.tipovehiculosDTO"%>

<!doctype html>
<html>
    <head>
         <%
            response.setHeader("Cache-Control", "no-cache");
            response.setHeader("Cache-Control", "no-store");
            response.setDateHeader("Expires", 0);
        %>
 <meta charset="utf-8">
<link rel="shortcut icon" href="imagenes/br.ico" />
<title>..::Booking Routers::..</title>
        <link type="text/css" rel="stylesheet" href="bootstrap-3.2.0-dist/bootstrap-3.2.0-dist/css/bootstrap.css">
        <link type="text/css" rel="stylesheet" href="css/css.css">
        <script  src="jquery/jquery.js"></script>
        <script src="jquery/jquery.validate.js"></script>
        <script src="jquery/additional-methods.js"></script>
        <style type="text/css">
            .info, .exito, .alerta, .error {
                font-family:Arial, Helvetica, sans-serif; 
                font-size:13px;
                border: 1px solid;
                margin: 10px 0px;
                padding:15px 10px 15px 50px;
                background-repeat: no-repeat;
                background-position: 10px center;
            }
            .info {
                color: #00529B;
                background-color: #BDE5F8;
                background-image: url('img/alerta.png');
            }
            .exito {
                color: #4F8A10;
                background-color: #DFF2BF;
                background-image:url('img/exito.png');
            }
            .alerta {
                color: #9F6000;
                background-color: #FEEFB3;
                background-image: url('img/alerta.png');
            }
            .error{
                color: #D8000C;
                background-color: #FFBABA;
                background-image: url('img/error.png');
            }
        </style>
        <script type="text/javascript" src="js/jquery-1.2.6.js"></script>
        <script type="text/javascript">
            $(document).ready(function () {
                setTimeout(function () {
                    $(".mensajes").fadeIn(800).fadeOut(800);
                }, 4000);
            });
        </script>
    </head>
    <body>
        <div class ="contenedor">
            <div class="banner"> 
                <p><a href="index.jsp"><img src="imagenes/Logo.png" alt="Booking Routers" width="100%" height="150" title="Forget the rest, call the best"  /></a></p>
            </div>
        </div>
            <nav>
                <ul id="main">
                    <li><a href="verificarRegistro.jsp"><span class="glyphicon glyphicon-home"></span> Inicio</a></li>

        <li><div align="center"><a href="#" style="text-decoration: none;"><span class="glyphicon glyphicon-send"></span> Gestión Rutas</a>
  <ul class="submain">
  <li><a href="ModRuta.jsp?msj=" style="text-decoration: none;">Modificación de Rutas</a> </li>
  </ul>
  </div>  
  </li> 
                    
                 <li><div align="center"><a href="#" style="text-decoration: none;"><span class="glyphicon glyphicon-folder-open"></span> Reportes</a></div> 
                <ul class="submain">  
                 <li><div align="center"><a href="Filtro.jsp" style="text-decoration: none;">Clientes</a></div></li>
                 <li><div align="center"><a href="filtroConductores.jsp" style="text-decoration: none;">Conductores</a></div></li>
                   <li><div align="center"><a href="EnvioCorreoMasivo.jsp" style="text-decoration: none;">Envío de correos masivos</a></div></li>
                </ul>
                   </li>
                <li><a href="Controlador?action=logout" style="text-decoration: none;"><span class="glyphicon glyphicon-remove-sign"></span> Cerrar sesión</a> </li>   
                </ul>
            </nav>
            <br>

            <%
                HttpSession misesion = request.getSession(false);

                if (misesion.getAttribute("logueado") != null) {   
                    personasDTO pdto = null;
                    personasDTO persona = null;
                    FacadePersonas facadeP = new FacadePersonas();
                    tipovehiculosDAO TVDao = new tipovehiculosDAO();
                    reserDAO RDao = new reserDAO();
                    conductoresDAO conDAO = new conductoresDAO();
                    estadorutasDAO estadoDAO = new estadorutasDAO();
                    pdto = (personasDTO) misesion.getAttribute("logueado");
                    persona = facadeP.ListarUnaPersona(pdto.getIdPersona());
            %>
            <div>
                <form name="CreaRuta"  action="CreaRuta" method="post" >   
                    <div  style="background: #0C4391; height: 70px; margin-top: 10px; padding-top: 5px; border-radius: 15px; color: #ffffff">

                        <h2>
                            <center>Creación de Rutas</center>
                        </h2>
                    </div>
                    <center> 
                        <table id="Crea">
                            <div style=" background:#98A0A8;  text-align: center ; border-radius: 15; ">
                                Inicio-> Creación de Rutas
                            </div>
                            <tr>
                                <td>
                                    <br>
                                    <strong>Placa Vehículo</strong><font color="#FF0000">*</font>
                                    <br>
                                </td>
                                <td><input id="Placa" maxlength="6" name="Placa" type="text" style="width:250px; height:30px " autofocus  placeholder="Ingrese placa" required class="form-control inputtext"  /> </td>
                            </tr>
                            <br>
                            <tr>
                                <td>
                                    <br>
                                    <strong>Cliente </strong><font color="#FF0000">*</font>  
                                    <br>
                                </td>
                                <td>
                                    <input id="Cliente" value="<%=request.getParameter("nombrepersona")%>"  readonly="readonly"  name ="clientenombre" type="text" style="width:250px; height:30px " autofocus   required class="form-control inputtext" />
                                    <input id="Cliente" value="<%=request.getParameter("idPersona")%>"  readonly="readonly"  name ="idPersona" type="hidden" style="width:250px; height:30px " autofocus   required class="form-control inputtext" />
                                      
                                
                                </td>
                            </tr>
                            <tr>
                                    <tr>
                                <td>
                                    <br>
                                    <strong>Fecha Reserva</strong><font color="#FF0000">*</font>  
                                    <br>
                                </td>
                                <td>
                                    <input id="Cliente" only value="<%=request.getParameter("FechaReserva")%>" readonly="readonly"  name ="Cliente" type="text" style="width:250px; height:30px " autofocus   required class="form-control inputtext" />
                                      
                                
                                </td>
                            </tr>
                                <td>
                                    <br>
                                    <strong>Hora Vuelo</strong><font color="#FF0000">*</font>  
                                    <br>
                                </td>
                                <td>
                                    <input id="Cliente" only value="<%=request.getParameter("HoraReserva")%>" readonly="readonly"  name ="Cliente" type="text" style="width:250px; height:30px " autofocus   required class="form-control inputtext" />
                                      
                                
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <br>
                                    <strong>Número de vuelo </strong><font color="#FF0000">*</font>  
                                    <br>
                                </td>
                                <td>
                                    <input id="Cliente" value="<%=request.getParameter("nrovuelo")%> "  readonly="readonly" name ="Cliente" type="text" style="width:250px; height:30px " autofocus   required class="form-control inputtext" >
                                 
                                </td>
                            </tr>
                                  <tr>
                                <td>
                                    <br>
                                    <strong>Tipo Vehículo </strong><font color="#FF0000">*</font> 
                                    <br>
                                </td>
                                <td> 
                                    <select id="Tipo" name="Tipo" type="text" style="width:250px; height:30px " autofocus  required class="form-control inputtext"  >
                                        <%=facadeP.seleccionTipoV("0")%>
                                    </select>
                                </td>
                            </tr>
                                     <strong>Nro de Acompañantes </strong><font color="#FF0000">*</font>  
                                     <input id="Cliente" value="<%=request.getParameter("cupo")%>" readonly="readonly" name ="Cliente" type="text" style="width:35px; height:30px " autofocus   required class="form-control inputtext" >
                                      <strong>Nro de Maletas </strong><font color="#FF0000">*</font>  
                                     <input id="Cliente" value="<%=request.getParameter("nromaletas")%>" readonly="readonly"  name ="Cliente" type="text" style="width:35px; height:30px " autofocus   required class="form-control inputtext" >
                               
                            <br>
                            <td>
                                <br>
                                <strong>Conductor </strong><font color="#FF0000">*</font>
                                <br>
                            </td>
                            <td> 
                                <select id="Conductor" name="Conductor" type="text" style="width:250px; height:30px " autofocus   required class="form-control inputtext"  >
                                    <%=facadeP.conductores("0")%>
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
                                    
                                    <input id="Reserva" name="Reserva" value="<%=request.getParameter("nombreservicio")%>" type="text" style="width:250px; height:30px " autofocus  required class="form-control inputtext" />
                                  
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <input type="hidden" name="idReserva" value="<%=request.getParameter("idReserva")%>"/>
                                    <input class="btn btn-success " name="btnCrea" type="submit" value="Crear Ruta" /> 
                                </td>
                            </tr>
                
                        </table>
                        <br>
                        <table>

                            <tr>
                                <td colspan="2">
                                    <%
                                        if (request.getParameter("no") != null) {
                                    %>
                                    <div>
                                        <b class="error mensajes"  role="alert" style="position:relative; left:60px"> Esta ruta ya ha sido asignada</b>
                                    </div>
                                    <%
                                        }
                                    %>  
                                </td>
                            </tr>
                        </table>
                        <br>
                    </center> 
                                     <%
                }else {
                misesion.removeAttribute("logueado");
                misesion.invalidate();
                response.sendRedirect("index.jsp?msg= Sesion cerrada");
            }
            %>
           
                </form>
            </div>
            <div style="width:100%; background: #0C4391; height: 30px; margin-top:10px; padding-top:5px; border-radius:3px;color:#e2c60f; margin-bottom:1%; float:left; text-align: center;height:70px;color:white;">
                <span>Booking Routers &copy; 2015</span><br>
                Integrantes :<span class="glyphicon glyphicon-user" style="padding-top: 4px;"></span> Yilber Hernandez 
                <span class="glyphicon glyphicon-user" style="padding-top: 4px;"></span> Cristian Moreno 
                <span class="glyphicon glyphicon-user" style="padding-top: 4px;"></span> Sergio Stiven Urbina
                <span class="glyphicon glyphicon-user" style="padding-top: 4px;"></span> Andres Feipe Guerrero<br>
                <img src="imagenes/dddd.png"><a href="CreaRuta1.jsp" style=" color: #ffffff; text-decoration: none;"  >English</a> --  <img src="imagenes/original.jpg"><a href="CreaRuta.jsp" style=" color: #ffffff; text-decoration: none;" >Spanish</a>

            </div>
             

    </body>
</html>





