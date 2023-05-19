<#import "blocks/template.ftlh" as t>
<@t.template user>
    <div class="mx-auto" style="width: 500px">
        <img src="/static/images/flowershop.PNG" alt="mdo" width="500">
    </div>
    <br>
    <div class="mx-auto" style="text-align: center">
        <h3>Цветочная мастерская | Город Москва</h3>
        <hr>
        <h4>Наши авторские букеты</h4>
    </div>
    <div class="card-columns">
        <#list products as product>
            <a href="/product/${product.id}" class="product-link">
                <div class="card text-white my-3 product" style="background-color: rgb(86,77,66)">
                    <img src="/images/${product.previewImageId}"
                         class="card-img-top">
                    <div class="card-body">
                        <h5 class="card-title">${product.title}</h5>
<#--                        <p class="card-text">${product.price} ₽</p>-->
                    </div>
                    <div class="card-footer">
<#--                        ${product.city}-->
                        <p class="card-text">${product.price} ₽</p>
                    </div>
                </div>
            </a>
        <#else>
            <h4 style="text-align: center">Не найдено</h4>
        </#list>
    </div>
</@t.template>
