  
<%@page import="Controlador.FacadePersonas"%>
<%@page import="co.sena.edu.booking.DAO.personasDAO"%>
<%@page import="co.sena.edu.booking.DTO.personasDTO"%> 	 
<%@page import="co.sena.edu.booking.DAO.empresatransportesDAO"%>
<%@page import="co.sena.edu.booking.DAO.lugararrivosDAO"%>
<%@page import="co.sena.edu.booking.DTO.empresatransportesDTO"%>
<%@page import="co.sena.edu.booking.DTO.lugararrivosDTO"%>
<%@page import="java.util.ArrayList"%>

<html>
<head>
     <%
            response.setHeader("Cache-Control", "no-cache");
            response.setHeader("Cache-Control", "no-store");
            response.setDateHeader("Expires", 0);
        %>
<meta charset="utf-8">
<link rel="shortcut icon" href="imagenes/br.ico" />
<link type="text/css" rel="stylesheet" href="bootstrap-3.2.0-dist/bootstrap-3.2.0-dist/css/bootstrap.css">
<link type="text/css" rel="stylesheet" href="css/css.css">
<link type="text/css" rel="stylesheet" href="css/styles/glDatePicker.default.css">
<link type="text/css" rel="stylesheet" href="sweetalert-master/dist/sweetalert.css" />
<script src="css/styles/glDatePicker.min.js" ></script>
<script src="css/styles/glDatePicker.js" ></script>
<script src="sweetalert-master/dist/sweetalert.min.js"></script>
<script src="scripts/reservas.js" type="text/javascript"></script>
<script src="js/Funciones.js" type="text/javascript"></script>
<script type="text/javascript" src="js/jquery-1.11.2.min.js"></script>
<script src="scripts/reservas.js" type="text/javascript"></script>
<script src="bootstrap-3.2.0-dist/bootstrap-3.2.0-dist/js/bootstrap.js"></script>
<style type="text/css">
    
    .errormsg {
  margin: .5em 0 0;
  display: block;
  color: #dd4b39;
  line-height: 17px;
  }
    span:hover{
        cursor:pointer
    } 
    span.ayuda{       
        position:relative;
        left:270px;
        top:-20px;
    }
    span.ayudas{       
        position:relative;
        left:30px;
        top:40px;
    }
</style> 
<script type="text/javascript">
$(document).ready(function(){
       setTimeout(function(){ $(".mensajes").fadeIn(800).fadeOut(800);}, 3500); 
});
</script>
<script>
$(function () {
  $('[data-toggle="popover"]').popover()
})
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
            <li><div align="center"><a href="#" style="text-decoration: none;"><span class="glyphicon glyphicon-plane"></span> Reservas</a>
                            <ul class="submain">
                                <li><a href="CancelarR.jsp" style="text-decoration: none;">Cancelar Reserva</a></li>
                                <li><a href="ModificarReservas.jsp" style="text-decoration: none;">Modificar Reserva</a> </li>
                                </ul>
                </div>
                        </li>
                        <li><div align="center"><a href="menuCliente.jsp" style="text-decoration: none;"><span class="glyphicon glyphicon-list-alt"></span> Menu</a></div></li>
                       <li><a href="Controlador?action=logout"><span class="glyphicon glyphicon-remove-sign"></span> Cerrar sesion</a></li>  
        </ul>
    </nav> 
