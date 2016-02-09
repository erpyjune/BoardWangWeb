<!DOCTYPE html>
<html>

<head>
    <title>보드왕</title>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
    <!-- Latest compiled JavaScript -->
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</head>

<body>

<!-- nav -->
<nav class="navbar navbar-inverse navbar-fixed" role="navigation">
    <div class="container">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="./list">보드왕</a>
        </div>
        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">

                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">게시판<span class="caret"></span></a>
                    <ul class="dropdown-menu" role="menu">
                        <li><a href="./list?cp=클리앙">클리앙</a></li>
                        <li><a href="./list?cp=보배드림">보배드림</a></li>
                        <li><a href="./list?cp=개드립">개드립</a></li>
                        <li><a href="./list?cp=개드립닷컴">개드립닷컴</a></li>
                        <li><a href="./list?cp=웃긴대학">웃긴대학</a></li>
                        <li><a href="./list?cp=짱공유">짱공유</a></li>
                        <li><a href="./list?cp=풀빵닷컴">풀빵닷컴</a></li>
                        <li><a href="./list?cp=헝그리앱">헝그리앱</a></li>
                    </ul>
                </li>

                <#--<li class="dropdown">-->
                    <#--<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">침구류<span class="caret"></span></a>-->
                    <#--<ul class="dropdown-menu" role="menu">-->
                        <#--<li><a href="./search?category_search_type=category&cate1=003&size=20&from=0&display_type=0">침구류 전체</a></li>-->
                        <#--<li><a href="./search?category_search_type=category&cate1=003&cate2=001&size=20&from=0&display_type=0">침낭 전체</a></li>-->
                        <#--<li class="divider"></li>-->
                        <#--<li><a href="./search?category_search_type=category&cate1=003&cate2=002&size=20&from=0&display_type=0">매트 전체</a></li>-->
                        <#--<li class="divider"></li>-->
                        <#--<li><a href="./search?category_search_type=category&cate1=003&cate2=003&size=20&from=0&display_type=0">침대/해먹</a></li>-->
                        <#--<li><a href="./search?category_search_type=category&cate1=003&cate2=004&size=20&from=0&display_type=0">베개/방석/귀마개/안대</a></li>-->
                        <#--<li><a href="./search?category_search_type=category&cate1=003&cate2=999&size=20&from=0&display_type=0">침구류 기타</a></li>-->
                    <#--</ul>-->
                <#--</li>-->


                <#--<li class="dropdown">-->
                    <#--<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">버너류/난로류<span class="caret"></span></a>-->
                    <#--<ul class="dropdown-menu" role="menu">-->
                        <#--<li><a href="./search?category_search_type=category&cate1=004&size=20&from=0&display_type=0">버너류/난로류 전체</a></li>-->
                        <#--<li><a href="./search?category_search_type=category&cate1=004&cate2=001&size=20&from=0&display_type=0">버너 전체</a></li>-->
                        <#--<li><a href="./search?category_search_type=category&cate1=004&cate2=002&size=20&from=0&display_type=0">버너관련 기타</a></li>-->
                        <#--<li><a href="./search?category_search_type=category&cate1=004&cate2=003&size=20&from=0&display_type=0">난방/난로/히터</a></li>-->
                        <#--<li><a href="./search?category_search_type=category&cate1=004&cate2=004&size=20&from=0&display_type=0">연료/연료통</a></li>-->
                        <#--<li><a href="./search?category_search_type=category&cate1=004&cate2=999&size=20&from=0&display_type=0">버너류/난로류 기타</a></li>-->
                    <#--</ul>-->
                <#--</li>-->

                <li>
                    <a href="#">About</a>
                </li>
            </ul>
        </div>
        <!-- /.navbar-collapse -->
    </div>
    <!-- /.container -->
</nav>

<#if boardList??>
<div class="container">
    <!-- <div class="container-fluid"> -->
    <table class="table table-striped">
        <thead>
        <tr>
            <th>이미지</th>
            <#--<th>사이트</th>-->
            <th>제목</th>
            <#--<th>날짜</th>-->
            <#--<th>조회수</th>-->
            <#--<th>추천수</th>-->
        </tr>
        </thead>
        <tbody>
    <#list boardList as product>
        <tr>
            <#if product.getIsThumbnail() == "Y">
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
        <#if from gt 0>
        <li><a href="./list?from=${prevFrom}&size=${size}&cp=${cp}">Previous</a></li>
        </#if>
        <li><a href="./list?from=${nextFrom}&size=${size}&cp=${cp}">Next</a></li>

    </ul>

</div> <!-- ccontainer -->
</#if> <!-- boardList -->

</body>
</html>