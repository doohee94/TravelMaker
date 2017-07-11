<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- 일정만들기 step1 페이지 출/경/도착지 선택과 동행자 선택 그리고 날짜입력하는 페이지
    (화면설계 슬라이드4번)-->

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>일정만들기 step1</title>

<!-- 검색 이미지  -->
<link rel="stylesheet"href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />

</head>
<body>
	<!-- 메인 헤더 부분 -->
    <jsp:include page="/tmmain/header.tm"></jsp:include>

		<div class="container" id="totaldiv" style="margin-bottom:50px">
        	
			
			<div class="col-lg-12">
				<h2 class="page-header">회사소개</h2>
			</div>
			
			<div class="col-lg-12">
				<h2 style="margin-left:40%;margin-bottom:30px">Travel Maker</h2>
				<h4 style="margin-left:25%">저희 Travel Maker에 방문해주신 여러분께 언제나 행운이 깃들길 기원합니다.</h4>
				<h4 style="margin-left:28%">우리는 고객 여러분들에게 믿음을 주기 위해 항상 최선을 다하겠습니다.</h4>
			</div>
			
			<div class="col-lg-12">
				<h2 class="page-header">조직도</h2>
			</div>
			
			<div id="membermap" align="center">
				<img src="/resource/introduce/images/membermap.jpg"/>
			</div>
			
			<div class="col-lg-12">
				<h2 class="page-header">오시는길</h2>
			</div>
			
			<div id="map" align="center">
				
				<img src="/resource/introduce/images/kostamap.jpg"/>
				<br/>
				<div><h3>Tel : 02 - 3636 - 7373</h3></div>
			</div>

		</div><!-- end of totaldiv  -->
		
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</body>
</html>
