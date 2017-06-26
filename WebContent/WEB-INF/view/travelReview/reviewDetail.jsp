<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>reviewDetail.jsp</title>

<!-- 페이지 css파일 -->
<link rel="stylesheet" href="/resource/travelReview/css/reviewDetail.css">

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>


<!-- 탭 부분 -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!-- 페이스북 공유하기 관련 파일 -->
<meta property="og:title" content="공유하기 연습">
<meta property="og:url" content="http://localhost:8080/ProjectUIPractice/TravelSpotReview/reviewDetail.jsp">
<meta property="og:description" content="내용입니다 내용 내용 내용">
<meta property="og:image" content="sample.JPG">

<!-- 지도부분 api -->
<script type="text/javascript"
	src="//apis.daum.net/maps/maps3.js?apikey=1464ab905ce0a7acbcb1f9933dbd5961&libraries=services"></script>

<!-- 페이지 js파일 -->
<script type="text/javascript" src="/resource/travelReview/js/travelDetail.js"></script>

</head>



<body>
	<!-- 사진보여주는 곳 -->
	<br>
	<div class="container">
		<div class="carousel slide article-slide" id="article-photo-carousel">
			<!-- Wrapper for slides -->
			<div class="carousel-inner cont-slider" style="width:">
				<div class="item active" style="width:80%; height:300px;">
					<img alt="" title="" src="http://lorempixel.com/850/850/?random=123"
						class="img-responsive">
				</div>
			</div>
			<!-- Indicators -->
			<ol class="carousel-indicators">
				<li class="active" data-slide-to="0"
					data-target="#article-photo-carousel"><img alt=""
					src="http://lorempixel.com/850/850/?random=123"
					class="img-responsive"></li>
				<li class="" data-slide-to="1" data-target="#article-photo-carousel">
					<img alt="" src="http://lorempixel.com/850/850/?random=123">
				</li>
				<li class="" data-slide-to="2" data-target="#article-photo-carousel">
					<img alt="" src="http://lorempixel.com/850/850/?random=123">
				</li>
				<li class="" data-slide-to="3" data-target="#article-photo-carousel">
					<img alt="" src="http://lorempixel.com/850/850/?random=123">
				</li>
			</ol>
		</div>
	</div>


	<!-- 리뷰제목과 내용 -->
	<div id="content-wrapper">
		<!-- PAGE CONTENT -->
		<div class="container">
			<div class="page-header">
				<h3>여행리뷰 제목</h3>
				<input type="button" id="shareBtn" value="페이스북공유하기"/>
				<input type="image" id="heartBtn" src="heart1.png">
			</div>
			<div class="well">
				<p>여기는 리뷰 내용입니다</p>
			</div>
			<!-- End Well -->
		</div>
		<!-- End Container -->
	</div>


	<!-- 여행일정 탭 내용 -->

				<div class="tabbable-panel map">
					<div class="tabbable-line" id="myTab">
						<ul class="nav nav-tabs">
							<!-- 탭 갯수 만들기 -->
							<%
								for (int i = 0; i < 5; i++) {
							%>
							<li id="tab<%=i + 1%>" class="tab active"><a href="#tab_default_<%=i + 1%>"data-toggle="tab"> Tab <%=i + 1%>
							</a></li>
							<%
								}
							%>
						</ul>
						<!-- 각각의 탭에 해당하는 내용들 -->
						<%
							for (int i = 0; i < 5; i++) {
						%>
							<div class="tab-pane" id="tab_default_<%=i + 1%>">
								<%
									for (int j = 0; j < 10; j++) {
								%>
								<ul>
									<li><%=i + 1%>번째 탭의 <%=j + 1%>번 리스트</li>
								</ul>
								<%
									}
								%>
							</div>
						<%
							}
						%>
					</div>
				</div>
	<!-- 지도 구성 -->
	<div id="map" style="width: 30%; height: 350px;" class="map"></div>
</body>
</html>