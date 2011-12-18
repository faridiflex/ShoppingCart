
<%@ page import="com.reb.info.ContactInfo" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'contactInfo.label', default: 'ContactInfo')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'contactInfo.id.label', default: 'Id')}" />
                        
                            <th><g:message code="contactInfo.address.label" default="Address" /></th>
                        
                            <g:sortableColumn property="email" title="${message(code: 'contactInfo.email.label', default: 'Email')}" />
                        
                            <g:sortableColumn property="mobile" title="${message(code: 'contactInfo.mobile.label', default: 'Mobile')}" />
                        
                            <g:sortableColumn property="name" title="${message(code: 'contactInfo.name.label', default: 'Name')}" />
                        
                            <g:sortableColumn property="phone" title="${message(code: 'contactInfo.phone.label', default: 'Phone')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${contactInfoList}" status="i" var="contactInfo">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${contactInfo.id}">${fieldValue(bean: contactInfo, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: contactInfo, field: "address")}</td>
                        
                            <td>${fieldValue(bean: contactInfo, field: "email")}</td>
                        
                            <td>${fieldValue(bean: contactInfo, field: "mobile")}</td>
                        
                            <td>${fieldValue(bean: contactInfo, field: "name")}</td>
                        
                            <td>${fieldValue(bean: contactInfo, field: "phone")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${contactInfoTotal}" />
            </div>
        </div>
    </body>
</html>
