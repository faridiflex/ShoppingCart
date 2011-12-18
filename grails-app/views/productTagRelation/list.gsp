
<%@ page import="com.reb.relation.ProductTagRelation" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'productTagRelation.label', default: 'ProductTagRelation')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'productTagRelation.id.label', default: 'Id')}" />
                        
                            <th><g:message code="productTagRelation.product.label" default="Product" /></th>
                        
                            <th><g:message code="productTagRelation.tag.label" default="Tag" /></th>
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${productTagRelationInstanceList}" status="i" var="productTagRelationInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${productTagRelationInstance.id}">${fieldValue(bean: productTagRelationInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: productTagRelationInstance, field: "product")}</td>
                        
                            <td>${fieldValue(bean: productTagRelationInstance, field: "tag")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${productTagRelationInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
