<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%

int result = (int)request.getAttribute("result");

%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Bootstrap Core CSS -->
    <link href="/resource/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="/resource/bootstrap/css/modern-business.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="/resource/bootstrap/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
   
<title>TravelMaker</title>
</head>

<body>
	<input type="hidden" id="result" value="<%=result%>"/>
  <jsp:include page="/tmmain/header.tm"></jsp:include>
  	<input type="hidden" value="${contentid}" id="contentid">
   <!-- Page Content -->
    <div class="container">
<input type="hidden" id="user_id" value="${sessionScope.userId}"/>
        <!-- Page Heading/Breadcrumbs -->
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header title">
                    
                </h1>
                <ol class="breadcrumb">
                    <li style="font-size:17px;font-weight:bold;font-family:맑은고딕">여행지추천</li>
                    <li class="active"><a href='#'style="font-size:17px;font-family:맑은고딕">여행지상세</li>
                </ol>
            </div>
        </div>
        <!-- /.row -->

		 <!-- Image Header -->
        <div class="row">
            <div class="col-lg-12 image">
               <!--  이미지 -->
            </div>
        </div>
        <!-- /.row -->
        
        <!--  개요 -->
        <!-- Intro Content -->
        <div class="row">
        	<div class="col-lg-12">
                <h2 class="page-header">소개</h2>
            </div>
            <div class="col-md-6 overview" style="width:100%">
            <!--  개요부분 -->
            </div>
        </div>

        <!--  end  -->
        
        
         <!-- Service Panels -->
        <!-- The circle icons use Font Awesome's stacked icon classes. For more information, visit http://fontawesome.io/examples/ -->
        <div class="row" >
            <div class="col-lg-12">
                <h2 class="page-header">정보</h2>
            </div>
            <div class="col-md-3 col-sm-6">
                <div class="panel panel-default text-center">
                    <div class="panel-heading">
                        <span class="fa-stack fa-5x">
                              <i class="fa fa-circle fa-stack-2x text-primary"></i>
                              <i class="fa  fa-home  fa-stack-1x fa-inverse"></i>
                        </span>
                    </div>
                    <div class="panel-body addr">
                        
                        <!--  주소부분 -->
                    </div>
                </div>
            </div>
            <div class="col-md-3 col-sm-6">
                <div class="panel panel-default text-center">
                    <div class="panel-heading">
                        <span class="fa-stack fa-5x">
                              <i class="fa fa-circle fa-stack-2x text-primary"></i>
                              <i class="fa fa-phone fa-stack-1x fa-inverse"></i>
                        </span>
                    </div>
                    <div class="panel-body tel">
                   <!--  전화번호 -->
                       
                    </div>
                </div>
            </div>
            <div class="col-md-3 col-sm-6">
                <div class="panel panel-default text-center">
                    <div class="panel-heading">
                        <span class="fa-stack fa-5x">
                              <i class="fa fa-circle fa-stack-2x text-primary"></i>
                              <i class="fa fa-external-link fa-stack-1x fa-inverse"></i>
                        </span>
                    </div>
                    <div class="panel-body page">
                       <!--  홈페이지 -->
                        
                    </div>
                </div>
            </div>
         
        </div>
        <!--  end row -->
        <!--  지도 -->
		<div class="row mapdiv">
		 <div class="col-lg-12">
                <h2 class="page-header">지도</h2>
            </div>

		<div id="map" style="width: 100%; height: 350px;"></div>
	
		</div>
		<br/><br/><br/><br/>
		<!--  지도 end -->
      </div><!--  컨테이너 끝 -->
</body>

    <!-- jQuery -->
    <script src="/resource/bootstrap/js/jquery.js"></script>

    <script src="/resource/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="/resource/recommandTravelRegion/js/find.js"></script>
	<script type="text/javascript"src="//apis.daum.net/maps/maps3.js?apikey=1464ab905ce0a7acbcb1f9933dbd5961&libraries=services"></script>
</html>