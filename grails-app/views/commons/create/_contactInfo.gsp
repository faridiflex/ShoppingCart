%{--

Usage:-

This template expects a contactPrefix in model to separate out the contact info parameters

--}%

<tr class="prop">
    <td valign="top" class="name">
        <label for="${contactPrefix}.addLine1"><g:message code="contactInfo?.address.addLine1.label"
                                                          default="Add Line1"/></label>
    </td>
    <td valign="top" class="value ${hasErrors(bean: contactInfo?.address, field: 'addLine1', 'errors')}">
        <g:textField name="${contactPrefix}.addLine1" value="${contactInfo?.address?.addLine1}"/>
    </td>
</tr>

<tr class="prop">
    <td valign="top" class="name">
        <label for="${contactPrefix}.addLine2"><g:message code="contactInfo?.address.addLine2.label"
                                                          default="Add Line2"/></label>
    </td>
    <td valign="top" class="value ${hasErrors(bean: contactInfo?.address, field: 'addLine2', 'errors')}">
        <g:textField name="${contactPrefix}.addLine2" value="${contactInfo?.address?.addLine2}"/>
    </td>
</tr>

<tr class="prop">
    <td valign="top" class="name">
        <label for="${contactPrefix}.city"><g:message code="contactInfo?.address.city.label" default="City"/></label>
    </td>
    <td valign="top" class="value ${hasErrors(bean: contactInfo?.address, field: 'city', 'errors')}">
        <g:textField name="${contactPrefix}.city" value="${contactInfo?.address?.city}"/>
    </td>
</tr>

<tr class="prop">
    <td valign="top" class="name">
        <label for="${contactPrefix}.landmark"><g:message code="contactInfo?.address.landmark.label"
                                                          default="Landmark"/></label>
    </td>
    <td valign="top" class="value ${hasErrors(bean: contactInfo?.address, field: 'landmark', 'errors')}">
        <g:textField name="${contactPrefix}.landmark" value="${contactInfo?.address?.landmark}"/>
    </td>
</tr>

<tr class="prop">
    <td valign="top" class="name">
        <label for="${contactPrefix}.pinCode"><g:message code="contactInfo?.address.pinCode.label"
                                                         default="Pin Code"/></label>
    </td>
    <td valign="top" class="value ${hasErrors(bean: contactInfo?.address, field: 'pinCode', 'errors')}">
        <g:textField name="${contactPrefix}.pinCode"
                     value="${fieldValue(bean: contactInfo?.address, field: 'pinCode')}"/>
    </td>
</tr>

<tr class="prop">
    <td valign="top" class="name">
        <label for="${contactPrefix}.state"><g:message code="contactInfo?.address.state.label" default="State"/></label>
    </td>
    <td valign="top" class="value ${hasErrors(bean: contactInfo?.address, field: 'state', 'errors')}">
        <g:textField name="${contactPrefix}.state" value="${contactInfo?.address?.state}"/>
    </td>
</tr>


<tr class="prop">
    <td valign="top" class="name">
        <label for="${contactPrefix}.email"><g:message code="contactInfo?.email.label" default="Email"/></label>
    </td>
    <td valign="top" class="value ${hasErrors(bean: contactInfo, field: 'email', 'errors')}">
        <g:textField name="${contactPrefix}.email" value="${contactInfo?.email}"/>
    </td>
</tr>

<tr class="prop">
    <td valign="top" class="name">
        <label for="${contactPrefix}.mobile"><g:message code="contactInfo?.mobile.label" default="Mobile"/></label>
    </td>
    <td valign="top" class="value ${hasErrors(bean: contactInfo, field: 'mobile', 'errors')}">
        <g:textField name="${contactPrefix}.mobile" value="${contactInfo?.mobile}"/>
    </td>
</tr>

<tr class="prop">
    <td valign="top" class="name">
        <label for="${contactPrefix}.name"><g:message code="contactInfo?.name.label" default="Name"/></label>
    </td>
    <td valign="top" class="value ${hasErrors(bean: contactInfo, field: 'name', 'errors')}">
        <g:textField name="${contactPrefix}.name" value="${contactInfo?.name}"/>
    </td>
</tr>

<tr class="prop">
    <td valign="top" class="name">
        <label for="${contactPrefix}.phone"><g:message code="contactInfo?.phone.label" default="Phone"/></label>
    </td>
    <td valign="top" class="value ${hasErrors(bean: contactInfo, field: 'phone', 'errors')}">
        <g:textField name="${contactPrefix}.phone" value="${contactInfo?.phone}"/>
    </td>
</tr>