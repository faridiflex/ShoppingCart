
<%@ page import="com.reb.info.RegistrationInfo" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'registrationInfo.label', default: 'RegistrationInfo')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'registrationInfo.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="activationDate" title="${message(code: 'registrationInfo.activationDate.label', default: 'Activation Date')}" />
                        
                            <g:sortableColumn property="registrationDate" title="${message(code: 'registrationInfo.registrationDate.label', default: 'Registration Date')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${registrationInfoInstanceList}" status="i" var="registrationInfoInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${registrationInfoInstance.id}">${fieldValue(bean: registrationInfoInstance, field: "id")}</g:link></td>
                        
                            <td><g:formatDate date="${registrationInfoInstance.activationDate}" /></td>
                        
                            <td><g:formatDate date="${registrationInfoInstance.registrationDate}" /></td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${registrationInfoInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
