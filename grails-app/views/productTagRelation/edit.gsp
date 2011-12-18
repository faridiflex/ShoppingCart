

<%@ page import="com.reb.relation.ProductTagRelation" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main1" />
        <g:set var="entityName" value="${message(code: 'productTagRelation.label', default: 'ProductTagRelation')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${productTagRelationInstance}">
            <div class="errors">
                <g:renderErrors bean="${productTagRelationInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${productTagRelationInstance?.id}" />
                <g:hiddenField name="version" value="${productTagRelationInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="product"><g:message code="productTagRelation.product.label" default="Product" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: productTagRelationInstance, field: 'product', 'errors')}">
                                    <g:select name="product.id" from="${com.reb.Product.list()}" optionKey="id" value="${productTagRelationInstance?.product?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="tag"><g:message code="productTagRelation.tag.label" default="Tag" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: productTagRelationInstance, field: 'tag', 'errors')}">
                                    <g:select name="tag.id" from="${com.reb.info.Tag.list()}" optionKey="id" value="${productTagRelationInstance?.tag?.id}"  />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
