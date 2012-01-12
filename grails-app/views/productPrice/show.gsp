
<%@ page import="com.reb.ProductPrice" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'productPrice.label', default: 'ProductPrice')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-productPrice" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-productPrice" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list productPrice">
			
				<g:if test="${productPrice?.priceInPaise}">
				<li class="fieldcontain">
					<span id="priceInPaise-label" class="property-label"><g:message code="productPrice.priceInPaise.label" default="Price In Paise" /></span>
					
						<span class="property-value" aria-labelledby="priceInPaise-label"><g:fieldValue bean="${productPrice}" field="priceInPaise"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${productPrice?.product}">
				<li class="fieldcontain">
					<span id="product-label" class="property-label"><g:message code="productPrice.product.label" default="Product" /></span>
					
						<span class="property-value" aria-labelledby="product-label"><g:link controller="product" action="show" id="${productPrice?.product?.id}">${productPrice?.product?.name?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${productPrice?.validFrom}">
				<li class="fieldcontain">
					<span id="validFrom-label" class="property-label"><g:message code="productPrice.validFrom.label" default="Valid From" /></span>
					
						<span class="property-value" aria-labelledby="validFrom-label"><g:formatDate date="${productPrice?.validFrom}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${productPrice?.validTill}">
				<li class="fieldcontain">
					<span id="validTill-label" class="property-label"><g:message code="productPrice.validTill.label" default="Valid Till" /></span>
					
						<span class="property-value" aria-labelledby="validTill-label"><g:formatDate date="${productPrice?.validTill}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${productPrice?.id}" />
					<g:link class="edit" action="edit" id="${productPrice?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
