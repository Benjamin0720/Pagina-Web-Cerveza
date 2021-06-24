<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Listing PerfilUsuario Items</title>
            <link rel="stylesheet" type="text/css" href="/Cerveza/faces/jsfcrud.css" />
        </head>
        <body>
            <h:panelGroup id="messagePanel" layout="block">
                <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
            </h:panelGroup>
            <h1>Listing PerfilUsuario Items</h1>
            <h:form styleClass="jsfcrud_list_form">
                <h:outputText escape="false" value="(No PerfilUsuario Items Found)<br />" rendered="#{perfilUsuario.pagingInfo.itemCount == 0}" />
                <h:panelGroup rendered="#{perfilUsuario.pagingInfo.itemCount > 0}">
                    <h:outputText value="Item #{perfilUsuario.pagingInfo.firstItem + 1}..#{perfilUsuario.pagingInfo.lastItem} of #{perfilUsuario.pagingInfo.itemCount}"/>&nbsp;
                    <h:commandLink action="#{perfilUsuario.prev}" value="Previous #{perfilUsuario.pagingInfo.batchSize}" rendered="#{perfilUsuario.pagingInfo.firstItem >= perfilUsuario.pagingInfo.batchSize}"/>&nbsp;
                    <h:commandLink action="#{perfilUsuario.next}" value="Next #{perfilUsuario.pagingInfo.batchSize}" rendered="#{perfilUsuario.pagingInfo.lastItem + perfilUsuario.pagingInfo.batchSize <= perfilUsuario.pagingInfo.itemCount}"/>&nbsp;
                    <h:commandLink action="#{perfilUsuario.next}" value="Remaining #{perfilUsuario.pagingInfo.itemCount - perfilUsuario.pagingInfo.lastItem}"
                                   rendered="#{perfilUsuario.pagingInfo.lastItem < perfilUsuario.pagingInfo.itemCount && perfilUsuario.pagingInfo.lastItem + perfilUsuario.pagingInfo.batchSize > perfilUsuario.pagingInfo.itemCount}"/>
                    <h:dataTable value="#{perfilUsuario.perfilUsuarioItems}" var="item" border="0" cellpadding="2" cellspacing="0" rowClasses="jsfcrud_odd_row,jsfcrud_even_row" rules="all" style="border:solid 1px">
                        <h:column>
                            <f:facet name="header">
                                <h:outputText value="Descripcion"/>
                            </f:facet>
                            <h:outputText value="#{item.descripcion}"/>
                        </h:column>
                        <h:column>
                            <f:facet name="header">
                                <h:outputText escape="false" value="&nbsp;"/>
                            </f:facet>
                            <h:commandLink value="Show" action="#{perfilUsuario.detailSetup}">
                                <f:param name="jsfcrud.currentPerfilUsuario" value="#{jsfcrud_class['DAOJSF.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][perfilUsuario.converter].jsfcrud_invoke}"/>
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Edit" action="#{perfilUsuario.editSetup}">
                                <f:param name="jsfcrud.currentPerfilUsuario" value="#{jsfcrud_class['DAOJSF.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][perfilUsuario.converter].jsfcrud_invoke}"/>
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Destroy" action="#{perfilUsuario.remove}">
                                <f:param name="jsfcrud.currentPerfilUsuario" value="#{jsfcrud_class['DAOJSF.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][perfilUsuario.converter].jsfcrud_invoke}"/>
                            </h:commandLink>
                        </h:column>

                    </h:dataTable>
                </h:panelGroup>
                <br />
                <h:commandLink action="#{perfilUsuario.createSetup}" value="New PerfilUsuario"/>
                <br />
                <br />
                <h:commandLink value="Index" action="welcome" immediate="true" />


            </h:form>
        </body>
    </html>
</f:view>
