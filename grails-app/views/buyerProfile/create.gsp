

<%@ page import="com.reb.profile.BuyerProfile" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main1" />
        <g:set var="entityName" value="${message(code: 'buyerProfile.label', default: 'BuyerProfile')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${buyerProfileInstance}">
            <div class="errors">
                <g:renderErrors bean="${buyerProfileInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="contactInfo"><g:message code="buyerProfile.contactInfo.label" default="Contact Info" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: buyerProfileInstance, field: 'contactInfo', 'errors')}">
                                    <g:select name="contactInfo.id" from="${com.reb.info.ContactInfo.list()}" optionKey="id" value="${buyerProfileInstance?.contactInfo?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="name"><g:message code="buyerProfile.name.label" default="Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: buyerProfileInstance, field: 'name', 'errors')}">
                                    <g:textField name="name" value="${buyerProfileInstance?.name}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="registrationInfo"><g:message code="buyerProfile.registrationInfo.label" default="Registration Info" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: buyerProfileInstance, field: 'registrationInfo', 'errors')}">
                                    <g:select name="registrationInfo.id" from="${com.reb.info.RegistrationInfo.list()}" optionKey="id" value="${buyerProfileInstance?.registrationInfo?.id}"  />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
