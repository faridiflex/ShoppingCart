<%@ page import="com.reb.Buyer" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main1"/>
    <g:set var="entityName" value="${message(code: 'buyer.label', default: 'Buyer')}"/>
    <title><g:message code="default.create.label" args="[entityName]"/></title>
</head>

<body>
<div class="nav">
    <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a>
    </span>
    <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label"
                                                                           args="[entityName]"/></g:link></span>
</div>

<div class="body">
    <h1><g:message code="default.create.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${buyer}">
        <div class="errors">
            <g:renderErrors bean="${buyer}" as="list"/>
        </div>
    </g:hasErrors>
    <g:form action="save">
        <div class="dialog">
            <table>
                <tbody>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="loginId"><g:message code="buyer.loginId.label" default="Login Id"/></label>
                    </td>
                    <td valign="top" class="value ${hasErrors(bean: buyer, field: 'loginId', 'errors')}">
                        <g:textField name="loginId" value="${buyer?.loginId}"/>
                    </td>
                </tr>

                <g:render template="/commons/create/contactInfo" model="${[contactPrefix:'contactInfo']}"/>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="activationDate"><g:message code="registrationInfo.activationDate.label"
                                                               default="Activation Date"/></label>
                    </td>
                    <td valign="top"
                        class="value ${hasErrors(bean: registrationInfo, field: 'activationDate', 'errors')}">
                        <g:datePicker name="activationDate" precision="day"
                                      value="${registrationInfo?.activationDate}"/>
                    </td>
                </tr>

                <tr class="prop">
                    <td valign="top" class="name">
                        <label for="registrationDate"><g:message code="registrationInfo.registrationDate.label"
                                                                 default="Registration Date"/></label>
                    </td>
                    <td valign="top"
                        class="value ${hasErrors(bean: registrationInfo, field: 'registrationDate', 'errors')}">
                        <g:datePicker name="registrationDate" precision="day"
                                      value="${registrationInfo?.registrationDate}"/>
                    </td>
                </tr>

                </tbody>
            </table>
        </div>

        <div class="buttons">
            <span class="button"><g:submitButton name="create" class="save"
                                                 value="${message(code: 'default.button.create.label', default: 'Create')}"/></span>
        </div>
    </g:form>
</div>
</body>
</html>
