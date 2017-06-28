<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
 <% 
 System.out.println("세션의 아이디"+session.getAttribute("userId"));
 System.out.println("세션의 닉네임"+session.getAttribute("userNick")); 
 %>   
<!DOCTYPE html>
<html lang="UTF-8">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>TravelMaker</title>

    <!-- Bootstrap -->
    <link rel="stylesheet" href="/resource/main/css/bootstrap.min.css"/>
	<link rel="stylesheet" href="/resource/main/css/font-awesome.min.css"/>
	<link rel="stylesheet" href="/resource/main/css/animate.css"/>
	<link rel="stylesheet" href="/resource/main/css/prettyPhoto.css"/>
	<link rel="stylesheet" href="/resource/main/css/style.css"/>	
	<!--  bxslider -->
	<link rel="stylesheet" href="/resource/main/css/bxslider.min.css"/>
    <!-- header css -->
    <link rel="stylesheet" href="/resource/main/header/css/base.css">
	<!-- footer css -->
    <link rel="stylesheet" href="/resource/main/footer/css/style.css">
		
  </head>
	<header>		
		<div class="header-main">
			<div class="header-logo">
				<a href="/tmmain/main.tm"><img class="logo" src="/resource/main/header/images/samplelogo.png"></a>
			</div>
			<div class="header-navi">
			<!-- 
				navi list 
				if문으로 유저아이디 식별하여 메뉴 출력 
			-->
				<ul class="navi-list">
					<li><a href="/step1/step1.tm"><img src="/resource/main/header/images/plan.png"></a></li>
					<li><a href="/recommandtravelregion/recommandTravelRegion.tm"><img src="/resource/main/header/images/destination.png"></a></li>
					<% if (session.getAttribute("userId")!=null){ %>
					<li><a href="/challengeschedule/challengeSchedule.tm" id="btn-challenge"><img src="/resource/main/header/images/challenge.png"></a></li>
					<li><a href="#" id="btn-mypage"><img src="/resource/main/header/images/mypage.png"></a></li>
					<li><a href="/travelReview/reviewlist.tm" id="btn-mypage"><img src="/resource/main/header/images/review.png"></a></li>
					<%} %>
				</ul>
			</div>
			<div class="header-sub">
				<div class="header-serch">
				<!-- 검색창 -->
					<ul class="search-bar">	
						<li><input type='text'class="search-form"></li>
						<li><a href='#' class='button-search' id="btn-search"><img src="/resource/main/header/images/search.png"></a></li>
					</ul>
				</div>
				<div class="header-login">
					<ul class="login-list">
						<!--  회원 로그인시 생성되는 버튼 -->
						<% if (session.getAttribute("userId")!=null){ %>
						<li><label><%=session.getAttribute("userNick")%></label></li>
						<li><a href='#' class='button-logout' id="btn-logout"><img src="/resource/main/header/images/logout.png"></a></li>
						<!--  비회원 접속시 생성되는 버튼-->
						<%}else {%>
						<li><a href='#' class='button-login' id="btn-login"><img src="/resource/main/header/images/login.png"></a></li>
						<li><a href='#' class='button-join' id="btn-join"><img src="/resource/main/header/images/join.png"></a></li>		
						<%} %>
					</ul>	
				</div>
			</div>
		</div>
	</header>
	<body>
	<section id="main-slider" class="no-margin">
		<!-- bxslider -->
        <ul class="bxslider">
 			  <li><img src="http://lorempixel.com/output/sports-q-c-1600-500-1.jpg" width="100%" height="40%"/></li>
			  <li><img src="http://lorempixel.com/output/sports-q-c-1600-500-1.jpg" width="100%" height="40%"/></li>
			  <li><img src="http://lorempixel.com/output/sports-q-c-1600-500-1.jpg" width="100%" height="40%"/></li>
		</ul>
    </section><!--/#main-slider-->
	
	<div class="about">
		<div class="container">
			<div class="col-md-6 wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="300ms" >				
				<img src="/resource/main/images/6.jpg" class="img-responsive"/>
			</div>
			
			<div class="col-md-6 wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="600ms" >
				<img src="/resource/main/images/6.jpg" class="img-responsive"/>
			</div>
		</div>
	</div>
	
	<div class="lates">
		<div class="container">
			<div class="text-center">
				<h2>도전 나의 일정</h2>
			</div>
			<div class="col-md-4 wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="300ms">
				<img src="/resource/main/images/4.jpg" class="img-responsive"/>
				<h3>1번 도전</h3>
				<p>설명 어쩌구 저쩌구
				</p><br/>
				<p>별점 : ★★★★★</p>
			</div>
			
			<div class="col-md-4 wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="600ms">
				<img src="/resource/main/images/4.jpg" class="img-responsive"/>
				<h3>2번 도전</h3>
				<p>설명 어쩌구 저쩌구
				</p><br/>
				<p>별점 : ★★★★☆</p>
			</div>
			
			<div class="col-md-4 wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="900ms">				
				<img src="/resource/main/images/4.jpg" class="img-responsive"/>
				<h3>3번 도전</h3>
				<p>설명 어쩌구 저쩌구
				</p><br/>
				<p>별점 : ★★★☆☆</p>
			</div>
		</div>
		<button type="button" class="btn" id="more" >더보기</button>
	</div>

	<div class="pull-right">
				<a href="#home" class="scrollup"><i class="fa fa-angle-up fa-3x"></i></a>
	</div>


	
</body>
<footer>
<!-- footer -->	
<div class="container-fluid">
	<div class="row">
		<div class="col-md-8">
			<div class="col-md-4">
			</div>
			<div class="col-md-4">
			<br/>
				<div class="row">
				<div class="col-md-12">
				<p>회사 이야기</p>
				<br/>
					<div class="row">
						<div class="col-md-12">
						<a class="list" href="#">회사 소개</a>
						</div>
					</div>
					<br/>
					<div class="row">
						<div class="col-md-12">
						<a class="list" id="footer-alliance" href="#">광고 및 제휴</a>
						</div>
					</div>
				</div>
				</div>
			</div>
			<div class="col-md-4">
			<br/>
				<div class="row">
				<div class="col-md-12">
				<p>고객센터</p>
				<br/>
					<div class="row">
						<div class="col-md-12">
						<a class="list" id="footer-qna" href="#">QnA</a>
						</div>
					</div>
					<br/>
					<div class="row">
						<div class="col-md-12">
						<a class="list" href="#">이용방법</a>
						</div>
					</div>
				</div>
				</div>				
			</div>		
		</div>
		<div class="col-md-4">
			<img src="/resource/main/header/images/samplelogo.png" />
		</div>
	</div>
</div>	
</footer>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="/resource/main/js/jquery-2.1.1.min.js"></script>	
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="/resource/main/js/bootstrap.min.js"></script>
	<script src="/resource/main/js/jquery.prettyPhoto.js"></script>
    <script src="/resource/main/js/jquery.isotope.min.js"></script>  
	<script src="/resource/main/js/wow.min.js"></script>
	<!-- body function -->
	<script src="/resource/main/js/functions.js"></script>
	<!-- bxslider -->
	<script src="/resource/main/js/jquery.bxslider.min.js"></script>
	<!-- header function -->
	<script src="/resource/main/header/js/function.js"></script>
	<!-- footer function -->
	<script src="/resource/main/footer/js/function.js"></script>	
</html>