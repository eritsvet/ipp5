<#--<!DOCTYPE html>-->
<#--<html>-->
<#--<head>-->
<#--    <title>Course Work</title>-->
<#--</head>-->
<#--<body>-->
<#--<h1>Цветочный магазин</h1><hr>-->
<#--<h3>Редактирование пользователя ${user.name}</h3>-->
<#--<form action="/admin/user/edit" method="post">-->
<#--    <#list roles as role>-->
<#--        <div>-->
<#--            <label><input type="checkbox" name="${role}" ${user.roles?seq_contains(role)?string("checked", "")}>${role}</label>-->
<#--        </div>-->
<#--    </#list>-->
<#--    <input type="hidden" value="${user.id}" name="userId">-->
<#--    <input type="hidden" value="${_csrf.token}" name="_csrf">-->
<#--    <button type="submit">Сохранить</button>-->
<#--</form>-->
<#--</body>-->
<#--</html>-->


<#import "blocks/template.ftlh" as t>
<@t.template user>
    <h1 style="text-align: center">Редактирование пользователя ${user.name}</h1><hr>
    <form action="/admin/user/edit" method="post">
        <#list roles as role>
            <div>
                <label><input type="checkbox" name="${role}" ${user.roles?seq_contains(role)?string("checked", "")}>${role}</label>
            </div>
        </#list>
        <input type="hidden" value="${user.id}" name="userId">
        <input type="hidden" value="${_csrf.token}" name="_csrf">
        <button type="submit" class="btn btn-dark">Сохранить</button>
    </form>

</@t.template>