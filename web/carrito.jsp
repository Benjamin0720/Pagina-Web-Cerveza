<%-- 
    Document   : carrito
    Created on : 12/07/2020, 09:58:45 PM
    Author     : benja
--%>

<%@page import="modelo.Usuario"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.Cerveza"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <%
             Usuario nombre = (Usuario) request.getSession().getAttribute("nombre");
        ArrayList<Cerveza> carrito = (ArrayList<Cerveza>)
        request.getSession().getAttribute(nombre.toString());
        %>
        Hello <%=nombre.getNombre()%><br>
        Sus productos guardados son:
        <table border="1">
            <thead>
                <tr>
                    <th>Id</th>
                    <th>Nombre</th>
                    <th>Precio</th>
                    <th>Stock</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                <%
                    for (Cerveza elem : carrito) {
                %>
                <tr>
                    <td><%=elem.getId()%></td>
                    <td><%=elem.getNombre()%></td>
                    <td><%=elem.getPrecio()%></td>
                    <td><%=elem.getStock()%></td>
                    <td>Aca va el quitar :S</td>
                </tr>
                <%}%>
            </tbody>
        </table>
    </body>
</html>
