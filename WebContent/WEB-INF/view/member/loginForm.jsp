<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <!-- 로그인 페이지 -->
   
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
          <h1 class="text-center ">로그인 </h1>
        </div>
    <div class="main-content">
            
          <div class="input-group ">
            <span class="input-group-addon"><span class="glyphicon glyphicon-user" aria-hidden="true"></span></span>
            <input id="id" type="text" class="form-control" name="id" placeholder="ID">
          </div>
          <div class="input-group">
            <span class="input-group-addon"><span class="glyphicon glyphicon-lock" aria-hidden="true"></span></span>
            <input id="password" type="password" class="form-control" name="password" placeholder="PASSWORD">
          </div>
        
          
          <div class="form-group">
              <a href="#" type="button"  class="btn btn-danger btn-lg btn-block login-button">로그인</a>
          </div>
          
          <div class="form-group">
          <center>
          	<input type="button" class="insert-button" value="ID/PW 찾기" style="background-color:#489CFF" onclick="location.href='serchIdForm.tm'">&nbsp;&nbsp;
          	<input type="button" class="insert-button" value="회원가입" style="background-color:#489CFF" onclick="location.href='signupForm.tm'"></center>
          </div>

          

      
      </div>
    </div>
</div>
</section>

</body>
</html>