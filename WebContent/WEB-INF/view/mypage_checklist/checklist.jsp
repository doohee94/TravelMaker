<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.parser.JSONParser"%>
<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
 
 //데이터베이스에서 해당 아이디에 맞는 데이터를 가져와서 파싱
JSONObject obj = (JSONObject)request.getAttribute("obj");
System.out.println("jsp>>>>>"+obj);

//date배열이랑 place..?
JSONArray date = (JSONArray)obj.get("tour");

String _id = obj.get("_id").toString();

JSONArray place[] = new JSONArray[date.size()]; //여행지에 대한 배열

for(int i=0; i<date.size(); i++){
	
	JSONObject temp = new JSONObject();
	temp = (JSONObject)date.get(i);
	place[i] = (JSONArray)temp.get("place");
	System.out.println(i+">>>>place>>>>>"+place[i]);
}
 %>
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
<link href="/resource/bootstrap/css/modern-business.css"
	rel="stylesheet">

<!-- Custom Fonts -->
<link href="/resource/bootstrap/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<!-- 팝업 관련 파일 -->
<link rel="stylesheet" type="text/css"
	href="/resource/step3/css/alopex-ui-default.css" />
<!--  헤더 css -->
<link href="/resource/header/css/header.css" rel="stylesheet" />
<!-- 부루마블 css파일 -->
<link rel="stylesheet"
	href="/resource/mypage_checklist/css/checklist.css">
</head>
<body>
	<!-- 메인 헤더 부분 -->
      <jsp:include page="/tmmain/header.tm"></jsp:include>
	<div class="container">

		<!-- Page Heading/Breadcrumbs -->
		<!-- submenu start -->
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">
					체크 리스트 <small>여행제목넣으면 좋겠다</small>
				</h1>
			</div>
		</div>
		<!-- submenu end -->
		<hr>
		<div class="row">
		<input type="hidden" id="_id" value="<%=_id%>"/>
			<div id="accordion" style="">
				<%for(int i=0; i<date.size(); i++){
					
					if( place[i] != null){%>
				  <h3 class="day">day<%=i+1 %></h3>
				<div>

					<div class="col-md-12 board">
						<div class="board-inner">
							<ul class="nav nav-tabs" id="myTab">
								<div class="liner"></div>
								<%for(int j=0; j<place[i].size(); j++){
									
									JSONObject temp = new JSONObject();
									temp  = (JSONObject)place[i].get(j);
									String title = temp.get("title").toString();
									String check = temp.get("check").toString();
								%>
								<li class="active"><a aria-controls="home" role="tab"
									data-toggle="tab" title="User Experience"> 
									<%if(check.equals("-1")) {%>
									<span
										class="round-tabs one stemp" style="background-color: green">day<%=i+1%> <input
											type="hidden" class="num" value="<%=j%>" />
									</span>
									<%} else if(check.equals("1")) {%>
									<span
										class="round-tabs one stemp" style="background-color: pink">day<%=i+1%> <input
											type="hidden" class="num" value="<%=j%>" />
									</span>
									<%} else{%>
									<span
										class="round-tabs one stemp">day<%=i+1%> <input
											type="hidden" class="num" value="<%=j%>" />
									</span>
									<%} %>
								</a>
									<p class="tabTitle" align="center"><%=title %></p></li>
								<%} %>
							</ul>
						</div>
					</div>
				</div>
				<%}else{
						continue;
				}}%>
			</div>
		</div>
	</div>
	<!-- /.container -->





	<!-- jQuery -->
	<script src="/resource/bootstrap/js/jquery.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="/resource/bootstrap/js/bootstrap.min.js"></script>



	<!-- jquery, jqueryUI cdn -->
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

	<!--  js -->
	<script type="text/javascript"
		src="/resource/mypage_checklist/js/checklist.js"></script>

	<!--  팝업 -->
	<script type="text/javascript"
		src="/resource/step3/script/alopex-ui.min.js"></script>
</body>
</html>