<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- ID 결과 페이지 -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">        
    
<!DOCTYPE html>
<html>
<head>

<!-- CSS -->
<link rel="stylesheet" type="text/css" href="/resource/member/css/loginSeach.css">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<section class="login-info">
<div class="container">
  <div class="row main">
       <div class="form-header">
          <h1 class="text-center ">ID 찾기</h1>
        </div>
    <div class="main-content">
            
          <div class="input-insert ">
            <input id="id" type="text" class="form-control" name="id" value="${dto.userId }" disabled><br/>
          </div>       
          
          <div class="form-group">
          <center>
          		<input type="button" class="insert-check-button" value="로그인"  onclick="location.href='loginForm.tm'">&nbsp;&nbsp;
          		<input id="btnid" type="button" class="insert-check-button" value="ID찾기"  onclick="location.href='serchIdForm.tm'">
          		<input id="btnpw" type="button" class="insert-check-button" value="PW찾기"  onclick="location.href='serchPwForm.tm'">&nbsp;&nbsp;
          		<input type="button" class="insert-cancel-button" value="취소" onClick="history.back()"></center>
          </div>
  
      
      </div>
    </div>
</div>
</section>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>  
<script type="text/javascript">
	$("#btnid").hide();
	$("#btnpw").show();
	if($("#id").val() == "결과가 없습니다"){
		$("#btnid").show();	
		$("#btnpw").hide();	
	}
</script>

</body>
</html>