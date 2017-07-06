 /* 유효성처리 */
 $(function(){
  $("#update").click(function(){ 
		
		/* 아이디 정규화 */
	  var reg_id=/^[a-z0-9_]{4,20}$/;
		if(!(reg_id.test($("#userId").val()))){
			alert("ID는 5자 이상이여야 합니다");
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

 
	/* 수정버튼 눌림시 완료버튼 뜨게 */

	$(function(){
			$("#insertbutton").hide();
			$("#userPasswordcheck").hide();
		$("#updatebutton").click(function(){
			$("#insertbutton").show();
			$("#userPasswordcheck").show();
			$("#updatebutton").hide();
			
		});
		/* 수정버튼 누르면 readonly 해제 */
		$("#updatebutton").click(function(){
			$("#userPw").removeAttr("readonly");
			$("#userPasswordcheck").removeAttr("readonly");
			$("#userName").removeAttr("readonly");
			$("#userNick").removeAttr("readonly");
			$("#userTel").removeAttr("readonly");
			$("#userEmail").removeAttr("readonly");
			$("#userCity").removeAttr("disabled");
			$("#userBorough").removeAttr("disabled");
			$("#selOne").removeAttr("disabled");
			$("#selTwo").removeAttr("disabled");
		});
	});
	
	/* 비밀번호 체크 */
	$(function(){
		  $('#userPw').keyup(function(){
		   $('font[name=passcheck]').text('');
		   $('font[name=passcheck]').text('');
		  }); //#userPw.keyup

		  $('#userPasswordcheck').keyup(function(){
		   if($('#userPw').val()!=$('#userPasswordcheck').val()){
		    $('font[name=passcheck]').html("<span style='color: red'>암호틀림</span>");
		   }else{
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