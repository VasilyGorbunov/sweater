<#import "parts/common.ftl" as c>
<#import "parts/login.ftl" as l>
<@c.page>
<h3>Add new user</h3>
<div>
${message?ifExists}
</div>
<@l.login "/registration" true/>
</@c.page>