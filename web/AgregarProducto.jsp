<%-- 
    Document   : AgregarProducto
    Created on : 18/07/2020, 08:14:01 PM
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
        <h3>Agregue un producto</h3>
         <form action="CervezaServlet">
             Id<input type="text" name="txtId"><br><br>
             Nombre<input type="text" name="txtNombre"><br><br>
             Precio<input type="number" name="txtPrecio"><br><br>
             Marca<input type="text" name="txtMarca"><br><br>
             Stock<input type="number" name="txtStock"><br><br>
             Imagen<input type="text" name="txtImagen"><br><br>
            Categoria
            <select name="cbxCategoria">
                <c:forEach items="${categoria}" var="tmp">
                    <option value="${tmp.id}">${tmp.descripcion}></option>
                </c:forEach>
            </select><br><br>
            <input type="submit" name="accion" value="Agregar">
        </form>
    </body>
</html>
