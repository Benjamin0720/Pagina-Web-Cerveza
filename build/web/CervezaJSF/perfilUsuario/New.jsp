<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>New PerfilUsuario</title>
            <link rel="stylesheet" type="text/css" href="/Cerveza/faces/jsfcrud.css" />
        </head>
        <body>
            <h:panelGroup id="messagePanel" layout="block">
                <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
            </h:panelGroup>
            <h1>New PerfilUsuario</h1>
            <h:form>
                <h:inputHidden id="validateCreateField" validator="#{perfilUsuario.validateCreate}" value="value"/>
                <h:panelGrid columns="2">
                    <h:outputText value="Id:"/>
                    <h:inputText id="id" value="#{perfilUsuario.perfilUsuario.id}" title="Id" required="true" requiredMessage="The id field is required." />
                    <h:outputText value="Descripcion:"/>
                    <h:inputText id="descripcion" value="#{perfilUsuario.perfilUsuario.descripcion}" title="Descripcion" required="true" requiredMessage="The descripcion field is required." />
                    <h:outputText value="UsuarioList:"/>
                    <h:selectManyListbox id="usuarioList" value="#{perfilUsuario.perfilUsuario.jsfcrud_transform[jsfcrud_class['DAOJSF.util.JsfUtil'].jsfcrud_method.collectionToArray][jsfcrud_class['DAOJSF.util.JsfUtil'].jsfcrud_method.arrayToList].usuarioList}" title="UsuarioList" size="6" converter="#{usuario.converter}" >
                        <f:selectItems value="#{usuario.usuarioItemsAvailableSelectMany}"/>
                    </h:selectManyListbox>

                </h:panelGrid>
                <br />
                <h:commandLink action="#{perfilUsuario.create}" value="Create"/>
                <br />
                <br />
                <h:commandLink action="#{perfilUsuario.listSetup}" value="Show All PerfilUsuario Items" immediate="true"/>
                <br />
                <br />
                <h:commandLink value="Index" action="welcome" immediate="true" />

            </h:form>
        </body>
    </html>
</f:view>
