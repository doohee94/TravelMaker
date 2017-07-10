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
<title>git 이미지 사용 테스트</title>

<style type="text/css">
#blurExample{
 	background: url(/resource/error/errorpage500.PNG) center; 
	background-size:cover;
	width:1900px;
	height:800px;
	position: relative;
	z-index:1;
	float:left;
	margin:10px;
	margin-top:100px;
	overflow:hidden;
}

.bgBlur{
  content: '';
  position: absolute;
  top: 0; left:0; right:0; bottom:0;
  background: inherit;
  z-index:-1;
}

.bgBlur .maintitlelink .movemain{
	display:block;
	margin-top:400px;
	margin-left:1020px;
	border:0px;
	font-size:25px;
	font-family:맑은고딕;
	color:#A6A6A6;
	text-decoration:none;
}
	
</style>
</head>
<body>
<!--  <img src="/resource/gif/carfriends.gif" width="100%" height="950px" align="center"/> -->

<div id="blurExample" class="bgBlur">
<!-- 	<input type="button" class ="maintitlelink" value="TravelMaker" > -->
	<div class ="maintitlelink"><a class="movemain" href="/tmmain/main.tm">메인으로 돌아가기</a></div>
</div>

</body>
</html>
