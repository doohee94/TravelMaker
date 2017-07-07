<%@page import="java.util.ArrayList"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	ArrayList replyList = (ArrayList)request.getAttribute("replyList");
	int result = (Integer) request.getAttribute("result");
	String _id = (String)request.getAttribute("_id");
	String user_id = (String) request.getAttribute("user_id");
	System.out.println(result);
%>
<% 
	JSONArray tourarray = (JSONArray)request.getAttribute("obj");

	//각 day에 해당하는 place배열을 담을 리스트
	JSONArray placeArray[] = new JSONArray[tourarray.size()];
	
	//각 day에 해당하는 mapx배열을 담을 리스트
	JSONArray mapxArray[] = new JSONArray[tourarray.size()];
	//각 day에 해당하는 mapy배열을 담을 리스트
	JSONArray mapyArray[] = new JSONArray[tourarray.size()];
	
	for(int i=0; i<tourarray.size(); i++){
		//System.out.println( tourarray.get(i).toString());
		
		//각각의 tour리스트에서 place정보 빼오기
		JSONObject tour = (JSONObject)tourarray.get(i);
		
		//place배열 저장
		JSONObject temp = new JSONObject();
		temp = (JSONObject)tourarray.get(i);
		placeArray[i] = (JSONArray)temp.get("place");
	
	}
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>reviewDetail.jsp</title>

<!-- 페이지 css파일 -->
<link rel="stylesheet"
	href="/resource/travelReview/css/reviewDetail.css">

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<!-- Bootstrap Core CSS -->
<link href="/resource/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="/resource/bootstrap/css/modern-business.css"
	rel="stylesheet">

<!-- Custom Fonts -->
<link href="/resource/bootstrap/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">

<!-- 탭 부분 -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!-- 페이스북 공유하기 관련 파일 -->
<meta property="og:title" content="공유하기 연습">
<meta property="og:url"
	content="http://localhost:8080/ProjectUIPractice/TravelSpotReview/reviewDetail.jsp">
<meta property="og:description" content="내용입니다 내용 내용 내용">
<meta property="og:image" content="sample.JPG">

<!-- 지도부분 api -->
<script type="text/javascript"
	src="//apis.daum.net/maps/maps3.js?apikey=d7cd900845b5f9c431bb5325b827e675&libraries=services"></script>

<!-- 페이지 js파일 -->
<script type="text/javascript" src="/resource/travelReview/js/travelDetail.js"></script>
	
