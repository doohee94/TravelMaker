<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>   
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
    
  
    <!-- MetisMenu CSS -->
    <link href="/resource/bootstrap/css/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="/resource/bootstrap/css/sb-admin-2.css" rel="stylesheet">

    <!-- Morris Charts CSS -->
    <link href="/resource/bootstrap/css/morris.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="/resource/bootstrap/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

	<!-- list CSS -->
	<link rel="stylesheet" type="text/css" href="/resource/mypage/likespot/css/component.css" />
	
	<!-- list Plug-In -->
	<script src="/resource/mypage/likespot/js/modernizr.custom.js"></script>

	<!--  메뉴바 -->
	<link rel="stylesheet" type="text/css" href="/resource/mypage/likespot/css/base.css" />
	
	<link rel="stylesheet" type="text/css" href="/resource/mypage/likespot/css/style.css" />
	    
    <!-- 지정 css -->
    <link href="/resource/mypage/schedule/css/schedule.css" rel="stylesheet" type="text/css">
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
            <!-- /모바일 버전때 생성되는 버튼 -->   
            <!-- 로고 --> 
                <a class="navbar-brand" href="/tmmain/main.tm" style="padding-left: 381px; font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif;">Travel Maker</a>
            <!-- /로고 -->
            </div>
            <!-- 네비 헤더  메뉴 부분 -->
         <ul class="nav navbar-nav navbar-right">
                    <li>
                        <a href="/step1/step1.tm" style="font-size: 14px; font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif;">일정만들기</a>
                    </li>
                    <li>
                        <a href="/recommandtravelregion/recommandTravelRegion.tm" style="font-size: 14px; font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif;">여행지추천</a>
                    </li>
                    <li>
                        <a href="/recommandtravelregion/recommandTravelRegion.tm" style="font-size: 14px; font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif;">여행리뷰</a>
                    </li>
                    <li>
                        <a href="/challengeschedule/challengeSchedule.tm" style="font-size: 14px; font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif;">도전일정</a>
                    </li>
                     <li style="padding:10px;">
                       <input type="text" style="width: 170px; height: 26px"/><button id="#searchBtn" style="background-color: #fafafa; border:0px; border-style: none; height: 25px; width: 77px; font-size: 15px; font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif; color:#2e2e2e"><span class="glyphicon glyphicon-search"></span> search</button>
                    </li>                      
                     <li>
                        <a href="member/loginForm.tm" style="padding-right: 398px; font-size: 14px; font-family: 'Helvetica Neue',Helvetica,Arial,sans-serif;">로그인　</a>
                    </li>
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
                            <a href="/mylist/menubar.tm" style="background-color: #212121;"><i class="fa fa-list-alt fa-list-alt"></i>  내 일정</a>
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
				<div class="container">
					<!-- 바디 타이틀  -->
					<div class="row">
            			<div class="col-lg-12">
                			<h1 class="page-header">관심 일정
                    			<small>Like Travel Plan</small>
                			</h1>
            			</div>
            		<!-- /바디 타이틀 -->	
        			</div>
					<c:choose>
						<c:when test="${!empty sclist}">
							<section class="grid-wrap">
								<ul class="grid swipe-right" id="grid">
									<c:forEach var="i" items="${sclist}">
										<c:choose>
											<c:when test="${!empty i.totalrePhoto1fake}">
												<li><a href="#"><img class ="imagelist" src="${i.totalrePhoto1fake}" /></a>
											</c:when>
											<c:otherwise>
												<li><a href="#"><img class ="imagelist" src="/resource/mypage/likespot/images/noimage.jpg"/></a>							
											</c:otherwise>
										</c:choose>
													<h3>
														<p>${i.totalreTitle}</p>
														<p>${i.totalreLikecount} 명이 좋아합니다.</p>
														<br/>
														<a href="#" class="btn btn-s btn-danger">삭제</a>
														<input type="hidden" class="likeNum" value="${i.likescNum}"/>
													</h3> 
												</li>
									</c:forEach>
								</ul>
							</section>
						</c:when>
						<c:otherwise>
							<H1>저장하신 관심 일정이 없습니다.</H1>
							<div class='nonlist'>
								<section class="grid-wrap">
								</section>
							</div>
						</c:otherwise>
					</c:choose>
				</div>
				<!-- /container -->
			</article> 
        </div>
        <!-- 바디 부분 -->
    </div>
    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="/resource/bootstrap/js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="/resource/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="/resource/bootstrap/js/metisMenu.min.js"></script>
    <!-- Custom Theme JavaScript -->
    <script src="/resource/bootstrap/js/sb-admin-2.js"></script>
    <!--  list plug-In -->
    <script src="/resource/mypage/likespot/js/masonry.pkgd.min.js"></script>
	<script src="/resource/mypage/likespot/js/imagesloaded.pkgd.min.js"></script>
	<script src="/resource/mypage/likespot/js/classie.js"></script>
	<script src="/resource/mypage/likespot/js/colorfinder-1.1.js"></script>
	<script src="/resource/mypage/likespot/js/gridScrollFx.js"></script>
	<!-- 지정 js -->
	<script src="/resource/mypage/schedule/js/schedule.js"></script>
	
	<script>
	new GridScrollFx( document.getElementById( 'grid' ), {
	viewportFactor : 0.4
	} );
	</script>

</body>

</html>
