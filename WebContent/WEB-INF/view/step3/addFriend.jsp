<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <!--  친구 추가 팝업! -->
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
/*아이디 출력하는 textField*/
#idContent{
 	font-size: 25px;
 	display: inline-block;
 	border:none;
}
/*아이디 추가하는 버튼*/
#addBtn{
	background-color: #ffffff;
	border : 3x solid  #9ec3ff;
	width: 300px;
	height: 30px;
}
/*친구검색하는 textField*/
#searchFriend{
	
	width: 350px;
	height : 50px;
}
/*친구찾는 버튼*/
#searchBtn{
	height : 50px;
	background-color: #ffffff;
	border : 3x solid  #9ec3ff;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript"  src="/resource/step3/script/alopex-ui.min.js"></script>  
<title>Insert title here</title>
</head>
<body>

<form>

<div align="center">
<input type="text" id="searchFriend" name="searchFriend" placeholder="친구의 ID 혹은 닉네임을 입력하세요!"/>
<input type="button" id="searchBtn" name="searchBtn" value="친구찾기"/>
</div>
</form>
<br/>
<!--  친구 아이디 나오는 부분 -->

<div align="center">
<%//if(){ %> <!--  만약 받아온 아이디가 있ㅇ면 출력 -->
<img src="step3_image/people.png" style="display: inline-block;"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="text" id="idContent" readonly="readonly"/> <br/><br/>
<button id="addBtn">추가</button>
<br/>
<%//}else{ %> <!--  받아오는 아이디가 없으면 밑에 출력 -->
<img src="/resource/step3/step3_image/no.png""/>
<div  style="display: inline-block;">존재하는 아이디가 없습니다</div>
<%//} %>
</div>
</body>
<!-- ajax써서 아이디값 받아오기!!!!!!! -->
<script type="text/javascript">




</script>
</html>