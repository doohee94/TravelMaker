$(function() {
  		$("#myTab").tabs();

  		//슬라이더에 있는 사진들 클릭했을 때 이벤트
  		$(".carousel-indicators li").click(function(){
  			$(".carousel-indicators li").removeClass("active");
  			$(this).addClass("active");
  			var imgsrc = $(this).find("img").attr("src");
  			$(".item > img").attr("src",imgsrc);
  		});
  		
  		//공유하기 버튼 눌렀을 때
  		$("#shareBtn").click(function(){
  			window.open('http://www.facebook.com/sharer/sharer.php?u=http://localhost:8080/ProjectUIPractice/TravelSpotReview/reviewDetail.jsp')
  		});
  		
  		var likeinfo = {"user_id":"maro", "sc_num":"128"};
  		
  		//좋아요 버튼 눌렀을 때 이미지 변경
  		$("#heartBtn").click(function(){
  			if($("#heartBtn").attr("src") == "/resource/travelReview/images/heart1.png"){
  				
  				$.ajax({
               	 url : "/insertLike.tm"
           	     ,type:"post"
           	     ,contentType:"application/json"
           	     ,data:JSON.stringify(likeinfo)
           	     ,success:function(data){
           	    	$("#heartBtn").attr("src","/resource/travelReview/images/heart2.png");
           	     }
                ,error:function(err,status,error){
       	         alert("실패!"+err.status+error);
       	      }
                });
  				
  			}else{
  				
  				$.ajax({
  	               	 url : "/deleteLike.tm"
  	           	     ,type:"post"
  	           	     ,contentType:"application/json"
  	           	     ,data:JSON.stringify(likeinfo)
  	           	     ,success:function(data){
  	           	    	 $("#heartBtn").attr("src","/resource/travelReview/images/heart1.png");
  	           	     }
  	                ,error:function(err,status,error){
  	       	         alert("실패!"+err.status+error);
  	       	      }
  	                });
  			}
  		});
  		
  		
  		//지도 관련 부분 스크립트
  		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			level : 3
		// 지도의 확대 레벨
		};

		var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

		// 마커가 표시될 위치입니다 
		var markerPosition = new daum.maps.LatLng(33.450701, 126.570667);

		// 마커를 생성합니다
		var marker = new daum.maps.Marker({
			position : markerPosition
		});

		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);

		// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
		// marker.setMap(null);
	});