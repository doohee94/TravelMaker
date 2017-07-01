<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
  <%
  
  //시작날짜와 종료날짜를 계산해서 일수 구하기
  
  SimpleDateFormat format = new SimpleDateFormat("yy-MM-dd");
  
  String sDateStr = "17-05-27";
  String eDateStr = "17-05-30";
  
  Date sDate = format.parse(sDateStr);
  Date eDate = format.parse(eDateStr);
  
  long diff = eDate.getTime() - sDate.getTime();
  int day = (int)diff/(24*60*60*1000)+1;
  System.out.println("날짜"+day);

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
    

<style type="text/css">

/*사이드 내비*/
.sidenav {
   margin-top : 15%;
    height: 70%;
    width: 0;
    position: fixed;
    z-index: 1;
    top: 0;
    right: 0;
    background-color: #ffffff;
    overflow-x: hidden;
    transition: 0.5s;
    padding-top: 60px;
    
}

.sidenav a {
    padding: 8px 8px 8px 32px;
    text-decoration: none;
    font-size: 25px;
    color: #818181;
    display: block;
    transition: 0.3s;
    margin-top: 200px;
    z-index :1;
}

.sidenav a:hover, .offcanvas a:focus{
    color: #000000;
}

.sidenav .closebtn {
    position: absolute;
    top: 0;
    right: 25px;
    font-size: 36px;
    margin-left: 50px;
}

#main {
    transition: margin-right .5s;
    padding: 16px;
}

@media screen and (max-height: 450px) {
  .sidenav {padding-top: 15px;}
  .sidenav a {font-size: 18px;}
}

</style>
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
   <!-- Navigation -->
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
                <a class="navbar-brand" href="tmmain/main.tm">Travel Maker</a>
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
                    <li>
                        <a href="/recommandtravelregion/recommandTravelRegion.tm">여행리뷰</a>
                    </li>
                    <li>
                        <a href="/challengeschedule/challengeSchedule.tm">도전일정</a>
                    </li>
                     <li style="padding:10px">
                       <input type="text"/> <button>검색</button>
                    </li>                      
                     <li>
                        <a href="member/loginForm.tm">로그인</a>
                    </li>
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

<!-- 지역리스트/관광리스트/지도 -->
<div  style="width:100%; padding:0px" align="center">
   <!-- 지역, 여행지 리스트 부분 -->     
       <div style="height:650px;margin-left: 50px;margin-top: 13px;float: left;padding:0px;width: 150px;">
             
             <div width: 150px; border-bottom:solid 1px;" id="reSearchDiv">
                <input type="text" placeholder="지역검색" id="reSearchInput" style="border-top:none; border-left:none; border-right:none; width:100px; border-bottom:true"/>
                <button class="nextbtn" id="reSearchBtn">검색</button>
             </div>
<!--              <div style="display: inline-block;" >지역</div>  -->
<!--              <img src="/resource/step3/step3_image/Q.png" style="float: right;" id="reSearch"/> -->
             <br/>
            <ul style="padding:0px;width:100%; height:550px; overflow-x:hidden; overflow-y:scroll;  display:inline-block;" id="cityList"><!--  앞에서  선택된 지역 리스트 -->
                 <li class="list-group-item cityName" style=" width:150px;"><!--  앞에서 선택된 지역 리스트 -->
                        <div class="col-xs-12 col-sm-9" align = "center">
                            <span class="cityName">서울</span><br/>
                        </div>
                        <div class="clearfix"></div>
                    </li>                 
                     <li class="list-group-item" style="width:150px;">
                        <div class="col-xs-12 col-sm-9" align = "center">
                            <span class="cityName">인천</span><br/>
                        </div>
                        <div class="clearfix"></div>
                    </li>
                    
                     <li class="list-group-item" style="width:150px">
                       
                        <div class="col-xs-12 col-sm-9" align = "center">
                            <span class="cityName">전주</span><br/>
                        </div>
                        <div class="clearfix"></div>
                    </li>
                      <li class="list-group-item" style="width:150px">
                       
                        <div class="col-xs-12 col-sm-9" align = "center">
                            <span class="cityName">창원</span><br/>
                        </div>
                        <div class="clearfix"></div>
                    </li>
                      <li class="list-group-item" style="width:150px">                      
                        <div class="col-xs-12 col-sm-9" align = "center">
                            <span class="cityName">부산</span><br/>
                        </div>
                        <div class="clearfix"></div>
                    </li> 
                    
                    
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
                 <input type="hidden" id="DaySelectBoxNum" value="<%=day%>"/>
                <select id="DaySelectBox" class="DaySelectBox" style="width:50%">
                <%for(int i=1; i<=day;i++){ %>
                 <option value="DAY<%=i%>">DAY<%=i%></option>
                <%} %>
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