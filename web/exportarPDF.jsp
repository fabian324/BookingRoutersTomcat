<%--
    Document   : exportarPDF
    Created on : 16/03/2015, 07:20:40 PM
    Author     : Sergio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Exportar PDF</title>
    </head>
    <body>
        
        <h1>Reporte en PDF Personas</h1>
    <center>
        <%
         HttpSession miSession = request.getSession(false); 
         if (miSession.getAttribute("nombres") != null) {
    %>
     
    <object type="application/pdf" data="exportarPDF" width="1000" height="650">
            </object>
    
         <%
         }
      %>
    </center>
         
         
    </body>
</html>
