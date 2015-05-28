<%@page import="Controlador.FacadePersonas"%>
<%@page import="co.sena.edu.booking.DTO.serviciosDTO"%>
<%@page import="co.sena.edu.booking.DTO.empresatransportesDTO"%>
<%@page import="java.sql.Array"%>
<%@page import="co.sena.edu.booking.DAO.reserDAO"%>
<%@page import="co.sena.edu.booking.DTO.personasDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="co.sena.edu.booking.DAO.personasDAO"%>
<%@page import="co.sena.edu.booking.DTO.reserDTO"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<link rel="shortcut icon" href="imagenes/br.ico" />
<link type="text/css" rel="stylesheet" href="css/css.css">
<link rel="stylesheet" type="text/css" href="bootstrap-3.2.0-dist/bootstrap-3.2.0-dist/css/bootstrap.min.css"> 
<link type="text/css" rel="stylesheet" href="bootstrap-3.2.0-dist/bootstrap-3.2.0-dist/css/bootstrap.css">
<link rel="shortcut icon" type="image/x-icon" href="img/code.ico">
<script src="scripts/registro.js" type="text/javascript"></script>
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
       background-image: url('img/exito.png');
       width: 1050px;
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
$(document).ready(function(){
       setTimeout(function(){ $(".mensajes").fadeIn(800).fadeOut(800);}, 4000); 
});
</script>
<title>..::Booking Routers::..</title>
</head>
<body>
    <div class ="contenedor">
<div class="banner"> 
<p><a href="index.jsp"><img src="imagenes/Logo.png" alt="Booking Routers" width="1360" height="126" title="Forget the rest, call the best"  /></a></p>
</div>
      <nav> 
<ul id="main">
    <li><div align="center"><a href="index.jsp" style="text-decoration: none;"><span class="glyphicon glyphicon-home"></span> Inicio</a></div></li>
  <li><div align="center"><a href="#" style="text-decoration: none;"><span class="glyphicon glyphicon-plane"></span> Reservas</a></div>
  <ul class="submain"> 
  <li><a href="reserva.jsp" style="text-decoration: none;">Solicitar Reserva</a></li>
  <li><a href="CancelarR.jsp" style="text-decoration: none;">Cancelar Reservas</a></li>
  </ul>
  </li>
  <li><div align="center"><a href="menuCliente.jsp" style="text-decoration: none;"><span class="glyphicon glyphicon-list-alt"></span> Menu</a></div></li>
  <li><a href="Controlador?action=logout"><span class="glyphicon glyphicon-remove-sign"></span> Cerrar sesion</a></li>
</ul>
  </nav>  
</div>
    <%
      HttpSession misesion = request.getSession(false);
      if(misesion.getAttribute("logueado") != null) {
      empresatransportesDTO t = new empresatransportesDTO();
      serviciosDTO se =new serviciosDTO();  
      reserDTO  per= new reserDTO();
      FacadePersonas facadeP = new FacadePersonas();
      personasDTO persona = (personasDTO)misesion.getAttribute("logueado");
      ArrayList<reserDTO> misReservas= new ArrayList();      
      misReservas = (ArrayList) facadeP.listarReservaPer(persona.getIdPersona());
%>  
<center>
    <table>      
    <tr>
    <td colspan="2">
                    <% if (request.getParameter("msgSalida") != null) {%>
                    <% if (!request.getParameter("msgSalida").equals("")) {%> 
                    <div class="exito mensajes" role="alert">
                    <%= request.getParameter("msgSalida")%>
                    </div>
                    <%}%>
                    <%}%> 
      </td>
  </tr>
  </table>
 </center>  
<div class="ba">
      <h1> Mis Reservas</h1>
</div>
      <br>
<table borber="1" class="table table-bordered">
    <tbody>
    <tr>
       
        <th class="success">Servicio</th>
        <th class="success">Transporte Llegada</th>
        <th class="success">Responsable</th>
        <th class="success">Fecha Reserva</th>
        <th class="success">Hora Reserva</th>
        <th class="success">Direccion Destino</th>
        <th class="success">Acompañantes</th>
        <th class="success">Modificar</th>
        <th class="success">Acompañantes</th>
    </tr>
   
    <%
      for(reserDTO so: misReservas){      
    %>
    <tr>
        <td><%=so.getSer().getServicio()%></td>
        <td><%=so.getEmpre().getNombreEmpresaTransporte()%></td>
        <td><%=so.getResponsable()%></td>
        <td><%=so.getFechaReserva()%></td>
        <td><%=so.getHoraReserva()%></td>
        <td><%=so.getDireccionDestino()%></td>
        <td><%=so.getCupo()%></td>
        
        <td><a href="modificarReserva.jsp?idReserva=<%=so.getIdReserva()%>&idServicio=<%=so.getSer().getServicio()%>&IdTransporteLlegada=<%=so.getEmpre().getNombreEmpresaTransporte()%>
        &Responsable=<%=so.getResponsable()%>&FechaReserva=<%=so.getFechaReserva()%>&HoraReserva=<%=so.getHoraReserva()%>&DireccionDestino=<%=so.getDireccionDestino()%>&cupo=<%=so.getCupo()%>"> <img src="imagenes/Modificar.png" align="middle" width="32" height="32" title="Verificar"></a></td>
       
        <td><a href="listarAcompanates.jsp?idReserva=<%=so.getIdReserva()%>" class="btn btn-success" title="Modificar datos de acompañantes">Modificar</a></td>
     </tbody>
    </tr>
    <%
    }
    %>
</table>
<br>
<br>
<br>
<br>
<br>
<br>
<div style="width:100%; background: #0C4391; height: 30px; margin-top:10px; padding-top:5px; border-radius:3px;color:#e2c60f; margin-bottom:1%; float:left; text-align: center;height:70px;color:white;">
        <span>Booking Routers &copy; 2015</span><br>
        Integrantes :<span class="glyphicon glyphicon-user" style="padding-top: 4px;"></span> Yilber Hernandez 
        <span class="glyphicon glyphicon-user" style="padding-top: 4px;"></span> Cristian Moreno 
        <span class="glyphicon glyphicon-user" style="padding-top: 4px;"></span> Sergio Stiven Urbiba
        <span class="glyphicon glyphicon-user" style="padding-top: 4px;"></span> Andres Feipe Guerrero<br>
        <img src="imagenes/dddd.png"><a href="ModificarReservas1.jsp" style=" color: #ffffff; text-decoration: none;"  >English</a> --  <img src="imagenes/original.jpg"><a href="ModificarReservas.jsp" style=" color: #ffffff; text-decoration: none;" >Spanish</a>

</div>
<%
       }else{
       response.sendRedirect("index.jsp");
         }
       %>
</body>
</html>
