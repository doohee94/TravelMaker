$(document).ready(function() {
	//삭제 버튼을 눌러렀을때 이벤트
	$(".delete").click(function(){
		var likenum = $(this).next().val();
		alert("삭제버튼 눌림" + likenum);
		//db타고 와서 해당 여행지 삭제 시기기
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
				