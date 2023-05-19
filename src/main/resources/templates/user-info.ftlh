<#--<!DOCTYPE html>-->
<#--<html>-->
<#--<head>-->
<#--    <title>Course Work</title>-->
<#--</head>-->
<#--<body>-->
<#--<h1>Цветочный магазин</h1><hr>-->
<#--<h3>Подробная информация о пользователе ${user.name}</h3>-->
<#--<b>Номер телефона: </b> ${user.phoneNumber}<br>-->
<#--<b>Email: </b> ${user.email}<br>-->
<#--<h4>Товары пользователя ${user.name}</h4>-->
<#--<#list products as product>-->
<#--    <div>-->
<#--        <p><b>${product.title}</b> ${product.price} руб. | <a href="/product/${product.id}">Подробнее...</a></p>-->
<#--    </div>-->
<#--    <#else>-->
<#--    <h3>Товаров нет</h3>-->
<#--</#list>-->
<#--<#if errorMessage??>-->
<#--    <h2 style="color: red">${errorMessage}</h2>-->
<#--</#if>-->
<#--</body>-->
<#--</html>-->

<#import "blocks/template.ftlh" as t>
<@t.template user>
    <h1 style="text-align: center">Информация о пользователе</h1>
    <hr>
    <div style="text-align: center">
        <h2>${user.name}</h2>
        <br>
        Номер телефона: <b>${user.phoneNumber}</b>
        <br><br>
        Почта: <b>${user.email}</b>
    </div>
    <br>
    <hr>
    <h1 style="text-align: center">Товары пользователя ${user.name}</h1>
    <br>
    <div class="card-columns">
        <#list products as product>
            <a href="/product/${product.id}" class="product-link">
                <div class="card text-white bg-dark my-3 product">

                    <img src="/images/${product.previewImageId}"
                         class="card-img-top">
                    <div class="card-body">
                        <h5 class="card-title">${product.title}</h5>
                        <p class="card-text">${product.price} ₽</p>
                    </div>
                    <div class="card-footer">
                        ${product.user.name}
                    </div>
                </div>
            </a>
        <#else>
            <h1 style="text-align: center">Не найдено</h1>
        </#list>
    </div>
</@t.template>