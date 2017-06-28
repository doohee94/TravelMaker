$(function(){
	$("#btn-ok").click(function(){
		//이미지 완료형으로 바꾸는 쿼리
		$("#stamp").attr("src","/resource/mobile/images/stamp.png");
		//db에 해당장소에 아이디와 상태값(ture) 저장
		var id = sessionStorage.getItem("userId");
		var place = sessionStorage.getItem("place");
		var stamp = "true";
		//저장 하는 함수
	});
});