
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<% ArrayList<ArrayList> list = (ArrayList)request.getAttribute("tagList"); %>
<!-- 여행일정 리뷰리스트 페이지입니다. -->
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>reviewlist.jsp</title>

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 커스텀 css -->
<link rel="stylesheet"
	href="/resource/travelReview/css/reviewlist.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<!-- jquery cdn -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>


<!-- Bootstrap Core CSS -->
    <link href="/resource/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="/resource/bootstrap/css/modern-business.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="/resource/bootstrap/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">



<script type="text/javascript" src="/resource/bootstrap/js/bootstrap.min.js"></script>

<!-- 지역탭 부분 css링크 -->
<script src="/resource/travelReview/js/reviewlist.js"></script>

</head>
<header>
    <jsp:include page="/tmmain/header.tm"></jsp:include>
</header>
<body>
   
	<!-- Page Content -->
	<div class="container">

		<!-- Page Heading/Breadcrumbs -->
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">
					리뷰페이지 <small>여러분의 후기를 공유해보세요</small>	
					<div id="div_search" class="">
					<input type="text" placeholder="ex)서울여행, 서울, 함께" id="reviewSearchContent" /><button id="searchBtn">검색</button>
					</div>
				</h1>

				<ol class="breadcrumb">
					<li>리뷰 > </li>
					<li><a href="">최신순</a></li>
					<li class="active"><a href="">인기순</a></li>
				</ol>
			</div>
		</div>
		<!-- /.row -->
	</div>
	
		<!--   출발지 경유지 도착지 탭   -->
<!-- 	<div class="container"> -->
<!-- 		<div id="menu1" class="tab-pane fade in active"> -->
<%-- 			<p><%@ include file="travelregion.jsp"%></p> --%>
<!-- 	</div> -->

	<div class="container" id="divCon">
	<c:choose>
		<c:when test="${! empty list }">
			<c:forEach items="${list}" var="a">
				<!-- Project One -->
        <div class="row">
            <div class="col-md-7">
                <a href="reviewDetail.tm?_id=${a.scNum}">
                    <img class="img-responsive img-hover images" src="/upload/review/${a.totalrePhoto1fake}" style="width:700px; height:300px" alt="">
                </a>
            </div>
            <div class="col-md-5">
                <h3>${a.totalreTitle}</h3>
                <% for(int i=0; i<list.size(); i++){ 
                	for(int j=0; j<list.get(i).size();j++){
                %>
                <p style="font-weight:bold; color:white; display: inline-block; background-color: #0A0A2A; border-radius:5px; padding:2px">#<%=list.get(i).get(j).toString() %></p>
                	<%} 
               		}%>
                <p>${a.totalreContent}</p>
                <a href="reviewDetail.tm?_id=${a.scNum}" class="btn btn-primary images">상세보기</i></a>
            </div>
        </div>
        <!-- /.row -->
		
		<!--  리뷰아이디/몽고디비 일정아이디  -->
		<input type="hidden" id="totalreNum" value="${a.totalreNum}"/>
		<input type="hidden" id="scNum" value="${a.scNum}"/>
        <hr>
			</c:forEach>
		</c:when>
	</c:choose>	
   </div>
	<a class="btn btn-primary" id="move_top_btn" style="position:fixed; bottom:5px; right:5px">TOP</i></a>
</body>
</html>
