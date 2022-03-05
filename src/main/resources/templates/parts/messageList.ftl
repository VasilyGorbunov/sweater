<#include "security.ftl" >
<#import "pager.ftl" as p>

<@p.pager url page></@p.pager>
<div class="card-columns" id="message-list">
    <#list page.content as message>
        <div class="card my-3" style="width: 18rem;" data-id="${message.id}">
            <#if message.filename??>
                <img src="/img/${message.filename}" height="220" class="card-img-top"/>
            </#if>
            <div class="card-body">
                <span>${message.text}</span><br/>
                <i>#${message.tag}</i>
            </div>
            <div class="card-footer text-muted">
                <a href="/user-messages/${message.author.id}">${message.authorName}</a><br/>
                <#if message.author.id == currentUserId>
                    <a class="btn btn-primary" href="/user-messages/${message.author.id}?message=${message.id}">
                        Edit
                    </a>
                </#if>
            </div>
        </div>
    <#else>
        <strong>No messages</strong>
    </#list>
</div>
<@p.pager url page></@p.pager>