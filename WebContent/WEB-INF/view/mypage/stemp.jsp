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
            			<button class="btn btn-default filter-button" data-filter="all">모두 보기</button>
            			<button class="btn btn-default filter-button" data-filter="done">달성한 스탬프</button>
            			<button class="btn btn-default filter-button" data-filter="missing">달성하지 못한 스탬프</button>
       				</div>
        			<br/> 
        			<c:if test="${!empty doneList}">
        				<c:forEach var="done" items="${doneList}">
        	    			<div class="gallery_product col-lg-3 col-md-3 col-sm-3 col-xs-5 filter done" >
                				<img src="/resource/mypage/stemp/images/stamp.png" class="img-responsive">
                				<div class="text-center">
                					<br/>
                					<a href="#" class="place">${done.partnerName}</a>
                					<input type="hidden" value="${done.partnerAddr}">
                					<input type="hidden" value="${done.partnerName}">
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
                					<input type="hidden" value="${ndone.partnerAddr}">
                					<input type="hidden" value="${ndone.partnerName}">
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
	<script src="/resource/mypage/stemp/js/map.js"></script>
    <!-- 마이페이지 공통 js -->
    <script src="/resource/mypage/base/js/base.js"></script>

    <!-- 지정 js -->
    <script type="text/javascript">
			$(function(){
				var nonName = $('#nonName').val();
				var nonAddr = $('#nonAddr').val();
				var doneName = $('#doneName').val();
				var doneAddr = $('#doneAddr').val();
				$(".mapPanel").hide();
				$(".place").click(function(){
					$(".mapPanel").show();
					var addr = $(this).next().val();
					var partName = $(this).next().next().val();
					
					var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
				    mapOption = {
				        center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
				        level: 3 // 지도의 확대 레벨
				    };  

					// 지도를 생성합니다    
					var map = new daum.maps.Map(mapContainer, mapOption); 

					// 주소-좌표 변환 객체를 생성합니다
					var geocoder = new daum.maps.services.Geocoder();

					// 주소로 좌표를 검색합니다
					geocoder.addr2coord( "\'"+addr+"\'" , function(status, result) {

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
				            content: '<div style="width:150px;text-align:center;padding:6px 0;">'+partName+'<br/>'+addr+'</div>'
				        });
				        infowindow.open(map, marker);

				        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
				        map.setCenter(coords);
				    } 
				});    
				});
			});
		</script>

</body>

</html>
