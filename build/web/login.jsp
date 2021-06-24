<%-- 
    Document   : login
    Created on : 21/06/2020, 06:29:53 PM
    Author     : benja
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <h2>Inicia Sesion</h2>
        <form action="LoginServlet">
            Correo
            <input type="email" name="txtCorreo" required=""/></br>
            Contraseña
            <input type="password" name="txtPass" required=""/></br>
            
            <input type="submit" name="btnLogin" value="Ingresar"/>
        </form>
    </body>
</html>
