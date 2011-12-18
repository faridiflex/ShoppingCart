

<%@ page import="com.reb.relation.BuyerTagRelation" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main1" />
        <g:set var="entityName" value="${message(code: 'buyerTagRelation.label', default: 'BuyerTagRelation')}" />
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
            <g:hasErrors bean="${buyerTagRelationInstance}">
            <div class="errors">
                <g:renderErrors bean="${buyerTagRelationInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="buyer"><g:message code="buyerTagRelation.buyer.label" default="Buyer" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: buyerTagRelationInstance, field: 'buyer', 'errors')}">
                                    <g:select name="buyer.id" from="${com.reb.Buyer.list()}" optionKey="id" value="${buyerTagRelationInstance?.buyer?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="tag"><g:message code="buyerTagRelation.tag.label" default="Tag" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: buyerTagRelationInstance, field: 'tag', 'errors')}">
                                    <g:select name="tag.id" from="${com.reb.info.Tag.list()}" optionKey="id" value="${buyerTagRelationInstance?.tag?.id}"  />
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
