<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>New Usuario</title>
            <link rel="stylesheet" type="text/css" href="/Cerveza/faces/jsfcrud.css" />
        </head>
        <body>
            <h:panelGroup id="messagePanel" layout="block">
                <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
            </h:panelGroup>
            <h1>New Usuario</h1>
            <h:form>
                <h:inputHidden id="validateCreateField" validator="#{usuario.validateCreate}" value="value"/>
                <h:panelGrid columns="2">
                    <h:outputText value="Email:"/>
                    <h:inputText id="email" value="#{usuario.usuario.email}" title="Email" required="true" requiredMessage="The email field is required." />
                    <h:outputText value="Nombre:"/>
                    <h:inputText id="nombre" value="#{usuario.usuario.nombre}" title="Nombre" required="true" requiredMessage="The nombre field is required." />
                    <h:outputText value="Pass:"/>
                    <h:inputText id="pass" value="#{usuario.usuario.pass}" title="Pass" required="true" requiredMessage="The pass field is required." />
                    <h:outputText value="Perfil:"/>
                    <h:selectOneMenu id="perfil" value="#{usuario.usuario.perfil}" title="Perfil" >
                        <f:selectItems value="#{perfilUsuario.perfilUsuarioItemsAvailableSelectOne}"/>
                    </h:selectOneMenu>

                </h:panelGrid>
                <br />
                <h:commandLink action="#{usuario.create}" value="Create"/>
                <br />
                <br />
                <h:commandLink action="#{usuario.listSetup}" value="Show All Usuario Items" immediate="true"/>
                <br />
                <br />
                <h:commandLink value="Index" action="welcome" immediate="true" />

            </h:form>
        </body>
    </html>
</f:view>
