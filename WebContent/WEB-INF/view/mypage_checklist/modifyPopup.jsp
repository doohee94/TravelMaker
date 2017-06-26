<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" type="text/css" href="/resource/step3/css/alopex-ui-default.css" />
 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <style>
  #beforeList, #afterList{
    border: 1px solid #eee;
    width: 142px;
    min-height: 20px;
    list-style-type: none;
    margin: 0;
    padding: 5px 0 0 0;
    float: left;
    margin-right: 10px;
  }
  #beforeList li, #afterList li {
    margin: 0 5px 5px 5px;
    padding: 5px;
    font-size: 1.2em;
    width: 120px;
  }
  </style>
  
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script>
  $( function() {
    $( "#beforeList, #afterList" ).sortable({
      connectWith: ".connectedSortable"
    }).disableSelection();
    
    
    //바뀌기 전 리스트 불러오기
     $("#beforeDay").change(function(){
    	$("#beforeList").empty();
    	for(var i=0; i<5;i++){
    		$("#beforeList").append('<li class="ui-state-default">'+i+'</li>');
    	}
     });
    
     //바꾸고 싶은 날짜 리스트 불러오기
     $("#afterDay").change(function(){ 
    	 $("#afterList").empty();
    	 for(var i=0; i<5;i++){
     		$("#afterList").append('<li class="ui-state-default">'+$(this).val()+i+'</li>');
     	}
      });
    
     //수정버튼을 누르면 상태를 전환해줘준다. 
     $a.page(function() {
		    this.init = function(id, param) {
		        // $a.popup() 이 넘겨받은 data를 param으로 전달.
		      	
		        $('#submit').click( function(){ // close 버튼을 누르면
		        	var state=1;
		        	$a.close(state); // 데이터를 팝업을 띄운 윈도우의 callback에 전달 
		        });
		    }
		});  
  });
  </script>
</head>
<body>

<div align="center">
<h5>일정수정</h5>
</div>

<!--  바꾸기 전 리스트  -->

<div id="before" align="center" style="margin-left:22%;display: inline-block;">
<select id="beforeDay">
	<option>Day1</option>
	<option>Day2</option>
	<option>Day3</option>
</select>
<br/>
<ul id="beforeList" class="connectedSortable">
	
	<%for(int i=0; i<5;i++){ %>
		<li class="ui-state-default">바뀌기저<%=i %>번</li>
	
	<%} %>
</ul>

</div><!-- 바꾸기 전 끝 -->
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<!-- 바꾼 후 리스트 -->
<div id="after" align="center" style="display: inline-block;">
<select id="afterDay">
	<option>Day1</option>
	<option>Day2</option>
	<option>Day3</option>
</select>
<br/>
<ul id="afterList" class="connectedSortable">
  <%for(int i=0; i<5;i++){ %>
		<li class="ui-state-default">바뀐후<%=i %>번</li>
	
	<%} %>
</ul>

</div><!--  바꾼후 끝 -->
<br/><br/>
<div align="center">
<button id="submit">수정</button>
</div>

</body>
<script type="text/javascript" src="../step3/script/alopex-ui.min.js"></script>
</html>