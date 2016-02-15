<html xmlns="http://www.w3.org/1999/html">
<head>
    <title> Freemarker Test !! </title>
    <meta charset="utf-8" />
<#--<link rel="stylesheet" href="/resources/bootstrap-3.3.6/css/bootstrap.min.css">-->
    <link rel="stylesheet" href="http://getbootstrap.com/dist/css/bootstrap.min.css">
</head>
<body>

<h1>${message}</h1>
<#if productList??>
    <#list productList as product>
    <div class="row show-grid">
        <div class="col-md-2">
            <img src="${product.getThumbUrl()}" alt="${product.getProductName()}">
        </div>
        <div class="col-md-12">
            <img src="${product.getThumbUrl()}" alt="${product.getProductName()}"><img src="${product.getThumbUrl()}" alt="${product.getProductName()}">
            <a href="${product.getProductUrl()}" target="_blank">${product.getProductName()}</a><br>
            ${product.getProductUrl()}<br>
            ${product.getSpec1()}<br>
        </div>
    </div>

    <!-- print blog review -->
        <#list product.getBlogExtBodyList() as blogData>
        <div class="row show-grid">
            <div class="col-md-2"></div>
            <div class="col-md-2">
                <img src="${blogData.getPostImageUrl()}" alt="${product.getProductName()}">
            </div>
            <div class="col-md-8">
                <a href="${blogData.getPostUrl()}" target="_blank">${blogData.getPostTitle()}</a><br>
            ${blogData.getPostDesc()}<br>
            ${blogData.getPostAuthor()}<br>
            </div>
        </div>
        </#list>

    <!-- print shopping mall reputation -->
        <#list product.getReputationDataList() as repuData>
        <div class="row show-grid">
            <div class="col-md-2"></div>
            <div class="col-md-2"></div>
            <div class="col-md-8">
                [${repuData.getMallName()}]<a href="${repuData.getRepuUrl()}" target="_blank">${repuData.getRepuData()}</a><br>
            </div>
        </div>
        </#list>
    </#list>
<#else>
<h3>Data is none!!</h3>
</#if>

<div class="row show-grid">
    <div class="col-md-4"></div>
    <div class="col-md-4">
        <span class="label label-blue">
            <a href="http://localhost:8080/boardwang/list?from=0&count=10">1</a>
        </span>
        <span class="label label-blue">
            <a href="http://localhost:8080/boardwang/list?from=11&count=10">2</a>
        </span>
        <span class="label label-blue">
            <a href="http://localhost:8080/boardwang/list?from=21&count=10">3</a>
        </span>
        <span class="label label-blue">
            <a href="http://localhost:8080/boardwang/list?from=31&count=10">4</a>
        </span>
        <span class="label label-blue">
            <a href="http://localhost:8080/boardwang/list?from=41&count=10">5</a>
        </span>
        <span class="label label-blue">
            <a href="http://localhost:8080/boardwang/list?from=51&count=10">6</a>
        </span>
        <span class="label label-blue">
            <a href="http://localhost:8080/boardwang/list?from=61&count=10">7</a>
        </span>
        <span class="label label-blue">
            <a href="http://localhost:8080/boardwang/list?from=71&count=10">8</a>
        </span>
        <span class="label label-blue">
            <a href="http://localhost:8080/boardwang/list?from=81&count=10">9</a>
        </span>
        <span class="label label-blue">
            <a href="http://localhost:8080/boardwang/list?from=91&count=10">10</a>
        </span>
        <span class="label label-blue">
            <a href="http://localhost:8080/boardwang/list?from=101&count=10">1</a>
        </span>
    </div>
    <div class="col-md-4"></div>
</div>

</body>
</html>