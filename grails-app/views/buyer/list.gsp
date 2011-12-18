
<%@ page import="com.reb.Buyer" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main1" />
        <g:set var="entityName" value="${message(code: 'buyer.label', default: 'Buyer')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'buyer.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="loginId" title="${message(code: 'buyer.loginId.label', default: 'Login Id')}" />
                        
                            <th><g:message code="buyer.profile.label" default="Profile" /></th>
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${buyerInstanceList}" status="i" var="buyerInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${buyerInstance.id}">${fieldValue(bean: buyerInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: buyerInstance, field: "loginId")}</td>
                        
                            <td>${fieldValue(bean: buyerInstance, field: "profile")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${buyerInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
