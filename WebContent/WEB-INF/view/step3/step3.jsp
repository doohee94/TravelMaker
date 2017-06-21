<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
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
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=c21ea65fd6483d2f798f52cf4afd8beb&libraries=services"></script>

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

<!-- <!-- header CSS파일 -->
<!-- <link rel="stylesheet" href="../header/css/header.css"> -->

</head>

<header>
   <!-- 헤더 추가 -->
<%--    <jsp:include page="../header/header.jsp"></jsp:include> --%>
</header>



<body>
<!-- 친구등록/임시저장/저장 -->
<div style="height:75px; background-color: #103e68;">
   <br/>
   <div style="color:#fff; font-size: 2em; display: inline-block;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;나의 여행일정</div>
   <div style="float:right; margin-right: 50px;">
      <button id="addFriend">친구추가</button>
      <button id="tempSave">임시저장</button>
      <button id="save">저장</button> 
      
      <button id="chat" onclick="openNav()" style="margin-left:70px">채팅</button>  
   </div>
</div>
<br/>
<!-- 지역리스트/관광리스트/지도 -->
<div align="center"  id="main">
   <!-- 지역, 여행지 리스트 부분 -->     
       <div style="height:700px;display:inline-block; padding:0px;">
             
             <div style="display: none; width: 150px; border-bottom:solid 1px;" id="reSearchDiv">
                <input type="text" id="reSearchInput" style="border-style: none; width:100px;"/>
                <button id="reSearchBtn">검색</button>
             </div>
             <div style="display: inline-block;" >지역</div> 
             <img src="/resource/step3/step3_image/Q.png" style="float: right;" id="reSearch"/>
             <br/>
            <ul style="padding:0px;width:100%; height:100%; display:inline-block;" id="cityList"><!--  앞에서  선택된 지역 리스트 -->
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
   
       </div><!--  지역 끝 -->
       
    <!-- 여행지 정보 불러와서 출력할 리스트 -->
     <div style="width:18%; height:700px; display:inline-block; padding:0px;" id="apiList">
           <div style="maring:5px;">여행</div>
           <div id="category">
              <button class="categoryBtn" id="api_All">전체</button>
              <button class="categoryBtn" id="api_tour">여행지</button>
              <button class="categoryBtn" id="api_food">맛집</button>
              <button class="categoryBtn" id="api_ect">축제</button>
           </div>
            <ul class="droptrue  list-group" id="contact-list"
               style="overflow-y: scroll; height:100%; width:100%;display:inline-block;">
            </ul>
      <input type="hidden" id="hiddenCity"/>
   </div><!-- 여행지정보 끝 -->
   <!--  일정추가 -->
    <div style="height:700px; display:inline-block; width:18%; padding:0px;">
         <div class="select_panel-heading c-list">
                  <!-- 셀렉트박스@@ -->
                <select id="DaySelectBox" style="width:50%">
               <option value="2017.05.02">DAY1</option>
               <option value="2017.05.03">DAY2</option>
               <option value="2017.05.04">DAY3</option>
              </select>
            <img src="/resource/step3/step3_image/plus.png" style="float: right;"id="chuga"/>
             <br/>
         </div>
         <ul class="list-group droptrue" id="myList" style="color:#fff; height:100%; width:100%; padding:0px; overflow-y:scroll;display:inline-block;">hi
         </ul>
      </div>
   &nbsp;

   <!-- 지도 구성 부분-->
   <div id="map" style="width: 40%; height: 750px;display:inline-block;"></div>
</div><!--  지도/리스트들 끝끝 -->

<input type="button" value="경로 최적화" id="distanceCal" />

<!-- 채팅 슬라이드 내비 부분@@@@ -->
<div id="mySidenav" class="sidenav">
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
  
  
 <div class="panel panel-default" style="width: 280px; margin-top: 150px">
          <div class="panel-heading">Panel heading without title</div>
          <div class="panel-body" align="left">
            <div class="chat_container"  id="chat_body" style="height:350px;overflow-y: scroll;" >
                <div class="row message-bubble">
                <p class="text-muted">Matt Townsen</p>
                    <span>Why is yo shit so broke?</span>
                </div>
                <div class="row message-bubble">
                    <p class="text-muted">Matt Townsen</p>
                    <p>It Isn't'</p>
                </div>
                <div class="row message-bubble">
                <p class="text-muted" >Matt Townsen</p>
                    <p>Umm yes it is</p>
                </div>
                <div class="row message-bubble">
                <p class="text-muted">Matt Townsen</p>
                    <p>Test message</p>
                </div>
                <div class="row message-bubble">
                <p class="text-muted">Matt Townsen</p>
                    <p>Test message</p>
                </div>
                <div class="row message-bubble">
                <p class="text-muted">Matt Townsen</p>
                    <p>Test message</p>
                </div>
                <div class="row message-bubble">
                <p class="text-muted">Matt Townsen</p>
                    <p>Test message</p>
                </div>
	        </div>
            <div class="panel-footer">
                 <div class="input-group">
                  <input type="text" id="chat_text" class="form-control">
                  <span class="input-group-btn">
                    <button class="btn btn-default" id="send" type="button">Send</button>
                  </span>
                </div>
            </div>
          </div>
        </div>    
</div>
<!--  채팅용 js -->
<script type="text/javascript" src="/resource/step3/ws.js">
<script type="text/javascript">

//DAY change

$("#DaySelectBox").change(function(){
   $("#myList").empty(); 
});
</script>
</body>
</html>