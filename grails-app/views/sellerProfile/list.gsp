
<%@ page import="com.reb.profile.SellerProfile" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main1" />
        <g:set var="entityName" value="${message(code: 'sellerProfile.label', default: 'SellerProfile')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'sellerProfile.id.label', default: 'Id')}" />
                        
                            <th><g:message code="sellerProfile.contactInfo.label" default="Contact Info" /></th>
                        
                            <g:sortableColumn property="name" title="${message(code: 'sellerProfile.name.label', default: 'Name')}" />
                        
                            <th><g:message code="sellerProfile.registrationInfo.label" default="Registration Info" /></th>
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${sellerProfileInstanceList}" status="i" var="sellerProfileInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${sellerProfileInstance.id}">${fieldValue(bean: sellerProfileInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: sellerProfileInstance, field: "contactInfo")}</td>
                        
                            <td>${fieldValue(bean: sellerProfileInstance, field: "name")}</td>
                        
                            <td>${fieldValue(bean: sellerProfileInstance, field: "registrationInfo")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${sellerProfileInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
