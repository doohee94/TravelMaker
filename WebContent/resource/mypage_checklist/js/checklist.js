  $( function() {
	  
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
    $("#modify").click(function(){
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