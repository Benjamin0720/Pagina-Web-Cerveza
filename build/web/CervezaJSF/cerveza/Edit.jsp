<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Editing Cerveza</title>
            <link rel="stylesheet" type="text/css" href="/Cerveza/faces/jsfcrud.css" />
        </head>
        <body>
            <h:panelGroup id="messagePanel" layout="block">
                <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
            </h:panelGroup>
            <h1>Editing Cerveza</h1>
            <h:form>
                <h:panelGrid columns="2">
                    <h:outputText value="Id:"/>
                    <h:outputText value="#{cerveza.cerveza.id}" title="Id" />
                    <h:outputText value="Nombre:"/>
                    <h:inputText id="nombre" value="#{cerveza.cerveza.nombre}" title="Nombre" required="true" requiredMessage="The nombre field is required." />
                    <h:outputText value="Precio:"/>
                    <h:inputText id="precio" value="#{cerveza.cerveza.precio}" title="Precio" required="true" requiredMessage="The precio field is required." />
                    <h:outputText value="Marca:"/>
                    <h:inputText id="marca" value="#{cerveza.cerveza.marca}" title="Marca" required="true" requiredMessage="The marca field is required." />
                    <h:outputText value="Stock:"/>
                    <h:inputText id="stock" value="#{cerveza.cerveza.stock}" title="Stock" required="true" requiredMessage="The stock field is required." />
                    <h:outputText value="Imagen:"/>
                    <h:inputText id="imagen" value="#{cerveza.cerveza.imagen}" title="Imagen" required="true" requiredMessage="The imagen field is required." />
                    <h:outputText value="Categoria:"/>
                    <h:selectOneMenu id="categoria" value="#{cerveza.cerveza.categoria}" title="Categoria" >
                        <f:selectItems value="#{categoria.categoriaItemsAvailableSelectOne}"/>
                    </h:selectOneMenu>

                </h:panelGrid>
                <br />
                <h:commandLink action="#{cerveza.edit}" value="Save">
                    <f:param name="jsfcrud.currentCerveza" value="#{jsfcrud_class['DAOJSF.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][cerveza.cerveza][cerveza.converter].jsfcrud_invoke}"/>
                </h:commandLink>
                <br />
                <br />
                <h:commandLink action="#{cerveza.detailSetup}" value="Show" immediate="true">
                    <f:param name="jsfcrud.currentCerveza" value="#{jsfcrud_class['DAOJSF.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][cerveza.cerveza][cerveza.converter].jsfcrud_invoke}"/>
                </h:commandLink>
                <br />
                <h:commandLink action="#{cerveza.listSetup}" value="Show All Cerveza Items" immediate="true"/>
                <br />
                <br />
                <h:commandLink value="Index" action="welcome" immediate="true" />

            </h:form>
        </body>
    </html>
</f:view>
