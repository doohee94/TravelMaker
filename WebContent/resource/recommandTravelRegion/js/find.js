
$(function(){

	var contentid = $("#contentid").val().trim();
		$.ajax({
			
			url : "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?ServiceKey=6eo8W%2BYDwcd6mq99M0oUaSvi0uKT5iYW8SvMUzSnq8iSDXL2tJcbbQlYNqKsq2k6xovjplHXuqBJq1m8ud1hIQ%3D%3D"
					+"&defaultYN=Y&addrinfoYN=Y&overviewYN=Y&firstImageYN=Y&mapinfoYN=Y&contentId="+contentid+"&MobileOS=ETC&MobileApp=AppTesting"
			,dataType:"json"
			,success:function(data){
				
				var item = data.response.body.items.item;
				
				//제목붙이기
				$(".title").append(item.title
						+'<small>상세페이지</small>'+ '<span><input type="image" id="heartBtn" src="/resource/travelReview/images/heart1.png" style="float:right"></span>');
				
				
				//개요 붙이기--------------------------------------------
				$(".overview").append('<h2>'+item.title+'</h2>'
						+'<p>'+item.overview+'</p>'
				);
				
				//사진 붙이기 ---------------------------------------------
				var firstimage = "/resource/tour/images/noimage.jpg";
				if(item.firstimage != null){
	                firstimage=item.firstimage;
	            
	             }
				$(".image").append(' <img class="img-responsive" style="width:100%;" src="'+firstimage+'" alt="">');
				
				//주소 홈페이지 전화번호 붙이기-----------------------------
				 //주소
				 var addr = "주소가 없습니다.";
		            if(item.addr1 != null && item.addr2 !=null){
		            	addr=item.addr1+item.addr2;
		              
		               }
				$(".addr").append(' <h4>주소</h4>'
						+'<p>'+addr+'</p>');
				
				 //전화번호
				$(".tel").append(' <h4>전화번호</h4>'
						+'<p>'+item.tel+'</p>');
				
				 //홈페이지
				$(".page").append(' <h4>홈페이지</h4>'
						+'<p>'+item.homepage+'</p>');
				
				//지도 --------------------------------
				
				var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
				  mapOption = { 
				  center: new daum.maps.LatLng(item.mapy,item.mapx), // 지도의 중심좌표
				        level: 3 // 지도의 확대 레벨
				    };

				var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

				// 마커가 표시될 위치입니다 
				var markerPosition  = new daum.maps.LatLng(item.mapy,item.mapx); 

				// 마커를 생성합니다
				var marker = new daum.maps.Marker({
				    position: markerPosition
				});

				// 마커가 지도 위에 표시되도록 설정합니다
				marker.setMap(map);
				
			}//end success
			,error:function(err){
				alert("상세정보가져오기실패!"+err.status);
			}	
		});//end ajax
		
		
		// 여행지 상세페이지 좋아요 버튼(하트버튼) 눌렀을때.
		$(".title").on('click', '#heartBtn', function(){
			alert("좋아요 클릭 확인 ");
			
			var user_id = $("#user_id").val();
			if(user_id == ""){
				
				alert("로그인 후 이용할 수 있습니다");
				
			}else{
				if($("#heartBtn").attr("src") == "/resource/travelReview/images/heart1.png"){
					
					
				$.ajax({
					url:"plusLikeBtn.tm",
					type:"post",
					contentType:"application/json",
					data:JSON.stringfy(likeinfo),
					success:function(data){
						$("#heartBtn").attr("src","/resource/travelReview/images/heart2.png");
					},
					error:function(err,status,error){
						alert("실패..!" + err.status+error);
					}
				});
				
				}else{
					$.ajax({
						url:"minusLikeBtn.tm",
						type:"post",
						contentType:"apllication/json",
						data:JSON.stringfy(likeinf),
						succes:function(data){
							$("#heartBtn").attr("src","/resource/travelReview/images/heart1.png");
						},
						error:function(err,status,error){
							alert("실패.....!" + err.status+error);
						}
					});
					
				}// end of heartBtn click/unclick else
				
			}// end of login yes/no else
			
			
			
			
			
			
			
			
			
			
			
			
			
		});
		
});



