<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!--  slider -->
<link href="/resource/detailtour/css/jquery.bxslider.min.css" rel="stylesheet" />
<!-- base css -->
<link href="/resource/detailtour/css/base.css" rel="stylesheet" />
</head>
<body>
<header>		
<%-- <%@ include file="/view/header/header.jsp" %> --%>
</header>
<div class="content">
	<div class="slider">
        <!-- 여행지ID값을 받아 API를 이용한 이미지 출력 --> 			  
		<ul class="bxslider">
  		<li><img class="image0" src="/resource/detailtour/images/noimage.jpg" /></li>
  		<li><img class="image1" src="/resource/detailtour/images/noimage.jpg" /></li>
  		<li><img class="image2" src="/resource/detailtour/images/noimage.jpg" /></li>
  		<li><img class="image3" src="/resource/detailtour/images/noimage.jpg" /></li>
		</ul>
	</div>
	<div class="review">
		<h1>여행지 리뷰</h1>
		<label>우앙!</label>
	</div>
</div>
</body>
<!-- Jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- slider -->
<script src="/resource/detailtour/js/jquery.bxslider.min.js"></script>
<!-- function -->
<script src="/resource/detailtour/js/function.js"></script>
</html>