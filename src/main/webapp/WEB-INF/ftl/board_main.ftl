<!DOCTYPE html>
<html>

<#include "./board_head.ftl">

<body>

<!-- nav -->
<#include "./top_menu.ftl">


<div class="container">

<#----------------------------------------------- 최근 30분간 인기글 --------------------------------------------->
<#if boradListB?size &gt; 0>
    <table class="table table-striped">
        <thead>
        <tr>
            <button type="button" class="btn btn-primary">최근 30분간 인기글</button>
            <#--<th>최근 30분 최신정보</th>-->
            <#--<th>제목</th>-->
            <#--<th>제목</th>-->
            <#--<th>날짜</th>-->
            <#--<th>조회수</th>-->
            <#--<th>추천수</th>-->
        </tr>
        </thead>
        <tbody>
    <#list boradListB as product>
        <tr>
            <#if product.getThumbUrl()?length &gt; 0>
                <td><img src="http://kiwitomato.com/boardwang_img/thumb/${product.getCpName()}/${product.getThumbUrl()}" class="img-rounded" alt="Cinque Terre" width="50" height="50"></td>
            <#else>
                <td></td>
            </#if>
            <#--<td>${product.getCpName()}</td>-->
            <td>
                <a href="${product.getUrl()}" target="_blank">${product.getTitle()}&nbsp;</a><span class="badge">${product.getReplyCount()}</span><br>
                <small><mark>${product.getCpNameDisplay()}</mark>,&nbsp;조회수&nbsp;${product.getViewCount()},&nbsp;&nbsp;추천수 &nbsp;${product.getSuggestCount()},
                    &nbsp;&nbsp;${product.getDateTime()}</small>
            </td>
            <#--<td>${product.getDateTime()}</td>-->
            <#--<td>${product.getViewCount()}</td>-->
            <#--<td>${product.getSuggestCount()}</td>-->
        </tr>
    </#list>
        </tbody>
    </table>

    <ul class="pager">
        <#if from &gt; 0>
            <li><a href="./list?from=0&size=${size}&cp=${cp}&date_opt=${date_opt}&sort=${sort}">앞으로</a></li>
        </#if>
        <li><a href="./list?from=0&size=${size}&cp=${cp}&date_opt=30min&sort=reply">더보기</a></li>

    </ul>
</#if> <!-- boardList -->


    <#----------------------------------------------- 최신글 --------------------------------------------->
<#if boradListA?size &gt; 0>
    <table class="table table-striped">
        <thead>
        <tr>
            <button type="button" class="btn btn-primary">최신글</button>
            <#--<th>이미지</th>-->
        <#--<th>사이트</th>-->
            <#--<th>제목</th>-->
        <#--<th>날짜</th>-->
        <#--<th>조회수</th>-->
        <#--<th>추천수</th>-->
        </tr>
        </thead>
        <tbody>
            <#list boradListA as product>
            <tr>
                <#if product.getThumbUrl()?length &gt; 0>
                    <td><img src="http://kiwitomato.com/boardwang_img/thumb/${product.getCpName()}/${product.getThumbUrl()}" class="img-rounded" alt="Cinque Terre" width="50" height="50"></td>
                <#else>
                    <td></td>
                </#if>
            <#--<td>${product.getCpName()}</td>-->
                <td>
                    <a href="${product.getUrl()}" target="_blank">${product.getTitle()}&nbsp;</a><span class="badge">${product.getReplyCount()}</span><br>
                    <small><mark>${product.getCpNameDisplay()}</mark>,&nbsp;조회수&nbsp;${product.getViewCount()},&nbsp;&nbsp;추천수 &nbsp;${product.getSuggestCount()},
                        &nbsp;&nbsp;${product.getDateTime()}</small>
                </td>
            <#--<td>${product.getDateTime()}</td>-->
            <#--<td>${product.getViewCount()}</td>-->
            <#--<td>${product.getSuggestCount()}</td>-->
            </tr>
            </#list>
        </tbody>
    </table>

    <ul class="pager">
        <#if from &gt; 0>
        <li><a href="./list?from=0&size=${size}&cp=${cp}&date_opt=${date_opt}&sort=${sort}">앞으로</a></li>
        </#if>
        <li><a href="./list?from=0&size=${size}&cp=${cp}&date_opt=${date_opt}&sort=${sort}">더보기</a></li>

    </ul>
</#if> <!-- boardList -->

    <#----------------------------------------------- 최근 3시간 인기글 --------------------------------------------->
<#if boradListC?size &gt; 0>
        <table class="table table-striped">
            <thead>
            <tr>
                <button type="button" class="btn btn-primary">최근 3시간 인기글</button>
            <#--<th>이미지</th>-->
            <#--<th>사이트</th>-->
            <#--<th>제목</th>-->
            <#--<th>날짜</th>-->
            <#--<th>조회수</th>-->
            <#--<th>추천수</th>-->
            </tr>
            </thead>
            <tbody>
                <#list boradListC as product>
                <tr>
                    <#if product.getThumbUrl()?length &gt; 0>
                        <td><img src="http://kiwitomato.com/boardwang_img/thumb/${product.getCpName()}/${product.getThumbUrl()}" class="img-rounded" alt="Cinque Terre" width="50" height="50"></td>
                    <#else>
                        <td></td>
                    </#if>
                <#--<td>${product.getCpName()}</td>-->
                    <td>
                        <a href="${product.getUrl()}" target="_blank">${product.getTitle()}&nbsp;</a><span class="badge">${product.getReplyCount()}</span><br>
                        <small><mark>${product.getCpNameDisplay()}</mark>,&nbsp;조회수&nbsp;${product.getViewCount()},&nbsp;&nbsp;추천수 &nbsp;${product.getSuggestCount()},
                            &nbsp;&nbsp;${product.getDateTime()}</small>
                    </td>
                <#--<td>${product.getDateTime()}</td>-->
                <#--<td>${product.getViewCount()}</td>-->
                <#--<td>${product.getSuggestCount()}</td>-->
                </tr>
                </#list>
            </tbody>
        </table>

        <ul class="pager">
            <#if from &gt; 0>
                <li><a href="./list?from=0&size=${size}&cp=${cp}&date_opt=${date_opt}&sort=${sort}">앞으로</a></li>
            </#if>
            <li><a href="./list?from=0&size=${size}&cp=${cp}&date_opt=3hour&sort=reply">더보기</a></li>

        </ul>
</#if> <!-- boardList -->

    <div class="well well-sm">키위토마토닷컴. Copyright &copy; 2016 All right reserved. <span class="glyphicon glyphicon-envelope"></span>&nbsp;<em>summarynode@gmail.com</em></div>

</div> <!-- ccontainer -->


</body>
</html>