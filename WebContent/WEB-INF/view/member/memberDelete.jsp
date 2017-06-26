<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- 회원탈퇴페이지 -->
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<!--  프로그레스 -->
<link rel="stylesheet" href="/resource/member/css/jquery.lineProgressbar.css">

<!--  메뉴바 -->
<link rel="stylesheet" type="text/css" href="/resource/member/css/base.css" />
<link rel="stylesheet" type="text/css" href="/resource/member/css/style.css" />
</head>

<body>
<!--  메뉴네비게이션 -->
<div id="wrap" > 
	<div class="lnb">
		<h1>마이페이지</h1>
		<div class="subtitle"><a href="#">내정보</a></div>
			<ul class="sub" style="display:none;">
				<li><a href="memberUpdate.tm">정보보기</a></li>
				<li><a href="memberDelete.tm">회원탈퇴</a></li>
			</ul>
		<div class="subtitle"><a href="http://http://localhost:8080/mylist/menubar.tm">나의일정</a></div>
		<div class="subtitle"><a href="">관심일정</a></div>
		<div class="subtitle"><a href="">관심여행지</a></div>
		<div class="subtitle"><a href="">QnA</a></div>
		<div class="subtitle sub_end"><a href="">스탬프</a></div>
	</div>

<!--  달성률 보는 곳 -->
<article   style="margin-left:100px; background-image:url('/resource/mylist/images/test3.png'); height: 250px">
	
	<img src="/resource/member/css/images/flag.png" style="display: inline-block; margin-left:1500px"/>
	<div id="rate" style="margin-left:35%;display:inline-block;"></div>

</article>

<center><article><br/>
<img alt="" src="/resource/member/css/images/dropout.png" width="100" height="90" align=center><br/><br/>
<font size="5"> 정말 TRAVEL MAKER를 탈퇴하시겠습니까?</font><br/><br/>
<font size="3">탈퇴시 1주간 회원가입이 불가능합니다</font><br/><br/>
<div> 비밀번호:
<input id="pass" name="pass" type="password" ></div>
<br/><br/>
<!-- *************탈퇴되면 팝업창띄우기 -->
<button style="WIDTH: 60pt; HEIGHT: 20pt; font-size:9pt;" name="insert" id="insert" ><a href="loginForm.tm">탈퇴하기</a></button>
<button style="WIDTH: 60pt; HEIGHT: 20pt; font-size:9pt;" name="cancle" id="cancle"><a href="#" onClick="history.back();">취소</a></button>
<!-- 취소시 이전페이지로 -->
</article></center>


</body>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="/resource/member/js/jquery.lineProgressbar.js"></script>
<script type="text/javascript">
/* 계산에서 넘어온 rate 값을 넣어준다.  */
	var rate=80;
	$('#rate').LineProgressbar({
		
		percentage:rate,
		fillBackgroundColor:'#b989c4',
		height:'65px',
		radius:'50px',
		width:'900px'
	});	
</script>

<!--  메뉴바 -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<script type="text/javascript">
$(function() {
    $(".subtitle:not(:first)").attr('class','subtitle sub_on');
    $(".sub:first").css("display","block");
    $(".sub:not(:first)").css("display","none");
    $(".subtitle").click(function() { 
        if ($(this).next(".sub").css("display") == "none") {
            $(this).attr('class','subtitle');
        } else {
            $(this).attr('class','subtitle sub_on');
        }
        $(this).next(".sub").slideToggle('fast');
    });
});
</script>

</html>