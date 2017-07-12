$(document).ready(function() {
	$(".btn-danger").click(function(){
		//likenum의 값을 받음
		var likenum = $(this).next().val();
		//ajax
		//방식 post방식
		//likenum에 해당되는 컬럼을 삭제후 페이지 새로고침 실패시 경고창 생성
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
	
	
	$("#grid").click(function(){
	
		var scNum = $(this).find("input").val();
		location.href="/travelReview/reviewDetail.tm?_id="+scNum;
	});
});