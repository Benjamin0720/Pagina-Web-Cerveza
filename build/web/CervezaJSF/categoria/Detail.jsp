<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Categoria Detail</title>
            <link rel="stylesheet" type="text/css" href="/Cerveza/faces/jsfcrud.css" />
        </head>
        <body>
            <h:panelGroup id="messagePanel" layout="block">
                <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
            </h:panelGroup>
            <h1>Categoria Detail</h1>
            <h:form>
                <h:panelGrid columns="2">
                    <h:outputText value="Id:"/>
                    <h:outputText value="#{categoria.categoria.id}" title="Id" />
                    <h:outputText value="Descripcion:"/>
                    <h:outputText value="#{categoria.categoria.descripcion}" title="Descripcion" />

                    <h:outputText value="CervezaList:" />
                    <h:panelGroup>
                        <h:outputText rendered="#{empty categoria.categoria.cervezaList}" value="(No Items)"/>
                        <h:dataTable value="#{categoria.categoria.cervezaList}" var="item" 
                                     border="0" cellpadding="2" cellspacing="0" rowClasses="jsfcrud_odd_row,jsfcrud_even_row" rules="all" style="border:solid 1px" 
                                     rendered="#{not empty categoria.categoria.cervezaList}">
                            <h:column>
                                <f:facet name="header">
                                    <h:outputText value="Nombre"/>
                                </f:facet>
                                <h:outputText value="#{item.nombre}"/>
                            </h:column>
                            <h:column>
                                <f:facet name="header">
                                    <h:outputText value="Precio"/>
                                </f:facet>
                                <h:outputText value="#{item.precio}"/>
                            </h:column>
                            <h:column>
                                <f:facet name="header">
                                    <h:outputText value="Marca"/>
                                </f:facet>
                                <h:outputText value="#{item.marca}"/>
                            </h:column>
                            <h:column>
                                <f:facet name="header">
                                    <h:outputText value="Stock"/>
                                </f:facet>
                                <h:outputText value="#{item.stock}"/>
                            </h:column>
                            <h:column>
                                <f:facet name="header">
                                    <h:outputText value="Imagen"/>
                                </f:facet>
                                <h:outputText value="#{item.imagen}"/>
                            </h:column>
                            <h:column>
                                <f:facet name="header">
                                    <h:outputText value="Categoria"/>
                                </f:facet>
                                <h:outputText value="#{item.categoria}"/>
                            </h:column>
                            <h:column>
                                <f:facet name="header">
                                    <h:outputText escape="false" value="&nbsp;"/>
                                </f:facet>
                                <h:commandLink value="Show" action="#{cerveza.detailSetup}">
                                    <f:param name="jsfcrud.currentCategoria" value="#{jsfcrud_class['DAOJSF.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][categoria.categoria][categoria.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.currentCerveza" value="#{jsfcrud_class['DAOJSF.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][cerveza.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.relatedController" value="categoria" />
                                    <f:param name="jsfcrud.relatedControllerType" value="DAOJSF.CategoriaController" />
                                </h:commandLink>
                                <h:outputText value=" "/>
                                <h:commandLink value="Edit" action="#{cerveza.editSetup}">
                                    <f:param name="jsfcrud.currentCategoria" value="#{jsfcrud_class['DAOJSF.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][categoria.categoria][categoria.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.currentCerveza" value="#{jsfcrud_class['DAOJSF.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][cerveza.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.relatedController" value="categoria" />
                                    <f:param name="jsfcrud.relatedControllerType" value="DAOJSF.CategoriaController" />
                                </h:commandLink>
                                <h:outputText value=" "/>
                                <h:commandLink value="Destroy" action="#{cerveza.destroy}">
                                    <f:param name="jsfcrud.currentCategoria" value="#{jsfcrud_class['DAOJSF.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][categoria.categoria][categoria.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.currentCerveza" value="#{jsfcrud_class['DAOJSF.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][cerveza.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.relatedController" value="categoria" />
                                    <f:param name="jsfcrud.relatedControllerType" value="DAOJSF.CategoriaController" />
                                </h:commandLink>
                            </h:column>
                        </h:dataTable>
                    </h:panelGroup>

                </h:panelGrid>
                <br />
                <h:commandLink action="#{categoria.remove}" value="Destroy">
                    <f:param name="jsfcrud.currentCategoria" value="#{jsfcrud_class['DAOJSF.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][categoria.categoria][categoria.converter].jsfcrud_invoke}" />
                </h:commandLink>
                <br />
                <br />
                <h:commandLink action="#{categoria.editSetup}" value="Edit">
                    <f:param name="jsfcrud.currentCategoria" value="#{jsfcrud_class['DAOJSF.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][categoria.categoria][categoria.converter].jsfcrud_invoke}" />
                </h:commandLink>
                <br />
                <h:commandLink action="#{categoria.createSetup}" value="New Categoria" />
                <br />
                <h:commandLink action="#{categoria.listSetup}" value="Show All Categoria Items"/>
                <br />
                <br />
                <h:commandLink value="Index" action="welcome" immediate="true" />

            </h:form>
        </body>
    </html>
</f:view>
