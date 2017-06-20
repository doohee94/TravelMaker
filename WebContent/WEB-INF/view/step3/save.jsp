<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <!--  일정 추가 팝업
 	   임시저장을 누르면 임시저장 상태로 들어가고 완료를 누르면 완성된 상태로 들어가게 된다. 
 			 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Popup Data</title>
<!--  css -->
<style type="text/css">
.btn{

	background-color: #ffffff;
	border : 3x solid  #9ec3ff;
	width: 100px;
	height: 50px;
}


</style>    

<!-- 팝업 js파일/cnd -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript"  src="/resource/step3/script/alopex-ui.min.js"></script>  

</head>
<body>
 
 <article >
 
 <h1 align="center">나의 일정에 추가하시겠습니까?</h1>
 <br/>
 <div align="center">
 <button class="btn" id="tempSave">임시저장</button> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 <button class="btn" id="save">완료</button>
 </div>
 
 </article>
 
 
 
</body>

<!--  메인창에 결과 넘겨서 저장상태 넘기는 함수  -->
<script type="text/javascript">
$a.page(function() {
    this.init = function(id, param) {
        // 부모로부터 데이터 받아오는 거
        // var data = param["부모에서 보낸 이름"];
   
        $('#tempSave').click( function(){ // 임시저장버튼을 눌렀을 때 
        	var state = 0;
            $a.close(state); // 데이터를 팝업을 띄운 윈도우의 callback에 전달 
        });
        
        $('#save').click( function(){ // 저장버튼을 눌렀을 때 
        	var state = 1;
            $a.close(state); // 데이터를 팝업을 띄운 윈도우의 callback에 전달 
        });
        
    }
});



</script>



</html>