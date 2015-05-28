<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.ArrayList"%>
<%@page import="co.sena.edu.booking.DAO.personasDAO"%>
<%@page import="co.sena.edu.booking.DTO.personasDTO"%>
<!doctype html>
<html>
<head>

    
    <link type="text/css" rel="stylesheet" href="bootstrap-3.2.0-dist/bootstrap-3.2.0-dist/css/bootstrap.css">
<link type="text/css" rel="stylesheet" href="css/css.css">

	 <link rel="shortcut icon" href="imagenes/br.ico" />
         <script src="scripts/registro.js" type="text/javascript"></script>
         <script src="scripts/ingreso.js" type="text/javascript"></script>
         <script src="scripts/paginacion.js" type="text/javascript"></script>
         <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.1/jquery.min.js"></script>
<script type="text/javascript">
			$(document).ready(function() {
				$('#divTabla').buscoloquemesaledelospeones('inputFiltro');
			});
		</script>
         <script src="scripts/jquery_table.js" type="text/javascript"></script>

         <script src="scripts/bookasp.js" type="text/javascript"></script>
         <script src="scripts/smart-table.debug.js" type="text/javascript"></script>
         
<meta charset="utf-8">
<title>..::Booking Routers::..</title>
</head>
<body>
<div class ="contenedor">
<div class="banner"> 
<p><a href="Index.html"><img src="imagenes/Logo.png" alt="Booking Routers" width="1360" height="126" title="Forget the rest, call the best"  /></a></p>
</div>
    <nav>
    <ul id="main">
   <li><div align="center"><a href="Index.html" style="text-decoration: none;"><span class="glyphicon glyphicon-home"></span>Home</li></a>
   <li><div align="center"><a href="#" style="text-decoration: none;"><span class="glyphicon glyphicon-send"></span> Routes</a>
   <ul class="submain">
   <li><a href="CreaRuta1.jsp?msj=" style="text-decoration: none;">Creating Routes</a></li>
   <li><a href="ModRuta1.jsp?msj=" style="text-decoration: none;">Modify Routes</a> </li>
   </ul>
   </div>
       
   </li>
   
   <li><div align="center"><a href="#" style="text-decoration: none;"><span class="glyphicon glyphicon-folder-open"></span> Reports</a> 
    <ul class="submain">
    <li><div align="center"><a href="#" style="text-decoration: none;">Reservations</a> 
    <li><div align="center"><a href="#" style="text-decoration: none;">Routes</a>
    <li><div align="center"><a href="#" style="text-decoration: none;">Drivers</a> 
    <li><div align="center"><a href="listarPersonas.jsp" style="text-decoration: none;">Customers</a>
    <li><div align="center"><a href="ReporteM.jsp" style="text-decoration: none;">Report search</a> 
    </div>
     </li>
  </ul>
</li>
 </ul>
        </nav>
<center>
    <%
     personasDTO  per= new personasDTO();
     personasDAO pers = new personasDAO(); 
     ArrayList<personasDTO> misPersonas= new ArrayList();
     int numreg = pers.contarRegistros();
     int numpg = numreg/5;  
     int pg =0; //pagona a mostrar
     if(request.getParameter("pg")==null){
     pg=1;
     }else{
     pg=Integer.valueOf(request.getParameter("pg"));
     }
     misPersonas =(ArrayList<personasDTO>) pers.Paginacion(pg,5);      
     %>  
      
<div class="ba">
<h1><center>Registered</center></h1>
</div>
     <br>
     <div class="busqueda">
			<span style="font-weight:bold;">Search:&nbsp;</span>
			<input id="inputFiltro" type="text" />
		</div>
      <table border="1"  class="paginated" id="divTabla" >
          <thead>
          <tr id="titulo">
        <th st-ratio="20" st-sort="cedula">Document</th>
        <th st-ratio="20" st-sort="nombres">Name</th>
        <th st-ratio="20" st-sort="apellidos">Last Name</th>
        <th st-ratio="20" st-sort="fechanto">Date</th>
        <th st-ratio="20" st-sort="ciudad">City</th>
        <th st-ratio="20" st-sort="pais">Country</th>
        <th st-ratio="20" st-sort="telefono">Telephone</th>
        <th st-ratio="20" st-sort="correo">Mail</th>
        <th>Delete</th>
        <th>Check</th>
    </tr>
    </thead>
    <%
      for(personasDTO so: misPersonas){
          
      
    %>
    <tbody>
    <tr>
        <td data-sortable="true"><%=so.getIdPersona()%></td>
        <td data-sortable="true"><%=so.getNombres()%></td>
        <td data-sortable="true"><%=so.getApellidos()%></td>
        <td data-sortable="true"><%=so.getFechaNto()%></td>
        <td data-sortable="true"><%=so.getIdCiudad()%></td>
        <td data-sortable="true"><%=so.getIdNacionalidad()%></td>
        <td data-sortable="true"><%=so.getTelefono()%></td>
        <td data-sortable="true"><%=so.getCorreoElectronico()%></td>
        <td><a href="Controlador?id=<%=so.getIdPersona()%>"><img src="imagenes/Eliminar.png" align="middle" width="32" height="32" title="Eliminar"></a></td>
        <td><a href="Controlador?idPersona=<%=so.getIdPersona()%>"><img src="imagenes/user.jpg" align="middle" width="32" height="32" title="Verificar"></a></td>
    </tr>
     </tbody>
<%
}
%>
      </table>
<div class="pagination" id="">
     <%
     int adelanteA;
     if (request.getParameter("pg")==null) {
             adelanteA =1;
         }else{
     adelanteA =Integer.parseInt(request.getParameter("pg"));
     }
         
     %> 
    <a href="?pg=<%=adelanteA-1%>">&laquo</a>
    
    <%      
       for(int j=0;j<numpg+1;j++){
       %>  
       <a href="?pg=<%=j+1%>"><%=j+1 %></a>
 <%
     }
 %> 
<a href="?pg=<%=adelanteA+1%>">&raquo</a>
</div>
</center>
<div style="width:100%; background: #0C4391; height: 30px; margin-top:10px; padding-top:5px; border-radius:3px;color:#e2c60f; margin-bottom:1%; float:left; text-align: center;height:70px;color:white;">
        <span>Booking Routers &copy; 2015</span><br>
        Integrantes :<span class="glyphicon glyphicon-user" style="padding-top: 4px;"></span> Yilber Hernandez 
        <span classs="glyphicon glyphicon-user" style="padding-top: 4px;"></span> Cristian Moreno 
        <span class="glyphicon glyphicon-user" style="padding-top: 4px;"></span> Sergio Stiven Urbiba
        <span class="glyphicon glyphicon-user" style="padding-top: 4px;"></span> Andres Feipe Guerrero<br>
        <img src="imagenes/dddd.png"><a href="verificarRegistro1.jsp" style=" color: #ffffff; text-decoration: none;"  >English</a> --  <img src="imagenes/original.jpg"><a href="verificarRegistro.jsp" style=" color: #ffffff; text-decoration: none;" >Spanish</a>

</div>
</body>
<html>