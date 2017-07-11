<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- 회원탈퇴페이지 -->
<!DOCTYPE html>
<html>
<head>

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>회원탈퇴</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta http-equiv="Content-Script-Type" content="text/javascript" />
	<meta http-equiv="Content-Style-Type" content="text/css" />
	<meta http-equiv="X-UA-Compatible" content="IE=10" />
	
	<!-- jQuery -->
    <script src="/resource/bootstrap/js/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="/resource/bootstrap//js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="/resource/bootstrap//js/metisMenu.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="/resource/bootstrap/js/sb-admin-2.js"></script>
	
    <!-- Bootstrap Core CSS -->
    <link href="/resource/bootstrap//css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="/resource/bootstrap/css/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="/resource/bootstrap/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="/resource/bootstrap/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->


<!--  메뉴바 -->
<link rel="stylesheet" type="text/css" href="/resource/member/css/base.css" />
<link rel="stylesheet" type="text/css" href="/resource/member/css/style.css" />
</head>

<body>
		    <div id="wrapper">
       	<!-- Navigation -->
       <jsp:include page="/tmmain/mypageheader.tm"></jsp:include>
		<!-- 바디 부분 -->
        <div id="page-wrapper">
			<div class="container">
				<!-- 바디 타이틀  -->
          		<div class="row">
            		<div class="col-lg-12">
                		<h1 class="page-header">회원탈퇴
                		<small>Finish Schedule</small>
                		</h1>
            		</div>
            	<!-- /바디 타이틀 -->
            	  <!-- 바디 부분 -->
        <div id="page-wrapper" style="margin-left: 0px; min-height:0px;">
		<!-- 각 일정 보여주는 곳 -->
		
		<div class="schedule-list">                
				</div> 
			
        </div>
  
		</div><!-- /container -->
        </div>
      
    
    </div>
    
    </div>


<!-- 헤더넣기 -->
<form method="post" id="frm" action="memberOut.tm">
<center><article><br/><br/><br/><br/><br/><br/><br/><br/><br/>
<img alt="" src="/resource/member/css/images/dropout.png" width="100" height="90" align=center><br/><br/>
<font size="5"> 정말 TRAVEL MAKER를 탈퇴하시겠습니까?</font><br/><br/>
<font size="3">탈퇴시 1주간 회원가입이 불가능합니다</font><br/><br/>
<div> 비밀번호:
<input id="userPw" name="userPw" type="password" ></div>
<br/><br/>
<!-- *************탈퇴되면 팝업창띄우기 -->
<button type="submit" style="WIDTH: 60pt; HEIGHT: 20pt; font-size:9pt;" name="insert" id="insert" >탈퇴하기</a></button>
<button style="WIDTH: 60pt; HEIGHT: 20pt; font-size:9pt;" name="cancle" id="cancle"><a href="#" onClick="history.back();">취소</a></button>
<!-- 취소시 이전페이지로 -->
</article></center>

</form>
</body>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>


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