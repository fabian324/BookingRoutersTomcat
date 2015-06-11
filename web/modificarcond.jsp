
<%@page import="co.sena.edu.booking.DTO.personasDTO"%>
<%@page import="Controlador.FacadePersonas"%>
<%@page import="co.sena.edu.booking.DTO.nacionalidadesDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="co.sena.edu.booking.DAO.nacionalidadesDAO"%>
<!doctype html>
<html>
    <head>
        <meta charset="utf-8" />
        <title>Booking Routers</title>
        <link type="text/css" rel="stylesheet" href="bootstrap-3.2.0-dist/bootstrap-3.2.0-dist/css/bootstrap.css">
        <link type="text/css" rel="stylesheet" href="css/css.css" />
        <link type="text/css" rel="stylesheet" href="sweetalert-master/dist/sweetalert.css" />
        <script src="sweetalert-master/dist/sweetalert.min.js"></script>
        <link type="text/css" rel="stylesheet" href="font-awesome.css">
        <link rel="shortcut icon" href="imagenes/br.ico" />
        <script src="scripts/registro.js" type="text/javascript"></script>
        <script src="scripts/AjaxCiudades.js" type="text/javascript"></script>
    </head>
    <body>
        <div class ="contenedor">
            <div class="banner">
                <p><a href="index.jsp"><img src="imagenes/Logo.png" alt="Bookin Routers" width="1360" height="126" title="Forget the rest, call the best"/></a></p>
            </div>
            <nav> 
                <ul id="main"> 
                    <li>
                        <div align="center"> <a href="index.jsp" style="text-decoration: none;"><span class="glyphicon glyphicon-home"></span> Inicio</a>    
                        </div>
                    </li>
                </ul>
            </nav>  
            <form name="form1" action="registroConductor" method="post" id="form1"> 

                <table width="744" align="center">

                    <div class="ba">
                        <h1><center>Modificar Conductores</center></h1>
                    </div>
                    <div style=" background:#DDDDDD;  text-align: center; border-radius: 15; padding-top: 5px; border-radius: 15px; ">
                        <a href="index.jsp" style="color:black; text-decoration: none;">Inicio</a>
                        <a href="registro.jsp" style="color: black; text-decoration: none;">Registro Conductor</a>
                    </div> 
                    <tr>
                        <td><label for="nombres" class="labele"><strong>Nombres<font color="#FF0000">*</strong></label></font></td>
                        <td><input name="nombres"  value="<%=request.getParameter("nombreConductor") %>" type="text" style="width:250px; height:25px " autofocus id="nombres" placeholder="Nombres" required class="form-control" onChange="requisitos(nombres)" onkeypress="return validLetter(event);">
                        </td>
                        <td><label for="ape" class="labele"><strong>Apellidos<font color="#FF0000">*</strong></label></font></td>
                        <td><input name="apellidos" value="<%=request.getParameter("apellidoConductor") %>"  type="text" style="width:250px; height:25px" autofocus id="apellidos" placeholder="Apellidos" required class="form-control inputtext"tabindex="2" onChange="requisitos(apellidos)" onkeypress="return validLetter(event)">
                        </td>
                    </tr>
                    <tr>
                        <td><label for="doc" class="labele"><strong>Documento <font color="#FF0000">*</strong></label></font></td>
                        <td><input name="doc" value="<%=request.getParameter("idPersona") %>"  type="text" style="width:250px; height:30px" autofocus id="doc" placeholder="Doc Identidad" required class="form-control inputtext" tabindex="3" onChange="requisitos(doc)" onkeypress="return validNumber(event)" minlenght=8></td>    
                        <td><label for="date" class="labele"><strong>Fecha Nacimiento<font color="#FF0000">* </strong></label></font></td>
                        <td><input name="date" value="<%=request.getParameter("fechanac") %>"   type="date" id="date" style="width:250px; height:25px" required class="form-control inputtext" tabindex="4" onChange="edad(date)"></td>    
                    </tr>
                    <tr>
                        <td><label for="tel" class="labele"><strong> Teléfono <font color="#FF0000">*</strong></label></font></td>
                        <td><input name="tel" type="text" value="telefono" id="tel" style="width:250px; height:25px" placeholder="Telefono" autofocus  required class="form-control inputtext" tabindex="6" onChange="requisitos(tel)" onkeypress="return validNumber(event)"></td>   
                        <td><label for="cor" class="labele"><strong>Correo<font color="#FF0000">*</strong></label></font></td>
                        <td><input name="cor" value="<%=request.getParameter("correo") %>"  type="email" id="cor" style="width:250px; height:25px" placeholder="asldj@misena.edu.co" autofocus required class="form-control inputtext" tabindex="7" onChange="requisitos(cor)"></td>
                    </tr>    
                    <tr>
                        <td><label for="paisnac" class="labele"><strong>País <font color="#FF0000">* </strong></label></font></td>
                        <td>
                            <%--<input name="paisnac" id="paisnac" style="width:250px; height:35px" placeholder="Seleccione país" autofocus required class="form-control inputtext" list="paises" tabindex="8" onChange="requisitos(paisnac)">--%>
                            <select id="paises" name="paisnac" id="paisnac" style="width:250px; height:35px" autofocus required class="form-control inputtext" list="paises" tabindex="8" onchange="getCiudades(this.value);" onChange="requisitos(paisnac)">
                                <option value="0" >------</option>

                                <%
                                    nacionalidadesDAO cdao = new nacionalidadesDAO();
                                    FacadePersonas facadeP = new FacadePersonas();
                                    ArrayList<nacionalidadesDTO> Ciud = new ArrayList();
                                    Ciud = (ArrayList) facadeP.listarNacionalidades();
                                    for (nacionalidadesDTO cdto : Ciud) {
                                %>   
                                <option <%if (request.getParameter("pais").equals("Mujer")){%> selected <%}%>value="<%=cdto.getIdNacionalidad()%>"> <%=cdto.getNacionalidad()%></option>
                                <%
                                    }
                                %>
                            </select>
                        </td>
                        <td><label for="ciunac" class="labele"><strong>Ciudad<font color="#FF0000">*</strong></label></font></td>
                        <td>
                            <%--<input name="ciunac" id="ciunac" style="width:250px; height:35px" placeholder="Seleccione ciudad" autofocus required class="form-control inputtext"  list="ciudades" tabindex="9" size="30" onChange="requisitos(ciunac)">--%>
                            <select  name="ciunac" id="ciunac" style="width:250px; height:35px" autofocus required class="form-control inputtext"  list="ciudades" tabindex="9" onChange="requisitos(cuinac)">
                                <option value="0" >Elija Ciudad</option>
                        </select>
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
                        <td><label for="pSexo" class="labele"><strong>Sexo<font color="#FF0000">* </strong></label></font></td>
                        <td>
                            <%--<input name="paisnac" id="paisnac" style="width:250px; height:35px" placeholder="Seleccione país" autofocus required class="form-control inputtext" list="paises" tabindex="8" onChange="requisitos(paisnac)">--%>
                            <select name="pSexo" required id="pSexo" class="form-control" onChange="requisitos(pSexo)">
                                <option value="">Seleccione su sexo</option>
                                    <option<%if (request.getParameter("sexo").equals("Mujer")){%> selected <%}%> value="Mujer">Mujer</option>
                                    <option <%if (request.getParameter("sexo").equals("Hombre")){%> selected <%}%> value="Hombre">Hombre</option>
                                </select>
                        </td>
                    </tr>
                   
                    <tr>
                        <td><input type="submit" name="registro"  id="registro" class="btn btn-success"  value="Registrar" onclick="validar(registro)"   style="position:relative; left:280px">
                    </tr>
                    <tr>
                </table>
            </form>
        </div> 
        <div style="width:100%; background: #0C4391; height: 30px; margin-top:10px; padding-top:5px; border-radius:3px;color:#e2c60f; margin-bottom:1%; float:left; text-align: center;height:70px;color:white;">
            <span>Booking Routers &copy; 2015</span><br>
            Integrantes :<span class="glyphicon glyphicon-user" style="padding-top: 4px;"></span> Yilber Hernandez 
            <span class="glyphicon glyphicon-user" style="padding-top: 4px;"></span> Cristian Moreno 
            <span class="glyphicon glyphicon-user" style="padding-top: 4px;"></span> Sergio Stiven Urbiba
            <span class="glyphicon glyphicon-user" style="padding-top: 4px;"></span> Andres Feipe Guerrero<br>
            <img src="imagenes/dddd.png"><a href="registro1.jsp" style=" color: #ffffff; text-decoration: none;"  >English</a> --  <img src="imagenes/original.jpg"><a href="registro.jsp" style=" color: #ffffff; text-decoration: none;" >Spanish</a>

        </div>
     
    </body>
    <html>
