<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Editing Categoria</title>
            <link rel="stylesheet" type="text/css" href="/Cerveza/faces/jsfcrud.css" />
        </head>
        <body>
            <h:panelGroup id="messagePanel" layout="block">
                <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
            </h:panelGroup>
            <h1>Editing Categoria</h1>
            <h:form>
                <h:panelGrid columns="2">
                    <h:outputText value="Id:"/>
                    <h:outputText value="#{categoria.categoria.id}" title="Id" />
                    <h:outputText value="Descripcion:"/>
                    <h:inputText id="descripcion" value="#{categoria.categoria.descripcion}" title="Descripcion" required="true" requiredMessage="The descripcion field is required." />
                    <h:outputText value="CervezaList:"/>
                    <h:selectManyListbox id="cervezaList" value="#{categoria.categoria.jsfcrud_transform[jsfcrud_class['DAOJSF.util.JsfUtil'].jsfcrud_method.collectionToArray][jsfcrud_class['DAOJSF.util.JsfUtil'].jsfcrud_method.arrayToList].cervezaList}" title="CervezaList" size="6" converter="#{cerveza.converter}" >
                        <f:selectItems value="#{cerveza.cervezaItemsAvailableSelectMany}"/>
                    </h:selectManyListbox>

                </h:panelGrid>
                <br />
                <h:commandLink action="#{categoria.edit}" value="Save">
                    <f:param name="jsfcrud.currentCategoria" value="#{jsfcrud_class['DAOJSF.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][categoria.categoria][categoria.converter].jsfcrud_invoke}"/>
                </h:commandLink>
                <br />
                <br />
                <h:commandLink action="#{categoria.detailSetup}" value="Show" immediate="true">
                    <f:param name="jsfcrud.currentCategoria" value="#{jsfcrud_class['DAOJSF.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][categoria.categoria][categoria.converter].jsfcrud_invoke}"/>
                </h:commandLink>
                <br />
                <h:commandLink action="#{categoria.listSetup}" value="Show All Categoria Items" immediate="true"/>
                <br />
                <br />
                <h:commandLink value="Index" action="welcome" immediate="true" />

            </h:form>
        </body>
    </html>
</f:view>
