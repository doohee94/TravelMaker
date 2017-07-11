<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	HashMap map = (HashMap)request.getAttribute("finalSet");
	String[] top3Title = (String[])map.get("top3Title");
	String[] top3Image = (String[])map.get("top3Image");
	String[] top3Addr = (String[])map.get("top3Addr");
	String[] top3Contentid = (String[])map.get("top3Contentid");
	
	ArrayList title = (ArrayList)map.get("titleTemp");
	ArrayList image = (ArrayList)map.get("imageTemp");
	ArrayList addr = (ArrayList)map.get("addrTemp");
	ArrayList contentid = (ArrayList)map.get("contentidTemp");
%>

<!-- 여행지 추천 페이지 -->

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>여행지 추천 페이지</title>

<!-- 탭 및 폼 css -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- css  -->
<link rel="stylesheet"
	href="/resource/recommandTravelRegion/css/recommandTravelRegion.css" />
<link rel="stylesheet"
	href="/resource/recommandTravelRegion/css/myInterestOrder.css" />
<link rel="stylesheet"
	href="/resource/recommandTravelRegion/css/popularOrder.css" />
<!--  헤더 css -->
<link href="/resource/header/css/header.css" rel="stylesheet" />
<!-- 탭 및 폼 script -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- top 버튼 script -->
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script
	src="/resource/recommandTravelRegion/js/recommandTravelRegion.js"></script>

</head>
<body>	
  
	<!-- 메인 헤더 부분 -->
    <jsp:include page="/tmmain/header.tm"></jsp:include>

	<div class="container" id="secondcontainer">
		<div class="col-lg-12">
			<h2 class="page-header" style="font-size:36px">
				여행지 추천
			</h2>
		</div>
		<!-- top3 공간 -->
		<div class="topthreeloc">
		
			<div class="topthreelb" id="topthreelb">
				<h2>TOP 3</h2>
			</div>

			<div class="topthreediv">
				<%for(int i=0; i<top3Title.length; i++){
					String url ="/recommandtravelregion/find.tm?contentid="+top3Contentid[i];%>
				<div class="col-md-4 text-center">
					<div class="thumbnail">
						<a href="<%=url%>">
							<img class="img-responsive" src=<%=top3Image[i]%> style="height:250px" alt="">
							<div class="caption">
								<h3>
									<%=top3Title[i]%>
								</h3>
								<p><%=top3Addr[i]%></p>
							</div>
						</a>
					</div>
				</div>
				<%}%>
			</div>
			<!-- end top3 div (topthreediv)  -->
		</div>
		<!-- end top3 제목 및 div  -->
	</div>
	<!-- 두번째 container (top3 제목 및 글 ) -->

	<!--  인기순 내관심순 탭	-->
	<div class="container" id="thirdcontainer">

		<ul class="nav nav-tabs">
			<li class="active"><a data-toggle="tab" href="#populartab">인기순</a></li>
			<li><a data-toggle="tab" href="#myinteresttab">내관심순</a></li>
			<!-- 		    <input type="button" value="다음" id="nextbtn"> -->
		</ul>



		<div class="tab-content">
			<!-- 인기순 탭 -->
			<div id="populartab" class="tab-pane fade in active">

				<!-- 여행지 추천 페이지 - 인기순 페이지 -->
				<%
					for (int i = 0; i < 100; i++) {
						if(image.size() > 100){break;}
						if(image.size() == i){break;}
						String url ="/recommandtravelregion/find.tm?contentid="+contentid.get(i).toString();
				%>
				<div class="col-md-4 text-center">
					<div class="thumbnail">
						<a href="<%=url%>">
							<img class="img-responsive" src=<%=image.get(i).toString() %> alt="" style="height:250px">
							<input type="hidden" value="<%=contentid.get(i).toString()%>"/>
							<div class="caption">
								<h3>
									<%=title.get(i).toString() %><br>
								</h3>
								<p><%=addr.get(i).toString() %></p>
							</div>
						</a>
					</div>
				</div>
				<%
					}
				%>


				<!-- end 여행지 추천 페이지 - 인기순 페이지 -->

			</div>

			<!-- 내 관심순 탭 --> 
			<div id="myinteresttab" class="tab-pane fade">

				<!--여행지추천페이지 - 관심순 페이지 -->
				<br/><br/>
				<div align="center" id="NonuUserId">
					<br/>
					<h1><span class="glyphicon glyphicon-remove"></span>이런, 로그인을 안하셨네요!</h1>
					<h3>로그인 하시면 관심지역의 여행지를 보실 수 있습니다!</h3>
					<a href="/member/loginForm.tm" class="btn btn-lg btn-default"><span class="glyphicon glyphicon-chevron-down"></span> 로그인</a>
					<br/><br/>
				</div>
				<br/>
				
			
				
				<!-- end 여행지추천페이지 - 인기순 페이지 -->
			</div>

		</div>
		<!-- end tab-content -->


	</div>
	<!-- end class container -->

	<!-- top 버튼 클릭시 맨위로 올라간다. -->
	<!-- 	<a href="#topthreelb" class="topbtn">TOP</a> -->
	<a class="return-top" href="#"
		style="right: 15px; bottom: 15px; position: fixed; z-index: 9999; width: 40px; height: 30px; font-size: 20px;">TOP</a>

</body>
</html>
