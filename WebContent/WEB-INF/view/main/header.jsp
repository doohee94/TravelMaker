<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	 <!-- Bootstrap Core CSS -->
    <link href="/resource/main/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="/resource/main/css/modern-business.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="/resource/main/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
 
 	<!-- Modernizr -->
  	<script src="/resource/tour/js/modernizr.js"></script>
  	
 	<!-- 헤더 css -->
	<link href="/resource/header/css/header.css" rel="stylesheet" />
</head>
<body>

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
                        <a href="/travelReview/reviewlist.tm">여행리뷰</a>
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


</body>
</html>