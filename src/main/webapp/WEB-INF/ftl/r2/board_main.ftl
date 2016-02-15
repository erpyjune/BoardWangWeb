<!DOCTYPE html>
<html>

<#----------------------------------------------- 변수 선언 --------------------------------------------->
<#include "./global_data.ftl">

<#----------------------------------------------- html head --------------------------------------------->
<#include "./board_head.ftl">

<body data-feedly-mini="yes">

<!-- nav -->
<#include "./top_menu.ftl">


<div class="container">

    <!-- Heading Row -->
    <div class="row">
        <div class="col-md-8">
            <img class="img-responsive img-rounded" src="http://www.kiwitomato.com/boardwang_img/logo2_900_350.jpeg" alt="">
        </div>
        <!-- /.col-md-8 -->
        <div class="col-md-4">
            <h1>Kiwitomato.com</h1>
            <p>This is a curation service. It will provide a variety of data able to see all the issues, funny, world news information willingly.</p>
        </div>
    </div>

    <hr>

<#----------------------------------------------- 게시판 소개 --------------------------------------------->
    <div class="btn-group btn-group-justified">
        <a href="./main?sort=reply" class="btn btn-default">댓글순 보기</a>
        <a href="./main?sort=suggest" class="btn btn-default">추천순 보기</a>
        <a href="./main?sort=view" class="btn btn-default">조회순 보기</a>
    </div>
    <div><br></div>


<#----------------------------------------------- 최신글 --------------------------------------------->
<#if boradListA?size &gt; 0>
    <table class="table table-striped">
        <thead>
        <tr>
            <#--<button type="button" class="btn btn-default">최신글 순서</button>-->
            <#--<div class="well well-sm">최신글 순서</div>-->
                <span class="label label-primary">최신글 순서</span>
            <#--<a href="./list?sort=${sort}" class="btn btn-default">최신순서 더보기</a>-->
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
        <li><a href="./list?from=0&size=${size}&cp=${cp}&date_opt=&sort=recency">더보기</a></li>

    </ul>

    <hr>
</#if> <!-- boradListA -->


<#----------------------------------------------- 최근 30분간 인기글 --------------------------------------------->
<#if boradListB?size &gt; 0>
    <table class="table table-striped">
        <thead>
        <tr>
            <span class="label label-primary">최근 30분 동안 [${sortFieldName}]</span>
            <#--<button type="button" class="btn btn-default">최근 30분 동안 [${sortFieldName}]</button>-->
            <#--<a href="./list?from=0&size=${size}&cp=${cp}&date_opt=30min&sort=${sort}" class="btn btn-default">최근 30분 동안 [${sortFieldName}] 더보기</a>-->
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
        <li><a href="./list?from=0&size=${size}&cp=${cp}&date_opt=30min&sort=${sort}">더보기</a></li>
    </ul>

    <hr>
</#if> <!-- boradListB -->



<#----------------------------------------------- 최근 1시간 인기글 --------------------------------------------->
<#if boradListC?size &gt; 0>
        <table class="table table-striped">
            <thead>
            <tr>
                <#--<button type="button" class="btn btn-default">최근 1시간 동안 [${sortFieldName}]</button>-->
                <span class="label label-primary">최근 1시간 동안 [${sortFieldName}]</span>
                <#--<a href="./list?from=0&size=${size}&cp=${cp}&date_opt=1hour&sort=${sort}" class="btn btn-default">최근 1시간 동안 [${sortFieldName}] 더보기</a>-->
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
            <li><a href="./list?from=0&size=${size}&cp=${cp}&date_opt=1hour&sort=${sort}">더보기</a></li>
        </ul>

        <hr>
</#if> <!-- boradListC -->


<#----------------------------------------------- 최근 3시간 인기글 --------------------------------------------->
<#if boradListD?size &gt; 0>
    <table class="table table-striped">
        <thead>
        <tr>
            <#--<button type="button" class="btn btn-default">최근 3시간 동안 [${sortFieldName}]</button>-->
            <span class="label label-primary">최근 3시간 동안 [${sortFieldName}]</span>
            <#--<a href="./list?from=0&size=${size}&cp=${cp}&date_opt=3hour&sort=${sort}" class="btn btn-default">최근 3시간 동안 [${sortFieldName}] 더보기</a>-->
        <#--<th>이미지</th>-->
        <#--<th>사이트</th>-->
        <#--<th>제목</th>-->
        <#--<th>날짜</th>-->
        <#--<th>조회수</th>-->
        <#--<th>추천수</th>-->
        </tr>
        </thead>
        <tbody>
            <#list boradListD as product>
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
        <li><a href="./list?from=0&size=${size}&cp=${cp}&date_opt=3hour&sort=${sort}">더보기</a></li>
    </ul>

    <hr>
