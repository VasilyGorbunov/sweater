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

    <#include "parts/messageEdit.ftl"/>
    <#include "parts/messageList.ftl"/>

</@c.page>