<script type="text/javascript" src="/resource/bootstrap/js/bootstrap.js"></script>

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
        
    </nav>


	<div class="container">
		<!-- Page Heading/Breadcrumbs -->
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">리뷰페이지
					<small>
					<a href="#"><i class="fa fa-facebook-square fa-2x" id="shareBtn"></i></a>
				<%if(result == 0) {%>
				<input type="image" id="heartBtn" src="/resource/travelReview/images/heart1.png"/>
				<%}else{%>
				<input type="image" id="heartBtn" src="/resource/travelReview/images/heart2.png"/>
				<%}%>
					</small>
				</h1>
				<ol class="breadcrumb">
					<li>리뷰 </li>
					<li>리뷰상세</li>
				</ol>
				<input type="hidden" value="<%=_id%>" id="_id">
				<input type="hidden" value="<%=user_id%>" id="user_id">
			</div>
		</div>
		<!-- /.row -->

		<!-- 사진 나열 -->
		<div class="carousel slide article-slide" id="article-photo-carousel">
			<!-- Wrapper for slides -->
			<div class="carousel-inner cont-slider" style="width:">
				<div class="item active" style="width: 100%; height: 400px;">
					<img alt="" title=""
						src="/resource/travelReview/images/${totalre.totalrePhoto1fake}"
						class="img-responsive" style="width: 100%; height: 400px">
				</div>
				<hr>
			</div>
			<!-- Indicators -->
			<ol class="carousel-indicators">
				<li class="active" data-slide-to="0"
					data-target="#article-photo-carousel"><img alt=""
					src="/resource/travelReview/images/${totalre.totalrePhoto1fake}"
					class="img-responsive"></li>
				<li class="" data-slide-to="1" data-target="#article-photo-carousel">
					<img alt=""
					src="/resource/travelReview/images/${totalre.totalrePhoto2fake}">
				</li>
				<li class="" data-slide-to="2" data-target="#article-photo-carousel">
					<img alt=""
					src="/resource/travelReview/images/${totalre.totalrePhoto3fake}">
				</li>
				<li class="" data-slide-to="3" data-target="#article-photo-carousel">
					<img alt=""
					src="/resource/travelReview/images/${totalre.totalrePhoto4fake}">
				</li>
			</ol>
		</div>
		
	</div>

	<div class="container map" style="width: 40%; margin-left:15%">
		<!-- Service Tabs -->
		<div class="row map">
			<div class="col-lg-12">
				<h2 class="page-header">일정</h2>
			</div>
			<div class="col-lg-12">

				<ul id="myTab" class="nav nav-tabs nav-justified">
					<!-- 일정 수만큼 탭 갯수 만들기 -->
					<%
						for (int i = 0; i < tourarray.size() && placeArray[i] != null; i++) {
					%>
					<li class="mapInfo"><a href="#service-<%=i %>"
						data-toggle="tab"><i class="fa fa-tree"></i>DAY<%=i+1 %></a>
					<%
						//위에서 만든 place배열에서 title, mapx, mapy 정보 가져오기
							for (int j = 0; j < placeArray[i].size(); j++) {
								JSONObject temp = new JSONObject();
								temp  = (JSONObject)placeArray[i].get(j);
								
								String mapx = temp.get("mapx").toString();
								String mapy = temp.get("mapy").toString();
								String title = temp.get("title").toString();
						%>
						<input type="hidden" class="mapx" value=<%=mapx %>>
						<input type="hidden" class="mapy" value=<%=mapy %>>
						<input type="hidden" class="title" value=<%=title %>>	
						<%
							}
						%>
					</li>
					<%
						}
					%>
				</ul>

				<div id="myTabContent" class="tab-content" style="height:400px; overflow: scroll;">
					<%
					for (int i = 0; i < tourarray.size() && placeArray[i] != null; i++) {
					%>
					<div class="tab-pane fade in" id="service-<%=i %>">
						<%
						//위에서 만든 place배열에서 title, mapx, mapy 정보 가져오기
							for (int j = 0; j < placeArray[i].size(); j++) {
								JSONObject temp = new JSONObject();
								temp  = (JSONObject)placeArray[i].get(j);
								String title = temp.get("title").toString();
						%>
						<h4><%= title%></h4>
						<p>		여기 일단 음 디게 재밌었다ㅎㅎㅎㅎㅎ</p>
						<hr>
						<%
							}
						%>
					</div>

					<%
					}
					%>
				</div>

			</div>
		</div>
	</div>
	
	<!-- 지도 구성 -->
	<div id="map" style="width: 30%; height: 450px;" class="map"></div>

	<div style="width:80%; margin-left:10%" align="center">
	<table class="table table-striped">
		<tr>
			<th>내용</th>
			<th>작성자</th>
			<th>날짜</th>
		</tr>
		<c:choose>
			<c:when test="${! empty replyList }">
				<c:forEach items="${replyList}" var="list">
					<tr>
						<td>${list.reply }</td>
						<td>${list.userId }</td>
						<td>${list.writeDate }</td>
					</tr>
				</c:forEach>
			</c:when>
		</c:choose>
	</table>
	<br/>
	<form action="/travelReview/insertReply.tm">
	<input type="hidden" value="<%=_id%>" id="_id" name="scNum">
	<input type="hidden" value="<%=user_id%>" id="user_id" name="userId">
	<input style="width:70%; margin-bottom:5px" type="text" placeholder="댓글" id="reply" name="reply"><input type="submit" value="입력">
	</form>
	</div>

</body>
</html>