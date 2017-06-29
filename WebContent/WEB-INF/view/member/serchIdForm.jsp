<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 아이디 찾는 페이지 -->

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">        

<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script> 

<!DOCTYPE html>
<html>
<head>

<script type="text/javascript">
/* 유효성처리 */
$(function(){
 $("#insert").click(function(){ 
	  
	/* 이름정규화 */
		var reg_name=/^[가-힣]+$/;
		if(!(reg_name.test($("#name").val()))){
			alert("이름을 다시 입력해주세요");
			$("#name").focus();
			return false;
		}
		/* 이메일 정규화 */
		 var reg_email=/^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
		if(!(reg_email.test($("#email").val()))){
			alert("이메일을 다시 입력해주세요");
			$("#email").focus();
			return false;
		}
		$("#frm").submit();
	});
});
</script>

<!-- CSS -->
<link rel="stylesheet" type="text/css" href="/resource/member/css/login.css">


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form id="frm" method="post" action="serchIdOkForm.tm">
<section class="login-info">
<div class="container">
  <div class="row main">
       <div class="form-header">
          <h1 class="text-center ">ID 찾기</h1>
        </div>
    <div class="main-content">
            
          <div class="input-group ">
            <span class="input-group-addon"><span class="glyphicon glyphicon-user" aria-hidden="true"></span></span>
            <input id="name" type="text" class="form-control" name="userName" placeholder="NAME" required="required">
          </div>
          <div class="input-group">
            <span class="input-group-addon"><span class="glyphicon glyphicon-envelope" aria-hidden="true"></span></span>
            <input id="email" type="text" class="form-control" name="userEmail" placeholder="EMAIL" required="required">
          </div>
        
          
          <div class="form-group">
          		<center>
          		<input type="submit" class="insert-button" value="확인" style="background-color:#489CFF" >&nbsp;&nbsp;
          		<input type="button" class="insert-button" value="취소" style="background-color:#d6564f" onClick="history.back()"></center>
          </div>
  
      
      </div>
    </div>
</div>
</section>
</form>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
</script>
</body>
</html>