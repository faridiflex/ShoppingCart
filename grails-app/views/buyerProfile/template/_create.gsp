

%{--<tr class="prop">--}%
    %{--<td valign="top" class="name">--}%
        %{--<label for="contactInfo"><g:message code="buyerProfile.contactInfo.label" default="Contact Info"/></label>--}%
    %{--</td>--}%
    %{--<td valign="top" class="value ${hasErrors(bean: buyerProfile, field: 'contactInfo', 'errors')}">--}%
        %{--<g:select name="contactInfo.id" from="${com.reb.info.ContactInfo.list()}" optionKey="id"--}%
                  %{--value="${buyerProfile?.contactInfo?.id}"/>--}%
    %{--</td>--}%
%{--</tr>--}%

<g:render template="/contactInfo/template/create" model="[contactInfo: buyerProfile?.contactInfo, prefix: prefix+'contactInfo.']"/>


<tr class="prop">
    <td valign="top" class="name">
        <label for="${prefix}name"><g:message code="buyerProfile.name.label" default="Name"/></label>
    </td>
    <td valign="top" class="value ${hasErrors(bean: buyerProfile, field: 'name', 'errors')}">
        <g:textField name="${prefix}name" value="${buyerProfile?.name}"/>
    </td>
</tr>

%{--<tr class="prop">--}%
    %{--<td valign="top" class="name">--}%
        %{--<label for="registrationInfo"><g:message code="buyerProfile.registrationInfo.label"--}%
                                                 %{--default="Registration Info"/></label>--}%
    %{--</td>--}%
    %{--<td valign="top" class="value ${hasErrors(bean: buyerProfile, field: 'registrationInfo', 'errors')}">--}%
        %{--<g:select name="registrationInfo.id" from="${com.reb.info.RegistrationInfo.list()}" optionKey="id"--}%
                  %{--value="${buyerProfile?.registrationInfo?.id}"/>--}%
    %{--</td>--}%
%{--</tr>--}%

<g:render template="/registrationInfo/template/create" model="[registrationInfo: buyerProfile?.registrationInfo, prefix: prefix+'registrationInfo.']"/>
                        