<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="">
	<meta name="author" content="">
	<title>TravelMaker</title>
	<!-- Bootstrap Core CSS -->
    <link href="/resource/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="/resource/bootstrap/css/modern-business.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="/resource/bootstrap/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	
	<!--  slider -->
	<link href="/resource/tour/css/flexslider.css" rel="stylesheet" />
 
 	<!-- Modernizr -->
  	<script src="/resource/tour/js/modernizr.js"></script>
  	
  	<!-- 지정 CSS -->
  	<style type="text/css">
  	.flexslider{
  	width: 100%;
  	max-height: 450px;
  	}
  	img{
  	max-height: 450px;
  	}
  	</style>
    
<!--     Header CSS -->
<!--     <link href="/resource/bootstrap/css/header.css" rel="stylesheet" type="text/css"> -->
    
</head>
<body>
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
	<div class="container">

        <!-- Page Heading/Breadcrumbs -->
        <!-- submenu start -->
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">여행자 리뷰
                    <small>Tour Review</small>
                </h1>
                <ol class="breadcrumb">
                    <li><a href="/tmmain/main.tm">Home</a></li>
                    <li class="active">Full Width Page</li>
                </ol>
            </div>
        </div>
         <!-- submenu end -->        
		<div class="row">
      		<section class="slider">
        		<!-- Place somewhere in the <body> of your page -->
				<div class="flexslider">
  					<ul class="slides">
    					<li>
      						<img class="image1 i-slider" src="/resource/tour/images/noimage.jpg" />
    					</li>
    					<li>
      						<img class="image2 i-slider" src="/resource/tour/images/noimage.jpg" />
    					</li>
    					<li>
      						<img class="image3 i-slider" src="/resource/tour/images/noimage.jpg" />
    					</li>
    					<li>
      						<img class="image4 i-slider" src="/resource/tour/images/noimage.jpg" />
    					</li>
  					</ul>
				</div>
      		</section>			
			<div class="review">
				<div>
				리뷰 불러오기
				</div>
			</div>
		</div>
    </div>
    <!-- /.container -->
    
    <!-- jQuery -->
    <script src="/resource/bootstrap/js/jquery.js"></script>
    
    <!-- slider -->
	<script src="/resource/tour/js/jquery.flexslider-min.js"></script>
	
	<!-- function -->
	<script src="/resource/tour/js/function.js"></script>
    

    <!-- Bootstrap Core JavaScript -->
    <script src="/resource/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>