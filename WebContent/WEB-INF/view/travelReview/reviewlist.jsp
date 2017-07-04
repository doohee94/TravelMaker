<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 여행일정 리뷰리스트 페이지입니다. -->
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>reviewlist.jsp</title>

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<!-- jquery cdn -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>


<!-- Bootstrap Core CSS -->
    <link href="/resource/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="/resource/bootstrap/css/modern-business.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="/resource/bootstrap/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

<script type="text/javascript" src="/resource/bootstrap/js/bootstrap.min.js"></script>

<!-- 지역탭 부분 css링크 -->
<script src="/resource/travelReview/js/reviewlist.js"></script>
<script src="/resource/travelReview/js/travelRegion.js"></script>

</head>

<body>

    <!-- Navigation -->
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="tmmain/main.tm">Travel Maker</a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li>
                        <a href="/step1/step1.tm">일정만들기</a>
                    </li>
                    <li>
                        <a href="/recommandtravelregion/recommandTravelRegion.tm">여행지추천</a>
                    </li>
                    <li>
                        <a href="/recommandtravelregion/recommandTravelRegion.tm">여행리뷰</a>
                    </li>
                    <li>
                        <a href="/challengeschedule/challengeSchedule.tm">도전일정</a>
                    </li>
                     <li style="padding:10px">
                       <input type="text"/> <button>검색</button>
                    </li>                      
                     <li>
                        <a href="member/loginForm.tm">로그인</a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
    </nav>
    
    


	<!-- Page Content -->
	<div class="container">

		<!-- Page Heading/Breadcrumbs -->
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">
					리뷰페이지 <small>여러분의 후기를 공유해보세요</small>
				</h1>

				<ol class="breadcrumb">
					<li>리뷰 > </li>
					<li><a href="">최신순</a></li>
					<li class="active"><a href="">인기순</a></li>
				</ol>
			</div>
		</div>
		<!-- /.row -->
	</div>
	
		<!--   출발지 경유지 도착지 탭   -->
	<div class="container">
		<div id="menu1" class="tab-pane fade in active">
			<p><%@ include file="travelregion.jsp"%></p>
		</div>
	</div>
	
	<hr>
	<div class="container" id="divCon">
		
		<%for(int i=0; i<4; i++){ %>
		<!-- Project One -->
        <div class="row">
            <div class="col-md-7">
                <a>
                    <img class="img-responsive img-hover images" src="http://placehold.it/700x300" alt="">
                </a>
            </div>
            <div class="col-md-5">
                <h3>신나는 여행!!</h3>
                <h4>출발지 - 서울</h4>
                <p>여행 정말 신났음 완전신나 안녕 디지몬 내꿈을꾸면서 잠이 들래~~ 안녕 디지몬.....</p>
                <a class="btn btn-primary images">상세보기</i></a>
            </div>
        </div>
        <!-- /.row -->

        <hr>
        <%} %>
   </div>
		
	<a class="btn btn-primary" id="move_top_btn" style="position:fixed; bottom:5px; right:5px">TOP</i></a>
</body>
</html>