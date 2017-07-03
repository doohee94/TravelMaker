    $(function(){
    	//flexslider
		$('.flexslider').flexslider({
		    animation: "slide"
		  });
		//api를 통해 사진 받아오
		var contentId = "";
		var key = "GE8ffyGcbc8LhTbkPBlErwmb2Q7JWxA2rhMEQ6iqXszlPFG%2BtFLSmkYyusYF%2FeguXxpATpP9ZiikFJ9%2BzgqGKA%3D%3D";	
		$.ajax({
			url:"http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailImage?ServiceKey="+key
			,dataType : "json"
			,data : {
				"contentId": "1095732",
				"MobileOS" : "ETC",
				"MobileApp":"AppTesting",
				"imageYN" : "Y",
				"_type":"json"
			}//end data
			,success:function(data){	
				for(var i=0 ; i < 4 ; i++){
					var item = data.response.body.items.item[i];
					var imgurl = item.originimgurl;
					//이미지가 없거나 찾지 못했을때
					if(imgurl ==null || imgurl == "undefined"){
						return;			
					}else{
					$(".image"+(i+1)).attr("src",data.response.body.items.item[i].originimgurl);
					}
				}
				
			}//end success
			,error:function(err){
				alert("여행지 정보 불러오기 실패" + err.status);
			}
		});//end ajax
	});

    