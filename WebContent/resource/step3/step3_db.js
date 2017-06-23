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
	                 state=stateData; //여기서 state 상태값 바꿔서 저장할때 바로 넘기는 작업하면 될듯!
	                 
	                 //완전저장
	                 if(state == 1){
	                	 
	                  var title = [];
	           	      var image = [];
	           	      var addr = [];
	           	      var mapx = [];
	           	      var mapy = [];
	           	      var city =  $("#hiddenCity").val();
	           	      var date="2017-05-02";
	           	      
	           	      //리스트의 정보를 ajax로 넘긴다
	           	      $('#myList > li').each(function(i,item){
	           	         title[i] = $(item).find(".name").text();
	           	         image[i] = $(item).find("img").attr("src");
	           	         addr[i] = $(item).find(".addr").text();
	           	         mapx[i] = $(item).find(".mapx").attr("value");
	           	         mapy[i] = $(item).find(".mapy").attr("value"); 

	           	         //alert(i + '/' + title);
	           	      });
	                	 
	           	     	           	      
	           	      
	           	      
	                	 
	                 }else if(state==0){//임시저장
	                	 
	                 }
	               
	              }
	             
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