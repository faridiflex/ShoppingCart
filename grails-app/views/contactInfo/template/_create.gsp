%{--<tr class="prop">--}%
    %{--<td valign="top" class="name">--}%
        %{--<label for="address"><g:message code="contactInfo.address.label" default="Address"/></label>--}%
    %{--</td>--}%
    %{--<td valign="top" class="value ${hasErrors(bean: contactInfo, field: 'address', 'errors')}">--}%
        %{--<g:select name="address.id" from="${com.reb.info.Address.list()}" optionKey="id"--}%
                  %{--value="${contactInfo?.address?.id}"/>--}%
    %{--</td>--}%
%{--</tr>--}%
<g:render template="/address/template/create" model="[address: contactInfo?.address, prefix: prefix+'address.']"/>

<tr class="prop">
    <td valign="top" class="name">
        <label for="${prefix}email"><g:message code="contactInfo.email.label" default="Email"/></label>
    </td>
    <td valign="top" class="value ${hasErrors(bean: contactInfo, field: 'email', 'errors')}">
        <g:textField name="${prefix}email" value="${contactInfo?.email}"/>
    </td>
</tr>

<tr class="prop">
    <td valign="top" class="name">
        <label for="${prefix}mobile"><g:message code="contactInfo.mobile.label" default="Mobile"/></label>
    </td>
    <td valign="top" class="value ${hasErrors(bean: contactInfo, field: 'mobile', 'errors')}">
        <g:textField name="${prefix}mobile" value="${contactInfo?.mobile}"/>
    </td>
</tr>

<tr class="prop">
    <td valign="top" class="name">
        <label for="${prefix}name"><g:message code="contactInfo.name.label" default="Name"/></label>
    </td>
    <td valign="top" class="value ${hasErrors(bean: contactInfo, field: 'name', 'errors')}">
        <g:textField name="${prefix}name" value="${contactInfo?.name}"/>
    </td>
</tr>

<tr class="prop">
    <td valign="top" class="name">
        <label for="${prefix}phone"><g:message code="contactInfo.phone.label" default="Phone"/></label>
    </td>
    <td valign="top" class="value ${hasErrors(bean: contactInfo, field: 'phone', 'errors')}">
        <g:textField name="${prefix}phone" value="${contactInfo?.phone}"/>
    </td>
</tr>