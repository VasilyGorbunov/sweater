<#macro pager url page>
    <div class="my-3 container">
        <div class="row">
            <ul class="pagination col justify-content-center">
                <li class="page-item disabled">
                    <a class="page-link" href="#">Pages</a>
                </li>

                <#list 1..page.getTotalPages() as p>
                    <#if (p - 1) == page.getNumber()>
                        <li class="page-item active">
                            <a class="page-link" href="#" tabindex="-1">${p}</a>
                        </li>
                    <#else>
                        <li class="page-item">
                            <a class="page-link" href="${url}?page=${p - 1}&size=${page.getSize()}"
                               tabindex="-1">${p}</a>
                        </li>
                    </#if>

                </#list>
            </ul>

            <ul class="pagination col justify-content-center">
                <li class="page-item disabled">
                    <a class="page-link" href="#">Items per page</a>
                </li>

                <#list [2, 5, 10] as c>
                    <#if c == page.getSize()>
                        <li class="page-item active">
                            <a class="page-link" href="#" tabindex="-1">${c}</a>
                        </li>
                    <#else>
                        <li class="page-item">
                            <a class="page-link" href="${url}?page=${page.getNumber()}&size=${c}" tabindex="-1">${c}</a>
                        </li>
                    </#if>

                </#list>
            </ul>
        </div>
    </div>
</#macro>