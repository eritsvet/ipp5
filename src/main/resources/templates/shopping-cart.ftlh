<#import "blocks/template.ftlh" as t>
<@t.template user>
    <h1 style="text-align: center">Корзина</h1>
    <hr>
<#--    <#list shoppingCarts as shoppingCart>-->
<#--        <div style="display: flex;justify-content: center;flex-wrap: wrap;flex-direction: row;">-->
<#--            <#if shoppingCart.productName??>-->
<#--                <#if shoppingCart.user.name == user.name>-->
<#--                    <div class="d-flex justify-content-around">-->
<#--                        <p>-->
<#--                            <b>${shoppingCart.productName} </b>-->
<#--                        </p>-->
<#--                        <p>${shoppingCart.price} ₽</p>-->
<#--                        <p><a href="/product/${shoppingCart.productId}">Подробнее...</a></p>-->
<#--                        <form action="/product/deleteCart/${shoppingCart.id}" method="post">-->
<#--                            <input type="hidden" name="_csrf" value="${_csrf.token}">-->
<#--                            <input type="submit" value="Удалить">-->
<#--                        </form>-->
<#--                        &lt;#&ndash;                        <a href="/product/${shoppingCart.productId}">Подробнее...</a></p>&ndash;&gt;-->
<#--                    </div>-->
<#--                </#if>-->
<#--            </#if>-->
<#--        </div>-->
<#--    <#else>-->
<#--        <h3>Товаров нет</h3>-->
<#--    </#list>-->
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