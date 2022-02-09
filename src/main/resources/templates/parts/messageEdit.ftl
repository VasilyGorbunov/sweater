<a class="btn btn-info" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false"
   aria-controls="collapseExample">
    Message Editor
</a>

<div class="collapse <#if message??>show</#if>" id="collapseExample">
    <div class="form-group mt-3">
        <form method="post" enctype="multipart/form-data">
            <input type="hidden" name="_csrf" value="${_csrf.token}">
            <input type="hidden" name="id" value="<#if message??>${message.id}</#if>">
            <div class="form-group">
                <input class="form-control ${(textError??)?string('is-invalid', '')}"
                       type="text"
                       name="text"
                       placeholder="Enter message"
                       value="<#if message??>${message.text}</#if>"
                >
                <#if textError??>
                    <div class="invalid-feedback">${textError}</div>
                </#if>
            </div>
            <div class="form-group">
                <input class="form-control ${(tagError??)?string('is-invalid', '')}"
                       type="text"
                       name="tag"
                       placeholder="Enter tag"
                       value="<#if message??>${message.tag}</#if>"
                >
                <#if tagError??>
                    <div class="invalid-feedback">${tagError}</div>
                </#if>
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