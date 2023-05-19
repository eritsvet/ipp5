<#import "blocks/template.ftlh" as t>
<@t.template user>
    `<h1 style="text-align: center">Панель администратора</h1>
    <hr>
    <#if user.email?? && user.isAdmin()>
        <h3 data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false"
            aria-controls="collapseExample">Создание нового товара</h3>
        <hr>
        <form action="/product/create" method="post" enctype="multipart/form-data" class="collapse"
              id="collapseExample">
            Название букета: <input type="text" name="title"/><br><br>
            Описание букета: <input type="text" name="description"/><br><br>
            Цена: <input type="number" name="price"/><br><br>
            <#--        Город: <input type="text" name="city"/><br><br>-->
            Первая фотография: <input type="file" name="file1"/><br><br>
            Вторая фотография: <input type="file" name="file2"/><br><br>
            Третья фотография: <input type="file" name="file3"/><br><br>
            <input type="hidden" name="_csrf" value="${_csrf.token}">
            <input type="submit" value="Добавить букет"/>
        </form>
    </#if>
    <hr>
    <h3 data-toggle="collapse" href="#collapseExample1" role="button" aria-expanded="false"
        aria-controls="collapseExample">Информация о пользователях</h3>
    <hr>
    <table class="table table-bordered table-hover collapse" id="collapseExample1">
        <tr>
            <th>Email</th>
            <th>Номер телефона</th>
            <th>Активность</th>
            <th>Роли</th>
            <th>Бан</th>
            <th>Редактирование</th>
            <th>Подробная информация</th>
        </tr>
        <#list users as user>
            <tr>
                <th>${user.email}</th>
                <th>${user.phoneNumber}</th>
                <th>
                    <#if user.active>
                        true
                    <#else>
                        false
                    </#if>
                </th>
                <th><#list user.roles as role>${role}</#list></th>
                <th>
                    <form action="/admin/user/ban/${user.id}" method="post">
                        <input type="hidden" name="_csrf" value="${_csrf.token}">
                        <input type="submit" value="Бан">
                    </form>
                </th>
                <th><a href="/admin/user/edit/${user.id}">Редактирование</a></th>
                <th><a href="/user/${user.id}">Подробная информация</a></th>
            </tr>
        <#else>
            <h3>Пользователей нет</h3>
        </#list>
    </table>
    <br><br>
</@t.template>