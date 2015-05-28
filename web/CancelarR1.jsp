<%@page import="co.sena.edu.booking.DTO.empresatransportesDTO"%>
<%@page import="co.sena.edu.booking.DTO.serviciosDTO"%>
<%@page import="Controlador.FacadePersonas"%>
<%@page import="co.sena.edu.booking.DAO.reserDAO"%>
<%@page import="co.sena.edu.booking.DTO.personasDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="co.sena.edu.booking.DAO.personasDAO"%>
<%@page import="co.sena.edu.booking.DTO.reserDTO"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
 	 	<!doctype html>
<html>
<head>
<link type="text/css" rel="stylesheet" href="bootstrap-3.2.0-dist/bootstrap-3.2.0-dist/css/bootstrap.css">
<link type="text/css" rel="stylesheet" href="css/css.css">
<script src="scripts/registro.js" type="text/javascript"></script>
<meta charset="utf-8">
<link rel="shortcut icon" href="imagenes/br.ico" />
<title>..::Booking Routers::..</title>
</head>
<body>
<div class ="contenedor">
<div class="banner"> 
    <p><a href="Index1.jsp"><img src="imagenes/Logo.png" alt="Booking Routers" width="1360" height="126" title="Forget the rest, call the best"  /></a></p>
</div>
    <nav>
<ul id="main">
    <li><a href="Index1.jsp">Home</li></a>
       <li><a align="center" href="#" style="text-decoration: none;">Reservations</a>
                            <ul class="submain">
                                <li><a href="reserva1.jsp" style="text-decoration: none;">Request reserve</a></li>
                                <li><a href="CancelarR1.jsp" style="text-decoration: none;">Cancel reserve</a> </li>
                                <li><a href="ModificarReservas1.jsp" style="text-decoration: none;">Modify reserve</a> </li>
                                </ul>
                        </li>
                         <li><a align="center" href="#" style="text-decoration: none;">My account</a>
                            <ul class="submain">
                                <li><a href="actualizarDatos2.jsp" style="text-decoration: none;">My Imformation</a></li>
                                <li><a href="cambiarContraseña1.jsp" style="text-decoration: none;">Change Password</a> </li>
                                </ul>
                        </li>
      
        </ul>

</nav>
<center>
   <%
      HttpSession misesion = request.getSession(false);
      empresatransportesDTO t = new empresatransportesDTO();
      serviciosDTO se =new serviciosDTO(); 
      reserDTO  per= new reserDTO();
      FacadePersonas facadeP = new FacadePersonas();
      personasDTO persona = (personasDTO)misesion.getAttribute("logueado");
      ArrayList<reserDTO> misReservas= new ArrayList();      
      misReservas = (ArrayList) facadeP.listarReservaPer(persona.getIdPersona());
%>   
      <div class="ba">
      <h1>Reservations</h1>
      </div>
<table border="6" class="paginated" id="divTabla">
    <tr>
        <th style="background: #0C4391;">idReserve</th>
        <th style="background: #0C4391;">idStateReserve</th>
        <th style="background: #0C4391;">idService</th>
        <th style="background: #0C4391;">idTransportArrival</th>
        <th style="background: #0C4391;">Responsible</th>
        <th style="background: #0C4391;">Date Reserve</th>
        <th style="background: #0C4391;">Time Reserve</th>
        <th style="background: #0C4391;">Direction Destination</th>
        <th style="background: #0C4391;">Remove</th>
    </tr>
    <%
      for(reserDTO so: misReservas){
          
      
    %>
    <tr>
        <td><%=so.getIdReserva()%></td>
        <td><%=so.getIdEstadoReserva()%></td>
        <td><%=so.getIdServicio()%></td>
        <td><%=so.getIdTransporteLlegada()%></td>
        <td><%=so.getResponsable()%></td>
        <td><%=so.getFechaReserva()%></td>
        <td><%=so.getHoraReserva()%></td>
        <td><%=so.getDireccionDestino()%></td>
        
        <td><a href="Controlador1?idReserva=<%=so.getIdReserva()%>"><img src="imagenes/Eliminar.png" align="middle" width="32" height="32" title="Eliminar"></a></td>
    
    </tr>
    <%
    }
    %>
</table>
 <div style="width:100%; background: #0C4391; height: 30px; margin-top:10px; padding-top:5px; border-radius:3px;color:#e2c60f; margin-bottom:1%; float:left; text-align: center;height:70px;color:white;">
        <span>Booking Routers &copy; 2015</span><br>
        Integrantes :<span class="glyphicon glyphicon-user" style="padding-top: 4px;"></span> Yilber Hernandez 
        <span classs="glyphicon glyphicon-user" style="padding-top: 4px;"></span> Cristian Moreno 
        <span class="glyphicon glyphicon-user" style="padding-top: 4px;"></span> Sergio Stiven Urbiba
        <span class="glyphicon glyphicon-user" style="padding-top: 4px;"></span> Andres Feipe Guerrero<br>
        <img src="imagenes/dddd.png"><a href="CancelarR1.jsp" style=" color: #ffffff; text-decoration: none;"  >English</a> --  <img src="imagenes/original.jpg"><a href="CancelarR.jsp" style=" color: #ffffff; text-decoration: none;" >Spanish</a>

</div>

</table>
</main>

</body>
</html>
