<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Cerveza Detail</title>
            <link rel="stylesheet" type="text/css" href="/Cerveza/faces/jsfcrud.css" />
        </head>
        <body>
            <h:panelGroup id="messagePanel" layout="block">
                <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
            </h:panelGroup>
            <h1>Cerveza Detail</h1>
            <h:form>
                <h:panelGrid columns="2">
                    <h:outputText value="Id:"/>
                    <h:outputText value="#{cerveza.cerveza.id}" title="Id" />
                    <h:outputText value="Nombre:"/>
                    <h:outputText value="#{cerveza.cerveza.nombre}" title="Nombre" />
                    <h:outputText value="Precio:"/>
                    <h:outputText value="#{cerveza.cerveza.precio}" title="Precio" />
                    <h:outputText value="Marca:"/>
                    <h:outputText value="#{cerveza.cerveza.marca}" title="Marca" />
                    <h:outputText value="Stock:"/>
                    <h:outputText value="#{cerveza.cerveza.stock}" title="Stock" />
                    <h:outputText value="Imagen:"/>
                    <h:outputText value="#{cerveza.cerveza.imagen}" title="Imagen" />
                    <h:outputText value="Categoria:"/>
                    <h:panelGroup>
                        <h:outputText value="#{cerveza.cerveza.categoria}"/>
                        <h:panelGroup rendered="#{cerveza.cerveza.categoria != null}">
                            <h:outputText value=" ("/>
                            <h:commandLink value="Show" action="#{categoria.detailSetup}">
                                <f:param name="jsfcrud.currentCerveza" value="#{jsfcrud_class['DAOJSF.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][cerveza.cerveza][cerveza.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentCategoria" value="#{jsfcrud_class['DAOJSF.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][cerveza.cerveza.categoria][categoria.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="cerveza"/>
                                <f:param name="jsfcrud.relatedControllerType" value="DAOJSF.CervezaController"/>
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Edit" action="#{categoria.editSetup}">
                                <f:param name="jsfcrud.currentCerveza" value="#{jsfcrud_class['DAOJSF.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][cerveza.cerveza][cerveza.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentCategoria" value="#{jsfcrud_class['DAOJSF.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][cerveza.cerveza.categoria][categoria.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="cerveza"/>
                                <f:param name="jsfcrud.relatedControllerType" value="DAOJSF.CervezaController"/>
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Destroy" action="#{categoria.destroy}">
                                <f:param name="jsfcrud.currentCerveza" value="#{jsfcrud_class['DAOJSF.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][cerveza.cerveza][cerveza.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentCategoria" value="#{jsfcrud_class['DAOJSF.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][cerveza.cerveza.categoria][categoria.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="cerveza"/>
                                <f:param name="jsfcrud.relatedControllerType" value="DAOJSF.CervezaController"/>
                            </h:commandLink>
                            <h:outputText value=" )"/>
                        </h:panelGroup>
                    </h:panelGroup>


                </h:panelGrid>
                <br />
                <h:commandLink action="#{cerveza.remove}" value="Destroy">
                    <f:param name="jsfcrud.currentCerveza" value="#{jsfcrud_class['DAOJSF.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][cerveza.cerveza][cerveza.converter].jsfcrud_invoke}" />
                </h:commandLink>
                <br />
                <br />
                <h:commandLink action="#{cerveza.editSetup}" value="Edit">
                    <f:param name="jsfcrud.currentCerveza" value="#{jsfcrud_class['DAOJSF.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][cerveza.cerveza][cerveza.converter].jsfcrud_invoke}" />
                </h:commandLink>
                <br />
                <h:commandLink action="#{cerveza.createSetup}" value="New Cerveza" />
                <br />
                <h:commandLink action="#{cerveza.listSetup}" value="Show All Cerveza Items"/>
                <br />
                <br />
                <h:commandLink value="Index" action="welcome" immediate="true" />

            </h:form>
        </body>
    </html>
</f:view>
