<%@ page import="com.reb.ProductPrice" %>



<div class="fieldcontain ${hasErrors(bean: productPrice, field: 'priceInPaise', 'error')} required">
	<label for="priceInPaise">
		<g:message code="productPrice.priceInPaise.label" default="Price In Paise" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="priceInPaise" required="" value="${fieldValue(bean: productPrice, field: 'priceInPaise')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: productPrice, field: 'product', 'error')} required">
	<label for="product">
		<g:message code="productPrice.product.label" default="Product" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="product" name="product.id" from="${com.reb.Product.list()}" optionKey="id" optionValue="name" required="" value="${productPrice?.product?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: productPrice, field: 'validFrom', 'error')} required">
	<label for="validFrom">
		<g:message code="productPrice.validFrom.label" default="Valid From" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="validFrom" precision="day"  value="${productPrice?.validFrom}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: productPrice, field: 'validTill', 'error')} required">
	<label for="validTill">
		<g:message code="productPrice.validTill.label" default="Valid Till" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="validTill" precision="day"  value="${productPrice?.validTill}"  />
</div>

