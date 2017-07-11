<%@page import="tm.totalre.dto.TotalreDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<% 
 String userId = (String)session.getAttribute("userId");
 String userNick = (String)session.getAttribute("userNick");
 
 ArrayList<TotalreDTO> list = (ArrayList)request.getAttribute("likelist");
 %>
<!DOCTYPE html>
<html lang="UTF-8">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Travel Maker 마이페이지</title>
<!-- Bootstrap Core CSS -->
<link href="/resource/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="/resource/bootstrap/css/modern-business.css"
	rel="stylesheet">

<!-- Custom Fonts -->
<link href="/resource/bootstrap/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">

<!-- MetisMenu CSS -->
<link href="/resource/bootstrap/css/metisMenu.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="/resource/bootstrap/css/sb-admin-2.css" rel="stylesheet">


<!-- Custom Fonts -->
<link href="/resource/bootstrap/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">

<!-- list CSS -->
<link rel="stylesheet" type="text/css"
	href="/resource/mypage/likespot/css/component.css" />

<!-- list Plug-In -->
<script src="/resource/mypage/likespot/js/modernizr.custom.js"></script>

<!-- 마이페이지 공통 css -->
<link href="/resource/mypage/base/css/mypage.css" rel="stylesheet"
	type="text/css">

<!-- 지정 css -->
<link href="/resource/mypage/schedule/css/schedule.css" rel="stylesheet"
	type="text/css">
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->


</head>

