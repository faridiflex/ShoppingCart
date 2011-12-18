

<%@ page import="com.reb.Buyer" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main1" />
        <g:set var="entityName" value="${message(code: 'buyer.label', default: 'Buyer')}" />
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
            <g:hasErrors bean="${buyerInstance}">
            <div class="errors">
                <g:renderErrors bean="${buyerInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${buyerInstance?.id}" />
                <g:hiddenField name="version" value="${buyerInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="loginId"><g:message code="buyer.loginId.label" default="Login Id" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: buyerInstance, field: 'loginId', 'errors')}">
                                    <g:textField name="loginId" value="${buyerInstance?.loginId}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="profile"><g:message code="buyer.profile.label" default="Profile" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: buyerInstance, field: 'profile', 'errors')}">
                                    <g:select name="profile.id" from="${com.reb.profile.BuyerProfile.list()}" optionKey="id" value="${buyerInstance?.profile?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="tags"><g:message code="buyer.tags.label" default="Tags" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: buyerInstance, field: 'tags', 'errors')}">
                                    <g:select name="tags" from="${com.reb.info.Tag.list()}" multiple="yes" optionKey="id" size="5" value="${buyerInstance?.tags*.id}" />
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
