<%-- 
    Document   : subirArchivos
    Created on : 29/04/2015, 08:13:31 PM
    Author     : Sergio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Subir Archivos</h1>
        <form action="uploadFile.jsp" method="post" enctype="multipart/form-data"> 
            <input type="file" name="file"/> 
            <br /> 
            <input type="submit" value="Subir archivo" /> 
        </form>
    </body>
</html>
