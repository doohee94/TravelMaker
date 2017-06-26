<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- ID 결과 페이지 -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">        
    
<!DOCTYPE html>
<html>
<head>

<!-- CSS -->
<link rel="stylesheet" type="text/css" href="/resource/member/css/login.css">

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
            <input id="id" type="text" class="form-control" name="id" disabled><br/>
          </div>       
          
          <div class="form-group">
          <center><input type="button" class="insert-button" value=비밀번호찾기 style="background-color:#489CFF" onclick="location.href='serchPwForm.tm'">&nbsp;&nbsp;
          		<input type="button" class="insert-button" value="취소" style="background-color:#d6564f" onClick="history.back()"></center>
          </div>
  
      
      </div>
    </div>
</div>
</section>

</body>
</html>