<body>

	<div id="wrapper">
		<!-- Navigation -->
		<nav class="navbar navbar-inverse navbar-static-top" role="navigation"
			style="margin-bottom: 0">
			<div class="navbar-header">
				<!--  모바일 버전때 생성되는 버튼 -->
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-collapse">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand moblie_logo" href="/tmmain/main.tm">Travel
					Maker</a>
				<!-- /모바일 버전때 생성되는 버튼 -->
			</div>
			<!-- 로고 -->
			<div class="logobox">
				<a class="navbar-brand" href="/tmmain/main.tm">Travel Maker</a>
			</div>
			<!-- /로고 -->
			<!-- 네비 헤더  메뉴 부분 -->
			<ul class="nav navbar-nav navbar-right">
				<li><a href="/step1/step1.tm">일정만들기</a></li>
				<li><a href="/recommandtravelregion/recommandTravelRegion.tm">여행지추천</a>
				</li>
				<!-- 로그인 할때 생기는 버튼 -->
				<%if(userNick!=null){ %>
				<li><a href="/travelReview/reviewlist.tm">여행리뷰</a></li>
				<%} //end of if %>
				<li style="padding: 10px;"><input type="text" id="tf_search"
					style="width: 170px; height: 26px" />
				<button id="searchBtn">
						<span class="glyphicon glyphicon-search"></span>
					</button></li>
				<!-- 로그인 할때 생기는 버튼 -->
				<%if(userNick!=null){ %>
				<li><a href="/mylist/menubar.tm"><%=userNick%>&nbsp;&nbsp;님</a>
				</li>
				<li><a href="/tmmain/logout.tm">로그아웃</a></li>
				<!-- 로그인 안 할때 생기는 버튼 -->
				<%}else{ %>
				<li><a href="/member/loginForm.tm">로그인</a></li>
				<li><a href="/member/signupForm.tm">회원가입</a></li>
				<%} //end of if %>
			</ul>
			<!-- /네비 헤더  메뉴 부분 -->

			<div class="navbar-inverse sidebar" role="navigation">
				<div class="sidebar-nav navbar-collapse">
					<ul class="nav" id="side-menu">
						<li><a href="#" style="color: #9d9d9d;"><i
								class="fa fa-user fa-user"></i> 내 정보<span class="fa arrow"></span></a>
							<ul class="nav nav-second-level">
								<li><a href="/member/memberUpdate.tm"
									style="color: #9d9d9d;"> 정보수정</a></li>
								<li><a href="/member/memberDelete.tm"
									style="color: #9d9d9d;"> 회원탈퇴</a></li>
							</ul></li>
						<li><a href="#" style="color: #9d9d9d;"><i
								class="fa fa-list-alt fa-list-alt"></i> 내 일정<span
								class="fa arrow"></span></a>
							<ul class="nav nav-second-level">
								<li><a href="/mylist/inglist.tm" style="color: #9d9d9d;">
										계획중인일정</a></li>
								<li><a href="/mylist/donelist.tm" style="color: #9d9d9d;">
										완성된일정</a></li>
								<li><a href="/mylist/startlist.tm" style="color: #9d9d9d;">
										시작된일정</a></li>
								<li><a href="/mylist/endlist.tm" style="color: #9d9d9d;">
										여행한일정</a></li>
							</ul></li>
						<li><a href="/tmmypage/likespot.tm" style="color: #9d9d9d;"><i
								class="fa fa-heart fa-heart"></i> 관심 여행지</a></li>
						<li><a href="/tmmypage/schedule.tm" style="color: #9d9d9d;"><i
								class="fa fa-calendar fa-calendar"></i> 관심 일정</a></li>
						<li><a href="/tmmypage/qna.tm" style="color: #9d9d9d;"><i
								class="fa fa-omments fa-comments"></i> QnA</a></li>
						<li><a href="/tmmypage/stemp.tm" style="color: #9d9d9d;"><i
								class="fa fa-flag fa-flag"></i> 스템프</a></li>
					</ul>
				</div>
				<!-- /.sidebar-collapse -->
			</div>
			<!-- /.navbar-static-side -->
		</nav>
		<!-- 바디 부분 -->
		<div id="page-wrapper">
			<article>
				<div class="container">
					<!-- 바디 타이틀  -->
					<div class="row">
						<div class="col-lg-12">
							<h1 class="page-header">
								관심 일정 <small>Like Travel Plan</small>
							</h1>
						</div>
						<!-- /바디 타이틀 -->
					</div>
					
				<%
				if(list != null){
				for(int i=0; i<list.size(); i++){ %>
					<section class="grid-wrap">
						<ul class="grid swipe-right" id="grid">
							<li><a href="#"><img class="imagelist"
									src="<%=list.get(i).getTotalrePhoto1fake() %>" /></a>
								<h3>
								<p style="color: white;"><%=list.get(i).getTotalreTitle() %></p>
								<br/> <input type="hidden" class="likeNum" value="<%=list.get(i).getScNum()%>" />
								</h3>
							</li>

						</ul>
					</section>
				<%} 
				}else{
				%>

					<H1>저장하신 관심 일정이 없습니다.</H1>
					<div class='nonlist'>
						<section class="grid-wrap"></section>
					</div>
				<%} %>
				</div>
				<!-- /container -->
			</article>
		</div>
		<!-- 바디 부분 -->
	</div>
	<!-- /#wrapper -->

	<!-- jQuery -->
	<script src="/resource/bootstrap/js/jquery.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="/resource/bootstrap/js/bootstrap.min.js"></script>

	<!-- Metis Menu Plugin JavaScript -->
	<script src="/resource/bootstrap/js/metisMenu.min.js"></script>
	<!-- Custom Theme JavaScript -->
	<script src="/resource/bootstrap/js/sb-admin-2.js"></script>
	<!--  list plug-In -->
	<script src="/resource/mypage/likespot/js/masonry.pkgd.min.js"></script>
	<script src="/resource/mypage/likespot/js/imagesloaded.pkgd.min.js"></script>
	<script src="/resource/mypage/likespot/js/classie.js"></script>
	<script src="/resource/mypage/likespot/js/colorfinder-1.1.js"></script>
	<script src="/resource/mypage/likespot/js/gridScrollFx.js"></script>
	<!-- 마이페이지 공통 js -->
	<script src="/resource/mypage/base/js/base.js"></script>
	<!-- 지정 js -->
	<script src="/resource/mypage/schedule/js/schedule.js"></script>

	<script>
	new GridScrollFx( document.getElementById( 'grid' ), {
	viewportFactor : 0.4
	} );
	</script>

</body>

</html>
