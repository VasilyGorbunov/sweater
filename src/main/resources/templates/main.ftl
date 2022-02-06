<#import "parts/common.ftl" as c>

<@c.page>
    <div class="form-row">
        <div class="form-group col-md-6">
            <form action="/main" method="get" class="form-inline">
                <div>
                    <input
                            class="form-control"
                            type="text"
                            name="filter"
                            value="${filter?ifExists}"
                            placeholder="Search by tag">
                </div>
                <div>
                    <button class="btn btn-info ml-2" type="submit">Search</button>
                </div>
            </form>
        </div>
    </div>

    <a class="btn btn-info" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false"
       aria-controls="collapseExample">
        Add new message
    </a>

    <div class="collapse" id="collapseExample">
        <div class="form-group mt-3">
            <form method="post" enctype="multipart/form-data">
                <input type="hidden" name="_csrf" value="${_csrf.token}">
                <div class="form-group">
                    <input class="form-control" type="text" name="text" placeholder="Enter message">
                </div>
                <div class="form-group">
                    <input class="form-control" type="text" name="tag" placeholder="Enter tag">
                </div>
                <div class="form-group">
                    <div class="custom-file">
                        <input type="file" name="file" id="customFile">
                        <label class="custom-file-label" for="customFile">Choose file</label>
                    </div>
                </div>
                <div class="form-group">
                    <button type="submit" class="btn btn-success">Save Message</button>
                </div>
            </form>
        </div>
    </div>

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

</@c.page>