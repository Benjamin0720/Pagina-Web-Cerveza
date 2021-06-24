<%-- 
    Document   : modificar
    Created on : 13/07/2020, 07:09:02 PM
    Author     : benja
--%>
<%@page import="modelo.Categoria"%>
<%@page import="modelo.Cerveza"%>
<%@page import="modelo.Usuario"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
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
            if (nombre != null) {
                if (nombre.getPerfil().getDescripcion().equals("Administrador")) {
                    //mostrar productos
                    //saludarlo
        %>
        <form action="CervezaServlet">
            Id<input type="text" name="txtId">
            Nombre<input type="text" name="txtNombre">
            Precio<input type="number" name="txtPrecio">
            Marca<input type="text" name="txtMarca">
            Stock<input type="number" name="txtStock">
            Imagen<input type="text" name="txtImagen">
            Categoria
            <select name="cbxCategoria">
                
                <c:forEach items="${categoria}" var="tmp">
                     <option value="${tmp.id}">${tmp.descripcion}</option>
                </c:forEach>
            </select><br>
            Categoria anterior ${cerveza.categoria}<br>
            <input type="submit" name="accion" value="Modificar">
        </form>
 <%
                } else {
                    response.sendRedirect("index.jsp");
                }
            } else {
                response.sendRedirect("index.jsp");
            }
        %>
    </body>
</html>
