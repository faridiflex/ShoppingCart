
<%@ page import="com.reb.Seller" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main1" />
        <g:set var="entityName" value="${message(code: 'seller.label', default: 'Seller')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'seller.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="loginId" title="${message(code: 'seller.loginId.label', default: 'Login Id')}" />
                        
                            <th><g:message code="seller.profile.label" default="Profile" /></th>
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${sellerInstanceList}" status="i" var="sellerInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${sellerInstance.id}">${fieldValue(bean: sellerInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: sellerInstance, field: "loginId")}</td>
                        
                            <td>${fieldValue(bean: sellerInstance, field: "profile")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${sellerInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
