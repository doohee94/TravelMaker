<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!--  이미지 슬라이더 css -->
<meta name="viewport" content="width=device-width,initial-scale=1.0" >
<meta http-equiv="x-ua-compatible" content="IE=edge,chrome=1" >
<link rel="stylesheet" type="text/css" href="/resource/search/css/list.css" >
<link rel="stylesheet" type="text/css" href="/resource/search/css/DSlider.css" >
<link href="http://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css">
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<title>Insert title here</title>
	<link rel="stylesheet" href="/resource/searchpage/css/header.css">
	<style type="text/css">
	
	body{
		margin: 5px;
	}
	
	/*타이틀 스타일*/
	.title{
		height: 60px;
		border-bottom: solid 3px;
		margin-left: 100px;
		margin-right: 100px;
		font-size: 40px;
		
	}
	/*날씨/사진 스타일*/
	.imageANDweather{
		margin-left: 300px;
		
	}
	.container { 
		max-width:960px;
	}
	.DSlider-item{
		margin : 0;
		padding: 0;
	}
	.Slider2{
		margin : 0;
		padding: 0;
		float: left;
	}
	.titleImg{
		margin-right:0px;
		padding: 0px;
		width:1000px;
		height:400px;
	}
	.weather{
		float: right;
	}
	.cityList{
		list-style-type : none;
 	padding-left:0px;
		
	}
	</style>
	
	
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
						<ul class="Slider Slider2">
							<li class="DSlider-item" data-title="이거"><img
								class="titleImg" src="https://unsplash.it/1800/1200/?random"
								alt="?" /></li>
							<li class="DSlider-item" data-title="22222"><img
								class="titleImg" src="https://unsplash.it/1200/300/?random"
								alt="22222" /></li>
							<li class="DSlider-item" data-title="33333"><img
								class="titleImg" src="https://unsplash.it/1000/300/?random"
								alt="33333" /></li>
							<li class="DSlider-item" data-title="44444"><img
								class="titleImg" src="https://unsplash.it/500/300/?random"
								alt="44444" /></li>
							<li class="DSlider-item" data-title="55555"><img
								class="titleImg" src="https://unsplash.it/1200/800/?random"
								alt="55555" /></li>
						</ul>
						<script src="/resource/search/js/DSlider.js"></script>
						<script>
							$(".Slider2").Slider({
								mode : 'fade',
								isFlexible : true
							});
						</script>
					</div><!--  container -->
					<script type="text/javascript"src="/resource/search/js/imageSilder.js"></script> 	
				</td><!--  사진끝끝  -->
				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
				<td>
					<div class="weather" align="center">
						<table>
							<tr>
								<td>
								<h2>현재날씨</h2>
								<img src="/resource/search/image/people.png" style="width:70px; height: 70px"/>
								<p>기온 30º</p>
								</td>
								<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
								<td>
								<h2>내일날씨</h2>
								<img src="/resource/search/image/people.png" style="width:70px; height: 70px"/>
								<p>기온 30º</p></td>
							</tr>
							<tr>
								<td>
								<h2>5일후</h2>
								<img src="/resource/search/image/people.png" style="width:70px; height: 70px"/>
								<p>현재기온 30º</p>
								</td>
								<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
								<td>
								<h2>10일후</h2>
								<img src="/resource/search/image/people.png" style="width:70px; height: 70px"/>
								<p>현재기온 30º</p></td>	
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
        </div>
        <br/>
			<div><!--  리스트 목록들 -->
				<ul class="cityListUL">
				<li class="cityList">
		            <div class="gallery_product col-lg-4 col-md-4 col-sm-4 col-xs-6 filter tour">
		                <img src="http://fakeimg.pl/365x365/" class="img-responsive">
		                <h3>dd</h3>
		            </div>
				</li>
				<li class="cityList">				
		            <div class="gallery_product col-lg-4 col-md-4 col-sm-4 col-xs-6 filter food">
		                <img src="http://fakeimg.pl/365x365/" class="img-responsive">
		                 <h3>dd</h3>
		            </div>
				</li>
				<li class="cityList">
		            <div class="gallery_product col-lg-4 col-md-4 col-sm-4 col-xs-6 filter festival">
		                <img src="http://fakeimg.pl/365x365/" class="img-responsive">
		                 <h3>dd</h3>
		            </div>
		        </li>
		        <li class="cityList">    
		            <div class="gallery_product col-lg-4 col-md-4 col-sm-4 col-xs-6 filter festival">
		                <img src="http://fakeimg.pl/365x365/" class="img-responsive">
		                 <h3>dd</h3>
		            </div>
		         </li>   
				</ul>
		    </div><!--  리스트 목록 끝 -->       
        </div>
    </div>
    
    <!--  페이징 -->
    
    
   <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>
    <script type="text/javascript" src="/resource/search/js/list.js"></script>
</body>
<!-- API 받아오는 스크립트~~~ -->
<script type="text/javascript">
//관광지 받아오기

var mapx = "";
var mapy = "";

var keyword = '${cityName}';
	$.ajax({
	
		url : "http://api.visitkorea.or.kr/openapi/service/rest/KorService/searchKeyword?ServiceKey=6eo8W%2BYDwcd6mq99M0oUaSvi0uKT5iYW8SvMUzSnq8iSDXL2tJcbbQlYNqKsq2k6xovjplHXuqBJq1m8ud1hIQ%3D%3D"
		,dataType:"json"
		,data : {
			
			"keyword":keyword,
			"MobileOS":"ETC",
			"MobileApp":"AppTesting",
			"numOfRows":"20",
			"arrange":"B",
			"_type":"json"
		}
		,success:function(data){
			var item
			
			mapx = data.reposn
			
			
			
			
		}
		,error:function(err){
			alert("실패!"+err.status);
		}
	
	
	});


</script>
</html>