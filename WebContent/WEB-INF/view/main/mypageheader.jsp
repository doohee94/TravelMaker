<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>   
 <% 
 String userId = (String)session.getAttribute("userId");
 String userNick = (String)session.getAttribute("userNick");
 %> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
                <a class="navbar-brand moblie_logo" href="/tmmain/main.tm">Travel Maker</a>
            <!-- /모바일 버전때 생성되는 버튼 -->   
            </div>
            <!-- 로고 --> 
            <div class="logobox">
                <a class="navbar-brand" href="/tmmain/main.tm" style="font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif;">Travel Maker</a>
            </div>
            <!-- /로고 -->
            <!-- 네비 헤더  메뉴 부분 -->
         	<ul class="nav navbar-nav navbar-right">
                    <li>
                        <a href="/step1/step1.tm"style="font-size:1.2em;font-weight:bold;font-family:맑은고딕">일정만들기</a>
                    </li>
                    <li>
                        <a href="/recommandtravelregion/recommandTravelRegion.tm"style="font-size:1.2em;font-weight:bold;font-family:맑은고딕">여행지추천</a>
                    </li>
                    <!-- 로그인 할때 생기는 버튼 -->
                    <%if(userNick!=null){ %>
                    <li>
                        <a href="/recommandtravelregion/recommandTravelRegion.tm"style="font-size:1.2em;font-weight:bold;font-family:맑은고딕">여행리뷰</a>
                    </li>
                    <%} //end of if %>
<!--                     <li> -->
<!--                         <a href="/challengeschedule/challengeSchedule.tm" style="font-size: 14px; font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif;">도전일정</a> -->
<!--                     </li> -->
                     <li style="padding:10px;">
                       <input type="text" style="width: 170px; height: 27px"/><button id="searchBtn"style="margin-left:5px;width:29px;height:27px"><span class="glyphicon glyphicon-search"></span></button>
                    </li>                                         
                                      <!-- 로그인 할때 생기는 버튼 -->
                    <%if(userNick!=null){ %>
                    <li>
                    	<a href="/member/memberUpdate.tm"style="font-size:1.2em;font-weight:bold;font-family:맑은고딕"><%=userNick%>&nbsp;&nbsp;님</a>
                    </li>                      
                    <li>
                        <a href="/tmmain/logout.tm" style="font-size:1.2em;font-weight:bold;font-family:맑은고딕">로그아웃</a>
                    </li>
                    <!-- 로그인 안 할때 생기는 버튼 -->
                    <%}else{ %>
                    <li>
                        <a href="/member/loginForm.tm"style="font-size:1.2em;font-weight:bold;font-family:맑은고딕">로그인</a>
                    </li>
                    <li>
                        <a href="/member/signupForm.tm"style="font-size:1.2em;font-weight:bold;font-family:맑은고딕">회원가입</a>
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
                            <a href="/mylist/menubar.tm" style="color: #e2e2e2; font-weight: bold; font-size: 14px; font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif;"><i class="fa fa-list-alt fa-list-alt"></i>  내 일정<span class="fa arrow"></span></a>
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
                            <a href="/tmmypage/likespot.tm" style="color: #e2e2e2; font-weight: bold; font-size: 14px; font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif;"><i class="fa fa-heart fa-heart"></i>  관심 여행지</a>
                        </li>
                        <li>
                            <a href="/tmmypage/schedule.tm" style="color: #e2e2e2; font-weight: bold; font-size: 14px; font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif;"><i class="fa fa-calendar fa-calendar"></i>  관심 일정</a>
                        </li>
                        <li>
                            <a href="/tmmypage/qna.tm" style="color: #e2e2e2; font-weight: bold; font-size: 14px; font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif;"><i class="fa fa-omments fa-comments"></i>  QnA</a>
                        </li>
                        <li>
                            <a href="/tmmypage/stemp.tm" style="color: #e2e2e2; font-weight: bold; font-size: 14px; font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif;"><i class="fa fa-flag fa-flag"></i>  스템프</a>
                        </li>                        
                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        </nav>

</body>
</html>