

<%@ page import="com.reb.info.Address" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main1" />
        <g:set var="entityName" value="${message(code: 'address.label', default: 'Address')}" />
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
            <g:hasErrors bean="${address}">
            <div class="errors">
                <g:renderErrors bean="${address}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${address?.id}" />
                <g:hiddenField name="version" value="${address?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="addLine1"><g:message code="address.addLine1.label" default="Add Line1" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: address, field: 'addLine1', 'errors')}">
                                    <g:textField name="addLine1" value="${address?.addLine1}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="addLine2"><g:message code="address.addLine2.label" default="Add Line2" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: address, field: 'addLine2', 'errors')}">
                                    <g:textField name="addLine2" value="${address?.addLine2}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="city"><g:message code="address.city.label" default="City" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: address, field: 'city', 'errors')}">
                                    <g:textField name="city" value="${address?.city}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="landmark"><g:message code="address.landmark.label" default="Landmark" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: address, field: 'landmark', 'errors')}">
                                    <g:textField name="landmark" value="${address?.landmark}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="pinCode"><g:message code="address.pinCode.label" default="Pin Code" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: address, field: 'pinCode', 'errors')}">
                                    <g:textField name="pinCode" value="${fieldValue(bean: address, field: 'pinCode')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="state"><g:message code="address.state.label" default="State" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: address, field: 'state', 'errors')}">
                                    <g:textField name="state" value="${address?.state}" />
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
