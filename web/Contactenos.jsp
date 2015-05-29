
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<link rel="shortcut icon" href="imagenes/br.ico" />
<title>Booking Routers</title>
<link type="text/css" rel="stylesheet" href="bootstrap-3.2.0-dist/bootstrap-3.2.0-dist/css/bootstrap.css">
<link type="text/css" rel="stylesheet" href="css/css.css">
<link type="text/css" rel="stylesheet" href="css/styles/glDatePicker.default.css">
<link type="text/css" rel="stylesheet" href="sweetalert-master/dist/sweetalert.css" />
<script src="css/styles/glDatePicker.min.js" ></script>
<script type="text/javascript" src="js/jquery-1.11.2.min.js"></script>
<script src="bootstrap-3.2.0-dist/bootstrap-3.2.0-dist/js/bootstrap.js"></script>
<script>
$(function () {
  $('[data-toggle="popover"]').popover()
})
</script>
<style type="text/css">
    span:hover{
        cursor:pointer
    } 
    span.ayudas{       
        position:relative;
        top:-40px;
      
    }
</style>
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
<li>
<div align="center" ><a href="registro.jsp" style="text-decoration: none;"><span class="glyphicon glyphicon-edit"></span>Registrate</a>
</div>
</li>	
<li>
<div align="center" ><a href="ingreso.jsp" style="text-decoration: none;"><span class="glyphicon glyphicon-user"></span> Ingresar</a>
</div>
</li>
</ul>
</nav> 
</div>
<center>
             <div class="ba">
                        <center><h1>Contactenos</h1></center>
                    </div>
            <div style=" background: #DDDDDD;  text-align: center; border-radius: 15; padding-top: 5px; border-radius: 15px; " class="popo">
                        <a href="index.jsp" style="color:black; text-decoration: none;">Inicio</a>
                        <a href="registro.jsp" style="color: black; text-decoration: none;">Contactenos</a>
                    </div>  
    <br>
    <div class="col2" style="border:#AB9C9D solid; border-radius:15px; box-shadow: 2px 3px 3px #332727"> 
            <form name="" action="contactenos" method="post" id="form1" class="contacto"> 
             <table width="744" align="center"><br>
                    <tr>
                        <td><label for="emal" class="labele"><strong>Tu Email<font color="#FF0000">*</strong></label></td>
                        <td><input name="emal" type="email" style="width:250px; height:30px" autofocus id="doc" placeholder="Correo" required class="form-control inputtext"  minlenght=8 tabindex="2"></td>    
                    </tr>
                    <tr>
                        <td><label for="cCuerpo" class="labele"><strong>Mensaje<font color="#FF0000" >*</strong></label></td>
                        <td><textarea rows="6" name="cCuerpo" tabindex="4"></textarea>
                            <span class="glyphicon glyphicon-question-sign ayudas" data-container="body"data-toggle="popover"data-placement="right"data-content="Escriba cualquier inquietud, reclamo o sugerencia que desee."></span></td>    
                    </tr>
                    <tr>
                        <td><input type="submit" name="enviar"  id="enviar" class="btn btn-success"  value="Enviar" style="position:relative; left:280px" tabindex="5">
                 </tr>
                 
             </table>
            </form> 
    </div>
</center> 
<div style="width:100%; background: #0C4391; height: 30px; margin-top:10px; padding-top:5px; border-radius:3px;color:#e2c60f; margin-bottom:1%; float:left; text-align: center;height:70px;color:white;">
                                <span>Booking Routers &copy; 2015</span><br>
                                Integrantes :<span class="glyphicon glyphicon-user" style="padding-top: 4px;"></span> Yilber Hernandez 
                                <span class="glyphicon glyphicon-user" style="padding-top: 4px;"></span> Cristian Moreno 
                                <span class="glyphicon glyphicon-user" style="padding-top: 4px;"></span> Sergio Stiven Urbiba
                                <span class="glyphicon glyphicon-user" style="padding-top: 4px;"></span> Andres Feipe Guerrero<br>
                                <img src="imagenes/dddd.png"><a href="reserva1.jsp" style=" color: #ffffff; text-decoration: none;"  >English</a> --  <img src="imagenes/original.jpg"><a href="reserva.jsp" style=" color: #ffffff; text-decoration: none;" >Spanish</a>

                            </div>
</body>
</html>
