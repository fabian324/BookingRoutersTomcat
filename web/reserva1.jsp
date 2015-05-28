 	 	<!doctype html>
<html>
<head>
<link type="text/css" rel="stylesheet" href="bootstrap-3.2.0-dist/bootstrap-3.2.0-dist/css/bootstrap.css">
<link type="text/css" rel="stylesheet" href="css/css.css">
<script src="scripts/registro.js" type="text/javascript"></script>
<script src="js/FuncionesIngles.js" type="text/javascript">
    
    function validarFechaIn() {
    var temp = document.getElementById("fecNac").value;
    var y = temp.split("-")
    var fechaSolicitud=new Date(y[0],y[1]-1,y[2]); // se forma la fecha que viene del formulario
    var fechaActual = new Date();   //Fecha actual
    var ftemp = new Date(); // Variable con la fecha actual
     var ftemp2 = new Date();
    var fechaMinima = new Date(ftemp.getTime() + (5 * 24 * 3600 * 1000));   //Sumo 5 dias a la fecha actual para obtener la fecha mínima
    var fechaMaxima = new Date (ftemp2.getTime() + (30 * 24 * 3600 * 1000));  // sumo 30 días a la fecha actual para

   //alert("Actual  : "+fechaActual + "  fecha calendario : "+fechaSolicitud+ "la fecha mínima es : "+fechaMinima);

    if (fechaSolicitud < fechaActual){
        document.getElementById("result").innerHTML="Esta seleccionando una fecha anterior a la actual";
        document.getElementById("fecNac").focus();
    } else if (fechaSolicitud >= fechaActual && fechaSolicitud <fechaMinima){
        document.getElementById("result").innerHTML="En ese tiempo no se alcanzaa tenr el pedido";
        document.getElementById("fecNac").focus();
    }else if(fechaSolicitud >=fechaMaxima){
       document.getElementById("result").innerHTML="NO hacemos pedidos con tanta Anticipacicion";
       document.getElementById("fecNac").focus();
    }else{
        document.getElementById("result").innerHTML="ok";
    }

}
</script>
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
<ul id="main">
    <li><div align="center"><a href="index1.html" style="text-decoration: none;"><span class="glyphicon glyphicon-home"></span> Home</li></a>
            <li><a align="center"><a href="#" style="text-decoration: none;"><span class="glyphicon glyphicon-plane"></span> Reservations</a>
                            <ul class="submain">
                                <li><a href="reserva1.jsp" style="text-decoration: none;">Request reservation</a></li>
                                <li><a href="CancelarR1.JSP" style="text-decoration: none;">My reservations</a> </li>
                                </ul>
                        </li>
                        <li><div align="center"><a href="menu1.jsp" style="text-decoration: none;"><span class="glyphicon glyphicon-list-alt"></span> Main</a>
                            <ul class="submain">
                                <li><a href="actualizarDatos1.jsp" style="text-decoration: none;">My data</a></li>
                                <li><a href="cambiarContraseña1.jsp" style="text-decoration: none;">Change password</a> </li>
                                </ul>
                        </li>              
        </ul>
    </nav> 


<form name="form1" action="Reserva1" method="post" > 
<table width="744" align="center" id="registro">
    <div class="ba">
        <h1><center>Reservations</center></h1>
    </div>

<tr>
<td><label for="ser" class="labele"><strong>Service<font color="#FF0000">*</strong></label></font></td>
<td><input name="ser" id="ser" style="width:250px; height:35px" placeholder="Select service" autofocus required class="form-control inputtext" list="servis" tabindex="9" size="30">   
      <datalist id="servis">     
      <option value="Airport and Jet Aviation Centers">1</option>
      <option value="Port and Cruise Ship Transportation">2</option>
      <option value="Transfer">3</option>
      <option value="By the Hour">4</option>
      <option value="Events">5</option>
      <option value="Tours">6</option>
      <option value="Atraccions Vacation Ideas">7</option>
      </datalist> 
 </td>
</select>                                        
<td><label for="aer" class="labele"><strong>Airlines<font color="#FF0000">*</strong></label></font></td>
<td><input name="aer" id="aer" style="width:250px; height:35px" placeholder="Select airline" autofocus required class="form-control inputtext" list="aero">   
      <datalist id="aero">
      <option value="Avianca">Avianca</option>
      <option value="LAN">LAN</option>
      <option value="US Airways">US Airways</option>
      <option value="American Airlin">American Airline</option>
      </datalist> 
 </td>
</tr>
<tr>
<td><label for="res" class="labele"><strong>Responsible for<font color="#FF0000">*</strong></label></font></td>
<td><input name="res" type="text" id="res" style="width:250px; height:25px" placeholder="Responsible for" autofocus  required class="form-control inputtext"></td>   
<td><label for="fecNac"><strong>Date  Reservation<font color="#FF0000">*</strong></label></td>
<td><input type="date" id="fecNac" name="fecNac" style="width:250px; height:25px"  required="" value="30-12-1900" class="form-control inputtext" tabindex="4" onblur="javascript:validarFechaIn()"><br></td>
<div id="result" class="mensajegError"></div> 
</tr> 
<td><label for="hora" class="labele">Time of flight</label></td>
<td><input type="time" name="hora" id="hora" style="width:250px; height:25px" class="form-control" required></td>
<td><label for="aerop" class="labele">Airport destination</label></td>
<td><select type="time" name="aerop" id="aerop" style="width:250px; height:30px" placeholder="Airport destination" autofocus  required class="form-control inputtext">
<option>Fort Louderdale</option>
</select>
</td>
</tr>
<tr>

<td><input type="submit" name="registro"  id="registro" class="btn btn-success"  value="Register" onclick="validar(registro)" style="position:relative; left:330px">
</tr>
</table>
</form>
</div>
<div style="width:100%; background: #0C4391; height: 30px; margin-top:10px; padding-top:5px; border-radius:3px;color:#e2c60f; margin-bottom:1%; float:left; text-align: center;height:70px;color:white;">
                                <span>Booking Routers &copy; 2015</span><br>
                                Integrantes :<span class="glyphicon glyphicon-user" style="padding-top: 4px;"></span> Yilber Hernandez 
                                <span classs="glyphicon glyphicon-user" style="padding-top: 4px;"></span> Cristian Moreno 
                                <span class="glyphicon glyphicon-user" style="padding-top: 4px;"></span> Sergio Stiven Urbiba
                                <span class="glyphicon glyphicon-user" style="padding-top: 4px;"></span> Andres Feipe Guerrero<br>
                                <img src="imagenes/dddd.png"><a href="reserva1.jsp" style=" color: #ffffff; text-decoration: none;"  >English</a> --  <img src="imagenes/original.jpg"><a href="reserva.jsp" style=" color: #ffffff; text-decoration: none;" >Spanish</a>

                            </div>
</body>
</html>
