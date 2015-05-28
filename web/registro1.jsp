<!doctype html>
<html>
    <head>
        <meta charset="utf-8" />
        <title>Booking Routers</title>
        <link type="text/css" rel="stylesheet" href="bootstrap-3.2.0-dist/bootstrap-3.2.0-dist/css/bootstrap.css">
        <link type="text/css" rel="stylesheet" href="css/css.css" />
        <link type="text/css" rel="stylesheet" href="font-awesome.css">
       <link rel="shortcut icon" href="imagenes/br.ico" />
     <script src="scripts/registro.js" type="text/javascript"></script>
    </head>
    <body>

        <div class ="contenedor">
            <div class="banner"> 
                <p><a href="index1.html"><img src="imagenes/Logo.png" alt="Bookin Routers" width="1360" height="126" title="Forget the rest, call the best"/></a></p>
            </div>
            <nav>  
            <ul id="main">  
                    <li>
                        <div align="center"><a href="index1.html" style="text-decoration: none;"><span class="glyphicon glyphicon-home"></span> Home</a>    
                        </div>
                    </li>
              </ul>
            </nav>      
                        <form name="form1" action="Controlador1" method="post" > 
                            <table width="744" align="center" id="registro">
                                <div class="ba">
                                    <h1><center>User Registration</center></h1>
                                </div>
                                <tr>
                          
                                    <td><label for="nombre" class="labele"><strong>Names<font color="#FF0000">*</strong></label></font></td>
                                    <td><input name="nombres" type="text" style="width:250px; height:25px " autofocus id="nombre" placeholder="Names" required class="form-control    inputtext" tabindex="1" onChange="requisitos(nombre)" minlenght=3>
                                    </td>
                                    <td><label for="ape" class="labele"><strong>Surnames<font color="#FF0000">*</strong></label></font></td>
                                    <td><input name="apellidos" type="text" style="width:250px; height:25px" autofocus id="ape" placeholder="Surnames" required class="form-control inputtext"tabindex="2" onChange="requisitos(ape)">
                                    </td>
                                    </tr>
                                    <tr>
                                        <td><label for="doc" class="labele"><strong>Document<font color="#FF0000">*</strong></label></font></td>
                                        <td><input name="doc" type="number" style="width:250px; height:30px" autofocus id="doc" placeholder="Doc identity" required class="form-control inputtext" tabindex="3" onChange="requisitos(doc)" minlenght=8></td>    
                                        <td><label for="date" class="labele"><strong>Date of birth<font color="#FF0000">* </strong></label></font></td>
                                        <td><input name="date" type="date" id="date" style="width:250px; height:25px" required class="form-control inputtext" tabindex="4" onChange="edad()"></td>    
                                    </tr>
                                    <tr>
                                        <td><label for="tel" class="labele"><strong> Phone <font color="#FF0000">*</strong></label></font></td>
                                        <td><input name="tel" type="text" id="tel" style="width:250px; height:25px" placeholder="Phone" autofocus  required class="form-control inputtext" tabindex="6" onChange="requisitos(tel)"></td>   
                                        <td><label for="cor" class="labele"><strong>Mail<font color="#FF0000">*</strong></label></font></td>
                                        <td><input name="cor" type="email" id="cor" style="width:250px; height:25px" placeholder="asldj@misena.edu.co" autofocus required class="form-control inputtext" tabindex="7" onChange="requisitos(cor)"></td>
                                    </tr>    
                                    <tr>
                                        <td><label for="paisnac" class="labele"><strong>Country<font color="#FF0000">* </strong></label></font></td>
                                        <td><input name="paisnac" id="paisnac" style="width:250px; height:35px" placeholder="Select country" autofocus required class="form-control inputtext" list="paises" tabindex="8" >
                                            <datalist id="paises">
                                                <option value="Argentina">Argentina</option>
                                                <option value="Brasil">Brasil</option>
                                                <option value="Chile">Chile</option>
                                                <option value="Colombia">Colombia</option>
                                                <option value="Ecuador">Ecuador</option>
                                                <option value="Perú">Perú</option>
                                            </datalist>
                                        </td>
                                    <td><label for="ciunac" class="labele"><strong>City<font color="#FF0000">*</strong></label></font></td>
                                    <td><input name="ciunac" id="ciunac" style="width:250px; height:35px" placeholder="Select city" autofocus required class="form-control inputtext"  list="cities" tabindex="9" size="30">
                                        <datalist id="cities">
                                            <option value="Bogota">Bogota</option>
                                            <option value="Cali">Cali</option>
                                            <option value="Medellin">Medellin</option>
                                            <option value="Barranquilla">Barranquilla</option>
                                        </datalist>
                                    </td>
                                    <td nowrap>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    </tr>
                                    <tr> 
                                        <td><label for="con" class="labele"><strong>Password<font color="#FF0000">*</strong></label></font></td>  
                                        <td><input name="con" type="password" id="con" style="width:250px; height:25px" tabindex="17" autofocus required class="form-control inputtext">
                                        <td><label for="con" class="labele"><strong>Confirm<font color="#FF0000">* </strong></label></font>  
                                        <td><input name="vcon" type="password" id="vcon" style="width:250px; height:25px" tabindex="18" autofocus required class="form-control inputtext"></td>
                                    </tr>
                                    <tr>
                                        <td><input name="submit11" class="btn btn-success" type="button" id="ccon" tabindex="19" onClick="contrase()" value="Validate password"style="position:relative; left:280px"></td>
                                        <td><input type="submit" name="registro"  id="registro" class="btn btn-success"  value="Register" onclick="validar(registro)" style="position:relative; left:270px">
                                        
                                       
                                    </tr>
                            </table>
                            </fieldset>
                        </form>
                        </div> 
           <div style="width:100%; background: #0C4391; height: 30px; margin-top:10px; padding-top:5px; border-radius:3px;color:#e2c60f; margin-bottom:1%; float:left; text-align: center;height:70px;color:white;">
                                <span>Booking Routers &copy; 2015</span><br>
                                Integrantes :<span class="glyphicon glyphicon-user" style="padding-top: 4px;"></span> Yilber Hernandez 
                                <span classs="glyphicon glyphicon-user" style="padding-top: 4px;"></span> Cristian Moreno 
                                <span class="glyphicon glyphicon-user" style="padding-top: 4px;"></span> Sergio Stiven Urbiba
                                <span class="glyphicon glyphicon-user" style="padding-top: 4px;"></span> Andres Feipe Guerrero<br>
                                <img src="imagenes/dddd.png"><a href="registro1.jsp" style=" color: #ffffff; text-decoration: none;"  >English</a> --  <img src="imagenes/original.jpg"><a href="registro.jsp" style=" color: #ffffff; text-decoration: none;" >Spanish</a>

                            </div>
                </body>
                <html>