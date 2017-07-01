<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- 도전일정 상세 페이지  -->

<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>도전일정 상세페이지</title>
<!-- 슬라이드 link -->
<link
	href="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css"
	rel="stylesheet" />

<!-- css -->
<link rel="stylesheet"
	href="/resource/challengeSchedule/css/challengeScheduleDetail.css" />

<!-- 슬라이드 script -->
<!-- 슬라이드 script ( 19번줄,20번줄 ), top버튼 ( 19번줄 ) -->
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>

<!-- js  -->
<script src="/resource/challengeSchedule/js/challengeScheduleDetail.js"></script>

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
                       <input type="text"/><button id="#searchBtn" style="background-color: #fafafa; border:0px; border-style: none; height: 25px;"><span class="glyphicon glyphicon-search"></span> search</button>
                    </li>                      
                     <li>
                        <a href="member/loginForm.tm">로그인</a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        
    </nav>
	
	<div class="container" id="titlecontainer">
		<div class="col-lg-12">
			<h2 class="page-header">도전 여행 상세페이지</h2>
		</div>
	</div>
	
	<div class="container" id="secondcontainer">
		<!-- ### 슬라이드 #### -->
		<div id="myCarousel" class="carousel slide" data-ride="carousel">

			<!--페이지-->
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
				<li data-target="#myCarousel" data-slide-to="3"></li>
			</ol>
			<!--페이지-->

			<div class="carousel-inner">
				<!--슬라이드1-->
				<div class="item active" id="imgarea">
					<img src="http://www.blueb.co.kr/SRC2/_image/w01.jpg"
						style="width: 100%" alt="First slide">
					<div class="container">
						<div class="carousel-caption">
							<h1>Slide 1</h1>
							<p>텍스트 1</p>
						</div>
					</div>
				</div>
				<!--슬라이드1-->

				<!--슬라이드2-->
				<div class="item" id="imgarea">
					<img src="http://www.blueb.co.kr/SRC2/_image/w02.jpg"
						style="width: 100%" data-src="" alt="Second slide">
					<div class="container">
						<div class="carousel-caption">
							<h1>Slide 2</h1>
							<p>텍스트 2</p>
						</div>
					</div>
				</div>
				<!--슬라이드2-->

				<!--슬라이드3-->
				<div class="item" id="imgarea">
					<img src="http://www.blueb.co.kr/SRC2/_image/w03.jpg"
						style="width: 100%" data-src="" alt="Third slide">
					<div class="container">
						<div class="carousel-caption">
							<h1>Slide 3</h1>
							<p>텍스트 3</p>
						</div>
					</div>
				</div>
				<!--슬라이드3-->

				<!--슬라이드4-->
				<div class="item" id="imgarea">
					<img src="http://www.blueb.co.kr/SRC2/_image/w03.jpg"
						style="width: 100%" data-src="" alt="Third slide">
					<div class="container">
						<div class="carousel-caption">
							<h1>Slide 3</h1>
							<p>텍스트 3</p>
						</div>
					</div>
				</div>
				<!--슬라이드4-->
			</div>

			<!--이전, 다음 버튼-->
			<a class="left carousel-control" href="#myCarousel" data-slide="prev"><span
				class="glyphicon glyphicon-chevron-left"></span></a> <a
				class="right carousel-control" href="#myCarousel" data-slide="next"><span
				class="glyphicon glyphicon-chevron-right"></span></a>

		</div>
		<!-- end div id="myCarousel" class="carousel slide" data-ride="carousel -->

		<!-- end ### 슬라이드 #### -->

		<!-- 텍스트 공간 -->
		<div class="detailtextarea">

			<div class="ptarow1">
				<div class="startrow1c"><p>출발</p></div>
				<div class="startrow2c"><p>출발지명</p></div>
				<div class="startrow3c"><p>공란</p></div>
			</div>
			
			<%for(int i=0; i<5; i++) {%>
			<div class="ptarow2">
				<div class="ptarowstopover1c"><p>경유</p></div>
				<div class="ptarowstopover2c"><p>경유지<%= i+1 %></p></div>
				<div class="ptarowstopover3c"><p>경유지 체크리스트</p></div>
			</div>
			<%} %>
			
			<div class="ptarow3">
				<div class="lastrow1c"><p>도착</p></div>
				<div class="lastrow2c"><p>도착지명</p></div>
				<div class="lastrow3c"><p>도착지 체크리스트</p></div>
			</div>
			

		</div>
		<!-- end detailtextarea  -->
		

		<!-- 별점, 공유하기, 좋아요 버튼 그룹 -->
		<div class="btngroup">

			<div class="likelocation">
				<img src='/resource/challengeSchedule/img/emptyheart.jpg' class="emptyheart">
				<img src='/resource/challengeSchedule/img/fullheart.jpg' class="fullheart" style="display: none;">
				
				<input type="button" id="shareBtn" value="페이스북공유하기" />
			</div>



		</div>
		<!-- end btngroup  -->
		<!-- end 별점, 공유하기, 좋아요 버튼 그룹 -->


		<!-- 여행경로 및 후기 -->
		<div class="travelpath">
			<div>타이틀</div>
			<div>내용</div>
		</div>
		<!-- end travelpath  -->
		<!-- end 여행경로 및 후기 -->


		<!-- 리뷰 -->

		<!-- 등록된 리뷰 -->
		<div class="reviewform">

			<div class="reviewregisted">

				<!-- 별점 -->
				<div class="row lead" id="starscore">

					<div id="hearts-existing-reg" class="starrr-reg"></div>

					<input type="text" id="count-existing-reg" value=""
						readonly="readonly" />

					<!-- 입력시간 -->
					<input type="text" id="THEN_TIME" value="" readonly="readonly" />

				</div>

				<!-- 입력된 리뷰 공간 -->

				<textarea class="reviewinputtextarea" id="reviewinputtextarea"
					placeholder="" name=rvtext></textarea>

			</div>

			<div class="reviewregisted">

				<!-- 별점 -->
				<div class="row lead" id="starscore">

					<div id="hearts-existing-reg" class="starrr-reg"></div>

					<input type="text" id="count-existing-reg" value=""
						readonly="readonly" />

					<!-- 입력시간 -->
					<input type="text" id="THEN_TIME" value="" readonly="readonly" />

				</div>

				<!-- 입력된 리뷰 공간 -->

				<textarea class="reviewinputtextarea" id="reviewinputtextarea"
					placeholder="" name=rvtext></textarea>

			</div>


			<div class="reviewregisted">

				<!-- 별점 -->
				<div class="row lead" id="starscore">

					<div id="hearts-existing-reg" class="starrr-reg"></div>

					<input type="text" id="count-existing-reg" value=""
						readonly="readonly" />

					<!-- 입력시간 -->
					<input type="text" id="THEN_TIME" value="" readonly="readonly" />

				</div>

				<!-- 입력된 리뷰 공간 -->

				<textarea class="reviewinputtextarea" id="reviewinputtextarea"
					placeholder="" name=rvtext></textarea>

			</div>


			<div class="reviewregisted">

				<!-- 별점 -->
				<div class="row lead" id="starscore">

					<div id="hearts-existing-reg" class="starrr-reg"></div>

					<input type="text" id="count-existing-reg" value=""
						readonly="readonly" />

					<!-- 입력시간 -->
					<input type="text" id="THEN_TIME" value="" readonly="readonly" />

				</div>

				<!-- 입력된 리뷰 공간 -->

				<textarea class="reviewinputtextarea" id="reviewinputtextarea"
					placeholder="" name=rvtext></textarea>

			</div>

		</div>


		<!-- 리뷰 입력 -->
		<div class="reviewinputdiv">
			<div class="reviewinput">
				<form class="reviewinputform" name=reviewfrm action="" method='get'>

					<!-- 별점 -->
					<div class="row lead" id="starscore">

						<div id="hearts-existing" class="starrr"></div>
						<!-- type="hidden" 으로 바꾸기 -->
						<input type="text" id="count-existing" value=""
							readonly="readonly" />

						<!-- 현재시간 -->
						<input type="text" id="NOW_TIME" value="" readonly="readonly" />

					</div>

					<!-- 리뷰입력창 -->

					<textarea class="reviewinputtextarea" id="reviewinputtextarea"
						placeholder=" 300자 내로 입력해주세요." name=rvtext></textarea>

					<input class="inputbtn" type=button value="입력"
						onclick="check_onclick()">
				</form>

			</div>
		</div>
		<!-- top버튼 -->
		<a class="return-top" href="#"
			style="right: 15px; bottom: 15px; position: fixed; z-index: 9999; width: 40px; height: 30px; font-size: 20px;">TOP</a>

	</div>
	<!-- end container -->

</body>
</html>
