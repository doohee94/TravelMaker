<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Modern Business - Start Bootstrap Template</title>

   <!-- Bootstrap Core CSS -->
    <link href="/resource/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="/resource/bootstrap/css/modern-business.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="/resource/bootstrap/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    
    <!-- 내가 준 css -->
        <link href="/resource/searchpage/css/search.css" rel="stylesheet" type="text/css">
<!--  헤더 css -->
<link href="/resource/header/css/header.css" rel="stylesheet" />
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

 <!-- Navigation -->
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
    <!-- Page Content -->
    <div class="container">

        <!-- Page Heading/Breadcrumbs -->
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header" id="cityName"><strong id="cityName">${cityName}</strong>
<!--                     <small>Subheading</small> -->
                </h1>
                <ol class="breadcrumb">
                    <li><a href="index.html">Home</a>
                    </li>
                    <li class="active">Portfolio Item</li>
                </ol>
            </div>
        </div>
        <!-- /.row -->

        <!-- Portfolio Item Row -->
        <div class="row" style="height: 400px; width:155%;">
			
            <div class="col-md-8" style="height:100%">
                <div id="carousel-example-generic" class="carousel slide" data-ride="carousel" style="height:100%">
                    <!-- Indicators -->
                    <ol class="carousel-indicators">
                        <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                        <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                        <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                    </ol>

                    <!-- Wrapper for slides 슬라이더 -->
                    <div class="carousel-inner" style="height:100%">

                    </div>

                    <!-- Controls  슬라이더 컨트롤 -->
                    <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
                        <span class="glyphicon glyphicon-chevron-left"></span>
                    </a>
                    <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
                        <span class="glyphicon glyphicon-chevron-right"></span>
                    </a>
                </div>
            </div>
        </div>
        <!-- /.row -->
		<br/>
		<hr/>
		
		<!-- 날씨정보 가져오기 -->
		 <!-- Related Projects Row -->
        <div class="row">

            <div class="col-lg-12">
                <h3 class="page-header">Related Projects</h3>
            </div>
			<!--  현재날씨 -->
            <div class="col-sm-3 col-xs-6" id="now" align="center">
               
            </div>
			<!--  내일날씨 -->
            <div class="col-sm-3 col-xs-6" id="tomorrow" align="center">
               
            </div>
			<!--  5일후 날씨 -->
            <div class="col-sm-3 col-xs-6" id="5day" align="center">
                
            </div>
			<!--  10일후 날씨 -->
            <div class="col-sm-3 col-xs-6" id="10day" align="center">
                
            </div>

        </div>
        <!-- /.row -->
		<br/>
		<hr/>
		<!--  버튼부분 -->
		<div class= "row" align="center">
			<button class="category"><span class="glyphicon glyphicon-th-large"></span>전체</button>
			<button class="category"><span class="glyphicon glyphicon-th-large"></span>축제</button>
			<button class="category"><span class="glyphicon glyphicon-camera"></span>관광지</button>
			<button class="category"><span class="glyphicon glyphicon-cutlery"></span>맛집</button>
</div>
		<!-- /.row -->
		<br/>
        <!-- Related Projects Row  리스트 띄우는 부분-->
        <div class="row List">
<!-- 			 <div class="col-md-4 img-portfolio"> -->
<!--                 <a href="portfolio-item.html"> -->
<!--                     <img class="img-responsive img-hover" src="http://placehold.it/700x400" alt=""> -->
<!--                 </a> -->
<!--                 <h3> -->
<!--                     <a href="portfolio-item.html">Project Name</a> -->
<!--                 </h3> -->
<!--                 <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra euismod odio, gravida pellentesque urna varius vitae.</p> -->
<!--             </div> -->
            
            
            <!--  관광지 리스트 뜨는 곳 -->
            
            
            
        </div>
        <!-- /.row -->

        <hr>
	 <!-- Pagination 리스트 -->
        <div class="row text-center">
            <div class="col-lg-12">
                <ul class="pagination">
                    
                    
                    
                    
                    
                </ul>
            </div>
        </div>
        <!-- /.row -->
	
    

    </div>
    <!-- /.container -->
	
	
   <!-- jQuery -->
    <script src="/resource/bootstrap/js/jquery.js"></script>
	<!--  search js -->
	<script src="/resource/searchpage/js/search.js"></script>
    <!-- Bootstrap Core JavaScript -->
    <script src="/resource/bootstrap/js/bootstrap.min.js"></script>

</body>

</html>