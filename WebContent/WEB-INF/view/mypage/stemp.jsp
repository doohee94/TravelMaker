<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>   
 <% 
 String userId = (String)session.getAttribute("userId");
 String userNick = (String)session.getAttribute("userNick");
 %>
<!DOCTYPE html>
<html lang="UTF-8">
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Travel Maker 마이페이지</title>
    <!-- Bootstrap Core CSS -->
    <link href="/resource/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="/resource/bootstrap/css/modern-business.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="/resource/bootstrap/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    
    <!-- list CSS -->
     <link rel="stylesheet" href="/resource/mypage/stemp/css/list.css">
    
    <!-- MetisMenu CSS -->
    <link href="/resource/bootstrap/css/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="/resource/bootstrap/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="/resource/bootstrap/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

   <!-- list CSS -->
   <link rel="stylesheet" type="text/css" href="/resource/mypage/likespot/css/component.css" />
   
    <!-- 지정 css -->
    <link href="/resource/mypage/stemp/css/stemp.css" rel="stylesheet" type="text/css">

    <!--  메뉴바 -->
   <link rel="stylesheet" type="text/css" href="/resource/mypage/likespot/css/base.css" />
   
   <link rel="stylesheet" type="text/css" href="/resource/mypage/likespot/css/style.css" />   
             
    <!-- 마이페이지 공통 css -->
    <link href="/resource/mypage/base/css/mypage.css" rel="stylesheet" type="text/css">
    
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    

</head>

