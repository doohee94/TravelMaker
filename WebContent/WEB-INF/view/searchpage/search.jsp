<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!--  이미지 슬라이더 css -->
<meta name="viewport" content="width=device-width,initial-scale=1.0" >
<meta http-equiv="x-ua-compatible" content="IE=edge,chrome=1" >

<title>Insert title here</title>
	<link rel="stylesheet" type="text/css" href="/resource/searchpage/css/list.css" >
<link rel="stylesheet" type="text/css" href="/resource/searchpage/css/DSlider.css" >
<link href="http://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css">
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="/resource/searchpage/css/header.css">
<link rel="stylesheet" href="/resource/searchpage/css/search.css">
	
<!-- js -->
<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
	
</head>
<body>
	<!--  헤더  -->
	<div class="header">
		<div class="MainName">Travel<br/>Maker</div>
		<div class="subMenu">
			<ul >            
                			<li><a href="#">일정만들기</a></li>
                			<li><a href="#">추천여행지</a></li>
                			<li><a href="#">마이 페이지</a></li>
			</ul>

		</div>
		<div class="Menu">
			<ul>  	
	      		 <li><input type="text"><button>검색</button></li>
	          	 <li><a href="#">로그인</a></li>
	             <li><a href="#">회원가입</a></li>	
			</ul>
		</div>
		
	</div><!--  헤더끝 -->
	<!-- 타이틀부분 -->
	<div class="title">
		<div id="cityNmae">${cityName}</div>
	</div>
	<!--  이미지랑 날씨 정보 -->
	<div class="imageANDweather">
		<table border="0">
			<tr>
				<td>
					<div class="imagecontainer">
						<ul class="Slider Slider2" id="Slider2">
							<!--  이미지들어가는 부분 -->
						</ul>
					
					</div><!--  container -->
					
				</td><!--  사진끝끝  -->
				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
				<td>
					<div class="weather" align="center">
						<table>
							<tr>
								<td id="now">
								</td>
								<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
								<td id="tomorrow">
							</tr>
							<tr>
								<td id="5day">
								
								</td>
								<td >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
								<td id="10day">
								</td>	
							</tr>
						</table>
					</div>
				</td>
			</tr>
		</table>
	</div>
	
	<br/><br/><br/>
	
	<!--  탭 -->
	 <div class="TabContainer" align="center">
        <div class="row">
        <div class="gallery col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <h1 class="gallery-title">지역 정보</h1>
        </div>

        <div align="center">
            <button class="btn btn-default filter-button" data-filter="all">All</button>
            <button class="btn btn-default filter-button" data-filter="tour">여행지</button>
            <button class="btn btn-default filter-button" data-filter="food">맛집</button>
            <button class="btn btn-default filter-button" data-filter="festival">축제</button>
            <button class="btn btn-default filter-button" data-filter="ect">숙박 및 기타</button>
        </div>
        <br/>
			<div><!--  리스트 목록들 -->
				<ul class="cityListUL" id="cityListUL">

			
				</ul>
		    </div><!--  리스트 목록 끝 -->       
        </div>
    </div>
    
    <!--  페이징 -->
   
    
</body>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>"></script>
<script type="text/javascript" src="/resource/searchpage/js/list.js"></script>
<script src="/resource/searchpage/js/DSlider.js"></script>
<script type="text/javascript"src="/resource/searchpage/js/imageSilder.js"></script>
<script type="text/javascript" src="/resource/searchpage/js/search.js"></script>

</html>