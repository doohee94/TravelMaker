$(function(){

	
	//슬라이더 관련 함수
	$(".Slider2").Slider({
		mode : 'fade',
		isFlexible : true
	});	
	
	
	
//검색해서 들어온 페이지에 해당하는 관광지를 ajax를 통해 찾는다.	
var mapx = "";
var mapy = "";
var pageNo="1";
var keyword = $("#cityNmae").text(); //검색어

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
	