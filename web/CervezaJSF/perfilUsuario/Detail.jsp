<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>PerfilUsuario Detail</title>
            <link rel="stylesheet" type="text/css" href="/Cerveza/faces/jsfcrud.css" />
        </head>
        <body>
            <h:panelGroup id="messagePanel" layout="block">
                <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
            </h:panelGroup>
            <h1>PerfilUsuario Detail</h1>
            <h:form>
                <h:panelGrid columns="2">
                    <h:outputText value="Id:"/>
                    <h:outputText value="#{perfilUsuario.perfilUsuario.id}" title="Id" />
                    <h:outputText value="Descripcion:"/>
                    <h:outputText value="#{perfilUsuario.perfilUsuario.descripcion}" title="Descripcion" />

                    <h:outputText value="UsuarioList:" />
                    <h:panelGroup>
                        <h:outputText rendered="#{empty perfilUsuario.perfilUsuario.usuarioList}" value="(No Items)"/>
                        <h:dataTable value="#{perfilUsuario.perfilUsuario.usuarioList}" var="item" 
                                     border="0" cellpadding="2" cellspacing="0" rowClasses="jsfcrud_odd_row,jsfcrud_even_row" rules="all" style="border:solid 1px" 
                                     rendered="#{not empty perfilUsuario.perfilUsuario.usuarioList}">
                            <h:column>
                                <f:facet name="header">
                                    <h:outputText value="Email"/>
                                </f:facet>
                                <h:outputText value="#{item.email}"/>
                            </h:column>
                            <h:column>
                                <f:facet name="header">
                                    <h:outputText value="Nombre"/>
                                </f:facet>
                                <h:outputText value="#{item.nombre}"/>
                            </h:column>
                            <h:column>
                                <f:facet name="header">
                                    <h:outputText value="Pass"/>
                                </f:facet>
                                <h:outputText value="#{item.pass}"/>
                            </h:column>
                            <h:column>
                                <f:facet name="header">
                                    <h:outputText value="Perfil"/>
                                </f:facet>
                                <h:outputText value="#{item.perfil}"/>
                            </h:column>
                            <h:column>
                                <f:facet name="header">
                                    <h:outputText escape="false" value="&nbsp;"/>
                                </f:facet>
                                <h:commandLink value="Show" action="#{usuario.detailSetup}">
                                    <f:param name="jsfcrud.currentPerfilUsuario" value="#{jsfcrud_class['DAOJSF.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][perfilUsuario.perfilUsuario][perfilUsuario.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.currentUsuario" value="#{jsfcrud_class['DAOJSF.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][usuario.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.relatedController" value="perfilUsuario" />
                                    <f:param name="jsfcrud.relatedControllerType" value="DAOJSF.PerfilUsuarioController" />
                                </h:commandLink>
                                <h:outputText value=" "/>
                                <h:commandLink value="Edit" action="#{usuario.editSetup}">
                                    <f:param name="jsfcrud.currentPerfilUsuario" value="#{jsfcrud_class['DAOJSF.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][perfilUsuario.perfilUsuario][perfilUsuario.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.currentUsuario" value="#{jsfcrud_class['DAOJSF.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][usuario.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.relatedController" value="perfilUsuario" />
                                    <f:param name="jsfcrud.relatedControllerType" value="DAOJSF.PerfilUsuarioController" />
                                </h:commandLink>
                                <h:outputText value=" "/>
                                <h:commandLink value="Destroy" action="#{usuario.destroy}">
                                    <f:param name="jsfcrud.currentPerfilUsuario" value="#{jsfcrud_class['DAOJSF.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][perfilUsuario.perfilUsuario][perfilUsuario.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.currentUsuario" value="#{jsfcrud_class['DAOJSF.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][usuario.converter].jsfcrud_invoke}"/>
                                    <f:param name="jsfcrud.relatedController" value="perfilUsuario" />
                                    <f:param name="jsfcrud.relatedControllerType" value="DAOJSF.PerfilUsuarioController" />
                                </h:commandLink>
                            </h:column>
                        </h:dataTable>
                    </h:panelGroup>

                </h:panelGrid>
                <br />
                <h:commandLink action="#{perfilUsuario.remove}" value="Destroy">
                    <f:param name="jsfcrud.currentPerfilUsuario" value="#{jsfcrud_class['DAOJSF.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][perfilUsuario.perfilUsuario][perfilUsuario.converter].jsfcrud_invoke}" />
                </h:commandLink>
                <br />
                <br />
                <h:commandLink action="#{perfilUsuario.editSetup}" value="Edit">
                    <f:param name="jsfcrud.currentPerfilUsuario" value="#{jsfcrud_class['DAOJSF.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][perfilUsuario.perfilUsuario][perfilUsuario.converter].jsfcrud_invoke}" />
                </h:commandLink>
                <br />
                <h:commandLink action="#{perfilUsuario.createSetup}" value="New PerfilUsuario" />
                <br />
                <h:commandLink action="#{perfilUsuario.listSetup}" value="Show All PerfilUsuario Items"/>
                <br />
                <br />
                <h:commandLink value="Index" action="welcome" immediate="true" />

            </h:form>
        </body>
    </html>
</f:view>
