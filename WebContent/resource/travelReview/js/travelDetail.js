$(function() {

	//슬라이더에 있는 사진들 클릭했을 때 이벤트
	$(".carousel-indicators li").click(function(){
		$(".carousel-indicators li").removeClass("active");
		$(this).addClass("active");
		var imgsrc = $(this).find("img").attr("src");
		$(".item > img").attr("src",imgsrc);
	});

	//공유하기 버튼 눌렀을 때
	$("#shareBtn").click(function(){
		alert("넌 왜 갑자기 안되냐?");
		window.open('http://www.facebook.com/sharer/sharer.php?u=http://localhost:8080/ProjectUIPractice/TravelSpotReview/reviewDetail.jsp')
	});

	var likeinfo = {"user_id":$("#user_id").val(), "sc_num":$("#_id").val()};

	//좋아요 버튼 눌렀을 때 이미지 변경
	$("#heartBtn").click(function(){
		alert("눌러지냐?");
		var user_id = $("#user_id").val();
		if(user_id == ""){
			alert("로그인 후 이용할 수 있습니다");
		}
		else{
			//좋아요를 누른경우 디비에 좋아요 저장하고 하트이미지 변경하기
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
				//좋아요 취소할 경우 디비에 좋아요 삭제하고 하트 이미지 변경하기
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
			}//end of inner else
		}//end of outer else
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

	//일정에서 가각의 탭을 눌렀을 때 해당 지역을 지도에 마커로 표시해준다
	$('#myTab > li').click(function(){
		var arrayX=[];
		var arrayY=[];
		var arrayTitle=[];

		//해당 탭의 리스트에서 위도,경도, 제목 뽑아오기
		$(this).find(".mapx").each(function(i,item){
			arrayX[i] = $(this).val();
		});

		$(this).find(".mapy").each(function(i,item){
			arrayY[i] = $(this).val();
		});

		$(this).find(".title").each(function(i,item){
			arrayTitle[i] = $(this).val();
		});

		/*불러온 정보에서 위도, 경도 정보를 받아 지도 위에 마커찍기*/
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = { 
			center: new daum.maps.LatLng(arrayY[0], arrayX[0]), // 지도의 중심좌표
			level: 8 // 지도의 확대 레벨
		};

		var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

		for(var i=0; i<arrayX.length; i++){

			//마커가 표시될 위치입니다 
			var markerPosition  = new daum.maps.LatLng(arrayY[i], arrayX[i]); 

			// 마커를 생성합니다
			var marker = new daum.maps.Marker({
				position: markerPosition
			});

			// 마커가 지도 위에 표시되도록 설정합니다
			marker.setMap(map);

			// 마커를 클릭했을 때 마커 위에 표시할 인포윈도우를 생성합니다
			var iwContent = '<div style="padding:5px;">'+arrayTitle[i]+'</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
			iwRemoveable = true, // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다
			iwPosition = new daum.maps.LatLng(arrayY[i], arrayX[i]); //인포윈도우 표시 위치입니다

			// 인포윈도우를 생성합니다
			var infowindow = new daum.maps.InfoWindow({
				position : iwPosition, 
				content : iwContent,
				removable : iwRemoveable
			});

			// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
			infowindow.open(map, marker); 
		}
	});
});