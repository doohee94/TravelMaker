    	


$(function(){
    		//검색버튼 누르면
    		$('.btn-search').click(function(){
    			var keyword = $("#search_bar").val();
    			//search 유효성 검사
    			if(keyword==""){
    				alert("검색어가 입력되지 않았습니다.");
    				return;
    			}else{
    			//검색후 serchview화면 이동
    			$(location).attr('href',"/searchpage/search.tm?cityName="+keyword);
    			}
    		});   		
    		//해당 일정 버튼을 누르면 해당 일정으로 이동
    		$('.review').click(function(){
    			//해당 일정 작성자 아이디 받기
    			var userId = $(this).next().val();
    			//해당 일정 번호 받기
    			var scNum = $(this).next().next().val();
    			//해당 리뷰 번호 받기
    			var totalNum = $(this).next().next().next().val();
    		});
    		//리뷰 더보기 버튼을 누르면 리뷰리스트 화면으로 이동
    		$('#reviewMore').click(function(){
    			$(location).attr('href',"/travelReview/reviewlist.tm");
    		});
    		$('#spotMore').click(function(){
    			$(location).attr('href',"/recommandtravelregion/recommandTravelRegion.tm");
    		});

    		var i=0; 
    		for(var x=0; x<3; x++){    			
    			var contentid = $("#reco"+x).val();
    			$.ajax({
    				
    				url : "http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon?ServiceKey=6eo8W%2BYDwcd6mq99M0oUaSvi0uKT5iYW8SvMUzSnq8iSDXL2tJcbbQlYNqKsq2k6xovjplHXuqBJq1m8ud1hIQ%3D%3D"
    						+"&defaultYN=Y&addrinfoYN=Y&overviewYN=Y&firstImageYN=Y&mapinfoYN=Y&contentId="+contentid+"&MobileOS=ETC&MobileApp=AppTesting"
    				,dataType:"json"
    				,success:function(data){
    					
    					var item = data.response.body.items.item;
    					
    					var firstimage = "/resource/tour/images/noimage.jpg";
    					if(item.firstimage != null){
    		                firstimage=item.firstimage;
    		             }
    					  var url = "/recommandtravelregion/find.tm?contentid="+contentid;
    					$(".reco"+i).append('<a href="'+url+'">'
    							+'<img class="img-responsive img-portfolio img-hover" src="'+firstimage+'" alt="" style="width:360px; height:300px">'
    							+'<span class="tourTop3">'+item.title+'</span>'
    							+'</a>'
    					
    					);
    					i++;
    				
    				}
    				,error:function(err){
    				alert("상세정보가져오기실패!"+err.status);
    				}	
    			
    			});//end ajax
    		}//end ifr
    		
    		

    	
    		
    		
    		
    	});