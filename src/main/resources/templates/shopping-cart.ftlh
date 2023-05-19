<#import "blocks/template.ftlh" as t>
<@t.template user>
    <h1 style="text-align: center">Корзина</h1>
    <hr>
    <table class="table table-borderless">
        <thead>

        <tr>
            <th scope="col">Название букета</th>
            <th scope="col">Цена</th>
            <th scope="col">Подробная информация</th>
            <th scope="col">Удаление</th>
        </tr>
        </thead>
        <tbody>
        <#list shoppingCarts as shoppingCart>
            <#if shoppingCart.productName??>
                <#if shoppingCart.user.name == user.name>
                    <tr>
                        <td>${shoppingCart.productName}</td>
                        <td>${shoppingCart.price} ₽</td>
                        <td><a href="/product/${shoppingCart.productId}">Подробнее...</a></td>
                        <td>
                            <form action="/product/deleteCart/${shoppingCart.id}" method="post">
                                <input type="hidden" name="_csrf" value="${_csrf.token}">
                                <input type="submit" value="Удалить">
                            </form>
                        </td>
                    </tr>
                </#if>
            </#if>
        </#list>
        </tbody>
    </table>
</@t.template>