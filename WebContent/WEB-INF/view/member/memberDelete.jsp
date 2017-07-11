<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <% 
 String userId = (String)session.getAttribute("userId");
 String userNick = (String)session.getAttribute("userNick");
 %>
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
		<!-- Navigation -->
        <nav class="navbar navbar-inverse navbar-static-top" role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
            <!--  모바일 버전때 생성되는 버튼 -->
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
            <!-- /모바일 버전때 생성되는 버튼 -->   
            <!-- 로고 --> 
                <a class="navbar-brand" href="tmmain/main.tm" style="padding-left: 382.6px; font-size:28px; font-weight: bold; font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif;">Travel Maker</a>
            <!-- /로고 -->
            </div>
            <!-- 네비 헤더  메뉴 부분 -->
         <ul class="nav navbar-nav navbar-right">
                    <li>
                        <a href="/step1/step1.tm" style="font-size: 17px; font-family: 맑은고딕; font-weight: bold;">일정만들기</a>
                    </li>
                    <li>
                        <a href="/recommandtravelregion/recommandTravelRegion.tm" style="font-size: 17px; font-family: 맑은고딕; font-weight: bold;">여행지추천</a>
                    </li>
                    <!-- 로그인 할때 생기는 버튼 -->
                    <%if(userNick!=null){ %>
                    <li>
                        <a href="/travelReview/reviewlist.tm" style="font-size: 17px; font-family: 맑은고딕; font-weight: bold;">여행리뷰</a>
                    </li>
                    <%} //end of if %>
                     <li style="padding:10px;">
                       <input type="text" id="tf_search" style="width: 170px; height: 26px"/>&nbsp;&nbsp;<button id="searchBtn"><span class="glyphicon glyphicon-search"></span></button>
                    </li>                                         
                                      <!-- 로그인 할때 생기는 버튼 -->
                    <%if(userNick!=null){ %>
                    <li>
                    	<a href="/mylist/inglist.tm" style="font-size: 17px; font-family: 맑은고딕; font-weight: bold;"><%=userNick%>&nbsp;&nbsp;님</a>
                    </li>                      
                    <li>
                        <a href="/tmmain/logout.tm"  style="font-size: 17px; font-family: 맑은고딕;  font-weight: bold; padding-right: 210.5px;">로그아웃</a>
                    </li>
                    <!-- 로그인 안 할때 생기는 버튼 -->
                    <%}else{ %>
                    <li>
                        <a href="/member/loginForm.tm">로그인</a>
                    </li>
                    <li>
                        <a href="/member/signupForm.tm">회원가입</a>
                    </li>   
                     <%} //end of if %>
                </ul>
            <!-- /네비 헤더  메뉴 부분 -->

            <div class="navbar-inverse sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                        <li>
                            <a href="#" style="color: #e2e2e2; font-weight: bold; font-size: 14px; font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif;"><i class="fa fa-user fa-user"></i>  내 정보<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="/member/memberUpdate.tm" style="color: #e2e2e2; font-weight: bold; font-size: 14px; font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif;">  정보수정</a>
                                </li>
                                <li>
                                    <a href="/member/memberDelete.tm" style="color: #e2e2e2; font-weight: bold; font-size: 14px; font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif;">  회원탈퇴</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        <li>
                            <a href="#" style="color: #e2e2e2; font-weight: bold; font-size: 14px; font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif;"><i class="fa fa-list-alt fa-list-alt"></i>  내 일정<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="/mylist/inglist.tm" style="color: #e2e2e2; font-weight: bold; font-size: 14px; font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif;">  계획중인일정</a>
                                </li>
                                <li>
                                    <a href="/mylist/donelist.tm" style="color: #e2e2e2; font-weight: bold; font-size: 14px; font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif;">  완성된일정</a>
                                </li>
                                <li>
                                    <a href="/mylist/startlist.tm" style="color: #e2e2e2; font-weight: bold; font-size: 14px; font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif;">  시작된일정</a>
                                </li>
                                <li>
                                    <a href="/mylist/endlist.tm" style="color: #e2e2e2; font-weight: bold; font-size: 14px; font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif;">  여행한일정</a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a href="/tmmypage/likespot.tm" style="color: #e2e2e2; font-weight: bold; font-size: 14px; font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif;"><i class="fa fa-check-square-o fa-fw"></i>  관심 여행지</a>
                        </li>
                        <li>
                            <a href="/tmmypage/schedule.tm" style="color: #e2e2e2; font-weight: bold; font-size: 14px; font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif;"><i class="fa fa-check-square-o fa-fw"></i>  관심 일정</a>
                        </li>
                        <li>
                            <a href="/tmmypage/qna.tm" style="color: #e2e2e2; font-weight: bold; font-size: 14px; font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif;"><i class="fa fa-comments fa-fw"></i>  QnA</a>
                        </li>
                        <li>
                            <a href="/tmmypage/stemp.tm" style="color: #e2e2e2; font-weight: bold; font-size: 14px; font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif;"><i class="fa fa-map-marker fa-fw"></i>  스템프</a>
                        </li>                        
                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        </nav>


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


</html>