<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- 도전일정 상세 페이지  -->

<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>도전일정 상세페이지</title>
<!-- 슬라이드 link -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css" rel="stylesheet" />

<!-- css -->
<link rel="stylesheet" href="/resource/challengeSchedule/css/challengeScheduleDetail.css"/>

<!-- 슬라이드 script -->
<!-- 슬라이드 script ( 19번줄,20번줄 ), top버튼 ( 19번줄 ) -->
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script	src="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>

<!-- js  -->
<script src="/resource/challengeSchedule/js/challengeScheduleDetail.js"></script>

</head>
<body>
<div style="height:75px; background-color: #103e68;">
   <br/>
   <div style="color:#fff; font-size: 2em; display: inline-block;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;도전 일정</div>
   <div style="float:right; margin-right: 50px;">
   <input type="submit" value="다음 >" id="nextbtn">
<!--       <button id="addFriend" style="background-color:#103e68; font-family:'Nanum Gothic'; border:0px solid white; color:white; font-weight:600; border-radius:7px; width:100px;height:30px">친구추가</button> -->
<!--       <button id="tempSave" style="background-color:#103e68; font-family:'Nanum Gothic'; border:0px solid white; color:white; font-weight:600; border-radius:7px; width:100px;height:30px">임시저장</button> -->
<!--       <button id="save" style="background-color:#103e68; font-family:'Nanum Gothic'; border:0px solid white; color:white; font-weight:600; border-radius:7px; width:60px;height:30px">저장</button>  -->
      
<!--       <button id="chat" onclick="openNav()" style="margin-left:70px; background-color:#FDE0E2; font-family:'Nanum Gothic'; border:0px solid #FFDFE4; color:#103e68; font-weight:600; border-radius:7px; width:60px;height:30px">채팅</button>   -->
   </div>
</div>	

	<div class="container">

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
		
			<p class="ptextarea">여행경로 및 한줄평(체크리스트)</p>
			
			<div class="ptarow1">
				<div class="startrow1c">출발</div>
				<div class="startrow2c">출발지</div>
				<div class="startrow3c">공란</div>
			</div>
			<div class="ptarow2">
				<div  class="ptarowstopover1c">경유</div>
				<div  class="ptarowstopover2c">경유지1</div>
				<div  class="ptarowstopover3c">경유지1 체크리스트</div>
			</div>
			
			<div class="ptarow2">
				<div  class="ptarowstopover1c">경유</div>
				<div  class="ptarowstopover2c">경유지2</div>
				<div  class="ptarowstopover3c">경유지2 체크리스트</div>
			</div>
			
			<div class="ptarow2">
				<div  class="ptarowstopover1c">경유</div>
				<div  class="ptarowstopover2c">경유지3</div>
				<div  class="ptarowstopover3c">경유지3 체크리스트</div>
			</div>
			
			<div class="ptarow2">
				<div  class="ptarowstopover1c">경유</div>
				<div  class="ptarowstopover2c">경유지4</div>
				<div  class="ptarowstopover3c">경유지4 체크리스트</div>
			</div>
			
			<div class="ptarow2">
				<div  class="ptarowstopover1c">경유</div>
				<div  class="ptarowstopover2c">경유지5</div>
				<div  class="ptarowstopover3c">경유지5 체크리스트</div>
			</div>
			
			<div class="ptarow2">
				<div  class="ptarowstopover1c">경유</div>
				<div  class="ptarowstopover2c">경유지6</div>
				<div  class="ptarowstopover3c">경유지6 체크리스트</div>
			</div>
			<div class="ptarow3">
				<div class="lastrow1c" >도착</div>
				<div class="lastrow2c">도착지</div>
				<div class="lastrow3c">체크리스트</div>
			</div>
			
		</div>
		<!-- end detailtextarea  -->
		<!-- end 텍스트 공간 -->

		<!-- 별점, 공유하기, 좋아요 버튼 그룹 -->
		<div class="btngroup">

			<div class="likelocation">
				<img src='/resource/challengeSchedule/img/emptyheart.jpg' class="emptyheart"> 
				<img src='/resource/challengeSchedule/img/fullheart.jpg' class="fullheart" style="display: none;">
			</div>

			<div class="sharebtn"><input type="button" id="shareBtn" value="페이스북공유하기"/></div>
			

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
					
						<div id="hearts-existing-reg" class="starrr-reg" ></div>
						
				        <input type="text" id="count-existing-reg" value="" readonly="readonly"/>
				        
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
					
						<div id="hearts-existing-reg" class="starrr-reg" ></div>
						
				        <input type="text" id="count-existing-reg" value="" readonly="readonly"/>
				        
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
					
						<div id="hearts-existing-reg" class="starrr-reg" ></div>
						
				        <input type="text" id="count-existing-reg" value="" readonly="readonly"/>
				        
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
					
						<div id="hearts-existing-reg" class="starrr-reg" ></div>
						
				        <input type="text" id="count-existing-reg" value="" readonly="readonly"/>
				        
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
				        <input type="text" id="count-existing" value="" readonly="readonly"/>
				        
					 	 <!-- 현재시간 -->
						<input type="text" id="NOW_TIME" value="" readonly="readonly" />
						
			   		</div>
			   		 
					<!-- 리뷰입력창 -->				
					
					<textarea class="reviewinputtextarea" id="reviewinputtextarea"
					placeholder=" 300자 내로 입력해주세요." name=rvtext></textarea>
					
					<input class="inputbtn" type=button value="입력" onclick="check_onclick()">
				</form>
				
			</div>
		</div>
		<!-- top버튼 -->
		<a class="return-top" href="#" style="right:15px; bottom:15px; position:fixed; z-index:9999;
	width:40px;height:30px; font-size:20px;">TOP</a>
	
	</div>
	<!-- end container -->
	
	
		
		
		
		
		<!-- end 리뷰 -->
	
</body>
</html>
