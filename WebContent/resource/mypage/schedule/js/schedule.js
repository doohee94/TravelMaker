$(document).ready(function() {
	$(".btn-danger").click(function(){
		var likenum = $(this).next().val();
		//db타고 와서 해당 여행지 삭제 시기기
			$.ajax({
				type : "POST",
				url : "/tmmypage/deleteschedule.tm",
				data : {
						likescNum : likenum
						},
					success : function(data){
						if(data=!null){
						alert("삭제를 성공하였습니다.");
						$(location).attr("href","/tmmypage/schedule.tm")
						}
					},
					error : function(err){
						alert("삭제실패"+err.status)
					}
			});
	});
});