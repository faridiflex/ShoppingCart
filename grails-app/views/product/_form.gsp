<%@ page import="com.reb.Product" %>



<div class="fieldcontain ${hasErrors(bean: product, field: 'primaryImage', 'error')} ">
	<label for="primaryImage">
		<g:message code="product.primaryImage.label" default="Primary Image" />
		
	</label>
	<input type="file" id="primaryImage" name="primaryImage" />
</div>

<div class="fieldcontain ${hasErrors(bean: product, field: 'categories', 'error')} ">
	<label for="categories">
		<g:message code="product.categories.label" default="Categories" />
		
	</label>
	<g:select name="categories" from="${com.reb.ProductCategory.list()}" multiple="multiple" optionKey="id" size="5" value="${product?.categories*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: product, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="product.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${product?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: product, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="product.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${product?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: product, field: 'status', 'error')} required">
	<label for="status">
		<g:message code="product.status.label" default="Status" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="status" from="${com.reb.enums.ProductStatus?.values()}" keys="${com.reb.enums.ProductStatus.values()*.name()}" required="" value="${product?.status?.name()}"/>
</div>

