<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>     
<!DOCTYPE html>
<html lang="UTF-8">
	<head>
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge"> 
		<meta name="viewport" content="width=device-width, initial-scale=1"> 
		<title>test</title>
		<link rel="stylesheet" type="text/css" href="/resource/mypage/likespot/css/demo.css" />
		<link rel="stylesheet" type="text/css" href="/resource/mypage/likespot/css/component.css" />
		<link rel="stylesheet" href="//cdn.jsdelivr.net/jquery.sidr/2.0.0/stylesheets/jquery.sidr.dark.min.css">
		<link rel="stylesheet" type="text/css" href="/resource/mypage/likespot/css/component.css" />
		<link rel="stylesheet" type="text/css" href="/resource/mypage/likespot/css/simplemenu.css" />
		<!-- header css -->
		<link rel="stylesheet" href="/resource/main/header/css/base.css">
		<script src="/resource/mypage/likespot/js/modernizr.custom.js"></script>
	</head>
	<!-- 헤더 부분 -->

	<header>
	<div class="header-main">
		<div class="header-logo">
		<a href="main.tm"><img class="logo" src="/resource/main/header/images/samplelogo.png"></a>
	</div>
		<div class="header-navi">
		<!-- 
		navi list 
		if문으로 유저아이디 식별하여 메뉴 출력 
		-->
			<ul class="navi-list">
				<li><a href="#"><img src="/resource/main/header/images/plan.png"></a></li>
				<li><a href="#"><img src="/resource/main/header/images/destination.png"></a></li>
				<% if (session.getAttribute("userID")!=null){ %>
				<li><a href="#"><img src="/resource/main/header/images/challenge.png"></a></li>
				<li><a href="#"><img src="/resource/main/header/images/mypage.png"></a></li>
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
					<% if (session.getAttribute("userID")!=null){ %>
					<li><%=session.getAttribute("nickName")+"님 환영합니다." %></li>
					<li><a href='' class='button-logout'><img src="/resource/main/header/images/logout.png"></a></li>
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
		<!-- 토글 버튼 -->

	<a id="simple-menu" href="#sidr">
	<img src="/resource/mypage/qna/images/menu.png">
	</a> 
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
		<c:choose>
			<c:when test="${!empty likelist}">
			<section class="grid-wrap">
				<ul class="grid swipe-right" id="grid">
<!-- 					for문 돌리기 		-->
					<c:forEach var="i" items="${likelist}">
						<c:choose>
							<c:when test="${!empty i.imagePath}">
							<li><a href="#"><img class ="imagelist" src="${i.imagePath}" /></a>
							</c:when>
							<c:otherwise>
							<li><a href="#"><img class ="imagelist" src="/resource/mypage/likespot/images/noimage.jpg"/></a>							
							</c:otherwise>
						</c:choose>
							<h3><a href="#" class="likeName">${i.likespotName}</a>
							<br/>
							<a href="#"  class="delete">삭제</a></h3>
							<input type="hidden" class="likeNum" value="${i.likespotNum}"/> </li>
					</c:forEach>
				</ul>
			</section>
			</c:when>
			<c:otherwise>
				<H1>저장하신 관심 일정이 없습니다.</H1>
			</c:otherwise>
			</c:choose>
		</div><!-- /container -->
	</article>
		<!-- Include jQuery -->
    	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
		<script src="/resource/mypage/likespot/js/masonry.pkgd.min.js"></script>
		<script src="/resource/mypage/likespot/js/imagesloaded.pkgd.min.js"></script>
		<script src="/resource/mypage/likespot/js/classie.js"></script>
		<script src="/resource/mypage/likespot/js/colorfinder-1.1.js"></script>
		<script src="/resource/mypage/likespot/js/gridScrollFx.js"></script>
		<!-- function -->		
		<script src="/resource/mypage/likespot/js/function.js"></script>		
    	<!-- Include the Sidr JS -->
    	<script src="//cdn.jsdelivr.net/jquery.sidr/2.0.0/jquery.sidr.js"></script>
    	<!-- header function -->
		<script type="text/javascript" src="/resource/main/header/js/function.js"></script>
		
		<script>
			new GridScrollFx( document.getElementById( 'grid' ), {
				viewportFactor : 0.4
			} );
		</script>
	</body>
</html>