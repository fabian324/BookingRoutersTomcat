<%@page import="Controlador.FacadePersonas"%>
<%@page import="co.sena.edu.booking.DAO.personasDAO"%>
<%@page import="co.sena.edu.booking.DTO.personasDTO"%>
<!doctype html>
<html>
    <head>
        <meta charset="utf-8" />
        <title>Booking Routers</title>
        <link type="text/css" rel="stylesheet" href="css/css.css" />
        <link type="text/css" rel="stylesheet" href="bootstrap-3.2.0-dist/bootstrap-3.2.0-dist/css/bootstrap.css">
        <link rel="shortcut icon" href="imagenes/br.ico" />
        <script src="scripts/bookclient.js" type="text/javascript">
        </script>
    </head>
    <body>
<div class ="contenedor">
<div class="banner"> 
<p><a href="Index.html"><img src="imagenes/Logo.png" alt="Booking Routers" width="1360" height="126" title="Forget the rest, call the best"  /></a></p>
</div>
                <nav>
                    <nav> 
                    <ul id="main">  
                        <li><div align="center"><a href="index1.html" style="text-decoration: none;"><span class="glyphicon glyphicon-home"></span> Home </a></li>
                        <li><div align="center"><a href="#" style="text-decoration: none;"><span class="glyphicon glyphicon-plane"></span> Reservations</a>
                            <ul class="submain">
                                <li><a href="#" style="text-decoration: none;">New Reservation</a></li>
                                <li><a href="#" style="text-decoration: none;">Modify Reservation</a> </li>
                                <li><a href="#" style="text-decoration: none;">New Reservation</a></li>
                            </ul>
                                <nav> 
                        </li>                    
                       
                        <li><div align="center"><a href="menu1.jsp" style="text-decoration: none;"><span class="glyphicon glyphicon-list"></span> Main</a> 
                        </li>                      
                    </ul>
                    
                            

                                <%
                                    HttpSession misesion = request.getSession(false);

                                    if (misesion.getAttribute("logueado") != null) {
                                        personasDTO pdto = null;
                                        personasDTO persona = null;
                                        FacadePersonas facadeP = new FacadePersonas();
                                        pdto = (personasDTO) misesion.getAttribute("logueado");
                                        persona = facadeP.ListarUnaPersona(pdto.getIdPersona());                                       
                                                

                                %>

                                <form id="registro" action="modificar1" method="post"> 
                                    <table width="744" align="center" id="registro">
                                       <div class="ba">
                                        <h1>Modify Registry Data</h1>
                                       </div>
                                        <main>
                                            <td align="left"><label for="nombre" class="labele"><strong>Names<font color="#FF0000">*</strong></label></font></td>
                                            <td><input name="nombres" type="text" value="<%=persona.getNombres()%>" style="width:250px; height:25px " autofocus readonly="readonly" id="nombre" placeholder="Names" class="form-control inputtext" tabindex="1" minlenght=3>
                                            </td>
                                            <td><label for="ape" class="labele"><strong>Last Name<font color="#FF0000">*</strong></label></font></td>
                                            <td><input name="apellidos" type="text" value="<%=persona.getApellidos()%>" style="width:250px; height:25px" autofocus readonly="readonly" id="ape" placeholder="Last Name" required class="form-control inputtext"tabindex="2" onChange="requisitos(ape)"></td>
                                            <td>&nbsp;</td>    
                                            <tr>
                                                <td><label for="doc" class="labele"><strong>Document <font color="#FF0000">*</strong></label></font></td>
                                                <td><input name="doc" type="number" value="<%=persona.getIdPersona()%>" style="width:250px; height:30px" autofocus readonly="readonly" id="doc" placeholder="Doc Identity" required class="form-control inputtext" tabindex="3" onChange="requisitos(doc)"></td>    
                                                <td width="60" nowrap><label for="date" class="labele"><strong>Date Birth<font color="#FF0000">* </strong></label></font></td>
                                                <td><input name="date" type="text" value="<%=persona.getFechaNto()%>" readonly="readonly" id="date" style="width:250px; height:25px" required class="form-control inputtext" tabindex="4" onChange="edad()"></td>    
                                            <tr>
                                                <td ><label for="tel" class="labele"><strong> Fhone <font color="#FF0000">*</strong></label></font></td>
                                                <td><input name="tel" type="text" id="tel" value="<%=persona.getTelefono()%>" style="width:250px; height:25px" placeholder="Fhone" autofocus  required class="form-control inputtext" tabindex="6" onChange="requisitos(tel)"></td>   
                                                <td><label for="cor" class="labele"><strong>E-mail<font color="#ff0000">*</strong></label></font></td>
                                                <td><input name="cor" type="email" id="cor" value="<%=persona.getCorreoElectronico()%>" style="width:250px; height:25px" placeholder="asldj@misena.edu.co" autofocus required class="form-control inputtext" tabindex="7" onChange="requisitos(cor)"></td>
                                                <td>&nbsp;</td>    
                                            <tr>
                                                <td><label for="paisnac" class="labele"><strong>Country<font color="#ff0000">* </strong></label></font></td>
                                                <td><input name="paisnac" id="paisnac" value="<%=persona.getIdNacionalidad()%>" style="width:250px; height:30px" placeholder="Select Country" autofocus required class="form-control inputtext" list="paises" tabindex="8" >
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
                                            <td><input name="ciunac" id="ciunac" value="<%=persona.getIdCiudad()%>" style="width:250px; height:30px" placeholder="Select City" autofocus required class="form-control inputtext"  list="ciudades" tabindex="9">
                                                <datalist id="ciudades">
                                                    <option label="BOG">Bogota</option>
                                                    <option label="CLO">Cali</option>
                                                    <option label="MED">Medellin</option>
                                                    <option label="BAR">Barranquilla</option>
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
                                             
                                                <td><input name="submit10" class="btn btn-success" type="submit" id="submit10" tabindex="20"  value="Save Changes" onClick="validar(registro)" style="position:relative; left:360px"></td>
                                               
                                               
                                            </tr>
                                    </table>
                                    </fieldset>
                                    <%
                                        }
                                    %>
                                </form>
                            </div>                            
                       <div style="width:100%; background: #0C4391; height: 30px; margin-top:10px; padding-top:5px; border-radius:3px;color:#e2c60f; margin-bottom:1%; float:left; text-align: center;height:70px;color:white;">
        <span>Booking Routers &copy; 2015</span><br>
        Integrantes :<span class="glyphicon glyphicon-user" style="padding-top: 4px;"></span> Yilber Hernandez 
        <span classs="glyphicon glyphicon-user" style="padding-top: 4px;"></span> Cristian Moreno 
        <span class="glyphicon glyphicon-user" style="padding-top: 4px;"></span> Sergio Stiven Urbiba
        <span class="glyphicon glyphicon-user" style="padding-top: 4px;"></span> Andres Feipe Guerrero<br>
        <img src="imagenes/dddd.png"><a href="actualizarDatos1.jsp" style=" color: #ffffff; text-decoration: none;"  >English</a> --  <img src="imagenes/original.jpg"><a href="actualizarDatos2.jsp" style=" color: #ffffff; text-decoration: none;" >Spanish</a>

</div>
                          
                        </body>
                        <html>

