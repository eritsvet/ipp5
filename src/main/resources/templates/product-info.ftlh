<#import "blocks/template.ftlh" as t>
<@t.template user>
    <h1 style="text-align: center">Подробная информация о букете</h1>
    <hr>
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
    <div style="text-align: center">
        <b>Название букета: </b>${product.title}<br>
        <b>Описание букета: </b>${product.description}<br>
        <b>Цена: </b>${product.price}<br>
    </div>
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
        <form action="/product/delete/${product.id}" method="post" style="text-align: center">
            <input type="hidden" name="_csrf" value="${_csrf.token}">
            <input type="submit" value="Удалить">
        </form>
    </#if>
    <br><br>
</@t.template>