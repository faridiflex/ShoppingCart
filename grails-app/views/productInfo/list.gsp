
<%@ page import="com.reb.info.ProductInfo" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'productInfo.label', default: 'ProductInfo')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'productInfo.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="primaryImage" title="${message(code: 'productInfo.primaryImage.label', default: 'Primary Image')}" />
                        
                            <g:sortableColumn property="description" title="${message(code: 'productInfo.description.label', default: 'Description')}" />
                        
                            <g:sortableColumn property="manufacturer" title="${message(code: 'productInfo.manufacturer.label', default: 'Manufacturer')}" />
                        
                            <g:sortableColumn property="name" title="${message(code: 'productInfo.name.label', default: 'Name')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${productInfoInstanceList}" status="i" var="productInfoInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${productInfoInstance.id}">${fieldValue(bean: productInfoInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: productInfoInstance, field: "primaryImage")}</td>
                        
                            <td>${fieldValue(bean: productInfoInstance, field: "description")}</td>
                        
                            <td>${fieldValue(bean: productInfoInstance, field: "manufacturer")}</td>
                        
                            <td>${fieldValue(bean: productInfoInstance, field: "name")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${productInfoInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
