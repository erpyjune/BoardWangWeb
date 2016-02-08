<html xmlns="http://www.w3.org/1999/html">
<head>
    <title>${title}</title>
    <meta charset="utf-8" />
<#--<link rel="stylesheet" href="/resources/bootstrap-3.3.6/css/bootstrap.min.css">-->
    <link rel="stylesheet" href="http://getbootstrap.com/dist/css/bootstrap.min.css">
</head>
<body>

<h1>${title}</h1>
<#if boardList??>
    <#list boardList as product>
    <div class="row show-grid">
        <div class="col-md-1"> </div>
        <div class="col-md-10">
            <img src="${product.getImageUrl()}" alt="${product.getTitle()}" width="100" height="100">
            <#if product.getReplyCount() gt 0 >
                <a href="${product.getUrl()}" target="_blank">${product.getTitle()} [${product.getReplyCount()}]</a><br>
            <#else>
                <a href="${product.getUrl()}" target="_blank">${product.getTitle()}</a><br>
            </#if>
        날짜  : ${product.getDateTime()}<br>
        사이트 : ${product.getCpName()}<br>
        조회수 : ${product.getViewCount()}<br>
        추천수 : ${product.getSuggestCount()}<br>
        </div>
        <div class="col-md-1"> </div>
    </div>
    </#list>
<#else>
<h3>Data is none!!</h3>
</#if>

<div class="boarder">
    <div class="media">
        <div class="media-left media-middle">
            <a href="#">
                <img class="media-object" src="data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiIHN0YW5kYWxvbmU9InllcyI/PjxzdmcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB3aWR0aD0iNjQiIGhlaWdodD0iNjQiIHZpZXdCb3g9IjAgMCA2NCA2NCIgcHJlc2VydmVBc3BlY3RSYXRpbz0ibm9uZSI+PGRlZnMvPjxyZWN0IHdpZHRoPSI2NCIgaGVpZ2h0PSI2NCIgZmlsbD0iI0VFRUVFRSIvPjxnPjx0ZXh0IHg9IjEzLjkyMTg3NSIgeT0iMzIiIHN0eWxlPSJmaWxsOiNBQUFBQUE7Zm9udC13ZWlnaHQ6Ym9sZDtmb250LWZhbWlseTpBcmlhbCwgSGVsdmV0aWNhLCBPcGVuIFNhbnMsIHNhbnMtc2VyaWYsIG1vbm9zcGFjZTtmb250LXNpemU6MTBwdDtkb21pbmFudC1iYXNlbGluZTpjZW50cmFsIj42NHg2NDwvdGV4dD48L2c+PC9zdmc+" alt="...">
            </a>
        </div>
        <div class="media-body">
            <h4 class="media-heading">Middle aligned media</h4>
            동해물과 백두산이 마르고 닳도록 하느님이 보우하자 우리나라 만세. 무궁화 삼천리 화려강산. 대한사란 대한으로 길이 보전하세.
            이기상 이마음로 충성을 다하여.
            괴로우나 즐거우나 나라 사랑하세
        </div>
    </div>
    <div class="media">
        <div class="media-left media-middle">
            <a href="#">
                <img class="media-object" src="data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiIHN0YW5kYWxvbmU9InllcyI/PjxzdmcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB3aWR0aD0iNjQiIGhlaWdodD0iNjQiIHZpZXdCb3g9IjAgMCA2NCA2NCIgcHJlc2VydmVBc3BlY3RSYXRpbz0ibm9uZSI+PGRlZnMvPjxyZWN0IHdpZHRoPSI2NCIgaGVpZ2h0PSI2NCIgZmlsbD0iI0VFRUVFRSIvPjxnPjx0ZXh0IHg9IjEzLjkyMTg3NSIgeT0iMzIiIHN0eWxlPSJmaWxsOiNBQUFBQUE7Zm9udC13ZWlnaHQ6Ym9sZDtmb250LWZhbWlseTpBcmlhbCwgSGVsdmV0aWNhLCBPcGVuIFNhbnMsIHNhbnMtc2VyaWYsIG1vbm9zcGFjZTtmb250LXNpemU6MTBwdDtkb21pbmFudC1iYXNlbGluZTpjZW50cmFsIj42NHg2NDwvdGV4dD48L2c+PC9zdmc+" alt="...">
            </a>
        </div>
        <div class="media-body">
            <h4 class="media-heading">Middle aligned media</h4>
            동해물과 백두산이 마르고 닳도록 하느님이 보우하자 우리나라 만세. 무궁화 삼천리 화려강산. 대한사란 대한으로 길이 보전하세.
            이기상 이마음로 충성을 다하여.
            괴로우나 즐거우나 나라 사랑하세
        </div>
    </div>
    <div class="media">
        <div class="media-left media-middle">
            <a href="#">
                <img class="media-object" src="data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiIHN0YW5kYWxvbmU9InllcyI/PjxzdmcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB3aWR0aD0iNjQiIGhlaWdodD0iNjQiIHZpZXdCb3g9IjAgMCA2NCA2NCIgcHJlc2VydmVBc3BlY3RSYXRpbz0ibm9uZSI+PGRlZnMvPjxyZWN0IHdpZHRoPSI2NCIgaGVpZ2h0PSI2NCIgZmlsbD0iI0VFRUVFRSIvPjxnPjx0ZXh0IHg9IjEzLjkyMTg3NSIgeT0iMzIiIHN0eWxlPSJmaWxsOiNBQUFBQUE7Zm9udC13ZWlnaHQ6Ym9sZDtmb250LWZhbWlseTpBcmlhbCwgSGVsdmV0aWNhLCBPcGVuIFNhbnMsIHNhbnMtc2VyaWYsIG1vbm9zcGFjZTtmb250LXNpemU6MTBwdDtkb21pbmFudC1iYXNlbGluZTpjZW50cmFsIj42NHg2NDwvdGV4dD48L2c+PC9zdmc+" alt="...">
            </a>
        </div>
        <div class="media-body">
            <h4 class="media-heading">Middle aligned media</h4>
            동해물과 백두산이 마르고 닳도록 하느님이 보우하자 우리나라 만세. 무궁화 삼천리 화려강산. 대한사란 대한으로 길이 보전하세.
            이기상 이마음로 충성을 다하여.
            괴로우나 즐거우나 나라 사랑하세
        </div>
    </div>