</#if> <!-- boradListD -->


<#----------------------------------------------- 최근 6시간 인기글 --------------------------------------------->
<#if boradListE?size &gt; 0>
    <table class="table table-striped">
        <thead>
        <tr>
            <#--<button type="button" class="btn btn-default">최근 6시간 동안 [${sortFieldName}]</button>-->
            <span class="label label-primary">최근 6시간 동안 [${sortFieldName}]</span>
            <#--<a href="./list?from=0&size=${size}&cp=${cp}&date_opt=6hour&sort=${sort}" class="btn btn-default">최근 6시간 동안 [${sortFieldName}] 더보기</a>-->
        <#--<th>이미지</th>-->
        <#--<th>사이트</th>-->
        <#--<th>제목</th>-->
        <#--<th>날짜</th>-->
        <#--<th>조회수</th>-->
        <#--<th>추천수</th>-->
        </tr>
        </thead>
        <tbody>
            <#list boradListE as product>
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
        <li><a href="./list?from=0&size=${size}&cp=${cp}&date_opt=6hour&sort=${sort}">더보기</a></li>
    </ul>

    <hr>
</#if> <!-- boradListE -->


<#----------------------------------------------- 최근 12시간 인기글 --------------------------------------------->
<#if boradListF?size &gt; 0>
    <table class="table table-striped">
        <thead>
        <tr>
            <#--<button type="button" class="btn btn-default">최근 12시간 동안 [${sortFieldName}]</button>-->
            <span class="label label-primary">최근 12시간 동안 [${sortFieldName}]</span>
            <#--<a href="./list?from=0&size=${size}&cp=${cp}&date_opt=12hour&sort=${sort}" class="btn btn-default">최근 12시간 동안 [${sortFieldName}] 더보기</a>-->
        <#--<th>이미지</th>-->
        <#--<th>사이트</th>-->
        <#--<th>제목</th>-->
        <#--<th>날짜</th>-->
        <#--<th>조회수</th>-->
        <#--<th>추천수</th>-->
        </tr>
        </thead>
        <tbody>
            <#list boradListF as product>
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
        <li><a href="./list?from=0&size=${size}&cp=${cp}&date_opt=12hour&sort=${sort}">더보기</a></li>
    </ul>

    <hr>
</#if> <!-- boradListF -->


<#----------------------------------------------- 최근 24시간 인기글 --------------------------------------------->
<#if boradListG?size &gt; 0>
    <table class="table table-striped">
        <thead>
        <tr>
            <#--<button type="button" class="btn btn-default">최근 24시간 동안 [${sortFieldName}]</button>-->
            <span class="label label-primary">최근 24시간 동안 [${sortFieldName}]</span>
            <#--<a href="./list?from=0&size=${size}&cp=${cp}&date_opt=24hour&sort=${sort}" class="btn btn-default">최근 24시간 동안 [${sortFieldName}] 더보기</a>-->
        <#--<th>이미지</th>-->
        <#--<th>사이트</th>-->
        <#--<th>제목</th>-->
        <#--<th>날짜</th>-->
        <#--<th>조회수</th>-->
        <#--<th>추천수</th>-->
        </tr>
        </thead>
        <tbody>
            <#list boradListG as product>
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
        <li><a href="./list?from=0&size=${size}&cp=${cp}&date_opt=24hour&sort=${sort}">더보기</a></li>
    </ul>
</#if> <!-- boradListG -->

<#----------------------------------------------- google Ads --------------------------------------------->
<#--<#include "./googleads.ftl">-->


    <#----------------------------------------------- footer --------------------------------------------->
    <div class="well well-sm">키위토마토닷컴. Copyright &copy; 2016 All right reserved. <span class="glyphicon glyphicon-envelope"></span>&nbsp;<em>summarynode@gmail.com</em></div>

</div> <!-- ccontainer -->


</body>
</html>