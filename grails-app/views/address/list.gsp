
<%@ page import="com.reb.info.Address" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'address.label', default: 'Address')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'address.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="addLine1" title="${message(code: 'address.addLine1.label', default: 'Add Line1')}" />
                        
                            <g:sortableColumn property="addLine2" title="${message(code: 'address.addLine2.label', default: 'Add Line2')}" />
                        
                            <g:sortableColumn property="city" title="${message(code: 'address.city.label', default: 'City')}" />
                        
                            <g:sortableColumn property="landmark" title="${message(code: 'address.landmark.label', default: 'Landmark')}" />
                        
                            <g:sortableColumn property="pinCode" title="${message(code: 'address.pinCode.label', default: 'Pin Code')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${addressInstanceList}" status="i" var="addressInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${addressInstance.id}">${fieldValue(bean: addressInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: addressInstance, field: "addLine1")}</td>
                        
                            <td>${fieldValue(bean: addressInstance, field: "addLine2")}</td>
                        
                            <td>${fieldValue(bean: addressInstance, field: "city")}</td>
                        
                            <td>${fieldValue(bean: addressInstance, field: "landmark")}</td>
                        
                            <td>${fieldValue(bean: addressInstance, field: "pinCode")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${addressInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
