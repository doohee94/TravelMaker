<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/VSampleCoding/view/header/css/base.css">
</head>
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript" src="/resource/main/header/js/function.js"></script>
</header>
</html>