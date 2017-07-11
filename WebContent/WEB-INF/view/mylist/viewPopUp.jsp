<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="/resource/mylist/js/jquery.techbytarun.excelexportjs.min.js"></script>
<title>상세일정 엑셀</title>
</head>
<body>
<div  id="tableContainer">
	<table id="myTable" border=3px;>
		<thead>
			<tr id="thead_tr">
				<!--  day 출력부분 -->
			</tr>
		</thead><!-- end 테이블 헤더 -->
	<!-- 일정 출력 부분 -->
		<tbody  id="tbody">
		</tbody><!-- end테이블 바디 -->


	</table><!-- 테이블 끝 -->
	</div><!--  컨테이너 끝 -->
	
	<div>
		<a id="export">엑셀로 저장하기</a>
	</div>
	

</body>
<script type="text/javascript">
var _id = '${_id}';
var _idcheck={
	"_id" : _id
}
// 변수 지정----------------------------------------------
 var tour = [];
var schduleNum = [];
var title = "";
//테이블 생성 ajax------------------------------------------
$.ajax({
	
	url : "/mylist/findSchedule.tm"
			,type:"post"
		    ,contentType:"application/json "
		    ,data:JSON.stringify(_idcheck)
		     ,success:function(data){
		    	//투어타이틀------------------
		    	title = data.tour_title;
		    	
		    	//day 붙이기------------------------
		    	for(var i=0; i<data.dayNum; i++ ){
		    		$("#thead_tr").append('<th>'+'day'+(i+1)+'</th>');
		    		tour[i] = data.tour[i];
		    		schduleNum[i] = data.tour[i].place.length;
		    	}
		    	 
		    	//일정 최대 길이 구하기
		    	var max = schduleNum[0]; 
		    	for(var i=0; i<schduleNum.length; i++){
		    		if(schduleNum[i] > max){
		    			max = schduleNum[i];
		    		}
		    	}
		    	
		    	 //day별 스케쥴 출력------------------
		    	 for(var i=0; i<max; i++){
		    		
		    		 $("#tbody").append(
		 		    			'<tr class="tr'+i+'"></tr>'); 
		    		 for(var j=0; j<data.dayNum; j++){
		    			 
		    			if(tour[j].place.length != 0 &&tour[j].place[i] != null ){
		    				 $(".tr"+i+"").append(
			 		    				'<td>'+tour[j].place[i].title+'</td>'	
			 		    		 ); 
		    				
		    			}else if(tour[j].place.length <max && tour[j].place[i] == null){
		    				$(".tr"+i+"").append(
		 		    				'<td> </td>'	
		 		    		 ); 
		    				
		    			}else{
		    				$(".tr"+i+"").append(
		 		    				'<td> </td>'	
		 		    		 ); 
		    			}

		    		 }//end for j 
		    		
		    		 
		    	 }//end for i
		    	 
		     }//end success
			,error:function(err,status,error){
				alert("상세페이지생성실패!"+err.status+error);
			}	
});//end ajax;

$(function(){
//엑셀저장-------------------------------------------------------------
	var uri = $("#myTable").excelexportjs({
		
		containerid:"tableContainer"
		,datatype:"table"
		,worksheetName:"나만의 워크시트"
		,returnUri:true
	});

	alert(uri);
	$("#export").attr("download", "하이").attr("href",uri).attr("target","_blank");
}); //end function

</script>

</html>