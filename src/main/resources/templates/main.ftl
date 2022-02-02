<#import "parts/common.ftl" as c>
<#import "parts/login.ftl" as l>

<@c.page>
    <div>
        <div>
            <a href="/user">User list</a>
        </div>
        <br><br>
        <@l.logout/>
    </div>
    <hr>
    <div>
        <form method="post" enctype="multipart/form-data">
            <input type="hidden" name="_csrf" value="${_csrf.token}">
            <div>
                <input type="text" name="text" placeholder="Enter message">
            </div>
            <div>
                <input type="text" name="tag" placeholder="Enter tag">
            </div>
            <div>
                <input type="file" name="file">
            </div>
            <div>
                <button type="submit">Add Message</button>
            </div>
        </form>
    </div>
    <h1>Список сообщений</h1>
    <form action="/main" method="get">
        <div>
            <input type="text" name="filter" value="${filter?ifExists}">
        </div>
        <div>
            <button type="submit">Search</button>
        </div>
    </form>
    <#list messages as message>
        <div>
            <b>${message.id}</b>&nbsp;
            <span>${message.text}</span>&nbsp;
            <i>${message.tag}</i>&nbsp;
            <strong>${message.authorName}</strong>
            <div>
                <#if message.filename??>
                    <img src="/img/${message.filename}" height="220"/>
                </#if>
            </div>
        </div>
    <#else>
        <strong>No messages</strong>
    </#list>
</@c.page>