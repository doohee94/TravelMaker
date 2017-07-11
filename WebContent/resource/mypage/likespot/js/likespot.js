$(document).ready(function() {
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
				