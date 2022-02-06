<#macro login path isRegisterForm>
    <form action="${path}" method="post">
        <div class="form-group row">
            <label class="col-sm-2 form-label">User Name :</label>
            <div class="col-sm-6">
                <input type="text" name="username" class="form-control" placeholder="User Name"/>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-2 form-label">Password: </label>
            <div class="col-sm-6">
                <input type="password" name="password" class="form-control" placeholder="Password"/>
            </div>
        </div>
        <#if isRegisterForm>
            <div class="form-group row">
                <label class="col-sm-2 form-label">Email: </label>
                <div class="col-sm-6">
                    <input type="email" name="email" class="form-control" placeholder="Email"/>
                </div>
            </div>
        </#if>
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <div class="form-group row">
            <button type="submit" class="btn btn-primary">
                <#if isRegisterForm>Create<#else>Sign In</#if>
            </button>
        </div>
        <#if !isRegisterForm>
            <div>
                <a href="/registration">Add new user</a>
            </div>
        </#if>
    </form>
</#macro>

<#macro logout>
    <form action="/logout" method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <button type="submit" class="btn btn-warning">Sign Out</button>
    </form>
</#macro>