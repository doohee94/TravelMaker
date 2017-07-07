/**
 * 한글포함 문자열 길이를 구한다
 */
function getTextLength(str) {
    var len = 0;
    for (var i = 0; i < str.length; i++) {
        if (escape(str.charAt(i)).length == 6) {
            len++;
        }
        len++;
    }
    return len;
}




    $(function () {
    	
    	
    	//관심순 여행지 불러오기
    	$.ajax({
    		
    		url : "/recommandtravelregion/likeList.tm"
	 			,type:"post"
	 		    ,success:function(keyData){ 	
	 		    	var keyword = keyData.trim();
	 		    	
	 		    	//로그인을 한 사람의 경우
	 		    	if(keyword != "None" && keyword != null){
	 		    		
	 		    		  $("#myinteresttab").empty();
	 		    		
	 		    		$.ajax({
		 		    		
		 		    		url : "http://api.visitkorea.or.kr/openapi/service/rest/KorService/searchKeyword?ServiceKey=6eo8W%2BYDwcd6mq99M0oUaSvi0uKT5iYW8SvMUzSnq8iSDXL2tJcbbQlYNqKsq2k6xovjplHXuqBJq1m8ud1hIQ%3D%3D"
		 		    			,dataType:"json"
		 		    			,data : {
		 		    				"keyword":keyword.trim(),
		 		    				"MobileOS":"ETC",
		 		    				"MobileApp":"AppTesting",
		 		    				"pageNo":1,
		 		    				"arrange":"B",
		 		    				"_type":"json",
		 		    				"numOfRows":100
		 		    			}
		 		    			,success:function(data){
		 		    				
		 		    				var item = data.response.body.items.item;
		 		    				
		 		    				for(var i=0; i<item.length; i++){
		 		    					
		 		    					//이미지 널값 처리
		 								var firstimage = "/resource/tour/images/noimage.jpg";
		 					               if(item[i].firstimage != null){
		 					                  firstimage=item[i].firstimage;
		 					              
		 					              }//end image if
		 					               
		 					              //주소처리
		 						           var addr = "주소가 없습니다.";
		 						            if(item[i].addr1 != null && item[i].addr2 !=null){
		 						            	addr=item[i].addr1+item[i].addr2;
		 						              
		 						              }// end addr if
		 		    					
		 						         //타이틀 글자수 처리  ------------------------------    
		 					               var title = item[i].title;
		 					               var titleTag = '<h3>'+item[i].title+'</h3>';
		 					               if(getTextLength(title)>25){
		 					            	   
		 					            	   titleTag = '<h3>'+item[i].title.substring(0,10)+"..."+'</h3>'
		 					            	   
		 					               }
		 					               
		 						            
		 						            
		 						           $("#myinteresttab").append('<div class="col-md-4 text-center">'
		 						        		   +'<div class="thumbnail">'
		 						        		   +'<a href="#">'
		 						        		   +'<img class="img-responsive" src="'+firstimage+'"style="height:250px"	alt="'+item[i].title+'">'
		 						        		   +'<div class="caption">'
		 						        		   +titleTag
		 						        		   +'<p>'+addr+'</p>'
		 						        		   +'</div></a></div></div>'	 						         
		 						           );
		 		    							    					
		 		    				}//end data for
		 		    				
		 		    				
		 		    				
		 		    			}//end searchList success
		 		    			,error:function(err,status,error){
		 			 				alert("리스트 받아오기실패!"+err.status+error);
		 			 			}//end searchList error
		 		    		
		 		    	});//end 관광지search ajax;
		 		    	
	 		    		
	 		    		
	 		    	}else if(keyword == null){
	 		    		  $("#myinteresttab").empty();
	 		    		$("#myinteresttab").append('<br/><br/>'
	 		    				+'<div align="center" id="NoneLikeSpot">'
	 		    				+'<br/>'
	 		    				+'<h1><span class="glyphicon glyphicon-remove"></span>이런, 관심지역이 없네요!</h1>'
	 		    				+'<h3>관심지역을 설정하여 여행지를 찾아보세요!</h3>'
	 		    				+'<a href="/member/memberUpdate.tm" class="btn btn-lg btn-default"><span class="glyphicon glyphicon-chevron-down"></span>내정보수정</a>'
	 		    				+'<br/><br/></div><br/>'
	 		    				);
	 		    		
	 		    	}
	 		    
	 		    	
	 		     }//end success
	 			,error:function(err,status,error){
	 				alert("여행지 받아오기실패!"+err.status+error);
	 			}
    	});
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	$(".return-top").hide(); // 탑 버튼 숨김
                 
        $(window).scroll(function () {
            if ($(this).scrollTop() > 100) { // 스크롤 내릴 표시
                $('.return-top').fadeIn();
            } else {
                $('.return-top').fadeOut();
            }
        });
                
        $('.return-top').click(function () {
            $('body,html').animate({
                scrollTop: 0
            }, 350);  // 탑 이동 스크롤 속도
            return false;
        });
    });
