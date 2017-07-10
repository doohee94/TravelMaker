<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- 
	allianceMain.jsp
	제휴 페이지 Main 페이지
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
    
</head>
<body>
	<!-- 메인 헤더 부분 -->
    <jsp:include page="/tmmain/header.tm"></jsp:include>
    
    <div class="container">
        <!-- Page Heading/Breadcrumbs -->
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">제휴
                    <small>제휴소개</small>
                </h1>
                <ol class="breadcrumb">
                    <li><a href="/tmmain/main.tm">Home</a></li>
                    <li class="active">제휴 소개</li>
                </ol>
            </div>
        </div>
        <!-- /.row -->
        <div class="row">
        	<center>
				<img alt="손잡고있는 그림" src="/resource/alliance/image/alliance.jpg"  style="width: 90%"/>
				<a href="allianceReq.tm"><img alt="버튼그림" class="button" src="/resource/alliance/image/button.png" style="width: 30%;" /></a>
			</center>
        </div>
    </div>
	
    <!-- jQuery -->
    <script src="/resource/bootstrap/js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="/resource/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>