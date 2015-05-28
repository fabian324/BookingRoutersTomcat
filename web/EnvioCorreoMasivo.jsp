
<%@page import="Controlador.FacadePersonas"%>
<%@page import="java.util.ArrayList"%>
<%@page import="co.sena.edu.booking.DTO.personasDTO"%>
<%@page import="co.sena.edu.booking.DAO.personasDAO"%>
<!DOCTYPE html>

<html>
<head>
<title>Booking Routers</title>
<meta charset="utf-8">
<link rel="shortcut icon" href="imagenes/br.ico" />
         <link type="text/css" rel="stylesheet" href="css/css.css" />
        <link type="text/css" rel="stylesheet" href="bootstrap-3.2.0-dist/bootstrap-3.2.0-dist/css/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="bootstrap-3.2.0-dist/bootstrap-3.2.0-dist/css/bootstrap.min.css">        
        <script src="js/jquery-1.11.2.min.js"></script>
        <script src="js/bootstrap.js"></script>
        <script type="text/javascript">
            function enviarFormularios() {
                document.formsubmit();
            }
        </script>
    </head>
    <body>
        <div class="banner"> 
<p><a href="index.jsp"><img src="imagenes/Logo.png" alt="Booking Routers" width="1360" height="126" title="Forget the rest, call the best"  /></a></p>
</div>
<nav>
  <ul id="main">
  <li><div align="center"><a href="#" style="text-decoration: none;"><span class="glyphicon glyphicon-send"></span> Gestion Rutas</a>
  <ul class="submain">
  <li><a href="CreaRuta.jsp?msj=" style="text-decoration: none;">Creación de Rutas</a></li>
  <li><a href="ModRuta.jsp?msj=" style="text-decoration: none;">Modificación de Rutas</a> </li>
  </ul>
  </div>  
  </li>  
  <li><div align="center"><a href="#" style="text-decoration: none;"><span class="glyphicon glyphicon-folder-open"></span> Reportes</a> 
  <ul class="submain">  
  <li><div align="center"><a href="Filtro.jsp" style="text-decoration: none;">Clientes</a></div></li>
  <li><div align="center"><a href="filtroConductores.jsp" style="text-decoration: none;">Conductores</a></div></li>
  </ul>
</li>
  <li><a href="Controlador?action=logout"><span class="glyphicon glyphicon-remove-sign"></span> Cerrar sesion</a></li> 
 </ul>
</nav><br><br>
        <form method="get" action="GestionCorreos">                
                    <div class="col-md-4">
                        <h1>Envió Correos másivos</h1>
                        <div class="form-group">
                            <label for="cAsunto">Asunto:</label>
                            <input type="text" name="cAsunto" id="cAsunto" 
                            class="form-control" placeholder="Asunto del correo" value="" required>
                        </div>
                        <div class="form-group">
                            <label for="cCuerpo">Mensaje:</label>
                            <textarea type="text" name="cCuerpo" id="cCuerpo" class="form-control" required placeholder="Mensaje para las personas"></textarea>
                        </div>                        
                        <button type="submit" class="btn btn-success">Enviar Correo</button>
                    </div>
                    <div class="col-md-8">

                        <table class="table table-striped table-hover table-condensed">
                            <thead>
                                <tr>
                                    <th>Documento</th>
                                    <th>Nombre</th>
                                    <th>Apellidos</th>
                                    <th>Correo</th>                                    
                                    
                                </tr>
                            </thead>
                            <tbody>

                                <% 
                       
                                 FacadePersonas facadeP = new FacadePersonas();                                             
                                ArrayList<personasDTO> misPersonas;
                                 misPersonas = (ArrayList<personasDTO>) facadeP.listarPersonas(null);
                                for (personasDTO p : misPersonas) {

                                %>
                                <tr>
                                    <td><%= p.getIdPersona()%></td>
                                    <td><%= p.getNombres()%></td>
                                    <td><%= p.getApellidos()%></td>
                                    <td><%= p.getCorreoElectronico()%></td>                                  
                                  
                                </tr>                        
                                <%
                                       
                                    }
                                %>
                            </tbody>
                        </table>                
                    </div>
                </div>
                             
            </form>

            <div class="row">
                <div class="col-md-4"></div>
                <div class="col-md-6">
                    <%
                        if (request.getParameter("info") != null) {
                    %>
                    <div class="alert alert-info text-center">
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                        <p><%= request.getParameter("info")%></p>
                    </div>
                    <%
                        }
                    %>
                    <div class="col-md-4"></div>
                </div>
            </div>      
    </body>
</html>
