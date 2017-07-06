$(function(){
	$("#btn-ok").click(function(){
		//hidden 태크에 저장되어있는 userId값과 parstempNum 값을 변수처리
		var userId = $("#userId").val();
		var parstempNum = $("#parstempNum").val();
		//변수로 지정된 값을 통해 Ajax로 db에 입력처리함 성공시 이미지 변환시킴
		// ajax데이터 타입 post형식 보내는값 userId, parstempNum
		$.ajax({
			type : "POST",
			url : "/tmmoblie/insert.tm",
			data : {
				userId : userId,
				parstempNum : parstempNum,
			},
			success : function(data){
				alert("입력되었습니다.");
				//이미지 완료형으로 바꾸는 쿼리
				$("#stamp").attr("src","/resource/mobile/images/stamp.png");
			},
			error : function(err){
				alert("작성실패"+err.status);
			} 
		});
	});
});