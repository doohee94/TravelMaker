<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- jQuery Mobile 기본구조 -->
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css">
<link rel="stylesheet" href="/resource/mobile/css/base.css" />
<script src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
<script
	src="https://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>
<script>
	$(document).on("pagecreate", "#pageone", function() {
		//로그인 상태값을 가져옴
		var state = $("#state").val();
		/*
			10 : 로그인 안됨
			20 : 로그인 실패
			30 : 로그인 성공
		*/
		if(state == '10'){
			alert("로그인이 필요한 페이지 입니다.");
		}else if(state == '20'){
			alert("로그인 정보가 잘못되었습니다");
		}
		
		$("#btn_login").on("click", function() {
			//로그인이 완료되면 30으로 변경
			$("#state").val(30);
		});
	});
</script>
</head>
<body>

	<div data-role="page" id="pageone" data-position="fixed">
		<div data-role="header" data-theme="b">
			<img id="logo" src="/resource/mobile/images/samplelogo.png" />
		</div>

		<div data-role="main" class="ui-content">
			<form action="login.tm" method="post" > 		
	       	    <label for="text-3">ID</label>
	     		<input type="text" data-clear-btn="true" name="userId" id="text-3">
	       	    <label for="text-3">Password</label>
	     		<input type="password" data-clear-btn="true" name="userPw" id="text-3">
	     		<input type="hidden" id="parstempNum" name="parstempNum"  value="${parstempNum }">
	     		<input type="hidden" id="state" name="state" value="${state }">
	      		<button type=submit class="ui-btn" id="btn_login">LogIn</button>
      		</form>	
		</div>
		<div data-role="footer"data-position="fixed" data-theme="b">
       	  	<div data-role="main" class="ui-content"></div>
        </div>
	</div>

</body>
</html>
