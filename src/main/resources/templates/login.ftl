<#import "parts/common.ftl" as c>
<#import "parts/login.ftl" as l>
<@c.page>
<h3>Login Page</h3>
<@l.login "/login" />
<div>
    <a href="/registration">Add new user</a>
</div>
</@c.page>