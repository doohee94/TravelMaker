$(function(){
	$("#btn-login").click(function(){
		alert("로그인 버튼");
		//id와 pw 변수 선언
		var id = $("#id").val();
		var pass = $("#password").val();
		//공백 정규화
		if(id==""||pass==""){
			if(id==""){
				alert("아이디를 확인하세요");	
			}
			else if(pass==""){
				alert("비밀번호를 확인하세요");	
			}
			return;
		}
		alert("로그인 성공");
		//DB다녀와서 id와 pw가져와 확인
	});
	$("#btn-cancel").click(function(){
		//이전 페이지로 보내기
		history.back();
	});
});