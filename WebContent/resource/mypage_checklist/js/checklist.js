  $( function() {
	  
	  //정렬 될 때 마다 리스트 순서를 불러와서 ajax로 넘겨 준 후 디비에 저장!
	     $.ajax({
     	 url : "/mypage_checklist/showlist.tm"
 	     ,type:"post"
 	     ,contentType:"application/json "
 	     ,data:'2'
 	     ,success:function(data){
 	
 	    for(var i=0; i<data.tour.length; i++){	
 	    	$("#accordion").append('<h3>'+data.tour[i].date+'  <button style="float:right;color:blue;" class="modify">수정</button></h3>'
 	    				+'<div>'
 	    				+'<div class="container">'
 	    				+'<div class="row">'
 	    				+'<div class="col-md-12 board">'
 	    				+'<div class="board-inner">'
 	    				+'<ul class="nav nav-tabs '+i+' " id="myTab">'
 	    				+'<div class="liner"></div></ul> </div> </div> </div> </div></div>');	
 	    	
 	    	for(var j=0; j<data.tour[i].place.length;j++){
 	    		$("."+i).append('<li class="active">'
 	    				+'<a aria-controls="home" role="tab" data-toggle="tab" title="User Experience"> <span class="round-tabs one stemp"></span>'
 	    				+'</a> <p align="center">'+data.tour[i].place[j].title+'</p> </li>'		
 	    		); 	    		
 	    	}//end for 
 	    	
 	    	
	     }//end for 
 	    
 	    
 	    
 	    
 	    
 	     }//end success
      ,error:function(err,status,error){
	         alert("실패!"+err.status+error);
	        
	      }
      });
	  
	  
	//아코디언 제목에 화살표 아이콘 표시
    var icons = {
      header: "ui-icon-circle-arrow-e",
      activeHeader: "ui-icon-circle-arrow-s"
    };
    $( "#accordion" ).accordion({
      icons: icons
    });
    
    //스탬프 클릭했을 때 팝업띄우기
    $(".stemp").click(function(){
    	var stempitem = $(this);
    	$a.popup({
            url : "schedulePopup.tm",
            ifram:true,
            width : 600,
            height : 350,
            callback:function(data){ // $a.close(data) API 사용 시 동작하는 콜백
               if(data !== null){ // 팝업 우측 상단 x 버튼으로 닫을 경우, $a.close(data); 와 같이 data를 넘겨주지 않으므로 data === null이다.
                  if(data == "1"){//성공이 들어올 경우     
                	  stempitem.css( { "background-color" : "pink" } );
                  }else if(data=="-1"){//실패가 들어올경우
                	  stempitem.css( { "background-color" : "green" } );
                  }
               }             
            },
            alias : "flag1",
            xButtonClickCallback : function(el){
               if(el.alias === "flag1"){// 우측 상단 X 버튼으로 닫을 경우 동작하는 콜백
                  if(confirm("저장되지 않은 데이터가 있습니다. 창을 닫으시겠습니까?")){
                     return true; // true를 return 시, 내부적으로 close 동작이 자동 수행됩니다.
                  }else{
                     return false; // false를 return 시, 내부적으로 close하는 동작을 제어 합니다.
                  }
               }
            }
         });
    	
    });
    $(".modify").click(function(){
    	$a.popup({
            url : "modifyPopup.jsp",
            ifram:true,
            width : 600,
            height : 500,
            callback:function(data){ // $a.close(data) API 사용 시 동작하는 콜백
               if(data !== null){ // 팝업 우측 상단 x 버튼으로 닫을 경우, $a.close(data); 와 같이 data를 넘겨주지 않으므로 data === null이다.
                  if(data == "1"){//성공이 들어올 경우          
                	  $(location).attr('href', "checkListFinal.jsp"); //수정된 화면으로 화면 재시작 
                  }
               }             
            },
            alias : "flag1",
            xButtonClickCallback : function(el){
               if(el.alias === "flag1"){// 우측 상단 X 버튼으로 닫을 경우 동작하는 콜백
                  if(confirm("저장되지 않은 데이터가 있습니다. 창을 닫으시겠습니까?")){
                     return true; // true를 return 시, 내부적으로 close 동작이 자동 수행됩니다.
                  }else{
                     return false; // false를 return 시, 내부적으로 close하는 동작을 제어 합니다.
                  }
               }
            }
         });
    	
    });
   
  });