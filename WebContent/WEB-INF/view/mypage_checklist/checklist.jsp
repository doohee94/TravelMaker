<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"

	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">


<!-- jquery, jqueryUI cdn -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!-- 팝업 관련 파일 -->
<link rel="stylesheet" type="text/css" href="../step3/css/alopex-ui-default.css" />

<!-- 부루마블 css파일 -->
<link rel="stylesheet" href="/resource/mypage_checklist/css/checklist.css">
<!-- js파일 -->
<script type="text/javascript" src="/resource/mypage_checklist/js/checklist.js"></script>
</head>
<body>
<br/>
<div id="accordion" style="width:80%; margin-left:10%">
<%for(int i=0; i<5; i++){ %>
  <h3>Day <%=i %> <button style="float:right;color:blue;" id="modify">수정</button></h3>
  <div> 
    <div class="container">
			<div class="row">
				<div class="col-md-12 board">
					<div class="board-inner">
						<ul class="nav nav-tabs" id="myTab">
						<div class="liner"></div>
							<%for(int j=0; j<12; j++){ %>
							<li class="active">
							<a aria-controls="home"
								role="tab" data-toggle="tab" title="User Experience">
								<span class="round-tabs one stemp"></span>
							</a>
							<p align="center"><%=j %>안녕ㅎㅎ</p>
							</li>
							<%} %>
						</ul>
					</div>
				</div>
			</div>
		</div>
  </div>
<%}%>
</div>
</body>
<script type="text/javascript" src="../step3/script/alopex-ui.min.js"></script>
</html>