</div>

<div class="row show-grid">
    <div class="col-md-4"></div>
    <div class="col-md-4">
        <span class="label label-blue">
            <a href="http://localhost:8080/boardwang/list?from=0&count=10">1</a>
        </span>
        <span class="label label-blue">
            <a href="http://localhost:8080/boardwang/list?from=10&count=10">2</a>
        </span>
        <span class="label label-blue">
            <a href="http://localhost:8080/boardwang/list?from=20&count=10">3</a>
        </span>
        <span class="label label-blue">
            <a href="http://localhost:8080/boardwang/list?from=30&count=10">4</a>
        </span>
        <span class="label label-blue">
            <a href="http://localhost:8080/boardwang/list?from=40&count=10">5</a>
        </span>
        <span class="label label-blue">
            <a href="http://localhost:8080/boardwang/list?from=50&count=10">6</a>
        </span>
        <span class="label label-blue">
            <a href="http://localhost:8080/boardwang/list?from=60&count=10">7</a>
        </span>
        <span class="label label-blue">
            <a href="http://localhost:8080/boardwang/list?from=70&count=10">8</a>
        </span>
        <span class="label label-blue">
            <a href="http://localhost:8080/boardwang/list?from=80&count=10">9</a>
        </span>
        <span class="label label-blue">
            <a href="http://localhost:8080/boardwang/list?from=90&count=10">10</a>
        </span>
        <span class="label label-blue">
            <a href="http://localhost:8080/boardwang/list?from=100&count=10">1</a>
        </span>
    </div>
    <div class="col-md-4"></div>
</div>

</body>
</html>