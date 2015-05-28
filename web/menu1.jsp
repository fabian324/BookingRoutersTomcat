<%@page import="Controlador.FacadePersonas"%>
<%@page import="co.sena.edu.booking.DAO.personasDAO"%>
<%@page import="co.sena.edu.booking.DTO.personasDTO"%>
<!doctype html>
<html>
<head>
<link type="text/css" rel="stylesheet" href="bootstrap-3.2.0-dist/bootstrap-3.2.0-dist/css/bootstrap.css">
<link type="text/css" rel="stylesheet" href="css/css.css">
	<script  src="jquery/jquery.js"></script>
	<script src="jquery/jquery.validate.js"></script>
	<script src="jquery/additional-methods.js"></script>
<meta charset="utf-8">
<link rel="shortcut icon" href="imagenes/br.ico" />
<title>..::Booking Routers::..</title>
</head>
<body>
<div class ="contenedor">
<div class="banner"> 
<p><a href="index1.html"><img src="imagenes/Logo.png" alt="Booking Routers" width="1360" height="126" title="Forget the rest, call the best"  /></a></p>
</div>
<nav>
<nav> 
    <ul id="main">
    <li><div align="center" style="text-decoration: none;"><a href="index1.jsp"><span classhtmls="glyphicon glyphicon-home"></span></a>< Home</li>
            <li><div align="center" style="text-decoration: none;"><a href="#"><span class="glyphicon glyphicon-plane"></span> Reservations</a>
                            <ul class="submain">
                                <li><a href="reserva1.jsp" style="text-decoration: none;">New Reservation</a></li>
                                <li><a href="CancelarR1.jsp" style="text-decoration: none;">My Reservation</a> </li>
                                <li><a href="ModificarReservas1.jsp" style="text-decoration: none;">Modify Reservation</a> </li>
                                </ul>
                        </li>
                        <li><div align="center"><a href="#" style="text-decoration: none;"><span class="glyphicon glyphicon-list-alt"></span> My Count</a>
                            <ul class="submain">
                                <li><a href="actualizarDatos2.jsp" style="text-decoration: none;">My Data</a></li>
                                <li><a href="cambiarContraseña1.jsp" style="text-decoration: none;">Change Password</a> </li>
                                </ul>
                        </li>
       <center>
                     <table>
                     <tr>
                     <td colspan="2">
            <% if(request.getParameter("msg") != null) {%>
            <% if(!request.getParameter("msg").equals("")) { %> 
           <div class="alert alert-success" role="alert">
            <%= request.getParameter("msg") %>
            </div>
            <%}%>
            <%}%> 
            </tr>
                     </table>
            </center>
        </ul>
</nav> 
</nav>
<br>

<%
                                    HttpSession misesion = request.getSession(false);

                                    if (misesion.getAttribute("logueado") != null) {
                                        personasDTO pdto = null;
                                        personasDTO persona = null;
                                       FacadePersonas facadeP = new FacadePersonas();
                                        pdto = (personasDTO) misesion.getAttribute("logueado");
                                        persona =facadeP.ListarUnaPersona(pdto.getIdPersona());                                       
                                                

                                %>
<div class="contenedor">
<div class="lateral">
 <h4>Welcome</h4>
<div class="nombre">
<td><input type="text" value="<%=persona.getNombres()%>" style="width:166px; height:25px; text-align:center; text-transform:uppercase;"  autofocus disabled  class="form-control inputtext">
</td>
</div>
<div class="foto">
<img id="foto" src="imagenes/user.jpg">
</div>
<div class="nombre">
<td><input type="text" value="USER" style="width:166px; height:25px; text-align:center; text-transform:uppercase;"  autofocus disabled  class="form-control inputtext">
</td>
</div>
</div>
<div class="novedades">
<h4>News</h4>
<h6>_________________________________________________________</h6>
<span class="glyphicon glyphicon-inbox"> </span> &nbsp;You have no news at present
</div>
<div class="Noticias">
<h4>Today</h4>
<h6>_________________________________________________________</h6>

<span class="glyphicon glyphicon-euro"> </span> &nbsp; $2900 &nbsp; <span class="glyphicon glyphicon-arrow-up"> </span> 
</div>
</div>
 <div style="width:100%; background: #0C4391; height: 30px; margin-top:10px; padding-top:5px; border-radius:3px;color:#e2c60f; margin-bottom:1%; float:left; text-align: center;height:70px;color:white;">
        <span>Booking Routers &copy; 2015</span><br>
        Integrantes :<span class="glyphicon glyphicon-user" style="padding-top: 4px;"></span> Yilber Hernandez 
        <span class="glyphicon glyphicon-user" style="padding-top: 4px;"></span> Cristian Moreno 
        <span class="glyphicon glyphicon-user" style="padding-top: 4px;"></span> Sergio Stiven Urbiba
        <span class="glyphicon glyphicon-user" style="padding-top: 4px;"></span> Andres Feipe Guerrero<br>
        <img src="imagenes/dddd.png"><a href="menu1.jsp" style=" color: #ffffff; text-decoration: none;"  >English</a> --  <img src="imagenes/original.jpg"><a href="menu.jsp" style=" color: #ffffff; text-decoration: none;" >Spanish</a>

</div>
 <%
   }
 %>
</body>
</html>
