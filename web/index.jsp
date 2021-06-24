<%-- 
    Document   : index
    Created on : 20/06/2020, 05:40:55 PM
    Author     : benja
--%>

<%@page import="modelo.Categoria"%>
<%@page import="modelo.Cerveza"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar bg">
  <a class="navbar-brand" href="index.jsp">Tienda Cerveza</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="index.jsp"><span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="modificar.jsp"></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="contacto.jsp" tabindex="" aria-disabled="">Contacto</a>
      </li>
    </ul>
    <form class="form-inline my-2 my-lg-0">
      <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
       <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
    <%
            try{
               String nombre = request.getSession().getAttribute("nombre").toString();
               if(nombre!=null){
                   %>
          Bienvenido <%=nombre%>
       <%            
                } else {
                    response.sendRedirect("login.jsp");
                }
            } catch (Exception ex) {
         //       response.sendRedirect("error.jsp?mensaje=" + ex);
                %>
                Iniciar sesion
                <%
            }
        %> 
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="login.jsp">Iniciar Sesion</a>
          <a class="dropdown-item" href="#"></a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="LoginServlet?btnLogin=cerrar">Cerrar Sesion</a>
        </div>
      </li>
    </form>
  </div>
</nav>
        <%
            int categoria = 0;
            String cate = request.getParameter("categoria");
            if(cate!=null) {
                categoria = Integer.parseInt(cate);
            }
        %>
   
    <c:forEach items="${categoria}" var="tmp">
    <a href="index.jsp?categoria=${tmp.id}">${tmp.descripcion}</a>
    </c:forEach>
    <a href="index.jsp?categoria=0">Mostrar todo</a>
    <a href="index.jsp">Mostrar todo</a>
    
    
    
    <table border="1">
        <thead>
            <tr>
                <th>Id</th>
                <th>Nombre</th>
                <th>Precio</th>
                <th>Marca</th>
                <th>Stock</th>
                <th>Imagen</th>
                <th>Categoria</th>
            </tr>
        </thead>
        <tbody>
            <%
                if (categoria == 0) {
            }
            %>
            <c:forEach items="${cerveza}" var="tmp">
            <tr>
                <td>${tmp.id}</td>
                <td>${tmp.nombre}</td>
                <td>${tmp.precio}</td>
                <td>${tmp.marca}</td>
                <td>${tmp.stock}</td>
                <td><img src="Cerveza/${tmp.imagen}" alt="" width="100" /></td>
                <td>${tmp.categoria}</td>
                <td><a href="CarritoServlet?id=${tmp.id}">Agregar carrito</a></td>
            </tr>
            </c:forEach>
        </tbody>
    </table>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
                 <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
                 <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
    </body>
</html>
