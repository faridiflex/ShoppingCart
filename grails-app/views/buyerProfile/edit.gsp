

<%@ page import="com.reb.profile.BuyerProfile" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'buyerProfile.label', default: 'BuyerProfile')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${buyerProfile}">
            <div class="errors">
                <g:renderErrors bean="${buyerProfile}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${buyerProfile?.id}" />
                <g:hiddenField name="version" value="${buyerProfile?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="contactInfo"><g:message code="buyerProfile.contactInfo.label" default="Contact Info" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: buyerProfile, field: 'contactInfo', 'errors')}">
                                    <g:select name="contactInfo.id" from="${com.reb.info.ContactInfo.list()}" optionKey="id" value="${buyerProfile?.contactInfo?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="name"><g:message code="buyerProfile.name.label" default="Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: buyerProfile, field: 'name', 'errors')}">
                                    <g:textField name="name" value="${buyerProfile?.name}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="registrationInfo"><g:message code="buyerProfile.registrationInfo.label" default="Registration Info" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: buyerProfile, field: 'registrationInfo', 'errors')}">
                                    <g:select name="registrationInfo.id" from="${com.reb.info.RegistrationInfo.list()}" optionKey="id" value="${buyerProfile?.registrationInfo?.id}"  />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
