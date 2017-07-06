/* 약관동의 */
  function chk(){ 
 var req = document.form.req.checked;
 var num = 0;
 if(req == true){
  num = 1;
 }
 if(num==1){
  document.form.submit();
 }else{
  alert("약관에 동의하셔야 합니다.");
 }
}
function nochk(){
 alert("동의하지 않으면 가입하실 수 없습니다");};  
 
 
 /* 약관동의 자세히 보기 팝업 */
 $(function(){
 $('#btn_popup').click( function() {
     $a.popup({
    	 title : "약관동의"
         , url: "popUp.tm" // 팝업에 표시될 HTML
         , width : 1200 //크기
         , height : 500
         , iframe: true // default
    });
 });
 });
 
 /* 유효성처리 */
 $(function(){
  $("#signup").click(function(){ 
		
		/* 아이디 정규화 */
	  var reg_id=/^[a-z0-9_]{4,20}$/;
		if(!(reg_id.test($("#userId").val()))){
			alert("ID는 5자 이상이여야 하며 영어만 가능합니다");
			$("#userId").focus();
			return false;
		}
		/* 비밀번호 정규화 */
 		var reg_pass=/^(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{6,20}$/;
		if(!(reg_pass.test($("#userPw").val()))){
			alert("비밀번호 형식이 잘못되었습니다");
			$("#userPw").focus();
			return false;
		}
		/* 이름 정규화 */
		var reg_name=/^[가-힣]+$/;
		if(!(reg_name.test($("#userName").val()))){
			alert("이름 형식이 잘못되었습니다");
			$("#userName").focus();
			return false;
		} 
		/* 전화번호 정규화 */
		var reg_tel=/^\d{2,3}-\d{3,4}-\d{4}$/;;
		if(!(reg_tel.test($("#userTel").val()))){
			alert("전화번호 형식이 잘못되었습니다");
			$("#userTel").focus();
			return false;
		}
		/* 이메일 정규화 */
		 var reg_email=/^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
		if(!(reg_email.test($("#userEmail").val()))){
			alert("이메일 형식이 잘못되었습니다");
			$("#userEmail").focus();
			return false;
		} 
		
		$("#frm").submit();
	}); 
 });
 
 /*아이디 중복확인*/
	/*$(function(){
		$('#userId').blur(function(){
			$.ajax({
				type:"POST",
				url:"idCheck.tm",
				data:{
					"userId":$('#userId').val()
				},
				success:function(data){
					if(data.trim()=="YES"){
						$('#idchk').html('<b style="font.size:18px;color:blue">사용가능</b>');
					}else{
						$('#idchk').html('<b style="font.size:18px;color:red">사용불가</b>');
					}
				}
			});
		});
닉네임 중복확인
		$('#userNick').blur(function(){
			$.ajax({
				type:"POST",
				url:"nickcCheck.tm",
				data:{
					"userNick":$('#userNick').val()
				},
				success:function(data){
					if(data.trim()=="YES"){
						$('#nickchk').html('<b style="font.size:18px;color:blue">사용가능</b>');
					}else{
						$('#nickchk').html('<b style="font.size:18px;color:red">사용불가</b>'); 
					}
				}
			});
		});
	});*/


/* 비밀번호 체크 */
$(function(){
	  $('#userPw').keyup(function(){
	   $('font[name=passcheck]').text('');
	  }); //#userPw.keyup

	  $('#userPasswordcheck').keyup(function(){
	   if($('#userPw').val()!=$('#userPasswordcheck').val()){
	    $('font[name=passcheck]').text('');
	    $('font[name=passcheck]').html("<span style='color: red'>암호틀림</span>");
	   }else{
	    $('font[name=passcheck]').text('');
	    $('font[name=passcheck]').html("<span style='color: blue'>암호맞음</span>");
	   }
	  }); //#passwordcheck.keyup
	 });

/* 체크확인 보이게 안보이게 */
$(function(){
		$("#passcheck").hide();
	$("#userPasswordcheck").keyup(function(){
		$("#passcheck").show();
		$("#pw-block").hide();
	});
});



