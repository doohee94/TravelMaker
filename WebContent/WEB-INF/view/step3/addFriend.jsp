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

<div align="center" id="all">
<!--  결과 나오는 부분-->
</div>

<input type="hidden" id="group_num"/>
<input type="hidden" id="_id"/>
</body>
<!-- ajax써서 아이디값 받아오기!!!!!!! -->
<script type="text/javascript">
$(function(){
	
	$a.page(function() {
	    this.init = function(id, param) {
	        // 팝업창 내 $a.page.init 함수 두번째 인자로 전달
	        $('#group_num').val(param["group_num"]);
	        $('#_id').val(param["_id"]);
	               
	        $('#all').on('click', '#addBtn', function() {
	        	
	        	var addFriend={
	        			 "_id":param["_id"],
	        			 "group_num" :param["group_num"],  
	        			 "tour_title": param["tour_title"],
	        			 "friend" : param["friend"],
	        			 "save_state":param["save_state"],
	        			 "member_id" : $("#idContent").val().trim()
	        			//나중에 필요한거 추가
	        	}
	        	
	    		$.ajax({
	    			url:"/step/addFriendMongo.tm"
	    				,type:"post"
	    				,contentType:"application/json "
	    		        ,data:JSON.stringify(addFriend)
	    		        ,success:function(data){
	    		        	
	    		        	if(data == "OVER"){
	    		        		alert("더이상 친구를 추가 할 수 없습니다.");
	    		        	}else if(data =="OVERLAP"){
	    		        		alert("이미 추가된 친구입니다. ");
	    		        	}else{
	    		        		alert("친구추가를 성공하였습니다.");
	    		        		$a.close("YES");
	    		        	}
	    		       		
	    		        			
	    		        }//end success
	    				,error:function(err,status,error){
	    	   	        // alert("실패!"+err.status+error);
	    	 	        
	    	  	      }//end err
	    			
	    			
	    		});//end ajax
	    		
	    		
	    		
	    	});//end click add
	        
	        
	    }
	});//end popup

	$("#searchBtn").click(function(){
		var friendId = {
				"id":$("#searchFriend").val()
		}
		
		$.ajax({
			url:"/step/searchFriend.tm"
			,type:"post"
			,contentType:"application/json "
	        ,data:JSON.stringify(friendId)
	        ,success:function(data){
	        	$("#all").empty();
	        	
	        	if(data =="0"){
	        		$("#all").append('<img src="/resource/step3/step3_image/no.png"/>'
	        				+'<div  style="display: inline-block;">존재하는 아이디가 없습니다</div>');
	        	}else{
	        		
	        		$("#all").append('<img src="/resource/step3/step3_image/people.png" style="display: inline-block;"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'
	        		+'<input type="text" id="idContent" readonly="readonly" value="'+data+'"/> <br/><br/>'
	        		+'<button id="addBtn">추가</button><br/>'		
	        		);
	        	}
	        }
			,error:function(err,status,error){
   	         alert("실패!"+err.status+error);
 	        
  	      }
				
		}); //end ajax
	});//click find
	
	
})//end functino

</script>
</html>