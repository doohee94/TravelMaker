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
	<jsp:include page="/tmmain/mypageheader.tm"></jsp:include>
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
