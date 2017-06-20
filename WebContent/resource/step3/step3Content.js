
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
   
  
//   /*맨처음 디폴트로 띄울 지도 위치*/
//    var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
//    mapOption = { 
//       center: new daum.maps.LatLng(37.241638, 131.864755), // 지도의 중심좌표
//       level: 3 // 지도의 확대 레벨
//    };
//
//    var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
    
      
   //리스트 끌고 순서바꾸고 해주는 함수
   $( "ul.droptrue" ).sortable({
      connectWith: "ul"
   });

   $( "ul.dropfalse" ).sortable({
      connectWith: "ul",
      dropOnEmpty: false
   });
   
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
              
              arrayX[i] = mapx;
              arrayY[i] = mapy;
              index++;
              
            });
            
          //리스트 더블클릭하면 삭제
          $(this).children(".remove").dblclick(function(){
              $(this).remove();
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
          
        }
      });
      

   //개인일정 추가 버튼 누르면 팝업 띄우고 결과값 리스트에 저장하는 함수
   $("#chuga").click(function(){
      $a.popup({
         url : "addTravelPopup.jsp",
         ifram:true,
         width : 600,
         height : 250,
         callback:function(data){ // $a.close(data) API 사용 시 동작하는 콜백
            if(data !== null){ // 팝업 우측 상단 x 버튼으로 닫을 경우, $a.close(data); 와 같이 data를 넘겨주지 않으므로 data === null이다.
               $("#myList").append("<li class='myList' style='color:#000;'>"+data+"</li>");   //결과 값 리스트에 붙이기
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
                     '<span style="color:#000;" >'+item[i].addr1+'</span>'+
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
                        '<span style="color:#000;" >'+item[i].addr1+'</span>'+
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
   
   $("#myList").sortable(function(){
      alert("sss");
   });
   
   
   //친구추가버튼 누를 시 팝업 뜨기
   $("#addFriend").click(function(){
      $a.popup({
             url: "addFriend.jsp" // 팝업에 표시될 HTML
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
             url: "tempSave.jsp" // 팝업에 표시될 HTML
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

     
   
   //저장버튼
   $("#save").click(function(){
      var state =0;
      $a.popup({
             url: "save.jsp" //
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
      });//end savaBtn
   
   
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
                        '<span style="color:#000;" >'+item[i].addr1+'</span>'+
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
   
   
   
   //채팅 입력 하면!!!!!!
   $("#chat_body").scrollTop($("#chat_body")[0].scrollHeight); //스트롤바 하단유지
   $("#send").click(function(){
      
      var chat = $("#chat_text").val();
     
      $("#chat_body").append(' <div class="row message-bubble">'+
                        '<p class="text-muted">'+'내아이디'+'</p>'+
                        '<p>'+chat+'</p></div>');
      
      
      $("#chat_text").val("");
      $("#chat_body").scrollTop($("#chat_body")[0].scrollHeight); //스트롤바 하단유지
   });
  
   
});