<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- jQuery Mobile 기본구조 -->
<!DOCTYPE html>
<html>
<head lang="utf-8">
    <meta charset="UTF-8">
    <title>TravelMaker Mobile</title>

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
       		<br/><br/>
       		<div class="images">
           		<img id="stamp" src="/resource/mobile/images/d-stamp.png"/>
           		<input type="hidden" id="userId"value="<%=session.getAttribute("userId")%>">
           		<input type="hidden" id="parstempNum"value="<%=session.getAttribute("parstempNum")%>">
           		<br/><br/><br/><br/><br/><br/><br/><br/>
           </div>
           <button class="ui-btn ui-corner-all" id="btn-ok">스템프 찍기</button>
           <button class="ui-btn ui-corner-all" id="btn-calcel">취소 하기</button>   
       </div>


   <!-- 지정 js -->
   <script type="text/javascript">
   		$(document).on('click', '#btn-ok', function(e){
   			//hidden 태크에 저장되어있는 userId값과 parstempNum 값을 변수처리
   			var userId = $("#userId").val();
   			var parstempNum = $("#parstempNum").val();
   			//변수로 지정된 값을 통해 Ajax로 db에 입력처리함 성공시 이미지 변환시킴
   			// ajax데이터 타입 post형식 보내는값 userId, parstempNum
   			alert("아이디는 : ["+userId+"] 장소번호는 : ["+parstempNum+"]");
   			$.ajax({
   				type : "POST",
   				url : "/tmmobile/insert.tm",
   				data : {
   					userId : userId,
   					parstempNum : parstempNum,
   				},
   				success : function(data){
   					alert("입력되었습니다.");
   					//이미지 완료형으로 바꾸는 쿼리
   					$("#stamp").attr("src","/resource/mobile/images/stamp.png");
   				},
   				error : function(err){
   					alert("작성실패"+err.status);
   				} 
   			});
		});

   
   </script>
   </div> 
</body>
</html>