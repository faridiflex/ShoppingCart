

<%@ page import="com.reb.info.Tag" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main1" />
        <g:set var="entityName" value="${message(code: 'tag.label', default: 'Tag')}" />
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
            <g:hasErrors bean="${tagInstance}">
            <div class="errors">
                <g:renderErrors bean="${tagInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="description"><g:message code="tag.description.label" default="Description" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: tagInstance, field: 'description', 'errors')}">
                                    <g:textField name="description" value="${tagInstance?.description}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="tagName"><g:message code="tag.tagName.label" default="Tag Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: tagInstance, field: 'tagName', 'errors')}">
                                    <g:textField name="tagName" value="${tagInstance?.tagName}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="type"><g:message code="tag.type.label" default="Type" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: tagInstance, field: 'type', 'errors')}">
                                    <g:select name="type" from="${com.reb.TagType?.values()}" keys="${com.reb.TagType?.values()*.name()}" value="${tagInstance?.type?.name()}"  />
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
