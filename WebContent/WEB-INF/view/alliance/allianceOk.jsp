<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!-- 
	allianceOk.jsp
	제휴 페이지 완료페이지
 -->
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
    
    <!-- Header CSS -->
    <link href="/resource/bootstrap/css/header.css" rel="stylesheet" type="text/css">
    
    <!-- 헤더 css -->
	<link href="/resource/header/css/header.css" rel="stylesheet" />
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
    
    <div class="container">
        <!-- Page Heading/Breadcrumbs -->
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">제휴
                    <small>완료</small>
                </h1>
                <ol class="breadcrumb">
                    <li><a href="/tmmain/main.tm">Home</a></li>
                    <li>제휴 소개</li>
                    <li>제휴 등록</li>
                    <li class="active">완료</li>
                </ol>
            </div>
        </div>
        <!-- /.row -->
        <div class="row">
        	<center>
			<img alt="완료그림" src="/resource/alliance/image/finsh.jpg" style="width: 95%"/>
			<br/> 
			<a href="/tmmain/main.tm"><img alt="" class="button" src="/resource/alliance/image/main.png"  style="width: 30%;"/></a>
			</center>
        </div>
    </div>
    <!-- jQuery -->
    <script src="/resource/bootstrap/js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="/resource/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>