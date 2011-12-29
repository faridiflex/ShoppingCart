
<%@ page import="com.reb.Buyer" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'buyer.label', default: 'Buyer')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-buyer" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-buyer" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="loginId" title="${message(code: 'buyer.loginId.label', default: 'Login Id')}" />
					
						<th><g:message code="buyer.profile.label" default="Profile" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${buyerList}" status="i" var="buyer">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${buyer.id}">${fieldValue(bean: buyer, field: "loginId")}</g:link></td>
					
						<td>${fieldValue(bean: buyer, field: "profile")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${buyerTotal}" />
			</div>
		</div>
	</body>
</html>
