<tr class="prop">
    <td valign="top" class="name">
        <label for="${prefix}addLine1"><g:message code="address.addLine1.label" default="Add Line1"/></label>
    </td>
    <td valign="top" class="value ${hasErrors(bean: address, field: 'addLine1', 'errors')}">
        <g:textField name="${prefix}addLine1" value="${address?.addLine1}"/>
    </td>
</tr>

<tr class="prop">
    <td valign="top" class="name">
        <label for="${prefix}addLine2"><g:message code="address.addLine2.label" default="Add Line2"/></label>
    </td>
    <td valign="top" class="value ${hasErrors(bean: address, field: 'addLine2', 'errors')}">
        <g:textField name="${prefix}addLine2" value="${address?.addLine2}"/>
    </td>
</tr>

<tr class="prop">
    <td valign="top" class="name">
        <label for="${prefix}city"><g:message code="address.city.label" default="City"/></label>
    </td>
    <td valign="top" class="value ${hasErrors(bean: address, field: 'city', 'errors')}">
        <g:textField name="${prefix}city" value="${address?.city}"/>
    </td>
</tr>

<tr class="prop">
    <td valign="top" class="name">
        <label for="${prefix}landmark"><g:message code="address.landmark.label" default="Landmark"/></label>
    </td>
    <td valign="top" class="value ${hasErrors(bean: address, field: 'landmark', 'errors')}">
        <g:textField name="${prefix}landmark" value="${address?.landmark}"/>
    </td>
</tr>

<tr class="prop">
    <td valign="top" class="name">
        <label for="${prefix}pinCode"><g:message code="address.pinCode.label" default="Pin Code"/></label>
    </td>
    <td valign="top" class="value ${hasErrors(bean: address, field: 'pinCode', 'errors')}">
        <g:textField name="${prefix}pinCode" value="${fieldValue(bean: address, field: 'pinCode')}"/>
    </td>
</tr>

<tr class="prop">
    <td valign="top" class="name">
        <label for="${prefix}state"><g:message code="address.state.label" default="State"/></label>
    </td>
    <td valign="top" class="value ${hasErrors(bean: address, field: 'state', 'errors')}">
        <g:textField name="${prefix}state" value="${address?.state}"/>
    </td>
</tr>