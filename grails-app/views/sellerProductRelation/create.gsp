

<%@ page import="com.reb.relation.SellerProductRelation" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main1" />
        <g:set var="entityName" value="${message(code: 'sellerProductRelation.label', default: 'SellerProductRelation')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${sellerProductRelationInstance}">
            <div class="errors">
                <g:renderErrors bean="${sellerProductRelationInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="product"><g:message code="sellerProductRelation.product.label" default="Product" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: sellerProductRelationInstance, field: 'product', 'errors')}">
                                    <g:select name="product.id" from="${com.reb.Product.list()}" optionKey="id" value="${sellerProductRelationInstance?.product?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="seller"><g:message code="sellerProductRelation.seller.label" default="Seller" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: sellerProductRelationInstance, field: 'seller', 'errors')}">
                                    <g:select name="seller.id" from="${com.reb.Seller.list()}" optionKey="id" value="${sellerProductRelationInstance?.seller?.id}"  />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
