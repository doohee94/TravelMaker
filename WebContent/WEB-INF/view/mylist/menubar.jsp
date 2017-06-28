<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <!--  
  마이페이지>내일정>내일정 관련 리스트 보여주는 페이지
   -->
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MyPageMenubar</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="Content-Script-Type" content="text/javascript" />
<meta http-equiv="Content-Style-Type" content="text/css" />
<meta http-equiv="X-UA-Compatible" content="IE=10" />

<!-- 탭 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!--  프로그레스 -->
<link rel="stylesheet" href="/resource/member/css/jquery.lineProgressbar.css">

<!--  메뉴바 -->
<link rel="stylesheet" type="text/css" href="/resource/member/css/base.css" />
<link rel="stylesheet" type="text/css" href="/resource/member/css/style.css" />

<!-- 헤더 -->
<!-- <link rel="stylesheet" href="/TravelMakerTest/css/base.css"> -->

<!-- 각 list 틀 -->
<link rel="stylesheet" type="text/js" href="/resource/mylist/js/mylist.js" />
<link rel="stylesheet" href="/resource/mylist/css/mylist.css">

<style type="text/css">

/*탭부분 스타일지정*/
.tab{
	font-size: 30px;
	display: inline-block;	
	font-weight: bold;
}
.tab:hover{
text-decoration:none;
}
</style>
</head>

<body>

<header>
<!--  여기에 헤더넣기 -->

</header>

<!--  메뉴네비게이션 -->
<div class="lnb">
		<h1>마이페이지</h1>
		<div class="subtitle"><a href="#">내정보</a></div>
			<ul class="sub" style="display:none;">
				<li><a href="/member/memberUpdate.tm">정보보기</a></li>
				<li><a href="/member/memberDelete.tm">회원탈퇴</a></li>
			</ul>
		<div class="subtitle"><a href="/mylist/menubar.tm">나의일정</a></div>
		<div class="subtitle"><a href="/tmmypage/likespot.tm">관심여행지</a></div>
		<div class="subtitle"><a href="/tmmypage/schedule.tm">관심일정</a></div>
		<div class="subtitle"><a href="/tmmypage/qna.tm">QnA</a></div>
		<div class="subtitle sub_end"><a href="/tmmypage/stemp.tm">스탬프</a></div>
</div>
<!--/메뉴네비게이션-->
 
<!--  달성률 보는 곳 -->
<article   style="margin-left:100px; background-image:url('/resource/mylist/images/test3.png'); height: 250px">
	
	<img src="/resource/mylist/images/flag.png" style="display: inline-block; margin-left:1500px"/>
	<div id="rate" style="margin-left:35%;display:inline-block;"></div>

</article>

<!-- 탭 -->
<article  style="background-color: #092551; height: 100px" >
<div align="center">
<br/>
			<a  class="tab" data-filter="all" id="all" style="color:#ffffff" style="cursor:pointer">전체<br/><br/>일정</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a  class="tab" data-filter="ing" id="ing" style="cursor:pointer">계획중인<br/><br/>일정</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a class="tab" data-filter="done" id="done" style="cursor:pointer">완성된 <br/><br/>일정</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a class="tab" data-filter="start" id="start" style="cursor:pointer">시작된<br/><br/>일정</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a class="tab" data-filter="end" id="end" style="cursor:pointer">여행한<br/><br/>일정</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</div>
</article>

<!--  요기서 리스트 넣는 이런거 해주면 된당 -->
<article>

</article>
	
</div>
</body> <!--  바디 끝 -->

<script src="/resource/member/js/jquery.lineProgressbar.js"></script>
<script type="text/javascript">
	var rate=80; // 계산에서 넘어온 rate 값을 넣어준다. 
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

<!--  탭관련 js
	클릭시 해당하는 일정 페이지로 넘어간다.-->
<script type="text/javascript">
$(function(){
	//전체 일정을 보여준다
	$('#all').click(function(){
		$('#all').attr('href','menubar.tm');//여기 경로만 수정해주세요
	});
	//계획중인 일정을 누르면 계획중인 일정 페이지로 넘어간다. 
	$('#ing').click(function(){
		$('#ing').attr('href','inglist.tm');//여기 경로만 수정해주세요
	});
	
	//완성된 일정을 페이지로 넘어감. 
	$('#done').click(function(){
		$('#done').attr('href','donelist.tm'); //여기 경로만 수정해주세요
	});
	
	//시작된 일정 페이지로 넘어감
	$('#start').click(function(){
		$('#start').attr('href','startlist.tm');//여기 경로만 수정해주세요
	});
	
	//여행한 일정 페이지로 넘어감.
	$('#end').click(function(){
		$('#end').attr('href','endlist.tm');//여기 경로만 수정해주세요
	});
	
});

</script>

</html>