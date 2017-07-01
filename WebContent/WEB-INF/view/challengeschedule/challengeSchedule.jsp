<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- 도전일정 페이지  -->

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>도전일정 페이지</title>


<!--게시글(네모창)에 마우스오버 했을때 사용되는 부트스트랩 link -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> -->

<!--게시글(네모창)에 마우스오버 했을때 사용되는 부트스트랩 link-->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"> -->

<!-- 베스트 3 css -->
<!-- <link rel="stylesheet" href="/resource/challengeSchedule/css/challengeSchedule.css"/> -->

<!-- Bootstrap Core CSS -->
<link href="/resource/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="/resource/bootstrap/css/modern-business.css"
	rel="stylesheet">

<!-- Custom Fonts -->
<link href="/resource/bootstrap/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">

<!--게시글(네모창)에 마우스오버 했을때 사용되는 부트스트랩 스크립트, top버튼 script -->

<!--  top버튼 (26번째 스크립트로 인해 25번줄 소스 생략가능)  -->
<!-- <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script> -->
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> -->

<!--게시글(네모창)에 마우스오버 했을때 사용되는 부트스트랩 스크립트-->
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->

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

	
	<div class="container" id="secondcontainer" >
		<!-- 베스트3 -->
		<div class="row">

			<div class="col-lg-12">
				<h2 class="page-header">도전 여행</h2>
			</div>

			<div class="col-lg-12">
				<h2 class="page-header">Best 3</h2>
			</div>

			<!-- best1 -->
			<div class="col-md-4 text-center">
				<div class="thumbnail">
					<a href="/challengeschedule/challengeScheduleDetail.tm">
						<img class="img-responsive" src="http://placehold.it/750x450"
							alt="">
						<div class="caption">
							<h3>
								대제목 공간<br> <small>소제목 공간</small>
							</h3>
							<p>내용 공간</p>
						</div>
					</a>
				</div>
			</div>

			<!-- end best1 -->

			<!-- best2 -->
			<div class="col-md-4 text-center">
				<div class="thumbnail">
					<a href="/challengeschedule/challengeScheduleDetail.tm">
						<img class="img-responsive" src="http://placehold.it/750x450"
							alt="">
						<div class="caption">
							<h3>
								대제목 공간<br> <small>소제목 공간</small>
							</h3>
							<p>내용 공간</p>
						</div>
					</a>
				</div>
			</div>

			<!-- end best2 -->

			<!-- best3 -->
			<div class="col-md-4 text-center">
				<div class="thumbnail">
					<a href="/challengeschedule/challengeScheduleDetail.tm">
						<img class="img-responsive" src="http://placehold.it/750x450"
							alt="">
						<div class="caption">
							<h3>
								대제목 공간<br> <small>소제목 공간</small>
							</h3>
							<p>내용 공간</p>
						</div>
					</a>
				</div>
			</div>

			<!-- end best3 -->



		</div>
		<!--  /.row -->

		<!-- 도전 공간 -->

		<div class="row" id="secondrow">

			<div class="col-lg-12">
				<h2 class="page-header">도전</h2>
			</div>
			
			<%for(int i=0; i<6; i++){ %>
			<div class="col-md-4 text-center">
				<div class="thumbnail">
					<a href="/challengeschedule/challengeScheduleDetail.tm">
						<img class="img-responsive" src="http://placehold.it/750x450"
							alt="">
						<div class="caption">
							<h3>
								대제목 공간<br> <small>소제목 공간</small>
							</h3>
							<p>내용 공간</p>
						</div>
					</a>	
				</div>
			</div>
 			<%} %>

			
		</div>
		<!-- /.row -->
	
		
	</div>
	<!-- /.container -->

			<!-- top버튼 -->
			<a class="return-top" href="#"
				style="right: 15px; bottom: 15px; position: fixed; z-index: 9999; width: 40px; height: 30px; font-size: 20px;">TOP</a>
		

	<!-- jQuery -->
	<script src="/resource/bootstrap/js/jquery.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="/resource/bootstrap/js/bootstrap.min.js"></script>

	<!-- js -->
	<script src="/resource/challengeSchedule/js/challengeSchedule.js"></script>
</body>
</html>