<tr class="prop">
    <td valign="top" class="name">
        <label for="${prefix}activationDate"><g:message code="registrationInfo.activationDate.label"
                                               default="Activation Date"/></label>
    </td>
    <td valign="top" class="value ${hasErrors(bean: registrationInfo, field: 'activationDate', 'errors')}">
        <g:textField name="${prefix}activationDate" precision="day" value="${registrationInfo?.activationDate}"/>
    </td>
</tr>

<tr class="prop">
    <td valign="top" class="name">
        <label for="${prefix}registrationDate"><g:message code="registrationInfo.registrationDate.label"
                                                 default="Registration Date"/></label>
    </td>
    <td valign="top" class="value ${hasErrors(bean: registrationInfo, field: 'registrationDate', 'errors')}">
        <g:textField name="${prefix}registrationDate" precision="day" value="${registrationInfo?.registrationDate}"/>
    </td>
</tr>