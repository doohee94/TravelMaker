$(document).ready(function() {
	
	var num = $("#listNum").val();
	for(var i=0; i<num; i++){
		
		var contentid = $(".likeNum"+i).val();
		
		
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
				$("#grid").append('<li class="shown">'
						+'<a href="#">'
							+'<img class ="imagelist" src="'+firstimage+'"/>'
						+'</a>'	
						+'<br/>'
						+'<h3>'+item.title+'</h3>'
						+'</li>'
				);
				
			}
			,error:function(err){
			alert("상세정보가져오기실패!"+err.status);
			}	
		});//end ajax
		
	}// end for i
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	//삭제 버튼을 눌러렀을때 이벤트
	$(".btn-danger").click(function(){
		//likenum의 값을 받아옴
		var likenum = $(this).next().val();
		//ajax 
		//방식 post방식
		//likenum을 받아서 해당되는 컬럼 삭제시키고 페이지 새로고침 실패시 경고창생성
		$.ajax({
			type : "POST",
			url : "/tmmypage/deletespot.tm",
			data : {
				likespotNum : likenum
			},
			success : function(data){
				if(data=!null){
				alert("삭제를 성공하였습니다.");
				$(location).attr("href","/tmmypage/likespot.tm")
				}
			},
			error : function(err){
				alert("삭제실패"+err.status);
			}
		});
	});	
});
				