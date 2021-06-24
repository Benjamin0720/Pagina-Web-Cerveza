<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modelo.Usuario"%>
<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<%--
    This file is an entry point for JavaServer Faces application.
--%>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
            <title>JSP Page</title>
<link rel="stylesheet" type="text/css" href="/Cerveza/faces/jsfcrud.css" />
        </head>
        <body>
             <%
            try{
               Usuario nombre = (Usuario) request.getSession().getAttribute("nombre");
               if(nombre!=null){
                   if (nombre.getPerfil().getDescripcion().equals("SuperAdministrador")) {
                   %>
          Bienvenido <%=nombre.getNombre()%>
            <h1><h:outputText value="JavaServer Faces"/></h1>
                <h:form>
                    <h:commandLink action="#{usuario.listSetup}" value="Show All Usuario Items"/>
                </h:form>

                <h:form>
                    <h:commandLink action="#{perfilUsuario.listSetup}" value="Show All PerfilUsuario Items"/>
                </h:form>

                <h:form>
                    <h:commandLink action="#{cerveza.listSetup}" value="Show All Cerveza Items"/>
                </h:form>

                <h:form>
                    <h:commandLink action="#{categoria.listSetup}" value="Show All Categoria Items"/>
                </h:form>
                 <%            
                } else {
                    response.sendRedirect("login.jsp");
                }
            }
            } catch (Exception ex) {
                //response.sendRedirect("error.jsp?mensaje=" + ex);
                %>
                Iniciar sesion
                <%
            }
        %> 
        </body>
    </html>
</f:view>
