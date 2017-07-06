<%@page import="tm.step1.dto.StepDTO"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>  
  <%
  //_id 값
  //시작날짜와 종료날짜를 계산해서 일수 구하기
  String userId=session.getAttribute("userId").toString();
  System.out.println("stpe3 세션 유져아이디>>>"+userId);

  %>
<!-- 일정짜기 step3 페이지 -->
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
  
<!-- 부트스트랩 -->
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
   
   <!-- Custom CSS -->
    <link href="/resource/bootstrap/css/modern-business.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="/resource/bootstrap/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">   
    
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<!-- 지도 api 키 -->
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=1464ab905ce0a7acbcb1f9933dbd5961&libraries=services"></script>

<!-- jquery, jquery mobile 관련 cdn -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript" src="/resource/step3/step3Content.js"></script>

<!-- 팝업 관련 파일 -->
<script type="text/javascript" src="/resource/step3/script/alopex-ui.min.js"></script>
<link rel="stylesheet" type="text/css" href="/resource/step3/css/alopex-ui-default.css" />

<!-- 리스트 관련 파일 -->
<link rel="stylesheet"
   href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resource/step3/step3.css">

</head>

<body>
<!-- 헤더 -->
<!-- 메인 헤더 부분 -->
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="/tmmain/main.tm">Travel Maker</a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li>
                        <a href="/step1/step1.tm">일정만들기</a>
                    </li>
                    <li>
                        <a href="/recommandtravelregion/recommandTravelRegion.tm">여행지추천</a>
                    </li>
                    <!-- 로그인 할때 생기는 버튼 -->
                    <c:if test="${not empty sessionScope.userNick }">
                    <li>
                        <a href="/recommandtravelregion/recommandTravelRegion.tm">여행리뷰</a>
                    </li>
                    <li>
                        <a href="/mylist/menubar.tm">마이페이지</a>
                    </li>
                    </c:if>
                    <li style="padding:10px" id="mobile_search">
                       <input type="text"/><button id="#searchBtn" style="background-color: #fafafa; border:0px; border-style: none; height: 25px;"><span class="glyphicon glyphicon-search"></span> search</button> 
                    </li>
                    <!-- 로그인 할때 생기는 버튼 -->
                    <c:choose>
                       <c:when test="${not empty sessionScope.userNick }">
                           <li>
                             <a href="#">${sessionScope.userNick }&nbsp;&nbsp;님</a>
                          </li>                      
                          <li>
                              <a href="/tmmain/logout.tm">로그아웃</a>
                          </li>
                       </c:when>
                       <c:otherwise>
                           <li>
                              <a href="/member/loginForm.tm">로그인</a>
                          </li>
                          <li>
                              <a href="/member/signupForm.tm">회원가입</a>
                          </li>   
                       </c:otherwise>
                    </c:choose>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
    </nav>
    <!-- 헤더 아래 버튼 -->
   <div id="main" style="padding: 0px;"> 
	<div style="height:50px; background-color: #222;">
		<div style="float:right; margin-right: 50px; margin-top:10px">
      <button id="addFriend" class="headbtn">친구추가</button>
      <button id="save" class="headbtn">저장</button>   
   </div>
</div>

<br/>


<!--  유저 아이디  -->
<input type="hidden" value="<%=userId%>" id="userId"/>
<!-- 지역리스트/관광리스트/지도 -->
<div  style="width:100%; padding:0px" align="center">
   <!-- 지역, 여행지 리스트 부분 -->     
       <div style="height:650px;margin-left: 50px;margin-top: 13px;float: left;padding:0px;width: 150px;">
             <input type="hidden" value="${_id}" id="scheduleId"/>
             <div width: 150px; border-bottom:solid 1px;" id="reSearchDiv">
                <input type="text" placeholder="지역검색" id="reSearchInput" style="border-top:none; border-left:none; border-right:none; width:100px; border-bottom:true"/>
                <button class="nextbtn" id="reSearchBtn">검색</button>
             </div>

             <br/>
            <ul style="padding:0px;width:100%; height:550px; overflow-x:hidden; overflow-y:scroll;  display:inline-block;" id="cityList"><!--  앞에서  선택된 지역 리스트 -->
                     
            </ul>
            
            <ul id="trash"><img src="/resource/step3/step3_image/trash.png"></ul>
  		 
       </div><!--  지역 끝 -->
               
    <!-- 여행지 정보 불러와서 출력할 리스트 -->
     <div style="width:18%; height:650px; display:inline-block; padding:0px;" id="apiList">
           <div id="category" style="margin-bottom:10px;">
              <button class="categoryBtn nextbtn" id="api_All">전체</button>
              <button class="categoryBtn nextbtn" id="api_tour">여행지</button>
              <button class="categoryBtn nextbtn" id="api_food">맛집</button>
              <button class="categoryBtn nextbtn" id="api_ect">축제</button>
           </div>
            <ul class="droptrue  list-group" id="contact-list"
               style="overflow-y: scroll; height:100%; width:100%;display:inline-block; border:2px solid  #8C8C8C;">
            </ul>
      <input type="hidden" id="hiddenCity"/>
   </div><!-- 여행지정보 끝 -->
   <!--  일정추가 -->
    <div style="height:650px; display:inline-block; width:18%; padding:0px;">
         <div class="select_panel-heading c-list">
                  <!-- 셀렉트박스@@ -->
                 <input type="hidden" id="DaySelectBoxNum"/>
                <select id="DaySelectBox" class="DaySelectBox" style="width:50%">
					<!-- 날짜 넣는곳 -->
              </select>
            <img src="/resource/step3/step3_image/plus.png" style="float:right;"id="chuga"/>
            <img src="/resource/step3/step3_image/opt.png" style="float: right;" id="distanceCal"/>
             <br/>
         </div>
         <ul class="list-group droptrue" id="myList" style="color:#fff; height:100%; width:100%; padding:0px; overflow-y:scroll;display:inline-block; border:2px solid  #8C8C8C;">hi
         </ul>
      </div>
   &nbsp;

   <!-- 지도 구성 부분-->
   <div id="map" style="float:right; width: 50%; height: 700px;display:inline-block; border:2px solid  #8C8C8C; margin-right:5px"></div>
</div><!--  지도/리스트들 끝끝 -->
</div>
</body>
</html>