//사업자 번호에서 포커스가 나갔을때
$("#partnerReginum").blur(function() {
	//입력된 값을 가져옴
	var text = $(this).val();
	//패턴형식 지정
	var partnerReginum = /[0-9]{10}$/;
	//정규식 테스트 후 결과 출력
	if (!(partnerReginum.test(text))) {
		$("#partnerReginumHint").text("잘못된 형식의 사업자 번호 입니다");
	} else {
		$("#partnerReginumHint").text("");
	}
	//10글자 이상일때 오류메시지 출력
	if (text.length > 10) {
		$("#partnerReginumHint").text("잘못된 형식의 사업자 번호 입니다");
	}
});

//입력 버튼이 눌렀을 때
$(".btn-info").click(function(){
	
	var chack = true;
			
			//회사명 누락 검사
			if($("#partnerComname").val() == "" || $("#partnerComname").val() == null){
				$("#partnerComnameHint").text("회사명 누락");
				chack = false;
			}else{
				$("#partnerComnameHint").text("");
				chack = true;
			}
			
			//대표명 누락 검사
			if($("#partnerCeoname").val() == "" || $("#partnerCeoname").val() == null){
				$("#partnerCeonameHint").text("대표명 누락");
				chack = false;
			}else{
				$("#partnerCeonameHint").text("");
				chack = true;
			}
			
			//사업자번호 정규식 검사
			var pattern1=/[0-9]{10}$/;
			if(!(pattern1.test($("#partnerReginum").val()))){
				$("#partnerReginumHint").text("잘못된 입력");
				chack = false;
			}else{
				$("#partnerReginumHint").text("");
				chack = true;
			}
			
			//Email 정규식 검사
			var pattern2=/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
			if(!(pattern2.test($("#partnerEmail").val()))){
				$("#partnerEmailHint").text("잘못된 입력");
				chack = false;
			}else{
				$("#partnerEmailHint").text("");
				chack = true;
			}
			
			//전화번호 검사 (앞자리)
			var pattern3=/[0-9]{2,3}$/;
			if(!(pattern3.test($("#partnerTel1").val()))){
				$("#partnerTelHint").text("잘못된 입력");
				chack = false;
			}else{
				$("#partnerTelHint").text("");
				chack = true;
			}
			//전화번호 검사 (중간자리)
			var pattern4=/[0-9]{3,4}$/;
			if(!(pattern4.test($("#partnerTel2").val()))){
				$("#partnerTelHint").text("잘못된 입력");
				chack = false;
			}else{
				$("#partnerTelHint").text("");
				chack = true;
			}
			//전화번호 검사 (끝자리)
			var pattern5=/[0-9]{4}$/;
			if(!(pattern5.test($("#partnerTel3").val()))){
				$("#partnerTelHint").text("잘못된 입력");
				chack = false;
			}else{
				$("#partnerTelHint").text("");
				chack = true;
			}
			//파일 누락 검사
			if($("#file").val() == "" || $("#file").val() == null){
				$("#fileHint").text("파일 누락");
				chack = false;
			}else{
				$("#fileHint").text("");
				chack = true;
			}
			//내용입력 누락 검사
			if($("#partnerContent").val() == "" || $("#partnerContent").val() == null){
				$("#partnerContentHint").text("내용 누락");
				chack = false;
			}else{
				$("#partnerContentHint").text("");
				chack = true;
			}
			//모든 체크 후 true값이 유지되면 입력
			if(chack){
				$("#frm").attr("action","allianceOk.tm");
				$("#frm").submit();
			}
			
});