<%@ page import="com.reb.info.Tag" %>



<div class="fieldcontain ${hasErrors(bean: tag, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="tag.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${tag?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: tag, field: 'tagName', 'error')} ">
	<label for="tagName">
		<g:message code="tag.tagName.label" default="Tag Name" />
		
	</label>
	<g:textField name="tagName" value="${tag?.tagName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: tag, field: 'type', 'error')} required">
	<label for="type">
		<g:message code="tag.type.label" default="Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="type" from="${com.reb.TagType?.values()}" keys="${com.reb.TagType.values()*.name()}" required="" value="${tag?.type?.name()}"/>
</div>

