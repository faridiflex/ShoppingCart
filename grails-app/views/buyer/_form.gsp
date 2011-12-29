<%@ page import="com.reb.Buyer" %>



<div class="fieldcontain ${hasErrors(bean: buyerInstance, field: 'loginId', 'error')} ">
	<label for="loginId">
		<g:message code="buyer.loginId.label" default="Login Id" />
		
	</label>
	<g:textField name="loginId" value="${buyerInstance?.loginId}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: buyerInstance, field: 'profile', 'error')} required">
	<label for="profile">
		<g:message code="buyer.profile.label" default="Profile" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="profile" name="profile.id" from="${com.reb.profile.BuyerProfile.list()}" optionKey="id" required="" value="${buyerInstance?.profile?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: buyerInstance, field: 'tags', 'error')} ">
	<label for="tags">
		<g:message code="buyer.tags.label" default="Tags" />
		
	</label>
	<g:select name="tags" from="${com.reb.info.Tag.list()}" multiple="multiple" optionKey="id" size="5" value="${buyerInstance?.tags*.id}" class="many-to-many"/>
</div>

