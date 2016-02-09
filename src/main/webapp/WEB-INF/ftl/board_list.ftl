<!DOCTYPE html>
<html>

<head>
    <title>bootstrap test</title>

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
            <a class="navbar-brand" href="./list">Home</a>
        </div>
        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">

                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">가구류<span class="caret"></span></a>
                    <ul class="dropdown-menu" role="menu">
                        <li><a href="./search?category_search_type=category&cate1=002&size=20&from=0&display_type=0">가구류 전체</a></li>
                        <li><a href="./search?category_search_type=category&cate1=002&cate2=001&size=20&from=0&display_type=0">테이블</a></li>
                        <li><a href="./search?category_search_type=category&cate1=002&cate2=002&size=20&from=0&display_type=0">키친 테이블</a></li>
                        <li><a href="./search?category_search_type=category&cate1=002&cate2=003&size=20&from=0&display_type=0">IGT</a></li>
                        <li><a href="./search?category_search_type=category&cate1=002&cate2=004&size=20&from=0&display_type=0">의자</a></li>
                        <li><a href="./search?category_search_type=category&cate1=002&cate2=999&size=20&from=0&display_type=0">가구류 기타</a></li>
                    </ul>
                </li>

                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">침구류<span class="caret"></span></a>
                    <ul class="dropdown-menu" role="menu">
                        <li><a href="./search?category_search_type=category&cate1=003&size=20&from=0&display_type=0">침구류 전체</a></li>
                        <li><a href="./search?category_search_type=category&cate1=003&cate2=001&size=20&from=0&display_type=0">침낭 전체</a></li>
                        <li class="divider"></li>
                        <li><a href="./search?category_search_type=category&cate1=003&cate2=002&size=20&from=0&display_type=0">매트 전체</a></li>
                        <li class="divider"></li>
                        <li><a href="./search?category_search_type=category&cate1=003&cate2=003&size=20&from=0&display_type=0">침대/해먹</a></li>
                        <li><a href="./search?category_search_type=category&cate1=003&cate2=004&size=20&from=0&display_type=0">베개/방석/귀마개/안대</a></li>
                        <li><a href="./search?category_search_type=category&cate1=003&cate2=999&size=20&from=0&display_type=0">침구류 기타</a></li>
                    </ul>
                </li>


                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">버너류/난로류<span class="caret"></span></a>
                    <ul class="dropdown-menu" role="menu">
                        <li><a href="./search?category_search_type=category&cate1=004&size=20&from=0&display_type=0">버너류/난로류 전체</a></li>
                        <li><a href="./search?category_search_type=category&cate1=004&cate2=001&size=20&from=0&display_type=0">버너 전체</a></li>
                        <li><a href="./search?category_search_type=category&cate1=004&cate2=002&size=20&from=0&display_type=0">버너관련 기타</a></li>
                        <li><a href="./search?category_search_type=category&cate1=004&cate2=003&size=20&from=0&display_type=0">난방/난로/히터</a></li>
                        <li><a href="./search?category_search_type=category&cate1=004&cate2=004&size=20&from=0&display_type=0">연료/연료통</a></li>
                        <li><a href="./search?category_search_type=category&cate1=004&cate2=999&size=20&from=0&display_type=0">버너류/난로류 기타</a></li>
                    </ul>
                </li>


                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">식기류<span class="caret"></span></a>
                    <ul class="dropdown-menu" role="menu">
                        <li><a href="./search?category_search_type=category&cate1=005&size=20&from=0&display_type=0">식기류 전체</a></li>
                        <li><a href="./search?category_search_type=category&cate1=005&cate2=001&size=20&from=0&display_type=0">코펠</a></li>
                        <li><a href="./search?category_search_type=category&cate1=005&cate2=002&size=20&from=0&display_type=0">쿨러</a></li>
                        <li><a href="./search?category_search_type=category&cate1=005&cate2=003&size=20&from=0&display_type=0">식기</a></li>
                        <li><a href="./search?category_search_type=category&cate1=005&cate2=004&size=20&from=0&display_type=0">프라이팬/주전자</a></li>
                        <li><a href="./search?category_search_type=category&cate1=005&cate2=005&size=20&from=0&display_type=0">컵</a></li>
                        <li><a href="./search?category_search_type=category&cate1=005&cate2=006&size=20&from=0&display_type=0">물병/물통/수낭</a></li>
                        <li><a href="./search?category_search_type=category&cate1=005&cate2=007&size=20&from=0&display_type=0">보온병/보냉병</a></li>
                        <li><a href="./search?category_search_type=category&cate1=005&cate2=008&size=20&from=0&display_type=0">칼/가위/도마/수저/포크</a></li>
                        <li><a href="./search?category_search_type=category&cate1=005&cate2=999&size=20&from=0&display_type=0">식기류 기타</a></li>
                    </ul>
                </li>


                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">랜턴/화로대/BBQ<span class="caret"></span></a>
                    <ul class="dropdown-menu" role="menu">
                        <li><a href="./search?category_search_type=category&cate1=006&size=20&from=0&display_type=0">랜턴/화로대/BBQ 전체</a></li>
                        <li><a href="./search?category_search_type=category&cate1=006&cate2=001&size=20&from=0&display_type=0">랜턴</a></li>
                        <li><a href="./search?category_search_type=category&cate1=006&cate2=002&size=20&from=0&display_type=0">손전등/후레쉬</a></li>
                        <li><a href="./search?category_search_type=category&cate1=006&cate2=003&size=20&from=0&display_type=0">헤드랜턴</a></li>
                        <li><a href="./search?category_search_type=category&cate1=006&cate2=004&size=20&from=0&display_type=0">화로대/그릴/BBQ/더치오븐/삼각대</a></li>
                        <li><a href="./search?category_search_type=category&cate1=006&cate2=005&size=20&from=0&display_type=0">취사/화로/BBQ/토치/라이터/꼬치 기타</a></li>
                        <li><a href="./search?category_search_type=category&cate1=006&cate2=006&size=20&from=0&display_type=0">랜턴/후레쉬 기타</a></li>
                        <li><a href="./search?category_search_type=category&cate1=006&cate2=999&size=20&from=0&display_type=0">랜턴/화로대/BBQ 기타</a></li>
                    </ul>
                </li>


                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">등산류<span class="caret"></span></a>
                    <ul class="dropdown-menu" role="menu">
                        <li><a href="./search?category_search_type=category&cate1=007&size=20&from=0&display_type=0">등산복 전체</a></li>
                        <li><a href="./search?category_search_type=category&cate1=007&cate2=001&size=20&from=0&display_type=0">자켓/조끼/바람막이</a></li>
                        <li><a href="./search?category_search_type=category&cate1=007&cate2=002&size=20&from=0&display_type=0">바지/반바지/칠부</a></li>
                        <li><a href="./search?category_search_type=category&cate1=007&cate2=003&size=20&from=0&display_type=0">긴팔/반팔</a></li>
                        <li><a href="./search?category_search_type=category&cate1=007&cate2=004&size=20&from=0&display_type=0">언더웨어</a></li>
                        <li><a href="./search?category_search_type=category&cate1=007&cate2=005&size=20&from=0&display_type=0">장갑/모자/양말/스카프</a></li>
                        <li><a href="./search?category_search_type=category&cate1=007&cate2=006&size=20&from=0&display_type=0">등산패션 기타</a></li>
                        <li><a href="./search?category_search_type=category&cate1=007&cate2=007&size=20&from=0&display_type=0">등산화</a></li>
                        <li><a href="./search?category_search_type=category&cate1=007&cate2=008&size=20&from=0&display_type=0">아웃도어 신발</a></li>
                        <li><a href="./search?category_search_type=category&cate1=007&cate2=009&size=20&from=0&display_type=0">샌들/아쿠아/슬리퍼</a></li>
                        <li><a href="./search?category_search_type=category&cate1=007&cate2=999&size=20&from=0&display_type=0">등산패션 기타</a></li>
                        <li class="divider"></li>
                        <li><a href="./search?category_search_type=category&cate1=008&size=20&from=0&display_type=0">등산장비 전체</a></li>
                        <li><a href="./search?category_search_type=category&cate1=008&cate2=001&size=20&from=0&display_type=0">스틱</a></li>
                        <li><a href="./search?category_search_type=category&cate1=008&cate2=002&size=20&from=0&display_type=0">카라비너/퀵드로우</a></li>
                        <li><a href="./search?category_search_type=category&cate1=008&cate2=003&size=20&from=0&display_type=0">아이젠/스패츠</a></li>
                        <li><a href="./search?category_search_type=category&cate1=008&cate2=004&size=20&from=0&display_type=0">우산/우의</a></li>
                        <li><a href="./search?category_search_type=category&cate1=008&cate2=005&size=20&from=0&display_type=0">고글/선글라스</a></li>
                        <li><a href="./search?category_search_type=category&cate1=008&cate2=008&size=20&from=0&display_type=0">암벽장비</a></li>
                        <li><a href="./search?category_search_type=category&cate1=008&cate2=999&size=20&from=0&display_type=0">등산장비 기타</a></li>
                    </ul>
                </li>


                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">배낭/가방<span class="caret"></span></a>
                    <ul class="dropdown-menu" role="menu">
                        <li><a href="./search?category_search_type=category&cate1=009&size=20&from=0&display_type=0">배낭 전체</a></li>
                        <li><a href="./search?category_search_type=category&cate1=009&cate2=001&size=20&from=0&display_type=0">배낭</a></li>
                        <li><a href="./search?category_search_type=category&cate1=009&cate2=002&size=20&from=0&display_type=0">디팩</a></li>
                        <li><a href="./search?category_search_type=category&cate1=009&cate2=003&size=20&from=0&display_type=0">가방</a></li>
                        <li><a href="./search?category_search_type=category&cate1=009&cate2=999&size=20&from=0&display_type=0">배낭/가방 기타</a></li>
                    </ul>
                </li>


                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">기타장비<span class="caret"></span></a>
                    <ul class="dropdown-menu" role="menu">
                        <li><a href="./search?category_search_type=category&cate1=010&size=20&from=0&display_type=0">전체</a></li>
                        <li><a href="./search?category_search_type=category&cate1=010&cate2=001&size=20&from=0&display_type=0">삽/망치/도끼/툴/나이프</a></li>
                        <li><a href="./search?category_search_type=category&cate1=010&cate2=002&size=20&from=0&display_type=0">시계/나침반/온도계/습도계/고도계</a></li>
                        <li><a href="./search?category_search_type=category&cate1=010&cate2=003&size=20&from=0&display_type=0">수상스포츠</a></li>
                        <li><a href="./search?category_search_type=category&cate1=010&cate2=004&size=20&from=0&display_type=0">스키/보드용품</a></li>
                        <li><a href="./search?category_search_type=category&cate1=010&cate2=005&size=20&from=0&display_type=0">쌍안경</a></li>
                        <li><a href="./search?category_search_type=category&cate1=010&cate2=006&size=20&from=0&display_type=0">망원경/스코프</a></li>
                        <li><a href="./search?category_search_type=category&cate1=010&cate2=007&size=20&from=0&display_type=0">전선/릴선</a></li>
                        <li><a href="./search?category_search_type=category&cate1=010&cate2=008&size=20&from=0&display_type=0">자동차용품</a></li>
                        <li><a href="./search?category_search_type=category&cate1=010&cate2=999&size=20&from=0&display_type=0">기타장비</a></li>
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
            <th>날짜</th>
            <#--<th>조회수</th>-->
            <#--<th>추천수</th>-->
        </tr>
        </thead>
        <tbody>
    <#list boardList as product>
        <tr>
            <#if product.getIsThumbnail() == "Y">
                <td><img src="${product.getImageUrl()}" class="img-rounded" alt="Cinque Terre" width="50" height="50"></td>
            <#else>
                <td></td>
            </#if>
            <#--<td>${product.getCpName()}</td>-->
            <td>
                <a href="${product.getUrl()}" target="_blank">${product.getTitle()}</a>&nbsp;<span class="badge">${product.getReplyCount()}</span><br>
                <small>조회수&nbsp;${product.getViewCount()}</small>,&nbsp;&nbsp;추천수 &nbsp;<small>${product.getSuggestCount()}</small>
            </td>
            <td>${product.getDateTime()}</td>
            <#--<td>${product.getViewCount()}</td>-->
            <#--<td>${product.getSuggestCount()}</td>-->
        </tr>
    </#list>
        </tbody>
    </table>

    <ul class="pager">
        <#if from gt 0>
        <li><a href="./list?from=${prevFrom}&size=${size}">Previous</a></li>
        </#if>
        <li><a href="./list?from=${nextFrom}&size=${size}">Next</a></li>
    </ul>

</div> <!-- ccontainer -->
</#if> <!-- boardList -->

</body>
</html>