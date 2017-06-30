<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
 <% 
 System.out.println("세션의 아이디"+session.getAttribute("userId"));
 System.out.println("세션의 닉네임"+session.getAttribute("userNick")); 
 %>   
<!DOCTYPE html>
<html lang="en">

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
                       <input type="text"/><button id="#searchBtn" style="background-color: #fafafa; border:0px; border-style: none; height: 25px;"><span class="glyphicon glyphicon-search"></span> search</button>
                    </li>                      
                     <li>
                        <a href="member/loginForm.tm">로그인</a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        
    </nav>

    <!-- Header Carousel -->
    <header id="myCarousel" class="carousel slide">
        <!-- Indicators -->
        <ol class="carousel-indicators">
            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
            <li data-target="#myCarousel" data-slide-to="1"></li>
            <li data-target="#myCarousel" data-slide-to="2"></li>
        </ol>

        <!-- Wrapper for slides -->
        <div class="carousel-inner">
            <div class="item active">
                <div class="fill" style="background-image:url('http://placehold.it/1900x1080&text=Slide One');"></div>
                <div class="carousel-caption">
                    <h2>Caption 1</h2>
                </div>
            </div>
            <div class="item">
                <div class="fill" style="background-image:url('http://placehold.it/1900x1080&text=Slide Two');"></div>
                <div class="carousel-caption">
                    <h2>Caption 2</h2>
                </div>
            </div>
            <div class="item">
                <div class="fill" style="background-image:url('http://placehold.it/1900x1080&text=Slide Three');"></div>
                <div class="carousel-caption">
                    <h2>Caption 3</h2>
                </div>
            </div>
        </div>

        <!-- Controls -->
        <a class="left carousel-control" href="#myCarousel" data-slide="prev">
            <span class="icon-prev"></span>
        </a>
        <a class="right carousel-control" href="#myCarousel" data-slide="next">
            <span class="icon-next"></span>
        </a>
    </header>

    <!-- Page Content -->
    <div class="container">
	 <hr>
	 <!-- Features Section 광고부분-->
        <div class="row"> 
            <div class="" align="left">
                <img class="img-responsive" style="width: 100%; height: 175px;" src="http://placehold.it/700x450" alt="">
            </div>
        </div>
        <!-- /.row -->
		<hr>

     <!-- Portfolio Section  도전일정-->
        <div class="row">
            <div class="col-lg-12"><!--  제목 -->
                <h2 class="page-header" style="display: inline-block;">도전일정 TOP3</h2>
                <a href="#" class="btn btn-default more">더보기</a>
            </div>
            <div class="col-md-4 col-sm-6" align="center">
                <a href="#">
                    <img class="img-responsive img-portfolio img-hover" src="http://placehold.it/700x450" alt="">
                	<span  class="challengeTitle">덤벼봐라 너의 도전일정</span>
                	
                </a>
            </div>
            <div class="col-md-4 col-sm-6" align="center">
                <a href="#">
                    <img class="img-responsive img-portfolio img-hover" src="http://placehold.it/700x450" alt="">
                	<span class="challengeTitle">덤벼봐라 너의 도전일정</span>
                </a>
            </div>
            <div class="col-md-4 col-sm-6" align="center">
                <a href="#">
                    <img class="img-responsive img-portfolio img-hover" src="http://placehold.it/700x450" alt="">
                	<span class="challengeTitle">덤벼봐라 너의 도전일정</span>
                </a>
            </div>
        </div>
        <!-- /.row -->

        <hr>
        <!-- Portfolio Section  여행지 top3-->
        <div class="row">
            <div class="col-lg-12"><!--  제목 -->
                <h2 class="page-header" style="display: inline-block;">여행지 TOP3</h2>
                <a href="#" class="btn btn-default more">더보기</a>
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
	<hr>
	  <!-- Footer -->
	<footer >
	
		<div class="footer" align="center">
			<br/>
			<div class="foot_content" align="center">
			<span class="footer_content_span">고객센터</span><br/>
			<a class="footer_content_a">QnA</a><br/>
			<a class="footer_content_a">제휴문의</a><br/>
			<a class="footer_content_a">회사소개</a><br/>
			</div>
			
			<div class="foot_logo">
				<img class="logo" src="/resource/main/header/images/samplelogo.png">
			</div>
		</div>
	</footer>
	
	
	
	<!-- jQuery -->
    <script src="/resource/bootstrap/js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="/resource/bootstrap/js/bootstrap.min.js"></script>

    <!-- Script to Activate the Carousel -->
    <script>
    $('.carousel').carousel({
        interval: 5000 //changes the speed
    })
    </script>

</body>

</html>
