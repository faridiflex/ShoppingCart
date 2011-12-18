

<%@ page import="com.reb.info.ContactInfo" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'contactInfo.label', default: 'ContactInfo')}" />
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
            <g:hasErrors bean="${contactInfo}">
            <div class="errors">
                <g:renderErrors bean="${contactInfo}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="address"><g:message code="contactInfo.address.label" default="Address" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: contactInfo, field: 'address', 'errors')}">
                                    <g:select name="address.id" from="${com.reb.info.Address.list()}" optionKey="id" value="${contactInfo?.address?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="email"><g:message code="contactInfo.email.label" default="Email" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: contactInfo, field: 'email', 'errors')}">
                                    <g:textField name="email" value="${contactInfo?.email}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="mobile"><g:message code="contactInfo.mobile.label" default="Mobile" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: contactInfo, field: 'mobile', 'errors')}">
                                    <g:textField name="mobile" value="${contactInfo?.mobile}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="name"><g:message code="contactInfo.name.label" default="Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: contactInfo, field: 'name', 'errors')}">
                                    <g:textField name="name" value="${contactInfo?.name}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="phone"><g:message code="contactInfo.phone.label" default="Phone" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: contactInfo, field: 'phone', 'errors')}">
                                    <g:textField name="phone" value="${contactInfo?.phone}" />
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
