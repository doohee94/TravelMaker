<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- 일정 추가 시 띄우는 팝업화면입니다 -->
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>개인일정을 적어주세요</title>
<!-- 지도 api 키 -->
<script type="text/javascript"
	src="//apis.daum.net/maps/maps3.js?apikey=1464ab905ce0a7acbcb1f9933dbd5961&libraries=services"></script>
<!-- jquery, jquery mobile 관련 cdn -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript" src="/resource/step3/step3Content.js"></script>
<!-- 팝업 관련 파일 -->
<script type="text/javascript"  src="/resource/step3/script/alopex-ui.min.js"></script>

<style type="text/css">
.btn{

	margin-top:5px;
	background-color: #ffffff;
	border : 3x solid  #9ec3ff;
	width: 50px;
	height: 25px;
}
</style>
</head>
<body>
<div align="center">
<h3>추가하고싶은 일정을 적어주세요</h3>
제목 : <input type="text" width="50px" id="addText"><br>
<input type="button" value="확인" id="ok" class="btn"/>
</div>
</body>
</html>