<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
 <% 
 String userId = (String)session.getAttribute("userId");
 String userNick = (String)session.getAttribute("userNick");
 System.out.println("세션의 아이디"+userId);
 System.out.println("세션의 닉네임"+userNick); 
 %>   
<!DOCTYPE html>
<html lang="UFT-8">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>TravelMaker</title>

    <!-- Bootstrap Core CSS -->
    <link href="/resource/main/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="/resource/main/css/modern-business.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="/resource/main/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
 
 	<!-- Modernizr -->
  	<script src="/resource/tour/js/modernizr.js"></script>
  	
    <!-- 지정 css -->
    
    <link href="/resource/main/css/main.css" rel="stylesheet" type="text/css">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>
<body>
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
                    <%if(userNick!=null){ %>
                    <li>
                        <a href="/travelReview/reviewlist.tm">여행리뷰</a>
                    </li>
                    <%} //end of if %>
<!--                     <li> -->
<!--                         <a href="/challengeschedule/challengeSchedule.tm">도전일정</a> -->
<!--                     </li> -->
                    <li style="padding:10px" id="mobile_search">
                       <input type="text"/><button id="#searchBtn" style="background-color: #fafafa; border:0px; border-style: none; height: 25px;"><span class="glyphicon glyphicon-search"></span> search</button> 
                    </li>
                    <!-- 로그인 할때 생기는 버튼 -->
                    <%if(userNick!=null){ %>
                    <li>
                    	<a href="/mylist/inglist.tm"><%=userNick%>&nbsp;&nbsp;님</a>
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
            </div>
            <!-- /.navbar-collapse -->
        </div>
    </nav>
    <!-- 중앙 이미지 및 검색창 -->
    <!-- Header Carousel -->
    <header id="myCarousel" class="carousel slide">
    <div class="main_search">
    	<div class="imageBox">
	   		<img class="img-responsive" src="/resource/main/images/main1.png">
    	</div>
    	<div class="m_imageBox">
    		<img class="img-responsive" src="/resource/main/images/main2.png">
    	</div>
    	<div class="searchBox">
    		<div class="headlogo">
    			<img class="img-responsive" src="/resource/main/images/logo.png">
    		</div>
<!--     		<label id="simble" style="font-family: nanum gothic  ">여행일정을 공유하고 리뷰를 나눕니다.</label> -->
    		<form class="form-inline search_menu">
    			<input class="form-control input-lg" id="search_bar" type="text" placeholder="검색어를 입력하세요">
    			<a href="#" class="btn btn-lg btn-danger btn-search">Search</a>
    		</form>
    	</div>
    </div>
    </header>
    

    <!-- Page Content -->
    <div class="container">
	 <hr>
	 <!-- Features Section 광고부분-->
        <div class="row"> 
            <div class="" align="left">
            	<c:choose>
					<c:when test="${!empty adImgPath}">
		                <img class="img-responsive" style="width: 100%; height: 10%;" src="/upload/admin/${adImgPath}" alt="">
					</c:when>
					<c:otherwise>
		                <img class="img-responsive" style="width: 100%; height: 175px;" src="http://placehold.it/700x450" alt="">
					</c:otherwise>
            	</c:choose>
            </div>
        </div>
        <!-- /.row -->
		<hr>

     <!-- Portfolio Section  일정 best 3-->
        <div class="row">
            <div class="col-lg-12"><!--  제목 -->
                <h2 class="page-header" style="display: inline-block;">리뷰 TOP3</h2>
                <a href="#" class="btn btn-default more" id="reviewMore">더보기</a>
            </div>
            <div class="col-md-4 col-sm-6" align="center">
                <a href="#" class="review">
                    <img class="img-responsive img-portfolio img-hover" src="/upload/review/${reviewimg0}" alt="review top 1">
                	<span  class="challengeTitle">${reviewtitle0}</span>                	
                </a>
                	<input type="hidden" class="reuserId" value="${reuserId0}">
                	<input type="hidden" class="rescNum" value="${rescNum0}">
                	<input type="hidden" class="retotalNum" value="${retotalNum0}">
                	<br/><small>${reviewlike0}명이 좋아합니다</small>
            </div>
            <div class="col-md-4 col-sm-6" align="center">
                <a href="#" class="review">
                    <img class="img-responsive img-portfolio img-hover" src="/upload/review/${reviewimg1}" alt="review top 1">
                	<span class="challengeTitle">${reviewtitle1}</span>
                </a>
                	<input type="hidden" class="reuserId" value="${reuserId1}">
                	<input type="hidden" class="rescNum" value="${rescNum1}">
                	<input type="hidden" class="retotalNum" value="${retotalNum1}">
                	<br/><small>${reviewlike1}명이 좋아합니다</small>
            </div>
            <div class="col-md-4 col-sm-6" align="center">
                <a href="#" class="review">
                    <img class="img-responsive img-portfolio img-hover" src="/upload/review/${reviewimg2}" alt="review top 1">
                	<span class="challengeTitle">${reviewtitle2}</span>
                </a>
                	<input type="hidden" class="reuserId" value="${reuserId2}">
                	<input type="hidden" class="rescNum" value="${rescNum2}">
                	<input type="hidden" class="retotalNum" value="${retotalNum2}">
                	<br/><small>${reviewlike2}명이 좋아합니다</small>
            </div>
        </div>
        <!-- /.row -->

        <hr>
        <!-- Portfolio Section  여행지 top3-->
        <div class="row">
            <div class="col-lg-12"><!--  제목 -->
                <h2 class="page-header" style="display: inline-block;">여행지 TOP3</h2>
                <a href="#" class="btn btn-default more" id="spotMore">더보기</a>
            </div>
            <div class="col-md-4 col-sm-6" align="center">
                <a href="#">
                    <img class="img-responsive img-portfolio img-hover" src="http://placehold.it/700x450" alt="">
                	<span  class="tourTop3">여행지 1순위~~</span>
                	
                </a>
            </div>
            <div class="col-md-4 col-sm-6" align="center">
                <a href="#">
                    <img class="img-responsive img-portfolio img-hover" src="http://placehold.it/700x450" alt="">
                	<span class="tourTop3">2순위~~~</span>
                </a>
            </div>
            <div class="col-md-4 col-sm-6" align="center">
                <a href="#">
                    <img class="img-responsive img-portfolio img-hover" src="http://placehold.it/700x450" alt="">
                	<span class="tourTop3">3순위~~~</span>
                </a>
            </div>
        </div>
        <!-- /.row -->
        <hr/>
    </div>
    <!-- /.container -->
	
	<!-- Footer -->
	<footer>
		<div class="footer" align="center">
			<br/>
			<div class="foot_content" align="center">
			<span class="footer_content_span">고객센터</span><br/>
			<a class="footer_content_a" href="/alliance/allianceMain.tm">제휴문의</a><br/>
			<a class="footer_content_a" href="#">회사소개</a><br/>
			</div>
			
			<div class="foot_logo">
				<img class="logo" src="/resource/main/images/logo.png">
			</div>
		</div>
	</footer>
	
	
	
	<!-- jQuery -->
    <script src="/resource/bootstrap/js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="/resource/bootstrap/js/bootstrap.min.js"></script>
    
    <!-- 지정 js -->
    <script src="/resource/main/js/main.js"></script>
           

</body>

</html>