<body>
    <div id="wrapper">
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
                <a class="navbar-brand" href="/tmmain/main.tm">Travel Maker</a>
            </div>
            <!-- /로고 -->
            <!-- 네비 헤더  메뉴 부분 -->
            <ul class="nav navbar-nav navbar-right">
                    <li>
                        <a href="/step1/step1.tm" >일정만들기</a>
                    </li>
                    <li>
                        <a href="/recommandtravelregion/recommandTravelRegion.tm" >여행지추천</a>
                    </li>
                    <!-- 로그인 할때 생기는 버튼 -->
                    <%if(userNick!=null){ %>
                    <li>
                        <a href="/recommandtravelregion/recommandTravelRegion.tm">여행리뷰</a>
                    </li>
                    <%} //end of if %>
                     <li style="padding:10px;">
                       <input type="text" id="tf_search" style="width: 170px; height: 26px"/><button id="searchBtn"><span class="glyphicon glyphicon-search"></span> search</button>
                    </li>                                         
                                      <!-- 로그인 할때 생기는 버튼 -->
                    <%if(userNick!=null){ %>
                    <li>
                       <a href="/mylist/menubar.tm"><%=userNick%>&nbsp;&nbsp;님</a>
                    </li>                      
                    <li>
                        <a href="/tmmain/logout.tm">로그아웃</a>
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
                            <a href="#"><i class="fa fa-user fa-user"></i>  내 정보<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="/member/memberUpdate.tm">  정보수정</a>
                                </li>
                                <li>
                                    <a href="/member/memberDelete.tm">  회원탈퇴</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        <li>
                            <a href="/mylist/menubar.tm"><i class="fa fa-list-alt fa-list-alt"></i>  내 일정<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="/mylist/inglist.tm">  계획중인일정</a>
                                </li>
                                <li>
                                    <a href="/mylist/donelist.tm">  완성된일정</a>
                                </li>
                                <li>
                                    <a href="/mylist/startlist.tm">  시작된일정</a>
                                </li>
                                <li>
                                    <a href="/mylist/endlist.tm">  여행한일정</a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a href="/tmmypage/likespot.tm"><i class="fa fa-heart fa-heart"></i>  관심 여행지</a>
                        </li>
                        <li>
                            <a href="/tmmypage/schedule.tm"><i class="fa fa-calendar fa-calendar"></i>  관심 일정</a>
                        </li>
                        <li>
                            <a href="/tmmypage/qna.tm"><i class="fa fa-omments fa-comments"></i>  QnA</a>
                        </li>
                        <li>
                            <a href="/tmmypage/stemp.tm"><i class="fa fa-flag fa-flag"></i>  스템프</a>
                        </li>                        
                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        </nav>
      <!-- 바디 부분 -->
        <div id="page-wrapper">
           <article>
            <!-- 바디 타이틀  -->
                <div class="row" id="body-title">
                  <div class="col-lg-12" >
                      <h1 class="page-header">스템프
                          <small align="center">My Stemp List</small>
                      </h1>
                  </div>
               <!-- /바디 타이틀 -->
              </div>   
            <br/>
            <!-- 지도 부분 -->
            <div class='mapPanel' align="center">
               <div id="map" style="width:70%;height:450px;"></div><br/>
            </div>
            <!-- 스탬프 리스트 부분 -->
             <div class="container">
                 <div class="row">
                    <div class="gallery col-lg-12 col-md-12 col-sm-12 col-xs-12">
                 </div>
               <div align="center">
                     <button id="all" class="btn btn-default filter-button" data-filter="all">모두 보기</button>
                     <button id="done" class="btn btn-default filter-button" data-filter="done">달성한 스탬프</button>
                     <button id="missing" class="btn btn-default filter-button" data-filter="missing">달성하지 못한 스탬프</button>
                   </div>
                 <br/> 
                 <c:if test="${!empty doneList}">
                    <c:forEach var="done" items="${doneList}">
                        <div class="gallery_product col-lg-3 col-md-3 col-sm-3 col-xs-5 filter done" >
                            <img src="/resource/mypage/stemp/images/stamp.png" class="img-responsive">
                            <div class="text-center">
                               <br/>
                               <a href="#" class="place">${done.partnerName}</a>
                               <input class="spotAddr" type="hidden" value="${done.partnerAddr}">
                               <input class="spotName" type="hidden" value="${done.partnerName}">
                               <p>${done.partnerAddr}</p>
                            </div>
                          </div>
                       </c:forEach>
                 </c:if>
                 <c:if test="${!empty temp}">
                     <c:forEach var="ndone" items="${temp}">
                        <div class="gallery_product col-lg-3 col-md-3 col-sm-3 col-xs-5 filter missing">
                            <img src="/resource/mypage/stemp/images/d-stamp.png" class="img-responsive">
                            <div class="text-center">
                               <br/>
                               <a href="#" class="place">${ndone.partnerName}</a>
                               <input class="spotAddr" type="hidden" value="${ndone.partnerAddr}">
                               <input class="spotName" type="hidden" value="${ndone.partnerName}">
                               <p>${ndone.partnerAddr}</p>
                            </div>
                          </div>
                       </c:forEach>
                 </c:if>                       
                 </div>
             </div>
            <div class="hidden">
               <input type="hidden" id="doneAddr" value="${doneAddr}">
               <input type="hidden" id="doneName" value="${doneName}">
               <input type="hidden" id="nonAddr" value="${nonAddr}">
               <input type="hidden" id="nonName" value="${nonName}">
            </div>   
         </article>                
       </div>
       <!-- /#wrapper -->
    </div>   
    <!-- jQuery -->
    <script src="/resource/bootstrap/js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="/resource/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="/resource/bootstrap/js/metisMenu.min.js"></script>
    <!-- Custom Theme JavaScript -->
    <script src="/resource/bootstrap/js/sb-admin-2.js"></script>
    <!-- list js -->
   <script src="/resource/mypage/stemp/js/list.js"></script>
   <!-- daum map api -->   
   <script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=141438a76ce74e385ae8e735b840f26c&libraries=services"></script>
   <!-- map js -->

    <!-- 마이페이지 공통 js -->
    <script src="/resource/mypage/base/js/base.js"></script>
    
    <script type="text/javascript">
       $(function(){
          
          //done, missing리스트의 이름과 주소를 각각 배열에 저장 
          var doneAddrList = [];
          var doneNameList = [];
          
          var missingAddrList = [];
          var missingNameList = [];
          
          var index1=0, index2=0, index3=0, index4=0;
          $(".done").find(".spotAddr").each(function(item){
             doneAddrList[index1] = $(this).val();
             index1++;
          });
          $(".done").find(".spotName").each(function(item){
             doneNameList[index2] = $(this).val();
             //alert(doneNameList[index2]);
             index2++;
          });
          
          $(".missing").find(".spotAddr").each(function(item){
             missingAddrList[index3] = $(this).val();
             //alert(missingAddrList[index3]);
             index3++;
          });
          $(".missing").find(".spotName").each(function(item){
             missingNameList[index4] = $(this).val();
             index4++;
          });
       
          
          var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
           mapOption = {
               center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
               level: 8 // 지도의 확대 레벨
           };  

          // 지도를 생성합니다    
          var map = new daum.maps.Map(mapContainer, mapOption);
          
          // 주소-좌표 변환 객체를 생성합니다
          var geocoder1 = new daum.maps.services.Geocoder();
          var geocoder2 = new daum.maps.services.Geocoder();
          
          done();
          missing();
          
          
          
          //스탬프 찍은 것들 보여주기
          function done(){
          for(var i=0; i<doneAddrList.length;i++){
             var temp=doneNameList[i];
             
             // 주소로 좌표를 검색합니다
             geocoder1.addr2coord(doneAddrList[i], function(status, result) {
                
                 // 정상적으로 검색이 완료됐으면 
                  if (status === daum.maps.services.Status.OK) {

                     var coords = new daum.maps.LatLng(result.addr[0].lat, result.addr[0].lng);

                     var imageSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_red.png';// 마커이미지의 주소입니다 
                  // 마커 이미지의 이미지 크기 입니다
                     var imageSize = new daum.maps.Size(24, 35); 
                     
                     // 마커 이미지를 생성합니다    
                     var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize); 
                     
                     // 결과값으로 받은 위치를 마커로 표시합니다
                     var marker = new daum.maps.Marker({
                         map: map,
                         position: coords,
                         image : markerImage
                     });

                     // 인포윈도우로 장소에 대한 설명을 표시합니다
                     var infowindow = new daum.maps.InfoWindow({
                         content: '<div style="width:150px;text-align:center;padding:6px 0;">'+temp+'</div>'
                     });
                     infowindow.open(map, marker);

                     // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
                     map.setCenter(coords);
                 } 
             });
          }
          }
          
          //아직 스탬프 안찍은 것들 보여주기
          function missing(){
          
          for(var i=0; i<missingAddrList.length;i++){
             var temp = missingNameList[i];
             // 주소로 좌표를 검색합니다
             geocoder2.addr2coord(missingAddrList[i], function(status, result) {
                 // 정상적으로 검색이 완료됐으면 
                  if (status === daum.maps.services.Status.OK) {

                     var coords = new daum.maps.LatLng(result.addr[0].lat, result.addr[0].lng);

                     // 결과값으로 받은 위치를 마커로 표시합니다
                     var marker = new daum.maps.Marker({
                         map: map,
                         position: coords
                     });
                     

                     // 인포윈도우로 장소에 대한 설명을 표시합니다
                     var infowindow = new daum.maps.InfoWindow({
                         content: '<div style="width:150px;text-align:center;padding:6px 0;">'+temp+'</div>'
                     });
                     infowindow.open(map, marker);

                     // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
                     map.setCenter(coords);
                 } 
             });
          }
          }
          
          //전체보기 버튼 눌렀을 경우
          $("#all").click(function(){
             done();
             missing();
          });
          //스탬프 찍은거 버튼 눌렀을 경우
          $("#done").click(function(){
             done();
          });
          
          //아직 안찍은거 버튼 눌렀을 경우
          $("#missing").click(function(){
             missing();
          });
       });
    </script>

</body>

</html>