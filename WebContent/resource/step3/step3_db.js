$(function(){
	
	//저장버튼
	   $("#save").click(function(){
	      var state =0;
	      $a.popup({
	             url: "save.tm" //
	           , iframe: true // default
	           , width: 600
	           , height : 250
	           , callback:function(stateData){ // $a.close(data) API 사용 시 동작하는 콜백
	              if(stateData != null){ // 팝업 우측 상단 x 버튼으로 닫을 경우, $a.close(data); 와 같이 data를 넘겨주지 않으므로 data === null이다.
	                //여기서 state 상태값 바꿔서 저장할때 바로 넘기는 작업하면 될듯!
	                 //완전저장
	                 if(state == 1){
	                	 
	  
	                     var group_number={
	                         	 "group_num":group_num
	                          }
	                          
	                          $.ajax({
	                         	 url : "/step/find_id.tm"
	            	            	     ,type:"post"
	            	            	     ,contentType:"application/json "
	            	            	     ,data:JSON.stringify(group_number)
	            	            	     ,success:function(_IDdata){
	            	            	   		    
	            	            	   		    
	            	            	   for(var x=0; x<_IDdata.length; x++){
	            	            		   
	            	            		   var place =[];
	            	            	        //select box에서 선택된 값의 인덱스
	            	            	          var index = $("#DaySelectBox option").index($("#DaySelectBox option:selected"));
	            	            	          for(var j=0; j<$("#DaySelectBoxNum").val(); j++){
	            	            	        	  
	            	            	        	//만약에 여기서 셀렉트 값이 day1 이면 배열 day[1]에 저장 
	            	            	              if(index == j){

	            	            	        		  $('#myList > li').each(function(i,item){
	            	            	                      
	            	            	                      var list={
	            	            	                    		 "num":i,
	            	            	        	           	    "title":$(item).find(".name").text(),
	            	            	        	           	    "addr":$(item).find(".addr").text(),
	            	            	        	           	    "image":$(item).find("img").attr("src"),
	            	            	        	           	    "mapx":$(item).find(".mapx").attr("value"),
	            	            	        	           	    "mapy":$(item).find(".mapy").attr("value"),  
	            	            	        	           	    "check":"0",
	            	            	        	           	 "oneline_review":""
	            	            	                      }
	            	            	                      
	            	            	                      place[i] = list;
	            	            	                      
	            	            	                   });
	            	            	        		  
	            	            	        		  day[j] = place;
	            	            	        	  }
	            	            	          }

	            	            	          var tour =[$("#DaySelectBoxNum").val()];
	            	            	          
	            	            	          for(var i=0; i<$("#DaySelectBoxNum").val(); i++){
	            	            	          	tour[i] = {
	            	            	          			
	            	            	          			"date" : "day"+(i+1),
	            	            	          			"city" : "",
	            	            	          			"place":day[i]
	            	            	          			
	            	            	          	}
	            	            	          }      
	            	            	         var city =  $("#hiddenCity").val(); 
	            	            	   	 
	            	            	   	    
	            	            	   	     var schedule={
	            	            	   	    		"_id":_IDdata[x]._id,
	            	            	   	    		"schedule_num":"1",
	            	            	   	    		"member_id":_IDdata[x].member_id,
	            	            	   	    		"friend":"5",
	            	            	   	    		"group_num":group_num,
	            	            	   	    		"tour_title":"즐거운 여행~",
	            	            	   	    		 "tour":tour,
	            	            	   	    		"save_state":stateData
	            	            	   	      }                     
	            	            	          //정렬 될 때 마다 리스트 순서를 불러와서 ajax로 넘겨 준 후 디비에 저장!
	            	            	   	     $.ajax({
	            	            	        	 url : "/step/listSave.tm"
	            	            	    	     ,type:"post"
	            	            	    	     ,contentType:"application/json "
	            	            	    	     ,data:JSON.stringify(schedule)
	            	            	    	     ,success:function(data){    	    
	            	            	    	     }
	            	            	         ,error:function(err,status,error){
	            	            		         alert("리스트저장실패!"+err.status+error);
	            	            		        
	            	            		      }
	            	            	         });
	            	            	          
	            	            		   
	            	            	   }//end for 
	            	            	    	 
	            	            	     
	            	            	     }//end success 
	            	                 ,error:function(err,status,error){
	            	        	         alert("_id 찾기실패!"+err.status+error);
	            	        	        
	            	        	      }//end 아이디 찾기 error
	                         	 
	                          });//end find _id ajax
	                	
	                	 
	           	   
	                
	                	 
	                 
	                 }//end not null if
	              }//end state if
	             
	           }//end calback
	           ,alias: "flag1"
	               , xButtonClickCallback : function(el){  // 우측 상단 X 버튼으로 닫을 경우 동작하는 콜백
	                     if(el.alias === "flag1"){
	                         if(confirm("일정을 다시 계획 하시겠어요?")){
	                             return true; // true를 return 시, 내부적으로 close 동작이 자동 수행됩니다.
	                         }else{
	                             return false; // false를 return 시, 내부적으로 close하는 동작을 제어 합니다.
	                         }
	                     }
	           }         
	      });
	      });//end savaBtn
	   
	
	   
	   
	
});