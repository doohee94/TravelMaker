<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>login page</title>
<!-- css -->
<link rel="stylesheet" href="/resource/login/css/login.css">
</head>
<body>
<div class="logo">
	<img class="button-search" src="/resource/login/images/samplelogo.png"/>
</div>
<br/>
<form class="form-container">
<div class="form-title"><h2>Login</h2></div>
<div class="form-title">ID</div>
<input class="form-field" type="text" name="id" id="id"/><br />
<div class="form-title">Password</div>
<input class="form-field" type="password" name="password" id="password" /><br />
<div class="submit-container">
	<a href="#"><img class="btn" id="btn-login" src="/resource/login/images/login.png"/></a>
	<a href="#"><img class="btn" id="btn-cancel" src="/resource/login/images/cancel.png"/></a>
</div>
</form>
	<!-- jquery -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<!-- function -->
	<script type="text/javascript" src="/resource/login/js/function.js" ></script>
</body>
</html>