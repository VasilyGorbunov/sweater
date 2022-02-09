<div class="card-columns">
    <#list messages as message>
        <div class="card my-3" style="width: 18rem;">
            <#if message.filename??>
                <img src="/img/${message.filename}" height="220" class="card-img-top"/>
            </#if>
            <div class="card-body">
                <span>${message.text}</span>&nbsp;
                <i>${message.tag}</i>&nbsp;
            </div>
            <div class="card-footer text-muted">
                ${message.authorName}
            </div>
        </div>
    <#else>
        <strong>No messages</strong>
    </#list>
</div>