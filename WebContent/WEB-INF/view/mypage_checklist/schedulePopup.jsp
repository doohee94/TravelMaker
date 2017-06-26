<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>일정 팝업</title>

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap-theme.min.css">
	
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="/resource/step3/css/alopex-ui-default.css" />

<!-- css파일 -->
<link rel="stylesheet" href="/resource/mypage_checklist/css/schedulePopup.css">

<!-- 팝업관련 파일 -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript" src="/resource/step3/script/alopex-ui.min.js"></script>

<!-- js 파일 -->
<script type="text/javascript" src="/resource/mypage_checklist/js/schedulePopup.js"></script>
</head>
<body>
<div class="col-md-4" align="center">
<div class="col-md-6">
     <h4>일정을 진행하셨나요?</h4>
    <div class="funkyradio">
        <div class="funkyradio-info">
            <input type="radio" name="radio" id="radio5" />
            <label for="radio5">SUCCESS</label>
        </div>
        <div class="funkyradio-info">
            <input type="radio" name="radio" id="radio6" />
            <label for="radio6">PASS</label>
        </div>
    </div>
    <input type="hidden" id="state"/>
    <div id="one-line">
    	한줄평 : <input type="text" id="one-line-text" style="width:300px; border-right:0; border-left:0; border-top:0"/>
    </div>
    <br/>
    <button id="submit">확인</button>
</div>

</div>
</body>
</html>