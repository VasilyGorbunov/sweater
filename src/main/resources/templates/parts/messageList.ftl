<#include "security.ftl" >

<div class="card-columns">
    <#list messages as message>
        <div class="card my-3" style="width: 18rem;">
            <#if message.filename??>
                <img src="/img/${message.filename}" height="220" class="card-img-top"/>
            </#if>
            <div class="card-body">
                <span>${message.text}</span><br>
                <i>#${message.tag}</i>&nbsp;
            </div>
            <div class="card-footer text-muted">
                <a href="/user-messages/${message.author.id}">${message.authorName}</a><br>
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