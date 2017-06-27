$(function(){
	/*
	qna 버튼 누르면
	로그인 정보 확인후 로그인이 안되어있으면 로그인페이지 이동
	로그인이 되어있으면 qna페이지이동
	*/
	$("#footer-qna").click(function(){
		var id = sessionStorage.getItem("userId");
		if(id== null){
			alert("로그인을 하셔야 이용 가능합니다.");
			$(location).attr('href',"login.tm");
		}else if(id!=null){
			$(location).attr('href',"qna.tm");
		}		
	});
	/*
	제휴 버튼 누르면 제휴페이지 이동
	*/
	$("#footer-alliance").click(function(){
		$("#footer-alliance").attr('href',"/alliance/allianceMain.tm")
	});
	
});