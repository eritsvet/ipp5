<#import "blocks/template.ftlh" as t>
<@t.template user>
<#--    <h1>Цветочный магазин</h1>-->
<#--    <hr>-->
    <h1 style="text-align: center">Подробная информация о букете</h1>
    <hr>
<#--<#list images as img>-->
<#--    <img src="/images/${img.id}" height="300px"/><br><br>-->
<#--</#list>-->
<#--<div id="carouselExampleSlidesOnly" class="carousel slide" data-ride="carousel">-->
<#--    <div class="carousel-inner">-->
<#--        <#list images as img>-->
<#--            <div class="carousel-item active">-->
<#--                <img src="/images/${img.id}" class="d-block w-100" alt="...">-->
<#--            </div>-->
<#--        </#list>-->
<#--    </div>-->
<#--</div>-->
    <div class="w-50 mx-auto">
        <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="/images/${images[0].id}" class="d-block w-100" alt="...">
                </div>
                <#list images as img>
                    <#if img.id != images[0].id>
                        <div class="carousel-item">
                            <img src="/images/${img.id}" class="d-block w-100" alt="...">
                        </div>
                    </#if>
                </#list>
            </div>
            <#if images[1]??>
                <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Предыдущий</span>
                </a>
                <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Следующий</span>
                </a>
            </#if>
        </div>
    </div>
<#--<div id="carouselExampleFade" class="carousel slide carousel-fade" data-ride="carousel">-->
<#--    <div class="carousel-inner">-->
<#--        <#list images as img>-->
<#--            <div class="carousel-item">-->
<#--                <img src="/images/${img.id}" class="d-block w-100" alt="...">-->
<#--            </div>-->
<#--        </#list>-->
<#--    </div>-->
<#--    <a class="carousel-control-prev" href="#carouselExampleFade" role="button" data-slide="prev">-->
<#--        <span class="carousel-control-prev-icon" aria-hidden="true"></span>-->
<#--        <span class="sr-only">Предыдущий</span>gt;-->
<#--    </a>-->
<#--    <a class="carousel-control-next" href="#carouselExampleFade" role="button" data-slide="next">-->
<#--        <span class="carousel-control-next-icon" aria-hidden="true"></span>-->
<#--        <span class="sr-only">Следующий</span>-->
<#--    </a>-->
<#--</div>-->
    <div style="text-align: center">
        <b>Название букета: </b>${product.title}<br>
        <b>Описание букета: </b>${product.description}<br>
        <b>Цена: </b>${product.price}<br>
    </div>
<#--    <b>Город: </b>${product.city}<br>-->
<#--    <b>Имя автора: </b><a href="/user/${product.user.id}">${product.user.name}</a><br>-->
    <hr>
    <#if user.id??>
        <#if !user.isAdmin()>
        <form action="/product/createCart" method="post" enctype="multipart/form-data">
            <input type="hidden" name="price" value="${product.price}">
            <input type="hidden" name="productName" value="${product.title}">
            <input type="hidden" name="user" value="${user.id}">
            <input type="hidden" name="productId" value="${product.id}">
            <input type="hidden" name="_csrf" value="${_csrf.token}">
            <div style="text-align: center">
                <input type="submit" value="Добавить букет в корзину"/>
            </div>
        </form>
        </#if>
    <#else>
        <form action="/login" style="text-align: center">
            <input type="submit" value="Добавить букет в корзину"/>
        </form>
    </#if>
    <#if user.id?? && user.isAdmin()>
<#--        <form action="/product/delete/${product.id}" method="post" enctype="multipart/form-data">-->
<#--            <div style="text-align: center">-->
<#--                <input type="submit" value="Удалить товар"/>-->
<#--            </div>-->
<#--        </form>-->
        <form action="/product/delete/${product.id}" method="post" style="text-align: center">
            <input type="hidden" name="_csrf" value="${_csrf.token}">
            <input type="submit" value="Удалить">
        </form>
    </#if>
    <br><br>
</@t.template>

<#--//Добавление товара в корзину-->
<#--<form action="/shopping_cart/add_product" method="post" enctype="multipart/form-data">-->
<#--    <input type="hidden" name="shopping_cart" value="${product}">-->
<#--    <input type="hidden" name="_csrf" value="${_csrf.token}">-->
<#--    <input type="hidden" name="_csrf" value="${_csrf.token}">-->
<#--    <input type="hidden" name="_csrf" value="${_csrf.token}">-->

<#--    <input type="hidden" name="_csrf" value="${_csrf.token}">-->
<#--    <input type="submit" value="Добавить букет в корзину"/>-->
<#--</form>-->

<#--<hr>-->
<#--<h3>Записи:</h3>-->
<#--<#list shopping_carts as shopping_cart>-->
<#--    <div>-->
<#--        <#if shopping_cart.username??>-->
<#--            <#if shopping_cart.description == product.title && shopping_cart.username == shopping_cart.name>-->
<#--                <p>-->
<#--                    <b>${shopping_cart.description} </b> ${shopping_cart.name} ${shopping_cart.price} ${shopping_cart.username}-->
<#--                <form action="/product/deleteEvent/${shopping_cart.id}" method="post">-->
<#--                    <input type="hidden" name="_csrf" value="${_csrf.token}">-->
<#--                    <input type="submit" value="Удалить">-->
<#--                </form>-->
<#--                </p>-->
<#--            </#if>-->
<#--        </#if>-->
<#--    </div>-->
<#--<#else>-->
<#--    <h3>Записей нет</h3>-->
<#--</#list>-->
<#--</form>-->
<#--<form action="/product/createEvent/${product.id}" method="post" enctype="multipart/form-data">-->
<#--    <input type="hidden" name="user" value="${user.id}">-->
<#--    <input type="hidden" name="username" value="${user.name}">-->
<#--    <input type="hidden" name="description" value="${product.title}"/><br>-->
<#--    Имя барбера: <input type="text" name="name"/><br><br>-->
<#--    Цена: <input type="number" name="price"/><br><br>-->
<#--    Время: <input type="text" name="time"/><br><br>-->
<#--    <input type="hidden" name="_csrf" value="${_csrf.token}">-->
<#--    <input type="submit" value="Добавить запись"/>-->
<#--</form>-->

<#--<hr>-->
<#--</body>-->
<#--</html>-->