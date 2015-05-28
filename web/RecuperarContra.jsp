<!doctype html>
<html>
<head>
<meta charset="utf-8" />
<title>Booking Routers</title>
<link type="text/css" rel="stylesheet" href="bootstrap-3.2.0-dist/bootstrap-3.2.0-dist/css/bootstrap.css">
<link type="text/css" rel="stylesheet" href="css/css.css" />
<!--<link type="text/css" rel="stylesheet" href="font-awesome.css">//-->
<link rel="shortcut icon" href="imagenes/br.ico" />
<!-- Start WOWSlider.com HEAD section -->
<link rel="stylesheet" type="text/css" href="engine1//style.css" media="screen" />
	<script type="text/javascript" src="engine1//jquery.js"></script>
<!-- End WOWSlider.com HEAD section -->
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
$(document).ready(function(){
       setTimeout(function(){ $(".mensajes").fadeIn(800).fadeOut(800);}, 4000); 
});
</script>

</head>

<body>
<div class ="contenedor">
<div class="banner"> 
<p><a href="index.jsp"><img src="imagenes/Logo.png" alt="Booking Routers" width="1360" height="126" title="Forget the rest, call the best"  /></a></p>
</div>
<nav> 
    <ul id="main"> 
<li>
    <div align="center" ><a href="index.jsp" style="text-decoration: none;"><span class="glyphicon glyphicon-home"></span> Inicio</a>
</div>
</li>	
</ul>
    </nav> 
<center>
<form name="form1" action="EnviarCorreos" method="post" > 

<div class="ba">
<h1>Recuperar Contraseña</h1>
</div>
<label for="correo" class="labele"><strong>Correo</strong><font color="#FF0000">*</label>
<input name="correo" type="email"  style="width:250px; height:30px " autofocus id="correo" placeholder="Correo Electronico" required class="form-control inputtext"  >

<br>
<input name="submit10" class="btn btn-success" type="submit" id="submit10"  value="Enviar">
<center>
    <table>      
    <tr>
    <td colspan="2">
                    <% if (request.getParameter("ms") != null) {%>
                    <% if (!request.getParameter("ms").equals("")) {%> 
                    <div class="exito mensajes" role="alert">
                        <%= request.getParameter("ms")%>
                    </div>
                    <%}%>
                    <%}%> 
      </td>
  </tr>
  </table>
 </center>     
</form>
</center>    
</html>