<%
            HttpSession misesion = request.getSession(false);

            if (misesion.getAttribute("logueado") != null) {
                personasDTO pdto = null;
                personasDTO persona = null;
                FacadePersonas facadeP = new FacadePersonas();
                personasDAO pdao = new personasDAO();
                pdto =(personasDTO) misesion.getAttribute("logueado");
               //String mgs =misesion.getAttribute("logueado").toString();
                persona = facadeP.ListarUnaPersona(pdto.getIdPersona());


        %>
<div class="ba">
<h1><center>Generar Reservas</center></h1>
</div>
<br>
<div class="col2" style="border:#AB9C9D solid; border-radius:15px; box-shadow: 2px  3px 3px#332727">  
<form name="form1" action="Reserva" method="post" > 
<table width="744" align="center" id="registro">

    <br>
   
    <center>
    <%
                        if(request.getParameter("noo") != null) {
                        %>
                        <div>
                            <b <div class="alert alert-danger mensajes" role="alert">Usted no puede realizar mas de 5 reservas.</b>
                      </div>
                        <%
                         }
                        %>  
                        </center>
                        <br>
<tr>    
<td><label for="doc" class="labele"><strong>Documento del usuario</strong></label></font></td>
<td><input name="doc" type="text" id="res" value="<%=persona.getIdPersona()%>" style="width:250px; height:25px" readonly="readonly" autofocus required class="form-control inputtext">
<td><label for="res" class="labele"><strong>Titular de la Reserva<font color="#FF0000">*</strong></label></td>
<td><input name="res" type="text" id="res" style="width:250px; height:25px" onChange="requisitos(res)" autofocus  required class="form-control inputtext" >    
<span class="glyphicon glyphicon-question-sign ayuda" data-container="body"data-toggle="popover"data-placement="bottom"data-content="Persona responsable de la reserva"></span></td>
</td>   
</tr>

<tr>
<td><label for="OrigenPais" class="labele"><strong>Origen Pais<font color="#FF0000">*</strong></label></td>
<td>   
    <select  id="OrigenPais" name="OrigenPais" id="OrigenPais" autofocus required class="form-control inputtext" list="servis" tabindex="9" style="width:250px; height:35px" onChange="requisitos(OrigenPais)">   
      <option value="">Escoja su país</option>
      <option value="Colombia">Colombia</option>
      <option value="Argentina">Argentina</option>
      <option value="Brazil">Brazil</option>
      <option value="Venezuela">Venezuela</option>
      <option value="Ecuador">Ecuador</option>
      <option value="Chile">Chile</option>
      <option value="Peru">Peru </option>
      <option value="España">España</option>
      <option value="Italia">Italia</option>
      <option value="Japon">Japon</option>
      <option value="Inglaterra">Inglaterra</option>
      <option value="Alemania">Alemania</option>
      
      </select> 
 </td>
</select>                                        
<td><label for="DestinoPais" class="labele"><strong>Destino Pais<font color="#FF0000">*</strong></label></td>
<td>   
      <select name="DestinoPais" id="DestinoPais" style="width:250px; height:35px" autofocus required class="form-control inputtext" list="aero" onChange="requisitos(DestinoPais)">
          
          <option value="Florida">Florida</option>
 
      </select> 
 </td>
</tr>

<tr>                                       
<td><label for="aer" class="labele"><strong>Aerolineas<font color="#FF0000">*</strong></label></td>
<td>   
      <select name="aer" id="aer" style="width:250px; height:35px" autofocus required class="form-control inputtext" list="aero" onChange="requisitos(aer)">
          <option value=""></option>
          <%
                                    empresatransportesDAO cdao = new empresatransportesDAO();
                                    ArrayList<empresatransportesDTO> Ciud = new ArrayList();
                                    Ciud = (ArrayList) cdao.listarEmpresaTransportesPais();
                                    for (empresatransportesDTO cdto : Ciud) {
                                %>
          <option value="<%=cdto.getIdEmpresaTransporte()%>"> <%=cdto.getNombreEmpresaTransporte()%></option>
          <%
                                    }
                                %>
      </select> 
 </td>
 </td><td><label for="NumeroV" class="labele"><strong>Numero Vuelo</strong></label></font></td>
<td><input name="NumeroV" type="text" id="NumeroV" style="width:250px; height:25px"  autofocus required class="form-control inputtext" onChange="requisitos(NumeroV)">
    
</tr>



<tr>


<td><label for="aerop" class="labele">Aeropuesto Destino<font color="#FF0000">*</label></td>
<td>
    <select type="time" name="aerop" id="aerop" style="width:250px; height:30px"  autofocus  required class="form-control inputtext" onChange="requisitos(aerop)">
      <option value="">Escoja su aeropuerto destino---></option>  
      <option value="Fort Louderdale">Fort Louderdale</option>      
      <option value="Miami International Airport">Miami International Airport</option>
                    
    </select>

</td>

<td><label for="registros" class="labele">Numero de Acompañantes</label><br></td>
<td><select  id="registros" name="registros"  autofocus required class="form-control inputtext" list="servis" tabindex="9" style="width:250px; height:35px" onChange="requisitos(registros)">
      <option value="">---></option>  
      <option value="0">Ninguna ---></option>      
      <option value="1">1 Persona</option>
      <option value="2">2 Personas</option>
      <option value="3">3 Personas</option>
      <option value="4">4 Personas</option>
      <option value="5">5 Personas</option>
      <option value="6">6 Personas</option>
      
      </select> </td>

</tr>
<td><span class="glyphicon glyphicon-question-sign ayudas" data-container="body"data-toggle="popover"data-placement="bottom"data-content="Cantidad total de equipaje incluyento el de acompañanantes"></span>
<label for="NumeroEquipaje" class="labele">Numero de Equipajes</label><br></td>
<td><select  id="NumeroEquipaje" name="NumeroEquipaje" id="ser" autofocus required class="form-control inputtext" list="servis" tabindex="9" style="width:250px; height:35px" onChange="requisitos(NumeroEquipaje)">
      <option value=""> ---></option>
      <option value="0">Ninguna ---></option>      
      <option value="1">1 Maleta</option>
      <option value="2">2 Maletas</option>
      <option value="3">3 Maletas</option>
      <option value="4">4 Maletas</option>
      <option value="5">5 Matelas</option>
      <option value="6">6 Maletas</option>
      
      </select> </td>
      
      <td><label for="ser" class="labele"><strong>Servicio<font color="#FF0000">*</strong></label></td>
<td><select name="ser" id="ser" autofocus required class="form-control inputtext" list="servis" tabindex="9" style="width:250px; height:35px" onChange="requisitos(ser)">
    <option value="">Escoja su el servicio que desea ---></option>      
      <option value="1">Aeropuerto y Centros de aviación Jet</option>
      <option value="2">Puerto y barco de cruceros de Transporte</option>
      <option value="3">Hotel y museo</option>
      <option value="4">Trabajo</option>
      <option value="5">Eventos</option>
      <option value="6">Turs</option>
      <option value="7">Vacaciones </option>      
      </select> 
    <span class="glyphicon glyphicon-question-sign ayuda" data-container="body"data-toggle="popover"data-placement="bottom"data-content="Escoja el servicio que mas se acomode a su nesecidad"></span>
 </td>      
<tr>    

<td><label for="fechNac" class="labele">Fecha de Reserva<font color="#FF0000">*</label></td>
<td><input type="date" id="fecNac" name="fecNac" style="width:250px; height:25px"  required="" value="30-12-1900" class="form-control inputtext" tabindex="4" onChange="requisitos(fecNac)" onblur="javascript:validarFecha()"><br></td>
<div id="result" class="mensajegError"></div>
<td><label for="hora" class="labele">Hora de Vuelo<font color="#FF0000">*</label></td>
<td><input type="time" name="hora" id="hora" style="width:250px; height:25px" class="form-control" required onChange="requisitos(hora)"></td>
</tr> 
<tr>

</tr>
<tr>
<td><input type="submit" name="registroR"  id="registro" class="btn btn-success"  value="Generar Reserva" onclick="validar(registro)" style="position:relative; left:330px">
</td>
</tr>
</table>
</form>
</div>
</div>
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



