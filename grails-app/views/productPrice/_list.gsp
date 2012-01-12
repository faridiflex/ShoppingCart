<table>
    <thead>
    <tr>

        <th><g:message code="productPrice.product.label" default="Product"/></th>

        <g:sortableColumn property="priceInPaise"
                          title="${message(code: 'productPrice.priceInPaise.label', default: 'Price In Paise')}"/>

        <g:sortableColumn property="validFrom"
                          title="${message(code: 'productPrice.validFrom.label', default: 'Valid From')}"/>

        <g:sortableColumn property="validTill"
                          title="${message(code: 'productPrice.validTill.label', default: 'Valid Till')}"/>

    </tr>
    </thead>
    <tbody>
    <g:each in="${productPriceList}" status="i" var="productPrice">
        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

            <td><g:link action="show" id="${productPrice.id}">${productPrice?.product?.name}</g:link></td>

            <td>${fieldValue(bean: productPrice, field: "priceInPaise")}</td>

            <td><g:formatDate date="${productPrice.validFrom}"/></td>

            <td><g:formatDate date="${productPrice.validTill}"/></td>

        </tr>
    </g:each>
    </tbody>
</table>