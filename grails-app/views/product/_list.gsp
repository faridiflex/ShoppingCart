<table>
    <thead>
    <tr>

        <g:sortableColumn property="primaryImage"
                          title="${message(code: 'product.primaryImage.label', default: 'Primary Image')}"/>

        <g:sortableColumn property="description"
                          title="${message(code: 'product.description.label', default: 'Description')}"/>

        <g:sortableColumn property="name" title="${message(code: 'product.name.label', default: 'Name')}"/>

        <g:sortableColumn property="status" title="${message(code: 'product.status.label', default: 'Status')}"/>

        <g:sortableColumn property="price" title="${message(code: 'product.price.label', default: 'Price')}"/>

    </tr>
    </thead>
    <tbody>
    <g:each in="${productList}" status="i" var="product">
        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

            <td><g:link action="show"
                        id="${product.id}">${fieldValue(bean: product, field: "primaryImage")}</g:link></td>

            <td>${fieldValue(bean: product, field: "description")}</td>

            <td>
                <g:link action="show"
                        id="${product.id}">
                    ${fieldValue(bean: product, field: "name")}
                </g:link>

            </td>

            <td>${fieldValue(bean: product, field: "status")}</td>

            <td>${fieldValue(bean: product, field: "price")}</td>

        </tr>
    </g:each>
    </tbody>
</table>