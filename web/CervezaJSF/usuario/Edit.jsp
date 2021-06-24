<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Editing Usuario</title>
            <link rel="stylesheet" type="text/css" href="/Cerveza/faces/jsfcrud.css" />
        </head>
        <body>
            <h:panelGroup id="messagePanel" layout="block">
                <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
            </h:panelGroup>
            <h1>Editing Usuario</h1>
            <h:form>
                <h:panelGrid columns="2">
                    <h:outputText value="Email:"/>
                    <h:outputText value="#{usuario.usuario.email}" title="Email" />
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
                <h:commandLink action="#{usuario.edit}" value="Save">
                    <f:param name="jsfcrud.currentUsuario" value="#{jsfcrud_class['DAOJSF.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][usuario.usuario][usuario.converter].jsfcrud_invoke}"/>
                </h:commandLink>
                <br />
                <br />
                <h:commandLink action="#{usuario.detailSetup}" value="Show" immediate="true">
                    <f:param name="jsfcrud.currentUsuario" value="#{jsfcrud_class['DAOJSF.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][usuario.usuario][usuario.converter].jsfcrud_invoke}"/>
                </h:commandLink>
                <br />
                <h:commandLink action="#{usuario.listSetup}" value="Show All Usuario Items" immediate="true"/>
                <br />
                <br />
                <h:commandLink value="Index" action="welcome" immediate="true" />

            </h:form>
        </body>
    </html>
</f:view>
