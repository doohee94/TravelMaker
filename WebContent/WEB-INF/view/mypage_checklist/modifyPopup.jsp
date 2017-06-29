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
//     	for(var i=0; i<5;i++){
//     		$("#beforeList").append('<li class="ui-state-default">'+i+'</li>');
//     	}
     });
    
     //바꾸고 싶은 날짜 리스트 불러오기
     $("#afterDay").change(function(){ 
    	 $("#afterList").empty();
//     	 for(var i=0; i<5;i++){
//      		$("#afterList").append('<li class="ui-state-default">'+$(this).val()+i+'</li>');
//      	}
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
</select>
<br/>
<ul id="beforeList" class="connectedSortable">
	
</ul>

</div><!-- 바꾸기 전 끝 -->
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<!-- 바꾼 후 리스트 -->
<div id="after" align="center" style="display: inline-block;">
<select id="afterDay">
</select>
<br/>
<ul id="afterList" class="connectedSortable">
  
</ul>

</div><!--  바꾼후 끝 -->
<br/><br/>
<div align="center">
<button id="submit">수정</button>
</div>

</body>
  <script type="text/javascript" src="/resource/step3/script/alopex-ui.min.js"></script>
<script type="text/javascript">
$(function(){
	
	//셀렉트 박스 날짜 넣기 -----------------------------------------------------------------------
	$.ajax({
		url :"/mypage_checklist/modifyPopupList.tm",
		type:"get",
		//data:"128",
		contentType:"application/json",
		dataType:"JSON",
		success:function(data){
			//데이터에 투어에 플레이스에 타이틀 
			for(var i=0; i<data.tour.length && data.tour[i].place != null;i++){
				$("#beforeDay").append("<option>"
						+data.tour[i].date
						+"</option>");	
				
				$("#afterDay").append("<option>"
						+data.tour[i].date
						+"</option>");	
				
			}//end i
			
			//day1에 리스트 띄워주기
			for(var j=0; j<data.tour[0].place.length ; j++){
				$("#beforeList").append("<li  class='ui-state-default'>"
						+data.tour[0].place[j].title
						+"</li>");
				$("#afterList").append("<li  class='ui-state-default'>"
						+data.tour[0].place[j].title
						+"</li>");

	}//end j
			
		},
		error:function(err,status,error){
	        //alert("실패!"+err.status+error);
	       
	     }		
		
		
		
	})//end ajaz
	
	//이전날짜 셀렉트 박스를 바꿀 경우 -------------------------------------------------------------
	$("#beforeDay").change(function(){
		$("#beforeList").empty();
		$.ajax({
			
			url :"/mypage_checklist/modifyPopupList.tm",
			type:"get",
			//data:"128",
			contentType:"application/json",
			dataType:"JSON",
			success:function(data){
				//데이터에 투어에 플레이스에 타이틀 
					for(var i=0; i<data.tour.length && data.tour[i].place != null;i++){
						
						
						for(var j=0; j<data.tour[i].place.length ; j++){
							if($("#beforeDay option:selected").text() == data.tour[i].date)
							{
								$("#beforeList").append("<li  class='ui-state-default'>"
										+data.tour[i].place[j].title
										+"</li>");
							}//end if 
						
					}//end j
				}//end i
			},
			error:function(err,status,error){
		        alert("실패!"+err.status+error);
		       
		     }		
		});//end ajax
	});//end before change
	
	
	//이후날짜 셀렉트 박스를 바꿀 경우 -------------------------------------------------------------
	$("#afterDay").change(function(){
		$("#afterList").empty();
		$.ajax({
			
			url :"/mypage_checklist/modifyPopupList.tm",
			type:"get",
			//data:"128",
			contentType:"application/json",
			dataType:"JSON",
			success:function(data){
				//데이터에 투어에 플레이스에 타이틀 
					for(var i=0; i<data.tour.length && data.tour[i].place != null;i++){							
						for(var j=0; j<data.tour[i].place.length ; j++){
							if($("#afterDay option:selected").text() == data.tour[i].date)
							{
								$("#afterList").append("<li  class='ui-state-default'>"
										+data.tour[i].place[j].title
										+"</li>");
							}//end if 
						
					}//end j
				}//end i
			},
			error:function(err,status,error){
		        alert("실패!"+err.status+error);  
		     }		
		});//end ajax
	});//end before change
	
	
});
</script>

</html>