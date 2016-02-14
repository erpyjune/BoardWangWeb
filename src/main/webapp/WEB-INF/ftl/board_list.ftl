<!DOCTYPE html>
<html>

<#----------------------------------------------- 변수 선언 --------------------------------------------->
<#include "./global_data.ftl">

<#----------------------------------------------- html head --------------------------------------------->
<#include "./board_head.ftl">

<body>

<!-- nav -->
<#include "./top_menu.ftl">


<div class="container">

<#----------------------------------------------- list --------------------------------------------->
<#if boardList??>
    <table class="table table-striped">
        <thead>
        <tr>
            <span class="label label-primary">${dateOptName} [${sortFieldName}]</span>
            <#--<button type="button" class="btn btn-primary">글 리스트</button>-->
            <#--<th>최근 30분 최신정보</th>-->
            <#--<th>제목</th>-->
            <#--<th>제목</th>-->
            <#--<th>날짜</th>-->
            <#--<th>조회수</th>-->
            <#--<th>추천수</th>-->
        </tr>
        </thead>
        <tbody>
    <#list boardList as product>
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
            <li><a href="./list?from=${prevFrom}&size=${size}&cp=${cp}&date_opt=${date_opt}&sort=${sort}">이전</a></li>
        </#if>
        <li><a href="./list?from=${nextFrom}&size=${size}&cp=${cp}&date_opt=${date_opt}&sort=${sort}">더보기</a></li>

    </ul>
</#if> <!-- boardList -->

   <#----------------------------------------------- google Ads --------------------------------------------->
   <#--<#include "./googleads.ftl">-->


   <#----------------------------------------------- footer --------------------------------------------->
    <div class="well well-sm">키위토마토닷컴. Copyright &copy; 2016 All right reserved. <span class="glyphicon glyphicon-envelope"></span>&nbsp;<em>summarynode@gmail.com</em></div>

</div> <!-- ccontainer -->

</body>
</html>