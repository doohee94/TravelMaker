<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- jQuery Mobile 기본구조 -->
<% session.setAttribute("parstempNum", "4"); %>
<% session.setAttribute("userId", "test"); %>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>TravelMaker Mobile</title>
    
   <!-- 1. viewport 설정 -->
   <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scaleable=no">

   <!-- 2. css, js import -->
   <link rel="stylesheet" href="http://code.jquery.com/mobile/1.3.2/jquery.mobile-1.3.2.min.css" />
   <link rel="stylesheet" href="/resource/mobile/css/base.css" />
   </head>
   
   <body>

   <!-- 3. page  -->
   <div id="home" data-role="page">

       <!-- 4. header -->
       <div data-role="header" data-position="fixed" data-theme="a">
          <img id="logo" src="/resource/mobile/images/samplelogo.png"/>
       </div>
       
       <!-- 5. content --> 
       <div data-role="content" data-theme="d">
       		<div class="images">
           <img id="stamp" src="/resource/mobile/images/d-stamp.png"/>
           <input type="hidden" id="userId"value="<%=session.getAttribute("userId")%>">
           <input type="hidden" id="parstempNum"value="<%=session.getAttribute("parstempNum")%>">
           <br/><br/><br/><br/><br/><br/><br/><br/>
           </div>
           <button class="ui-btn ui-corner-all" id="btn-ok">스템프 찍기</button>
           <button class="ui-btn ui-corner-all" id="btn-calcel">취소 하기</button>   
       </div>

   </div>   
   <script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
   <script src="http://code.jquery.com/mobile/1.3.2/jquery.mobile-1.3.2.min.js"></script>
   <script type="text/javascript" src="/resource/mobile/js/function.js"></script>
</body>
</html>