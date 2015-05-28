<%@page import="co.sena.edu.booking.DTO.personasDTO"%>
<%@page import="co.sena.edu.booking.DTO.reserDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="co.sena.edu.booking.DTO.personareservaDTO"%>
<%@page import="Controlador.FacadePersonas"%>
<html>
<head>
<meta charset="utf-8">
<link rel="shortcut icon" href="imagenes/br.ico" /> 
<link type="text/css" rel="stylesheet" href="bootstrap-3.2.0-dist/bootstrap-3.2.0-dist/css/bootstrap.css">
<link type="text/css" rel="stylesheet" href="css/css.css">
<script type="text/javascript" src="js/jquery-1.2.6.js"></script>
<script src="js/jquery.dataTables.min.js" type="text/javascript"></script>
<link type="text/css" rel="stylesheet" href="js/jquery.dataTables.min.css">

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
table th, td{
    text-align:center;
}
</style>
        <script type="text/javascript" src="js/jquery-1.2.6.js"></script>
<script type="text/javascript">
$(document).ready(function(){
       setTimeout(function(){ $(".mensajes").fadeIn(800).fadeOut(800);}, 4000); 
});
</script>
  <script type="text/javascript">
    function comfirmar()
    {
        if(confirm('Esta seguro que desea eliminar esta reserva'))
            return true;
        
        else
            return  false;
    }
    
</script>
<body>
<div class ="contenedor">
<div class="banner"> 
    <p><a href="index.jsp"><img src="imagenes/Logo.png" alt="Booking Routers" width="1360" height="126" title="Forget the rest, call the best"  /></a></p>
</div>
</div>
    <nav>
<ul id="main">
    <li><a href="index.jsp" style="text-decoration: none;"><span class="glyphicon glyphicon-home"></span> Inicio</a></li>
        <li><a href="#" style="text-decoration: none;"><span class="glyphicon glyphicon-plane"></span> Reservas</a>
                            <ul class="submain">
                                <li><a href="reserva.jsp" style="text-decoration: none;">Solicita Reserva</a></li>
                                <li><a href="ModificarReservas.jsp" style="text-decoration: none;">Modificar Reserva</a> </li>                               
                                </ul>
                        </li>
                          <li><a href="menuCliente.jsp"><span class="glyphicon glyphicon-list-alt"></span> Mi Cuenta</a>
                        </li>
      <li><a href="Controlador?action=logout"><span class="glyphicon glyphicon-remove-sign"></span> Cerrar sesion</a></li>
        </ul>
</nav>
<br>
 <%
      HttpSession misesion = request.getSession(false); 
       if(misesion.getAttribute("logueado") != null) {
      FacadePersonas facadeP = new FacadePersonas();
      personasDTO reserva = (personasDTO)misesion.getAttribute("logueado");
      ArrayList<personareservaDTO> misReservas= new ArrayList();      
      misReservas = (ArrayList) facadeP.listarAcompañantes(Integer.parseInt(request.getParameter("idReserva")));
%>  
<% if(misReservas.isEmpty() ){
%>
<span>vacio</span>
<% }%>
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
      <h1>Modificar Reservas</h1>
      </div>
      <center>
      <br>
     <table borber="1" class="table table-bordered">
     <tbody>
        <tr>
        <th class="success">Nombre</th>
        <th class="success">Apellido</th>
        <th class="success">Telefono</th>
        <th class="success">Fecha Nacimiento</th>
        <th class="success">Modificar</th>
        <th class="success">Eliminar</th>
        
    </tr>
    <%
      for(personareservaDTO so: misReservas){      
    %>
    <tr>
        <td><%=so.getNombres()%></td>       
        <td><%=so.getApellidos()%></td>
        <td><%=so.getTelefono()%></td>
        <td><%=so.getFechaNaci()%></td>
       
        <td><a href="modificarAcompanantes.jsp?idreservaPorPersona=<%=so.getIdreservaPorPersona()%>&nombres=<%=so.getNombres()%>&apellidos=<%=so.getApellidos()%>&telefono=<%=so.getTelefono()%>&idReserva=<%=so.getIdReserva()%>&fechaNac=<%=so.getFechaNaci()%>"
        class="btn btn-success" title="Modificar datos de acompañantes">Modificar</a></td>
       <td><a href="modificarAcompanantes?idReserva=<%=so.getIdreservaPorPersona()%>"><img src="imagenes/Eliminar.png" onclick="return comfirmar()" align="middle" width="32" height="32" title="Eliminar"></a></td>
        
    </tr> 
   </tbody>
    <%
    }
    %>
</table>
</center>
 <div style="width:100%; background: #0C4391; height: 30px; margin-top:10px; padding-top:5px; border-radius:3px;color:#e2c60f; margin-bottom:1%; float:left; text-align: center;height:70px;color:white;">
        <span>Booking Routers &copy; 2015</span><br>
        Integrantes :<span class="glyphicon glyphicon-user" style="padding-top: 4px;"></span> Yilber Hernandez 
        <span class="glyphicon glyphicon-user"  style="padding-top: 4px;"></span> Cristian Moreno 
        <span class="glyphicon glyphicon-user" style="padding-top: 4px;"></span> Sergio Stiven Urbina
        <span class="glyphicon glyphicon-user" style="padding-top: 4px;"></span> Andres Feipe Guerrero<br>
        <img src="imagenes/dddd.png"><a href="CancelarR1.jsp" style=" color: #ffffff; text-decoration: none;"  >English</a> --  <img src="imagenes/original.jpg"><a href="CancelarR.jsp" style=" color: #ffffff; text-decoration: none;" >Spanish</a>

</div>
<%
       }else{
       response.sendRedirect("index.jsp");
         }
       %>
</body>
</html>
