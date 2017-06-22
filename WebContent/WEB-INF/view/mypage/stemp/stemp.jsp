<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="UTF-8">
	<head>
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge"> 
		<meta name="viewport" content="width=device-width, initial-scale=1"> 
		<title>My stemp</title>
		<link rel="stylesheet" href="//cdn.jsdelivr.net/jquery.sidr/2.0.0/stylesheets/jquery.sidr.dark.min.css">
		<link rel="stylesheet" href="/resource/mypage/stemp/css/list.css">
		<!-- 합쳐지고 최소화된 최신 CSS -->
	    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" href="/resource/mypage/stemp/css/simplemenu.css" />	
	</head>
	<!-- 헤더 부분 -->
	<header>
<%-- 		<%@ include file="/view/header/header.jsp" %> --%>
	</header>
	<body>
	<!-- 토글 버튼 -->
	<a id="simple-menu" href="#sidr">
	<img src="/resource/mypage/stemp/images/menu.png">
	</a>

	<!-- 사이드 메뉴 -->	
	<div id="side_menu_nav" style="display:none">
	<nav class="nav">
  	<ul id="menu">
      <li>
      <a href="#">
        <span class="fa-stack fa-lg pull-left">
          <i class="fa fa-gears fa-stack-1x "></i>
        </span> 나의 정보
      </a>
      <ul>
        <li><a href="#">내정보 보기</a></li>
        <li><a href="#">회원 탈퇴</a></li> 
      </ul>
      </li>

      <li>
      <a href="likespot.tm">
        <span class="fa-stack fa-lg pull-left">
          <i class="fa fa-server fa-stack-1x "></i>
        </span> 관심여행지
      </a>
      </li>
      <li>
      <a href="schedule.tm">
        <span class="fa-stack fa-lg pull-left">
          <i class="fa fa-server fa-stack-1x "></i>
        </span> 관심일정
      </a>
      </li>
      <li>
      <a href="qna.tm">
        <span class="fa-stack fa-lg pull-left">
          <i class="fa fa-server fa-stack-1x "></i>
        </span> QnA
      </a>
      </li>
      <li>
      <a href="stemp.tm">
        <span class="fa-stack fa-lg pull-left">
          <i class="fa fa-server fa-stack-1x "></i>
        </span> 스탬프
      </a>
      </li>
      </ul>
</nav>
</div>
<article>
	
	<!-- 지도 부분 -->
	<div align="center">
	<div id="map" style="width:60%;height:450px;"></div><br/>
	</div>
	<!-- 스탬프 리스트 부분 -->
	 <div class="container">
        <div class="row">
        <div class="gallery col-lg-12 col-md-12 col-sm-12 col-xs-12">

        </div>

        <div align="center">
            <button class="btn btn-default filter-button" data-filter="all">모두 보기</button>
            <button class="btn btn-default filter-button" data-filter="hdpe">달성한 스탬프</button>
            <button class="btn btn-default filter-button" data-filter="sprinkle">달성하지 못한 스탬프</button>
        </div>
        <br/>

            <div class="gallery_product col-lg-4 col-md-4 col-sm-4 col-xs-6 filter hdpe">
                <img src="http://fakeimg.pl/365x365/" class="img-responsive"><p>광명시 XX</p>
            </div>

            <div class="gallery_product col-lg-4 col-md-4 col-sm-4 col-xs-6 filter sprinkle">
                <img src="http://fakeimg.pl/365x365/" class="img-responsive"><p>인천광역시 연수구 XX</p>
            </div>

            <div class="gallery_product col-lg-4 col-md-4 col-sm-4 col-xs-6 filter hdpe">
                <img src="http://fakeimg.pl/365x365/" class="img-responsive"><p>서울시 강서구 XX</p>
            </div>

            <div class="gallery_product col-lg-4 col-md-4 col-sm-4 col-xs-6 filter hdpe">
                <img src="http://fakeimg.pl/365x365/" class="img-responsive"><p>안양시 XX</p>
            </div>

            <div class="gallery_product col-lg-4 col-md-4 col-sm-4 col-xs-6 filter sprinkle">
                <img src="http://fakeimg.pl/365x365/" class="img-responsive"><p>부천시 XX</p>
            </div>
            <div class="gallery_product col-lg-4 col-md-4 col-sm-4 col-xs-6 filter hdpe">
                <img src="http://fakeimg.pl/365x365/" class="img-responsive"><p>광명시 XX</p>
            </div>

            <div class="gallery_product col-lg-4 col-md-4 col-sm-4 col-xs-6 filter sprinkle">
                <img src="http://fakeimg.pl/365x365/" class="img-responsive"><p>인천광역시 연수구 XX</p>
            </div>

            <div class="gallery_product col-lg-4 col-md-4 col-sm-4 col-xs-6 filter hdpe">
                <img src="http://fakeimg.pl/365x365/" class="img-responsive"><p>서울시 강서구 XX</p>
            </div>

            <div class="gallery_product col-lg-4 col-md-4 col-sm-4 col-xs-6 filter hdpe">
                <img src="http://fakeimg.pl/365x365/" class="img-responsive"><p>안양시 XX</p>
            </div>

            <div class="gallery_product col-lg-4 col-md-4 col-sm-4 col-xs-6 filter sprinkle">
                <img src="http://fakeimg.pl/365x365/" class="img-responsive"><p>부천시 XX</p>
            </div>
            
        </div>
    </div>

	
</article>
		
		
		<!-- Include jQuery -->
    	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    	<!-- Include the Sidr JS -->
    	<script src="//cdn.jsdelivr.net/jquery.sidr/2.0.0/jquery.sidr.js"></script>
    	<!-- list js -->
		<script src="/resource/mypage/stemp/js/list.js"></script>
		<!-- daum map api -->
		<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=141438a76ce74e385ae8e735b840f26c"></script>
		<!-- map js -->
		<script src="/resource/mypage/stemp/js/map.js"></script>
		<script src="/resource/mypage/stemp/js/sidemenu.js"></script>
		
	</body>
</html>