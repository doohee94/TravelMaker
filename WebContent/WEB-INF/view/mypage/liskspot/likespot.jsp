<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="UTF-8">
	<head>
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge"> 
		<meta name="viewport" content="width=device-width, initial-scale=1"> 
		<title>test</title>
		<link rel="stylesheet" type="text/css" href="/resource/mypage/likespot/css/demo.css" />
		<link rel="stylesheet" type="text/css" href="//resource/mypage/likespot/css/component.css" />
		<link rel="stylesheet" href="//cdn.jsdelivr.net/jquery.sidr/2.0.0/stylesheets/jquery.sidr.dark.min.css">
		<link rel="stylesheet" type="text/css" href="/resource/mypage/likespot/css/component.css" />
		<link rel="stylesheet" type="text/css" href="/resource/mypage/likespot/css/simplemenu.css" />
		<script src="/resource/mypage/likespot/js/modernizr.custom.js"></script>
	</head>
	<!-- 헤더 부분 -->
	<header>
<%-- 		<%@ include file="/view/header/header.jsp" %> --%>
	</header>
	<body>
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
		<div class="container">
			<section class="grid-wrap">
				<ul class="grid swipe-right" id="grid">
					<li><a href="#"><img src="/resource/mypage/likespot/images/dummy.png" alt="dummy"></a><h3>여행지<br/>별점 : ★★★★★</h3></li>
				</ul>
				</section>
		</div><!-- /container -->
</article>
		<script src="/resource/mypage/likespot/js/masonry.pkgd.min.js"></script>
		<script src="/resource/mypage/likespot/js/imagesloaded.pkgd.min.js"></script>
		<script src="/resource/mypage/likespot/js/classie.js"></script>
		<script src="/resource/mypage/likespot/js/colorfinder-1.1.js"></script>
		<script src="/resource/mypage/likespot/js/gridScrollFx.js"></script>
		<!-- function -->		
		<script src="/resource/mypage/likespot/js/function.js"></script>		
		<!-- Include jQuery -->
    	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    	<!-- Include the Sidr JS -->
    	<script src="//cdn.jsdelivr.net/jquery.sidr/2.0.0/jquery.sidr.js"></script>
		
		<script>
			new GridScrollFx( document.getElementById( 'grid' ), {
				viewportFactor : 0.4
			} );
		</script>
	</body>
</html>