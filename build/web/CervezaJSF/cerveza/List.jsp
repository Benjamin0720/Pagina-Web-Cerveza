<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Listing Cerveza Items</title>
            <link rel="stylesheet" type="text/css" href="/Cerveza/faces/jsfcrud.css" />
        </head>
        <body>
            <h:panelGroup id="messagePanel" layout="block">
                <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
            </h:panelGroup>
            <h1>Listing Cerveza Items</h1>
            <h:form styleClass="jsfcrud_list_form">
                <h:outputText escape="false" value="(No Cerveza Items Found)<br />" rendered="#{cerveza.pagingInfo.itemCount == 0}" />
                <h:panelGroup rendered="#{cerveza.pagingInfo.itemCount > 0}">
                    <h:outputText value="Item #{cerveza.pagingInfo.firstItem + 1}..#{cerveza.pagingInfo.lastItem} of #{cerveza.pagingInfo.itemCount}"/>&nbsp;
                    <h:commandLink action="#{cerveza.prev}" value="Previous #{cerveza.pagingInfo.batchSize}" rendered="#{cerveza.pagingInfo.firstItem >= cerveza.pagingInfo.batchSize}"/>&nbsp;
                    <h:commandLink action="#{cerveza.next}" value="Next #{cerveza.pagingInfo.batchSize}" rendered="#{cerveza.pagingInfo.lastItem + cerveza.pagingInfo.batchSize <= cerveza.pagingInfo.itemCount}"/>&nbsp;
                    <h:commandLink action="#{cerveza.next}" value="Remaining #{cerveza.pagingInfo.itemCount - cerveza.pagingInfo.lastItem}"
                                   rendered="#{cerveza.pagingInfo.lastItem < cerveza.pagingInfo.itemCount && cerveza.pagingInfo.lastItem + cerveza.pagingInfo.batchSize > cerveza.pagingInfo.itemCount}"/>
                    <h:dataTable value="#{cerveza.cervezaItems}" var="item" border="0" cellpadding="2" cellspacing="0" rowClasses="jsfcrud_odd_row,jsfcrud_even_row" rules="all" style="border:solid 1px">
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
                                <f:param name="jsfcrud.currentCerveza" value="#{jsfcrud_class['DAOJSF.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][cerveza.converter].jsfcrud_invoke}"/>
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Edit" action="#{cerveza.editSetup}">
                                <f:param name="jsfcrud.currentCerveza" value="#{jsfcrud_class['DAOJSF.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][cerveza.converter].jsfcrud_invoke}"/>
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Destroy" action="#{cerveza.remove}">
                                <f:param name="jsfcrud.currentCerveza" value="#{jsfcrud_class['DAOJSF.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][cerveza.converter].jsfcrud_invoke}"/>
                            </h:commandLink>
                        </h:column>

                    </h:dataTable>
                </h:panelGroup>
                <br />
                <h:commandLink action="#{cerveza.createSetup}" value="New Cerveza"/>
                <br />
                <br />
                <h:commandLink value="Index" action="welcome" immediate="true" />


            </h:form>
        </body>
    </html>
</f:view>
