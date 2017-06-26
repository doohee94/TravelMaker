<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<!-- jquery cdn -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

<!-- 지역탭 부분 css링크 -->
<link rel="stylesheet" href="reviewlist.css">

<script src="reviewlist.js"></script>
<script src="travelRegion.js"></script>

</head>

<body>
	<div class="container">
		<div class="row">
			<a>최신순</a> &nbsp; <a>인기순</a>
		</div>
		<hr>
		<!--   출발지 경유지 도착지 탭   -->
		<div class="container">
				<div id="menu1" class="tab-pane fade in active">
					<p><%@ include file="travelregion.jsp"%></p>
				</div>
		</div>
		<hr>
		<div class="row row-margin-bottom" id="divCon">
			<%for(int i=0; i<4; i++) {%>
			<div class="col-md-5 no-padding lib-item" data-category="view" id="divContent">
				<div class="lib-panel">
					<div class="row box-shadow">
						<div class="col-md-6">
							<button id="<%=i+1%>" class="images">
								<img class="lib-img-show"
									src="http://lorempixel.com/850/850/?random=123">
							</button>
						</div>
						<div class="col-md-6">
							<div class="lib-row lib-header">
								여행리뷰<%=i+1 %>
								<div class="lib-header-seperator"></div>
							</div>
							<div class="lib-row lib-desc">
								<%=i+1 %>
								여행리뷰 내용들입니다 하하하하하하하하하하하하핳
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-1"></div>
			<%} %>
		</div>
	</div>
	<input type="button" id="move_top_btn" value="TOP"/>
</body>
</html>