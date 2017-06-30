<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- 여행지 추천 페이지 -->

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>여행지 추천 페이지</title>

<!-- 탭 및 폼 css -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- css  -->
<link rel="stylesheet"
	href="/resource/recommandTravelRegion/css/recommandTravelRegion.css" />
<link rel="stylesheet"
	href="/resource/recommandTravelRegion/css/myInterestOrder.css" />
<link rel="stylesheet"
	href="/resource/recommandTravelRegion/css/popularOrder.css" />

<!-- 탭 및 폼 script -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- top 버튼 script -->
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script
	src="/resource/recommandTravelRegion/js/recommandTravelRegion.js"></script>

</head>
<body>
	<!-- Navigation -->
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div class="container">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="tmmain/main.tm">Travel Maker</a>
			</div>
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="/step1/step1.tm">일정만들기</a></li>
					<li><a href="/recommandtravelregion/recommandTravelRegion.tm">여행지추천</a>
					</li>
					<li><a href="/recommandtravelregion/recommandTravelRegion.tm">여행리뷰</a>
					</li>
					<li><a href="/challengeschedule/challengeSchedule.tm">도전일정</a>
					</li>
					<li style="padding: 10px"><input type="text" />
						<button>검색</button></li>
					<li><a href="member/loginForm.tm">로그인</a></li>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
	</nav>


<div class="container" id="secondcontainer">

		<!-- top3 공간 -->
		<div class="topthreeloc">
			<div class="topthreelb" id="topthreelb">
				<h2>TOP 3</h2>
			</div>

			<!-- 첫번째 -->
			<div class="topthreediv">

				<div class="col-md-4 text-center">
				<div class="thumbnail">
					<img class="img-responsive" src="http://placehold.it/750x450"
						alt="">
					<div class="caption">
						<h3>
							첫번째 대제목 공간<br> <small>소제목 공간</small>
						</h3>
						<p>내용 공간</p>
					</div>
				</div>
			</div>

				<!-- 두번째 -->
				<div class="col-md-4 text-center">
				<div class="thumbnail">
					<img class="img-responsive" src="http://placehold.it/750x450"
						alt="">
					<div class="caption">
						<h3>
							두번째 대제목 공간<br> <small>소제목 공간</small>
						</h3>
						<p>내용 공간</p>
					</div>
				</div>
			</div>

				<!-- 세번째 -->
				<div class="col-md-4 text-center">
				<div class="thumbnail">
					<img class="img-responsive" src="http://placehold.it/750x450"
						alt="">
					<div class="caption">
						<h3>
							세번째 대제목 공간<br> <small>소제목 공간</small>
						</h3>
						<p>내용 공간</p>
					</div>
				</div>
			</div>
				
			</div>
			<!-- end top3 div (topthreediv)  -->
		</div>
		<!-- end top3 제목 및 div  -->
</div><!-- 두번째 container (top3 제목 및 글 ) -->

		<!--  인기순 내관심순 탭	-->
<div class="container" id="thirdcontainer">
		
			<ul class="nav nav-tabs">
				<li class="active"><a data-toggle="tab" href="#populartab">인기순</a></li>
				<li><a data-toggle="tab" href="#myinteresttab">내관심순</a></li>
				<!-- 		    <input type="button" value="다음" id="nextbtn"> -->
			</ul>
			
		
		
		<div class="tab-content">
			<!-- 인기순 탭 -->
			<div id="populartab" class="tab-pane fade in active">

				<!-- 여행지 추천 페이지 - 인기순 페이지 -->
				<%
					for (int i = 0; i < 6; i++) {
				%>
				<div class="col-md-4 text-center">
					<div class="thumbnail">
						<img class="img-responsive" src="http://placehold.it/750x450"
							alt="">
						<div class="caption">
							<h3>
								대제목 공간<br> <small>소제목 공간</small>
							</h3>
							<p>내용 공간</p>
						</div>
					</div>
				</div>
				<%
					}
				%>


				<!-- end 여행지 추천 페이지 - 인기순 페이지 -->
				
			</div>

			<!-- 내 관심순 탭 -->
			<div id="myinteresttab" class="tab-pane fade">

				<!--여행지추천페이지 - 관심순 페이지 -->
				<%
					for (int i = 0; i < 6; i++) {
				%>
				<div class="col-md-4 text-center">
					<div class="thumbnail">
						<img class="img-responsive" src="http://placehold.it/750x450"
							alt="">
						<div class="caption">
							<h3>
								대제목 공간<br> <small>소제목 공간</small>
							</h3>
							<p>내용 공간</p>
						</div>
					</div>
				</div>
				<%
					}
				%>
				<!-- end 여행지추천페이지 - 인기순 페이지 -->
			</div>

		</div><!-- end tab-content -->


</div>	<!-- end class container -->

	<!-- top 버튼 클릭시 맨위로 올라간다. -->
	<!-- 	<a href="#topthreelb" class="topbtn">TOP</a> -->
	<a class="return-top" href="#"
		style="right: 15px; bottom: 15px; position: fixed; z-index: 9999; width: 40px; height: 30px; font-size: 20px;">TOP</a>

</body>
</html>
