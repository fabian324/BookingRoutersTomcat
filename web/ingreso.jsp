<!doctype html>
<html>
<head>
<meta charset="utf-8" />
<title>Booking Routers</title>
<link type="text/css" rel="stylesheet" href="bootstrap-3.2.0-dist/bootstrap-3.2.0-dist/css/bootstrap.css">
<link type="text/css" rel="stylesheet" href="css/css.css" />
<link rel="shortcut icon" href="imagenes/br.ico" />
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
<div class ="contenedor"></div>
 <div class="banner">
     <p><a href="index.jsp"><img src="imagenes/Logo.png" alt="Bookin Routers" width="1360" height="126" title="Forget the rest, call the best" /></a></p>
 </div>
<nav> 
<ul id="main"> 
    <li> <div align="center"> <a href="index.jsp" style="text-decoration:none;"><span class="glyphicon glyphicon-home"></span> Inicio</a>
 </div>
</li>
<li>
    <div align="center"> <a href="RecuperarContra.jsp" style="text-decoration:none;">¡Olvido contraseña!</a>
</div>
</li>
</ul>
    </nav> 
<center>

<table id="registro">
<div class="ba">
<h1>Ingreso Usuarios Registrados</h1>
</div>
     <div style=" background:#DDDDDD;  text-align: center; border-radius: 15; padding-top: 5px; border-radius: 15px; ">
                                  <a href="index.jsp" style="color:black; text-decoration: none;">Inicio</a>
                                  -->
                                  <a href="registro.jsp" style="color: black; text-decoration: none;">Ingreso</a>
     </div><br>
<form name="form1" action="login" method="post" >      
<label for="usu" class="labele"><strong>Cedúla<font color="#FF0000">*</strong></label></font>
<input name="idPersona" type="text" style="width:250px; height:25px " autofocus id="usu" placeholder="usuario" required class="form-control inputtext"  onChange="requisitos(nombre)" minlenght=3>

<br>
<label for="con" class="labele"><strong>Contraseña<font color="#FF0000">*</strong></label></font>
<input name="contraseña" type="password" style="width:250px; height:25px " required id="con" placeholder="*******" required class="form-control inputtext"  minlenght=3>
<br>
<input name="submit10" class="btn btn-success"  type="submit" id="submit10" onClick= "rol()" value="Ingresar">
</form>
</table>

</center>
<center>
    <table>
        <tr>
            <td colspan="2">
<%
 if(request.getParameter("invalida") != null  ) {
%>
<div class="error mensajes" >
    <b> Usted no esta registrado </b>
</div>
<%
 }
%>
        </tr>
    </table>
</center>
 <div class="idioma">
        <span>Booking Routers &copy; 2015</span><br>
        Integrantes :<span class="glyphicon glyphicon-user" style="padding-top: 4px;"></span> Yilber Hernandez 
        <span class="glyphicon glyphicon-user" style="padding-top: 4px;"></span> Cristian Moreno 
        <span class="glyphicon glyphicon-user" style="padding-top: 4px;"></span> Sergio Stiven Urbiba
        
       <span class="glyphicon glyphicon-user" style="padding-top: 4px;"></span> Andres Feipe Guerrero<br>
       <img src="imagenes/dddd.png"><a href="ingreso1.jsp" style=" color: #ffffff; text-decoration: none;"  >English</a> --  <img src="imagenes/original.jpg"><a href="ingreso.jsp" style=" color: #ffffff; text-decoration: none;" >Spanish</a>
   
 </div>
</body>
</html>