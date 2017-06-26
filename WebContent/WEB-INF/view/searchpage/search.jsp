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
	<style type="text/css">
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
	.img-responsive{
		width: 250px;
		height: 250px;
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

<script type="text/javascript">
$(".Slider2").Slider({
	mode : 'fade',
	isFlexible : true
});
</script>
<script type="text/javascript">
$(function(){

var mapx = "";
var mapy = "";
var pageNo="1";
var keyword = $("#cityNmae").text();

$.ajax({
	
		url : "http://api.visitkorea.or.kr/openapi/service/rest/KorService/searchKeyword?ServiceKey=6eo8W%2BYDwcd6mq99M0oUaSvi0uKT5iYW8SvMUzSnq8iSDXL2tJcbbQlYNqKsq2k6xovjplHXuqBJq1m8ud1hIQ%3D%3D"
		,dataType:"json"
		,data : {
			
			"keyword":keyword,
			"MobileOS":"ETC",
			"MobileApp":"AppTesting",
			"pageNo":pageNo,
			"arrange":"B",
			"_type":"json"
		}
		,success:function(data){
			
			var totalCount = data.response.body.totalCount;
			$.ajax({
				url : "http://api.visitkorea.or.kr/openapi/service/rest/KorService/searchKeyword?ServiceKey=6eo8W%2BYDwcd6mq99M0oUaSvi0uKT5iYW8SvMUzSnq8iSDXL2tJcbbQlYNqKsq2k6xovjplHXuqBJq1m8ud1hIQ%3D%3D"
					,dataType:"json"
					,data : {
						
						"keyword":keyword,
						"MobileOS":"ETC",
						"MobileApp":"AppTesting",
						"numOfRows":totalCount,
						"pageNo":pageNo,
						"arrange":"B",
						"_type":"json"
					}
					,success:function(data){
						
						var item = data.response.body.items.item;
						for(var i=0; i<5; i++){	
						$(".Slider2").append('<li class="DSlider-item" data-title="'+item[i].title+'"><img class="titleImg" src="'+item[i].firstimage+'"alt="'+item[i].title+'" /></li>');
						}//end image for		

						
						
						for(var i=0; i<item.length;i++)
			            {
			            	 var firstimage = "image/image.png";
			               if(item[i].firstimage != null){
			                  firstimage=item[i].firstimage;
			              
			               }
			               
			               var set;
							if(item[i].cat2 == "A0101" || item[i].cat2 == "A0102" || item[i].cat2 == "A0201"|| item[i].cat2 == "A0202" || item[i].cat2 == "A0203"
									|| item[i].cat2 == "A0204" || item[i].cat2 == "A0205" || item[i].cat2 == "A0206"){
								set = "tour";
							}else if(item[i].cat2 == "A0207" || item[i].cat2 == "A0208"){
								set = "festival";
							}else if(item[i].cat2 == "A0502"){
								set = "food";
							}else{
								set = "ect";
							}
							$("#cityListUL").append('<li class="cityList"><div class="gallery_product col-lg-4 col-md-4 col-sm-4 col-xs-6 filter '+set+'">'
													+'  <img src="'+firstimage+'" class="img-responsive"><h3>'+item[i].title+'</h3></div> </li>');
			               
			               
			            }
						
						for(var i=0; i<item.length;i++){
							
						}//end list for
						
						mapx=item[0].mapx;
						mapy=item[0].mapy;
						
						//현재날씨 받아오는 ajax
						   $.ajax({
							  	
							   url :  "http://apis.skplanetx.com/weather/current/minutely"
							   ,data:{
								    "version" : "1",
								    "appKey" : "65e16fa9-7caa-3142-9757-66d0ae8dd0f0",
									"lat":mapy,
									"lon":mapx
							   }
							   ,dataType : "json",
							   success:function(data){
								   var weatherImage = data.weather.minutely[0].sky.code.substring(5,7);
									var weathetTemp = data.weather.minutely[0].temperature.tc.substring(0,2);
									
								   $("#now").append('<h2>현재날씨</h2>'+
										   '<img src="/resource/searchpage/image/weather_icons/'+weatherImage+'.png" style="width:70px; height: 70px"/>'+
										   '<p>기온 '+weathetTemp+'</p>');
								   
							   }//end date success
							   
						   });

						//내일날씨
						   $.ajax({
							  	
							   url :  "http://apis.skplanetx.com/weather/forecast/3days"
							   ,data:{
								    "version" : "1",
								    "appKey" : "65e16fa9-7caa-3142-9757-66d0ae8dd0f0",
									"lat":mapy,
									"lon":mapx
							   }
							   ,dataType : "json",
							   success:function(data){
								   var weatherImage = data.weather.forecast3days[0].fcst3hour.sky.code25hour.substring(5,7);
									var weathetTemp = data.weather.forecast3days[0].fcst3hour.temperature.temp25hour.substring(0,2);
									
								   $("#tomorrow").append('<h2>내일날씨</h2>'+
										   '<img src="/resource/searchpage/image/weather_icons/'+weatherImage+'.png" style="width:70px; height: 70px"/>'+
										   '<p>기온 '+weathetTemp+'</p>');
								   
							   }//end date success
							   
						   });
				
						//5일후 날씨
						 $.ajax({
							  	
							   url :  "http://apis.skplanetx.com/weather/forecast/6days"
							   ,data:{
								    "version" : "1",
								    "appKey" : "65e16fa9-7caa-3142-9757-66d0ae8dd0f0",
									"lat":mapy,
									"lon":mapx
							   }
							   ,dataType : "json",
							   success:function(data){
								   var weatherImage = data.weather.forecast6days[0].sky.amCode5day.substring(5,7);
									var weathetTemp = data.weather.forecast6days[0].temperature.tmin5day;
									
								   $("#5day").append('<h2>5일 후</h2>'+
										   '<img src="/resource/searchpage/image/weather_icons/'+weatherImage+'.png" style="width:70px; height: 70px"/>'+
										   '<p>기온 '+weathetTemp+'</p>');
								   
							   }//end date success
							   
						   });
						//10일 후 날씨
						 $.ajax({
							  	
							   url :  "http://apis.skplanetx.com/weather/forecast/6days"
							   ,data:{
								    "version" : "1",
								    "appKey" : "65e16fa9-7caa-3142-9757-66d0ae8dd0f0",
									"lat":mapy,
									"lon":mapx
							   }
							   ,dataType : "json",
							   success:function(data){
								   var weatherImage = data.weather.forecast6days[0].sky.pmCode10day.substring(5,7);
									var weathetTemp = data.weather.forecast6days[0].temperature.tmin10day;
									
								   $("#10day").append('<h2>10일 후</h2>'+
										   '<img src="/resource/searchpage/image/weather_icons/'+weatherImage+'.png" style="width:70px; height: 70px"/>'+
										   '<p>기온 '+weathetTemp+'</p>');
								   
							   }//end date success
							   
						   });
						
						
					}//end success
				
			});
			
			
		}//end success
		,error:function(err){
			alert("실패!"+err.status);
		}
	
	
	}); //ajax
	

});
	
	
</script>

</html>