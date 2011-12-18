
<%@ page import="com.reb.relation.BuyerTagRelation" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main1" />
        <g:set var="entityName" value="${message(code: 'buyerTagRelation.label', default: 'BuyerTagRelation')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'buyerTagRelation.id.label', default: 'Id')}" />
                        
                            <th><g:message code="buyerTagRelation.buyer.label" default="Buyer" /></th>
                        
                            <th><g:message code="buyerTagRelation.tag.label" default="Tag" /></th>
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${buyerTagRelationInstanceList}" status="i" var="buyerTagRelationInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${buyerTagRelationInstance.id}">${fieldValue(bean: buyerTagRelationInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: buyerTagRelationInstance, field: "buyer")}</td>
                        
                            <td>${fieldValue(bean: buyerTagRelationInstance, field: "tag")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${buyerTagRelationInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
