<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Usuario Detail</title>
            <link rel="stylesheet" type="text/css" href="/Cerveza/faces/jsfcrud.css" />
        </head>
        <body>
            <h:panelGroup id="messagePanel" layout="block">
                <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
            </h:panelGroup>
            <h1>Usuario Detail</h1>
            <h:form>
                <h:panelGrid columns="2">
                    <h:outputText value="Email:"/>
                    <h:outputText value="#{usuario.usuario.email}" title="Email" />
                    <h:outputText value="Nombre:"/>
                    <h:outputText value="#{usuario.usuario.nombre}" title="Nombre" />
                    <h:outputText value="Pass:"/>
                    <h:outputText value="#{usuario.usuario.pass}" title="Pass" />
                    <h:outputText value="Perfil:"/>
                    <h:panelGroup>
                        <h:outputText value="#{usuario.usuario.perfil}"/>
                        <h:panelGroup rendered="#{usuario.usuario.perfil != null}">
                            <h:outputText value=" ("/>
                            <h:commandLink value="Show" action="#{perfilUsuario.detailSetup}">
                                <f:param name="jsfcrud.currentUsuario" value="#{jsfcrud_class['DAOJSF.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][usuario.usuario][usuario.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentPerfilUsuario" value="#{jsfcrud_class['DAOJSF.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][usuario.usuario.perfil][perfilUsuario.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="usuario"/>
                                <f:param name="jsfcrud.relatedControllerType" value="DAOJSF.UsuarioController"/>
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Edit" action="#{perfilUsuario.editSetup}">
                                <f:param name="jsfcrud.currentUsuario" value="#{jsfcrud_class['DAOJSF.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][usuario.usuario][usuario.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentPerfilUsuario" value="#{jsfcrud_class['DAOJSF.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][usuario.usuario.perfil][perfilUsuario.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="usuario"/>
                                <f:param name="jsfcrud.relatedControllerType" value="DAOJSF.UsuarioController"/>
                            </h:commandLink>
                            <h:outputText value=" "/>
                            <h:commandLink value="Destroy" action="#{perfilUsuario.destroy}">
                                <f:param name="jsfcrud.currentUsuario" value="#{jsfcrud_class['DAOJSF.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][usuario.usuario][usuario.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.currentPerfilUsuario" value="#{jsfcrud_class['DAOJSF.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][usuario.usuario.perfil][perfilUsuario.converter].jsfcrud_invoke}"/>
                                <f:param name="jsfcrud.relatedController" value="usuario"/>
                                <f:param name="jsfcrud.relatedControllerType" value="DAOJSF.UsuarioController"/>
                            </h:commandLink>
                            <h:outputText value=" )"/>
                        </h:panelGroup>
                    </h:panelGroup>


                </h:panelGrid>
                <br />
                <h:commandLink action="#{usuario.remove}" value="Destroy">
                    <f:param name="jsfcrud.currentUsuario" value="#{jsfcrud_class['DAOJSF.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][usuario.usuario][usuario.converter].jsfcrud_invoke}" />
                </h:commandLink>
                <br />
                <br />
                <h:commandLink action="#{usuario.editSetup}" value="Edit">
                    <f:param name="jsfcrud.currentUsuario" value="#{jsfcrud_class['DAOJSF.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][usuario.usuario][usuario.converter].jsfcrud_invoke}" />
                </h:commandLink>
                <br />
                <h:commandLink action="#{usuario.createSetup}" value="New Usuario" />
                <br />
                <h:commandLink action="#{usuario.listSetup}" value="Show All Usuario Items"/>
                <br />
                <br />
                <h:commandLink value="Index" action="welcome" immediate="true" />

            </h:form>
        </body>
    </html>
</f:view>
