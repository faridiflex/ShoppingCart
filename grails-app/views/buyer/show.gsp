<%@ page import="com.reb.Buyer" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'buyer.label', default: 'Buyer')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<a href="#show-buyer" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                            default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]"/></g:link></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="show-buyer" class="content scaffold-show" role="main">
    <h1><g:message code="default.show.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <ol class="property-list buyer">

        <g:if test="${buyer?.loginId}">
            <li class="fieldcontain">
                <span id="loginId-label" class="property-label"><g:message code="buyer.loginId.label"
                                                                           default="Login Id"/></span>

                <span class="property-value" aria-labelledby="loginId-label"><g:fieldValue bean="${buyer}"
                                                                                           field="loginId"/></span>

            </li>
        </g:if>

        <g:if test="${buyer?.dateCreated}">
            <li class="fieldcontain">
                <span id="dateCreated-label" class="property-label"><g:message code="buyer.dateCreated.label"
                                                                               default="Date Created"/></span>

                <span class="property-value" aria-labelledby="profile-label">${buyer.dateCreated}</span>

            </li>
        </g:if>

        <g:if test="${buyer?.profile}">
            <li class="fieldcontain">
                <span id="profile-label" class="property-label"><g:message code="buyer.profile.label"
                                                                           default="Profile"/></span>

                <span class="property-value" aria-labelledby="profile-label"><g:link controller="buyerProfile"
                                                                                     action="show"
                                                                                     id="${buyer?.profile?.id}">${buyer?.profile?.encodeAsHTML()}</g:link></span>

            </li>
        </g:if>

        <g:if test="${buyer?.tags}">
            <li class="fieldcontain">
                <span id="tags-label" class="property-label"><g:message code="buyer.tags.label" default="Tags"/></span>

                <g:each in="${buyer.tags}" var="t">
                    <span class="property-value" aria-labelledby="tags-label"><g:link controller="tag" action="show"
                                                                                      id="${t.id}">${t?.encodeAsHTML()}</g:link></span>
                </g:each>

            </li>
        </g:if>


    </ol>
    <g:form>
        <fieldset class="buttons">
            <g:hiddenField name="id" value="${buyer?.id}"/>
            <g:link class="edit" action="edit" id="${buyer?.id}"><g:message code="default.button.edit.label"
                                                                            default="Edit"/></g:link>
            <g:actionSubmit class="delete" action="delete"
                            value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                            onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>

            <g:link class="create" action="addTags" id="${buyer?.id}">Add Tags</g:link>
            <g:link class="create" action="addDetails" id="${buyer?.id}">Add Details</g:link>

        </fieldset>
    </g:form>
</div>
</body>
</html>
