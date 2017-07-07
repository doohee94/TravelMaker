<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head lang="utf-8">
    <meta charset="UTF-8">
    <title>TravelMaker Mobile</title>
    
   <!-- 1. viewport 설정 -->
   <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scaleable=no">

   <!-- jquery mobile -->
   <link rel="stylesheet" href="http://code.jquery.com/mobile/1.3.2/jquery.mobile-1.3.2.min.css" />
   <!-- 지정 css -->
   <link rel="stylesheet" href="/resource/mobile/css/base.css" />
   </head>
   
   <body>

   <!-- 2. page  -->
   <div id="home" data-role="page">

       <!-- 3. header -->
       <div data-role="header" data-position="fixed" data-theme="a">
          <img id="logo" src="/resource/mobile/images/samplelogo.png"/>
       </div>
       
       <!-- 4. content --> 
       <div data-role="content" data-theme="d">
       	<form action="/tmmobile/mstemp.tm" method="post" > 		
       	    <label for="text-3">ID</label>
     		<input type="text" data-clear-btn="true" name="userId" id="text-3">
       	    <label for="text-3">Password</label>
     		<input type="password" data-clear-btn="true" name="userPw" id="text-3">
     		<input type="hidden" id="parstempNum"value="<%=request.getParameter("parstempNum")%>">
      		<button type=submit class="ui-btn" id="btn_login">LogIn</button>
  
       </form>		
       </div>
       <!-- 5.footer -->
       <div data-role="footer"data-position="fixed" data-theme="a">
       	  	<div data-role="main" class="ui-content">
  			</div>
       </div>

   </div> 
    <!-- jquery  -->  
   <script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
   <!-- jquery mobile -->
   <script src="http://code.jquery.com/mobile/1.3.2/jquery.mobile-1.3.2.min.js"></script>

</body>
</html>