$(function(){
		
		
		//한줄평 안보이게하기
		$("#one-line").hide();
		
		//success버튼 누르면 한줄평 보이게 하기
		$(".funkyradio-info").click(function(){
			if($("#radio5").is(':checked')){
				$("#state").val("1"); //success누른상태
				$("#one-line").show();
			}
			else{
				$("#state").val("-1");
				$("#one-line").hide();
			}
		});
		
		$a.page(function() {
		    this.init = function(id, param) {
		        // $a.popup() 이 넘겨받은 data를 param으로 전달.
		      	
		        $('#submit').click( function(){ // close 버튼을 누르면 
		  			var state = $("#state").val();
		  			//한줄평이랑 상태 디비에 저장! 에이작스 써야할둡
		  			
		  			var data = {
		  					"state":state,
		  					"one_line":$("#one_line_text").val()
		  			}
		  			
		        	$a.close(data); // 데이터를 팝업을 띄운 윈도우의 callback에 전달 
		        });
		    }
		});
		
		
		
	});