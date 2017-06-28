
//채팅창

	function openNav() {
	    $("#mySidenav").css("width","300px");
	    $("#main").css("margin-right","300px");
	}	
	function closeNav() {
	    $("#mySidenav").css("width","0px");
	    $("#main").css("margin-right","0px");
	    
	}
	
$( function() {
	
	//day 별 리스트 저장 
	//alert($("#DaySelectBoxNum").val());	
	//var day = []; // 날짜 수 만큼 만들어져서 list를 저장하는 배열 
	$("#DaySelectBox").change(function(){
		
		   $("#myList").empty(); 
		});
	//경로 최적화 버튼 눌렀을 경우
	   $("#distanceCal").click(function(){
	      
	      var title = [];
	      var image = [];
	      var addr = [];
	      var mapx = [];
	      var mapy = [];
	      

	      //리스트의 정보를 ajax로 넘긴다
	      $('#myList > li').each(function(i,item){
	         title[i] = $(item).find(".name").text();
	         image[i] = $(item).find("img").attr("src");
	         addr[i] = $(item).find(".addr").text();
	         mapx[i] = $(item).find(".mapx").attr("value");
	         mapy[i] = $(item).find(".mapy").attr("value"); 

	         //alert(i + '/' + title);
	      });
	      
	      var listInfo = {
	            "image":image,
	            "title":title,
	            "addr":addr,
	            "mapx":mapx,
	            "mapy":mapy
	      };

	      $.ajax({

	         url : "/step/distanceCal.tm"
	         ,method:"post"
	            ,contentType:"application/json "
	            ,data:JSON.stringify(listInfo)
	            ,dataType:"JSON"
	            ,success:function(data){
	            	  
	            	  
	            	  $("#myList").empty();
	            	  
	            	   for(var i=0; i<data.title.length;i++){
	            		   
	            		  $("#myList").append(' <li class="list-group-item remove draggable"  style="color:#000;"> <div class="col-xs-12 col-sm-3">'+
	                              '<img src="'+data.image[i]+'" style="width:62px; height:62px" class="img-responsive img-circle"  /></div>'+
	                              ' <div class="col-xs-12 col-sm-9" align = "center">' +
	                              '<span class="name" style="color:#000;">'+data.title[i]+'</span><br/>'+
	                              '<span style="color:#000;" class="addr" >'+data.addr[i]+'</span>'+
	                              '<input type="hidden" class="mapx" value="'+data.mapx[i]+'"/>'+
	                              '<input type="hidden" class="mapy" value="'+data.mapy[i]+'"/>'+
	                              '</div><div class="clearfix"></div></li>');

	            	   }//end for
//--------------------------------지도에 새로 바뀐경로 찍어주기-----------------------------------------------	            	   
	            	   var arrayX = [];
	            	   var arrayY = [];
	            	 //리스트가 바뀔 때마다 위도, 경도 정보 가져와 배열에 저장하기
	                   $('#myList > li').each(function(i,item){
	                     var mapx = $(item).find(".mapx").attr("value");
	                     var mapy = $(item).find(".mapy").attr("value");
	                     
	                     arrayX[i] = mapx;
	                     arrayY[i] = mapy;
	                     index++;
	                     
	                   });	                   
	                 
	                 /*리스트 정보를 지도에 경로 표시*/
	                 var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	                  mapOption = { 
	                      center: new daum.maps.LatLng(arrayY[0], arrayX[0]), // 지도의 중심좌표
	                      level: 3 // 지도의 확대 레벨
	                  };  

	                 var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	                 
	                 // 선을 구성하는 좌표 배열입니다. 이 좌표들을 이어서 선을 표시합니다
	                 var linePath=[];
	                 for(var i=0; i<arrayX.length; i++){
	                    linePath[i] = new daum.maps.LatLng(arrayY[i], arrayX[i]);
	                 }
	                 //선 UI 설정
	                 var polyline = new daum.maps.Polyline({
	                    path: linePath, // 선을 구성하는 좌표배열 입니다
	                     strokeWeight: 5, // 선의 두께 입니다
	                     strokeColor: '#f00', // 선의 색깔입니다
	                     strokeOpacity: 0.7, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
	                     strokeStyle: 'solid' // 선의 스타일입니다
	                 });
	                 
	                 // 지도를 재설정할 범위정보를 가지고 있을 LatLngBounds 객체를 생성합니다
	                 var bounds = new daum.maps.LatLngBounds();
	                 
	                 var i, marker;
	                 for (i = 0; i < linePath.length; i++) {
	                     // 배열의 좌표들이 잘 보이게 마커를 지도에 추가합니다
	                     marker = new daum.maps.Marker({ position : linePath[i] });
	                     marker.setMap(map);
	                     
	                     // LatLngBounds 객체에 좌표를 추가합니다
	                     bounds.extend(linePath[i]);
	                 }
	                 
	                 // LatLngBounds 객체에 추가된 좌표들을 기준으로 지도의 범위를 재설정합니다
	                  // 이때 지도의 중심좌표와 레벨이 변경될 수 있습니다
	                  map.setBounds(bounds);
	                 
	                 // 지도에 선을 표시합니다 
	                 polyline.setMap(map);
	                 
	                 
//--------------------------------디비저장-----------------------------------------------
	                 //몽고디비에 바뀐 경로로 저장하기
	                 var place =[];
	                 
	                 $("#myList > li").each(function(i,item){
	                	 var list={
	     	           	    	"title":$(item).find(".name").text(),
	     	           	    	"image":$(item).find("img").attr("src"),
	     	           	    	"mapx":$(item).find(".mapx").attr("value"),
	     	           	    	"mapy":$(item).find(".mapy").attr("value"),  
	     	           	      }
	                	 place[i] = list;
	                 });
	                 
	                 
	                 var city =  $("#hiddenCity").val();
	           	     var date="2017-05-02";
	           	     var state="0";
	           	     var id=2;
	           	     var schedule={
	           	    		"_id":id++,
	           	    		"schedule_num":"1",
	           	    		"member_id":"doohee94",
	           	    		"friend":"5",
	           	    		"group_num":"254",
	           	    		"tour_title":"즐거운 여행~",
	           	    		 "tour" :[{
	           	    			"date":date,
	           	    			"city":city,
	           	    			"place":place
	           	    			
	           	    		}],
	           	    		"save_state":state
	           	      }                     
	                  //정렬 될 때 마다 리스트 순서를 불러와서 ajax로 넘겨 준 후 디비에 저장!
	           	     $.ajax({
	                	 url : "/step/listSave.tm"
	            	     ,type:"post"
	            	     ,contentType:"application/json "
	            	     ,data:JSON.stringify(schedule)
	            	     ,success:function(data){
	            	    	alert(data);
	            	     }
	                 ,error:function(err,status,error){
	        	         alert("실패!"+err.status+error);
	        	        
	        	      }
	                 });  
	//----------------------------------            	   
	               }
	      ,error:function(err,status,error){
	         alert("실패!"+err.status+error);
	      }

	      });

	   });//end 경로 최적화
    
      
   //리스트 끌고 순서바꾸고 해주는 함수
   $( "ul.droptrue" ).sortable({
      connectWith: "ul"
   });

   $( "ul.dropfalse" ).sortable({
      connectWith: "ul",
      dropOnEmpty: false
   });
   
   var day = [];
   var arrayX = [];
   var arrayY=[];
   var index = 0;
   $( "#myList" ).sortable({
         connectWith: "ul",
         item:'#myList > li',
         update:function(event, ui){
        	 
        	      	 
            //리스트가 바뀔 때마다 위도, 경도 정보 가져와 배열에 저장하기
           $('#myList > li').each(function(i,item){
              var mapx = $(item).find(".mapx").attr("value");
              var mapy = $(item).find(".mapy").attr("value");
              
              if(mapx != 0.0){
            	  arrayX[i] = mapx;
            	  arrayY[i] = mapy;
            	  index++;
              }
            });
          
          /*리스트 정보를 지도에 경로 표시*/
          var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
           mapOption = { 
               center: new daum.maps.LatLng(arrayY[0], arrayX[0]), // 지도의 중심좌표
               level: 3 // 지도의 확대 레벨
           };  

          var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
          
          // 선을 구성하는 좌표 배열입니다. 이 좌표들을 이어서 선을 표시합니다
          var linePath=[];
          for(var i=0; i<arrayX.length; i++){
             linePath[i] = new daum.maps.LatLng(arrayY[i], arrayX[i]);
          }
          //선 UI 설정
          var polyline = new daum.maps.Polyline({
             path: linePath, // 선을 구성하는 좌표배열 입니다
              strokeWeight: 5, // 선의 두께 입니다
              strokeColor: '#f00', // 선의 색깔입니다
              strokeOpacity: 0.7, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
              strokeStyle: 'solid' // 선의 스타일입니다
          });
          
          // 지도를 재설정할 범위정보를 가지고 있을 LatLngBounds 객체를 생성합니다
          var bounds = new daum.maps.LatLngBounds();
          
          var i, marker;
          for (i = 0; i < linePath.length; i++) {
              // 배열의 좌표들이 잘 보이게 마커를 지도에 추가합니다
              marker = new daum.maps.Marker({ position : linePath[i] });
              marker.setMap(map);
              
              // LatLngBounds 객체에 좌표를 추가합니다
              bounds.extend(linePath[i]);
          }
          
          // LatLngBounds 객체에 추가된 좌표들을 기준으로 지도의 범위를 재설정합니다
           // 이때 지도의 중심좌표와 레벨이 변경될 수 있습니다
           map.setBounds(bounds);
          
          // 지도에 선을 표시합니다 
          polyline.setMap(map);
          
       //----------------------------------------------------   
          
        var place =[];
        //select box에서 선택된 값의 인덱스
          var index = $("#DaySelectBox option").index($("#DaySelectBox option:selected"));
          
          for(var j=0; j<$("#DaySelectBoxNum").val(); j++){
        	  
        	//만약에 여기서 셀렉트 값이 day1 이면 배열 day[1]에 저장 
              if(index == j){

        		  $('#myList > li').each(function(i,item){
                      
                      var list={
        	           	    "title":$(item).find(".name").text(),
        	           	    "image":$(item).find("img").attr("src"),
        	           	    "mapx":$(item).find(".mapx").attr("value"),
        	           	    "mapy":$(item).find(".mapy").attr("value"),  
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
   	     var date="2017-05-02";
   	     var state="0";
   	     var id=2;
   	     var schedule={
   	    		"_id":128,
   	    		"schedule_num":"1",
   	    		"member_id":"doohee94",
   	    		"friend":"5",
   	    		"group_num":"254",
   	    		"tour_title":"즐거운 여행~",
   	    		 "tour":tour,
   	    		"save_state":state
   	      }                     
          //정렬 될 때 마다 리스트 순서를 불러와서 ajax로 넘겨 준 후 디비에 저장!
   	     $.ajax({
        	 url : "/step/listSave.tm"
    	     ,type:"post"
    	     ,contentType:"application/json "
    	     ,data:JSON.stringify(schedule)
    	     ,success:function(data){
    	    	alert(data);
    	     }
         ,error:function(err,status,error){
	         alert("실패!"+err.status+error);
	        
	      }
         });
          
          
          
        }//update end
   
   
      });//소터블 end
      

   //개인일정 추가 버튼 누르면 팝업 띄우고 결과값 리스트에 저장하는 함수
   $("#chuga").click(function(){
      $a.popup({
         url : "addTravelPopup.tm",
         ifram:true,
         width : 600,
         height : 250,
         callback:function(data){ // $a.close(data) API 사용 시 동작하는 콜백
            if(data !== null){ // 팝업 우측 상단 x 버튼으로 닫을 경우, $a.close(data); 와 같이 data를 넘겨주지 않으므로 data === null이다.
            	$("#myList").append(' <li class="list-group-item remove draggable" style="color:#000;"> <div class="col-xs-12 col-sm-3">'+
                        '<img src="/resource/step3/step3_image/cityscape.png" style="width:62px; height:62px" class="img-responsive img-circle"  /></div>'+
                        ' <div class="col-xs-12 col-sm-9" align = "center">' +
                        '<span class="name" style="color:#000;">'+data+'</span><br/>'+
                        '<input type="hidden" class="mapx" value=0.0 />'+
                        '<input type="hidden" class="mapy" value=0.0 />'+
                        '</div><div class="clearfix"></div></li>'//결과 값 리스트에 붙이기
                  );   //결과 값 리스트에 붙이기
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

   //addTravelPopup에서 입력받은 값을 원래화면(step3.jsp)에 전달
   $a.page(function() {
      this.init = function(id, param) {
         $('#ok').click( function(){ // close 버튼을 누르면
            var addText = $("#addText").val();
            $a.close(addText); // 데이터를 팝업을 띄운 윈도우의 callback에 전달 
         });
      }
   });


   //정보 얻어오는 ajax
   $("#cityList li").click(function(){
      var keyword = $(this).text().trim();
      $("#hiddenCity").val(keyword);
      
      $.ajax({

         url : "http://api.visitkorea.or.kr/openapi/service/rest/KorService/searchKeyword?ServiceKey=GE8ffyGcbc8LhTbkPBlErwmb2Q7JWxA2rhMEQ6iqXszlPFG%2BtFLSmkYyusYF%2FeguXxpATpP9ZiikFJ9%2BzgqGKA%3D%3D"
            ,dataType:"json"
               ,data : {

                  "keyword":keyword,
                  "MobileOS":"ETC",
                  "MobileApp":"AppTesting",
                  "arrange":"B",
                  "_type":"json"
               }
      ,success:function(data){
         var totalCount = data.response.body.totalCount;

         $.ajax({

            url : "http://api.visitkorea.or.kr/openapi/service/rest/KorService/searchKeyword?ServiceKey=GE8ffyGcbc8LhTbkPBlErwmb2Q7JWxA2rhMEQ6iqXszlPFG%2BtFLSmkYyusYF%2FeguXxpATpP9ZiikFJ9%2BzgqGKA%3D%3D"
               ,dataType:"json"
                  ,data : {

                     "keyword":keyword,
                     "MobileOS":"ETC",
                     "MobileApp":"AppTesting",
                     "arrange":"B",
                     "_type":"json",
                     "numOfRows":10,

                  }   
         ,success:function(data){
            var item=data.response.body.items.item;   

            $("#contact-list").empty();
            for(var i=0; i<item.length;i++)
            {
            	 var firstimage = "/resource/step3/step3_image/cityscape.png";
               if(item[i].firstimage != null){
                  firstimage=item[i].firstimage;
               }

               $("#contact-list").append(' <li class="list-group-item remove draggable"  style="color:#000;"> <div class="col-xs-12 col-sm-3">'+
                     '<img src="'+firstimage+'" style="width:62px; height:62px" class="img-responsive img-circle"  /></div>'+
                     ' <div class="col-xs-12 col-sm-9" align = "center">' +
                     '<span class="name" style="color:#000;">'+item[i].title+'</span><br/>'+
                     '<span style="color:#000;" class="addr" >'+item[i].addr1+'</span>'+
                     '<input type="hidden" class="mapx" value="'+item[i].mapx+'"/>'+
                     '<input type="hidden" class="mapy" value="'+item[i].mapy+'"/>'+
                     '</div><div class="clearfix"></div></li>'
               );

            }//end for


            /*불러온 정보에서 위도, 경도 정보를 받아 지도 위에 마커찍기*/
            var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
            mapOption = { 
               center: new daum.maps.LatLng(item[0].mapy, item[0].mapx), // 지도의 중심좌표
               level: 8 // 지도의 확대 레벨
            };

            var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

            for(var i=0; i<item.length; i++){

               //마커가 표시될 위치입니다 
               var markerPosition  = new daum.maps.LatLng(item[i].mapy,item[i].mapx); 

               // 마커를 생성합니다
               var marker = new daum.maps.Marker({
                  position: markerPosition
               });

               // 마커가 지도 위에 표시되도록 설정합니다
               marker.setMap(map);
            }
         }


         });


      }//end success
      ,error:function(err){
         alert("실패!"+err.status);
      }


      }); //end of ajax

   });//end of click
   
   
   //전체/여행지/맛집/기타 ajax불러오기
   $(".categoryBtn").click(function(){
   
     var keyword =   $("#hiddenCity").val();
     var ContentTypeId ="";
     if($(this).text().trim() =="전체"){
        ContentTypeId="";
     }else if($(this).text().trim() =="여행지"){
        ContentTypeId="12";
     }else if($(this).text().trim() =="맛집"){
        ContentTypeId="39";
     }else if($(this).text().trim() =="축제"){
        ContentTypeId="15";
     }
     //ajax
     $.ajax({

            url : "http://api.visitkorea.or.kr/openapi/service/rest/KorService/searchKeyword?ServiceKey=GE8ffyGcbc8LhTbkPBlErwmb2Q7JWxA2rhMEQ6iqXszlPFG%2BtFLSmkYyusYF%2FeguXxpATpP9ZiikFJ9%2BzgqGKA%3D%3D"
               ,dataType:"json"
                  ,data : {
             
                     "keyword":keyword,
                     "MobileOS":"ETC",
                     "MobileApp":"AppTesting",
                     "arrange":"B",
                     "_type":"json",
                     "contentTypeId":ContentTypeId
                  }
         ,success:function(data){
            var totalCount = data.response.body.totalCount;

            $.ajax({

               url : "http://api.visitkorea.or.kr/openapi/service/rest/KorService/searchKeyword?ServiceKey=GE8ffyGcbc8LhTbkPBlErwmb2Q7JWxA2rhMEQ6iqXszlPFG%2BtFLSmkYyusYF%2FeguXxpATpP9ZiikFJ9%2BzgqGKA%3D%3D"
                  ,dataType:"json"
                     ,data : {

                        "keyword":keyword,
                        "MobileOS":"ETC",
                        "MobileApp":"AppTesting",
                        "arrange":"B",
                        "_type":"json",
                        "numOfRows":10,
                        "contentTypeId":ContentTypeId
                     }   
            ,success:function(data){
               var item=data.response.body.items.item;   

               $("#contact-list").empty();
               
               for(var i=0; i<item.length;i++)
               {
            	   var firstimage = "/resource/step3/step3_image/cityscape.png";
                  if(item[i].firstimage != null){
                     firstimage=item[i].firstimage;
                  }

                  $("#contact-list").append(' <li class="list-group-item remove draggable" style="color:#000;"> <div class="col-xs-12 col-sm-3">'+
                        '<img src="'+firstimage+'" style="width:62px; height:62px" class="img-responsive img-circle"  /></div>'+
                        ' <div class="col-xs-12 col-sm-9" align = "center">' +
                        '<span class="name" style="color:#000;">'+item[i].title+'</span><br/>'+
                        '<span style="color:#000;"class="addr" >'+item[i].addr1+'</span>'+
                        '<input type="hidden" class="mapx" value="'+item[i].mapx+'"/>'+
                        '<input type="hidden" class="mapy" value="'+item[i].mapy+'"/>'+
                        '</div><div class="clearfix"></div></li>'
                  );

               }//end for


               /*불러온 정보에서 위도, 경도 정보를 받아 지도 위에 마커찍기*/
               var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
               mapOption = { 
                  center: new daum.maps.LatLng(item[0].mapy, item[0].mapx), // 지도의 중심좌표
                  level: 8 // 지도의 확대 레벨
               };

               var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

               for(var i=0; i<item.length; i++){

                  //마커가 표시될 위치입니다 
                  var markerPosition  = new daum.maps.LatLng(item[i].mapy,item[i].mapx); 

                  // 마커를 생성합니다
                  var marker = new daum.maps.Marker({
                     position: markerPosition
                  });

                  // 마커가 지도 위에 표시되도록 설정합니다
                  marker.setMap(map);
               }
            }
            });
         }//end success
         ,error:function(err){
            alert("실패!"+err.status);
         }


         }); //end of ajax
     
   });//end click
   
   
   //친구추가버튼 누를 시 팝업 뜨기
   $("#addFriend").click(function(){
      $a.popup({
             url: "step/addFriend.tm" // 팝업에 표시될 HTML
           , iframe: true // default
           , width: 600
           , height : 250
           , callback:function(fridenData){ // $a.close(data) API 사용 시 동작하는 콜백
              //친구추가ㅏㅏㅏㅏ 
           }//end calback
           ,title: "string"
      });
   });//end addFriend
   
   //임시저장버튼
   $("#tempSave").click(function(){
         var state =0;
      $a.popup({
             url: "tempSave.tm" // 팝업에 표시될 HTML
           , iframe: true // default
           , width: 600
           , height : 250
           , callback:function(stateData){ // $a.close(data) API 사용 시 동작하는 콜백
              if(data != null){ // 팝업 우측 상단 x 버튼으로 닫을 경우, $a.close(data); 와 같이 data를 넘겨주지 않으므로 data === null이다.
                 state=stateData; //여기서 state 상태값 바꿔서 저장할때 바로 넘기는 작업하면 될듯!
                 alert(state);
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
      });//end tempsavaBtn

     
   
   
   
   
   //Q모양 검색을 눌렀을 때
   $("#reSearch").click(function(){
    
      if($("#reSearchDiv").css("display")=="none"){
         $("#reSearchDiv").show();  
      }else{
         $("#reSearchDiv").hide();  
      }

   });//end click
   
   
   //재검색 버튼 눌럿을 때
   
   $("#reSearchBtn").click(function(){
      
     var keyword = $("#reSearchInput").val();
     $("#hiddenCity").val(keyword);
      $.ajax({
            
            url : "http://api.visitkorea.or.kr/openapi/service/rest/KorService/searchKeyword?ServiceKey=GE8ffyGcbc8LhTbkPBlErwmb2Q7JWxA2rhMEQ6iqXszlPFG%2BtFLSmkYyusYF%2FeguXxpATpP9ZiikFJ9%2BzgqGKA%3D%3D"
               ,dataType:"json"
                  ,data : {

                     "keyword":keyword,
                     "MobileOS":"ETC",
                     "MobileApp":"AppTesting",
                     "arrange":"B",
                     "_type":"json"
                  }
         ,success:function(data){
            var totalCount = data.response.body.totalCount;

            $.ajax({

               url : "http://api.visitkorea.or.kr/openapi/service/rest/KorService/searchKeyword?ServiceKey=GE8ffyGcbc8LhTbkPBlErwmb2Q7JWxA2rhMEQ6iqXszlPFG%2BtFLSmkYyusYF%2FeguXxpATpP9ZiikFJ9%2BzgqGKA%3D%3D"
                  ,dataType:"json"
                     ,data : {

                        "keyword":keyword,
                        "MobileOS":"ETC",
                        "MobileApp":"AppTesting",
                        "arrange":"B",
                        "_type":"json",
                        "numOfRows":10,

                     }   
            ,success:function(data){
               var item=data.response.body.items.item;   
               
               if(data.response.body.totalCount == 0){
                  alert("검색되는 지역이 없습니다.");
               }
               
               $("#contact-list").empty();
               for(var i=0; i<item.length;i++)
               {
                  var firstimage = "/resource/step3/step3_image/cityscape.png";
                  if(item[i].firstimage != null){
                     firstimage=item[i].firstimage;
                  }

                  $("#contact-list").append(' <li class="list-group-item remove draggable" style="color:#000;"> <div class="col-xs-12 col-sm-3">'+
                        '<img src="'+firstimage+'" style="width:62px; height:62px" class="img-responsive img-circle"  /></div>'+
                        ' <div class="col-xs-12 col-sm-9" align = "center">' +
                        '<span class="name" style="color:#000;">'+item[i].title+'</span><br/>'+
                        '<span style="color:#000;" class="addr">'+item[i].addr1+'</span>'+
                        '<input type="hidden" class="mapx" value="'+item[i].mapx+'"/>'+
                        '<input type="hidden" class="mapy" value="'+item[i].mapy+'"/>'+
                        '</div><div class="clearfix"></div></li>'
                  );

               }//end for


               /*불러온 정보에서 위도, 경도 정보를 받아 지도 위에 마커찍기*/
//               var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
//               mapOption = { 
//                  center: new daum.maps.LatLng(item[0].mapy, item[0].mapx), // 지도의 중심좌표
//                  level: 8 // 지도의 확대 레벨
//               };
//
//               var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

               for(var i=0; i<item.length; i++){

                  //마커가 표시될 위치입니다 
                  var markerPosition  = new daum.maps.LatLng(item[i].mapy,item[i].mapx); 

                  // 마커를 생성합니다
                  var marker = new daum.maps.Marker({
                     position: markerPosition
                  });

                  // 마커가 지도 위에 표시되도록 설정합니다
                  marker.setMap(map);
               }
            }


            });


         }//end success
         ,error:function(err){
            alert("실패!"+err.status);
         }


         }); //end of ajax
      
      
      
   });//end click
   
   
   
   //채팅 입력화면!!!!!!
   $("#send").click(function(){
      
      var chat = $("#chat_text").val();
     
      $("#chat_body").append(' <div class="row message-bubble">'+
                        '<p class="text-muted">'+'내아이디'+'</p>'+
                        '<p>'+chat+'</p></div>');
      
      
      $("#chat_text").val("");
      $("#chat_body").scrollTop($("#chat_body")[0].scrollHeight); //스트롤바 하단유지
   });
  
   
   
});