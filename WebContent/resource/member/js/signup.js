/*$(function(){
	$("#signup").click(function(){
		
		//정규화
		var reg_id = "^[a-zA-Z]{1}[a-zA-Z0-9_]{4,11}$";
		var reg_pass = "/^(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{6,20}$/";
		var reg_name = "[가-힣]";
		var reg_tel = "^\d{2,3}\-\d{3,4}\-\d{4}$";
		var reg_email = "^[_a-zA-Z0-9-\\.]+@[\\.a-zA-Z0-9-]+\\.[a-zA-Z]+$";
		
		if(!reg_id.test($("#id").val())){
			alert("아이디는 5-15자 이여야합니다");
		}else if(!reg_pass.test($("#pass").val())){
			alert("비밀번호 형식이 잘못되었습니다");
		}else if(!reg_name.test($("#name").val())){
			alert("이름을 형식이 잘못되었습니다");
		}else if(!reg_tel.test($("#tel").val())){
			alert("전화번호 형식이 잘못되었습니다");
		}else if(!reg_email.test($("#email").val())){
			alert("이메일 형식이 잘못되었습니다");
		}
	});
});*/

