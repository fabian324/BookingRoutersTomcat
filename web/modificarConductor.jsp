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
<meta charset="utf-8">
<link rel="shortcut icon" href="imagenes/br.ico" />
<title>..::Booking Routers::..</title>
<link type="text/css" rel="stylesheet" href="css/css.css">
<link rel="stylesheet" type="text/css" href="bootstrap-3.2.0-dist/bootstrap-3.2.0-dist/css/bootstrap.min.css"> 
<link type="text/css" rel="stylesheet" href="bootstrap-3.2.0-dist/bootstrap-3.2.0-dist/css/bootstrap.css">
<script src="scripts/registro.js" type="text/javascript"></script>
</head>
<body>
    <div class ="contenedor">
<div class="banner"> 
<p><a href="index.jsp"><img src="imagenes/Logo.png" alt="Booking Routers" width="1360" height="126" title="Forget the rest, call the best"  /></a></p>
</div>
      <nav> 
<ul id="main">
    <li><div align="center"><a href="verificarRegistro.jsp" style="text-decoration: none;"><span class="glyphicon glyphicon-home"></span> Inicio</a></div></li>
  <li><div align="center"><a href="#" style="text-decoration: none;"><span class="glyphicon glyphicon-send"></span> Gestion Rutas</a>
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
         int numreg = facadeP.contarReservas();
     int numpg = numreg/5;   
     int pg =0; 
     ArrayList<personasDTO> personas = new ArrayList();
      ArrayList<reserDTO> misReservas= new ArrayList();      
  personas = (ArrayList) facadeP.ListarUnConductor();
%>  
<center>
    <table>      
 <tr>
                                <td colspan="2" style="text-align: center">
                                    <% if (request.getParameter("msj") != null) {%>
                                    <% if (!request.getParameter("msj").equals("")) {%> 
                                    <div class="exito mensajes" role="alert">
                                        <%= request.getParameter("msj")%>
                                    </div>
                                    <% }%>   
                                    <% }%> 
                                </td>
                            </tr>
  </table>
 </center>  
<div class="ba">
      <h1> Mis Conductores</h1>
</div>
      <br>
<table borber="1" class="table table-bordered">
    <tbody>
    <tr>
       
        <th class="success">Documento</th>
        <th class="success">Nombre</th>
        <th class="success">Apellido</th>
        <th class="success">Correo Electronico</th>
        <th class="success">Telefono</th>
        <th class="success">Modificar</th>
       <th class="success">Eliminar</th>
    </tr>
   
    <%
      for(personasDTO so: personas){      
    %>
    <tr>
        <td><%=so.getIdPersona()%></td>
        <td><%=so.getNombres()%></td> 
        <td><%=so.getApellidos()%></td>
        <td><%=so.getCorreoElectronico()%></td>
        <td><%=so.getTelefono()%></td>
        
        <td><a href="modificarcond.jsp?idPersona=<%=so.getIdPersona()%>&nombreConductor=<%=so.getNombres()%>&apellidoConductor=<%=so.getApellidos()%>&correo=<%=so.getCorreoElectronico()%>&telefono=<%=so.getTelefono()%>&ciudad=<%=so.getCiu().getCiudad()%>&pais=<%=so.getNac().getNacionalidad()%>&sexo=<%=so.getSexo()%>&fechanac=<%=so.getFechaNto()%>"class="btn btn-success">Modificar</a></td>
         <td><a href="modificarAcompanantes?idPersona=<%=so.getIdPersona()%>"><img src="imagenes/Eliminar.png" onclick="return comfirmar()" align="middle" width="32" height="32" title="Eliminar"></a></td>
      
     </tbody>
    </tr>
    <%
    }
    %>
</table>


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
