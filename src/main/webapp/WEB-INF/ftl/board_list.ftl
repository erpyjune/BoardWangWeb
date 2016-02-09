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

                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">댓글순<span class="caret"></span></a>
                    <ul class="dropdown-menu" role="menu">
                        <li><a href="./list?date_opt=30min&sort=reply">최근30분</a></li>
                        <li><a href="./list?date_opt=1hour&sort=reply">최근1시간</a></li>
                        <li><a href="./list?date_opt=3hour&sort=reply">최근3시간</a></li>
                        <li><a href="./list?date_opt=6hour&sort=reply">최근6시간</a></li>
                        <li><a href="./list?date_opt=12hour&sort=reply">최근12시간</a></li>
                        <li><a href="./list?date_opt=24hour&sort=reply">최근24시간</a></li>
                    </ul>
                </li>

                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">조회순<span class="caret"></span></a>
                    <ul class="dropdown-menu" role="menu">
                        <li><a href="./list?date_opt=30min&sort=view">최근30분</a></li>
                        <li><a href="./list?date_opt=1hour&sort=view">최근1시간</a></li>
                        <li><a href="./list?date_opt=3hour&sort=view">최근3시간</a></li>
                        <li><a href="./list?date_opt=6hour&sort=view">최근6시간</a></li>
                        <li><a href="./list?date_opt=12hour&sort=view">최근12시간</a></li>
                        <li><a href="./list?date_opt=24hour&sort=view">최근24시간</a></li>
                    </ul>
                </li>

                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">추천순<span class="caret"></span></a>
                    <ul class="dropdown-menu" role="menu">
                        <li><a href="./list?date_opt=30min&sort=suggest">최근30분</a></li>
                        <li><a href="./list?date_opt=1hour&sort=suggest">최근1시간</a></li>
                        <li><a href="./list?date_opt=3hour&sort=suggest">최근3시간</a></li>
                        <li><a href="./list?date_opt=6hour&sort=suggest">최근6시간</a></li>
                        <li><a href="./list?date_opt=12hour&sort=suggest">최근12시간</a></li>
                        <li><a href="./list?date_opt=24hour&sort=suggest">최근24시간</a></li>
                    </ul>
                </li>

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
        <li><a href="./list?from=${prevFrom}&size=${size}&cp=${cp}&date_opt=${date_opt}&sort=${sort}">Previous</a></li>
        </#if>
        <li><a href="./list?from=${nextFrom}&size=${size}&cp=${cp}&date_opt=${date_opt}&sort=${sort}">Next</a></li>

    </ul>

</div> <!-- ccontainer -->
</#if> <!-- boardList -->

</body>
</html>