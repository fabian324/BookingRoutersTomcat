<%-- 
    Document   : subciudades
    Created on : 8/03/2015, 10:02:15 PM
    Author     : user
--%>


<%@page import="Controlador.FacadePersonas"%>
<%@page import="java.util.LinkedList"%>
<%@page import="co.sena.edu.booking.DTO.ciudadesDTO"%>
<%@page import="co.sena.edu.booking.DAO.nacionalidadesDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../css/mystyle.css" type="css/txt" >
        <title>subCiudades</title>
    </head>
    <body>

        <%
            FacadePersonas facadeP = new FacadePersonas();
            nacionalidadesDAO nao = new nacionalidadesDAO();
            LinkedList<ciudadesDTO> subciudades = new LinkedList<ciudadesDTO>();

            if (request.getParameter("idNacionalidad") != null) {
                subciudades = facadeP.ListarCiudades(Integer.parseInt(request.getParameter("idNacionalidad")));
                if (subciudades.size() > 0) {

                    for (ciudadesDTO scdto : subciudades) {
                        
                        out.write("<option value = " + scdto.getIdCiudad()+ ">" + scdto.getCiudad()+ "</option>");

                }


               }

           }


       %>


    </body>
</html>

