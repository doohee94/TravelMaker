/*날짜 변환 함수*/
function getFormatDate(date){
	var year = date.getFullYear();  //yyyy
	var month = (1 + date.getMonth());  //M
	month = month >= 10 ? month : '0' + month; // month 두자리로 저장
	var day = date.getDate();  //
	day = day >= 10 ? day : '0' + day;  //day 두자리로 저장
	var hours = date.getHours();
	var minutes = date.getMinutes();	
	var seconds = date.getSeconds();
	var milliseconds = date.getMilliseconds()	
	return  year + '' + month + '' + day +''+hours+''+minutes+''+seconds +''+milliseconds;
}

$( function() {
	
	
	//_Id -> 몽고디비 아이디
	//group_num -> 몽고디비 그룹아이디
//아이디값, 그룹 아이디값 생성하기. -------------------------------------------	
	var todayDate = new Date();	
	todayDate = getFormatDate(todayDate);	
//	var _id = "S"+todayDate;
//	var group_num = "G"+todayDate;
	
	var _id = ""; //여행일정 아이디
	var group_num ="";//그룹 아이디 
	var tour_title ="";//
	var member_id =$("#userId").val(); //세션에서 불러오기
	var save_state=0; //일정을 완전히 저장하지 않는 이상 모두 0
	var dayNum=0;
	var sDate= "";
	var eDate= "";
	var cityList = [];
	var day = []; //날짜 저장하는 배열 
	
	if($("#scheduleId").val() == "2"){ //넘어온 값이 2이면 새로 생성
		
		//세션 값을 받아서 선택값 받아오는 ajax
		$.ajax({	
			url : "/step/findSession.tm"
				,type:"post"
			     ,success:function(data){  	
			    	 tour_title = data.title;
			    	 dayNum = data.dayNum;
			    	 sDate = data.sDate;
			    	 eDate = data.eDate;			    	 
			    	 for(var i=0; i<data.cityList.length; i++){
			    		 cityList[i] = data.cityList[i];
			    	 }
			    
			    	 $("#DaySelectBoxNum").val(dayNum);
			    	 	    	 
			    	 //데이 셀렉트 박스 넣기-----------------------------------------
			   
			    	 for(var i=1; i<=dayNum; i++){
			    		 if(i<10){
			    			 $("#DaySelectBox").append(
			    					 '<option value="'+(i-1)+'">DAY0'+i+'</option>'
			    			 );
			    		 }else{
			    			 $("#DaySelectBox").append(
			    					 '<option value="'+(i-1)+'">DAY'+i+'</option>'
			    			 );
			    		 }//end if 
			    		 
			    	 }//end for
			    	 
			    	 //도시 리스트 넣기--------------------------------------------
			    	 
			    	 for(var i=0; i<cityList.length; i++){
			    		 
			    		 $("#cityList").append(' <li class="list-group-item cityName" style=" width:150px;">'
			    				+'<div class="col-xs-12 col-sm-9" align = "center">' 
			    				+'<span class="cityName">'+cityList[i]+'</span><br/>'
			    				+'</div>'
			    				+'<div class="clearfix"></div>'
			    				+' </li>'
			    		 );
			    		 
			    	 }
			    	//디비 기초 틀 생성!---------------------------------------------------
			    	 _id= "S"+todayDate;
			 		group_num = "G"+todayDate;		
			 		$("#scheduleId").val(_id); //생성한 아이디를 저장 
			 		
			 		
			 		var addFriend={
			 			"_id":_id,
			 			"group_num": group_num,
			 			"tour_title":tour_title,
			 			"sDate":sDate,
			 			"dayNum":dayNum,
			 			"eDate":eDate,
			 			"cityList":cityList,
			 			"save_state":save_state,
			 			"member_id":member_id
			 		}
			 		$.ajax({
			 			
			 			url : "/step/addFriendMongo.tm"
			 			,type:"post"
			 		    ,contentType:"application/json "
			 		    ,data:JSON.stringify(addFriend)
			 		     ,success:function(data){  	 
			 		     }//end success
			 			,error:function(err,status,error){
			 				alert("디비기초틀생성실패!"+err.status+error);
			 			}
			 			
			 			
			 		});//end ajax
			 		
			 		
			 		//친구추가---------------------------------------------------------
			 	
			 	
			 	var checkFriend = 0;	
			 	for(var i=0; i<data.friendList.length && data.friendList != null; i++){		 		
			 		var addDate = new Date();
			 		
			 		var AaddFriend={
				 			"_id":"S"+getFormatDate(addDate),
				 			"group_num": group_num,
				 			"tour_title":tour_title,
				 			"sDate":sDate,
				 			"dayNum":dayNum,
				 			"eDate":eDate,
				 			"cityList":cityList,
				 			"save_state":save_state,
				 			"member_id":data.friendList[i]
				 		}		 		
			 		
			 		$.ajax({
			 			url : "/step/addFriendMongo.tm",
						type : "post",
						contentType : "application/json ",
						data : JSON.stringify(AaddFriend),
						success : function(data) {
							checkFriend++;
						}//end success
						,
						error : function(err, status, error) {
							// alert("실패!"+err.status+error);

						}//end err
			 			
			 		});//end ajax addFriend
			 	}//end for
			     }//end success
				,error:function(err,status,error){
					alert("처음틀생성실패!"+err.status+error);
				}
			
		});//end findsession ajax
		
		
	}else{ //이미 일정이 있을경우 해당하는거 불러와서 리스트에 뿌려주기... ajax..?
		
		var findList = {
				"_id":$("#scheduleId").val()
		}
		$.ajax({
			
			url : "/step/findList.tm"
       	     ,type:"post"
       	     ,contentType:"application/json "
       	     ,data:JSON.stringify(findList)
       	     ,success:function(data){
       	    	
       	    	 _id=data._id;
       	    	group_num = data.group_num;
       	    	tour_title=data.tour_title;
       	    	save_state = data.save_state;
       	    	sDate = data.sDate;
       	    	eDate = data.eDate;
       	    	dayNum = data.dayNum;
       	    	cityList = data.cityList;
       	    	
       	    
       	    //도시 리트스 넣어주기
       	    	for(var i=0; i<cityList.length; i++){ 
	    		 $("#cityList").append(' <li class="list-group-item cityName" style=" width:150px;">'
	    				+'<div class="col-xs-12 col-sm-9" align = "center">' 
	    				+'<span class="cityName">'+cityList[i]+'</span><br/>'
	    				+'</div>'
	    				+'<div class="clearfix"></div>'
	    				+' </li>'
	    		 );
       	    	}
       	  
       	    	//데이 셀렉트 박스 넣기
       	    $("#DaySelectBoxNum").val(dayNum);
	    	 for(var i=1; i<=dayNum; i++){
	    		 if(i<10){
	    			 $("#DaySelectBox").append(
	    					 '<option value="'+(i-1)+'">DAY0'+i+'</option>'
	    			 );
	    		 }else{
	    			 $("#DaySelectBox").append(
	    					 '<option value="'+(i-1)+'">DAY'+i+'</option>'
	    			 );
	    		 }//end if  
	    	 }//end for
	    			
       	    if(data.tour != null){
       	    	for(var i=0; i<data.tour.length ; i++){	
       	    		
       	    	if(data.tour[i].place != null)	{
       	    		var place = [];
       	    		for(var j=0; j<data.tour[i].place.length; j++){
       	    			place[j] = data.tour[i].place[j];
       	    		}
       	    		day[i] = place;
       	    	}else{
       	    		continue;
       	    	}
       	    	} //for i  
       	    	      	    	
       	    	for(var j=0; j<day[0].length;  j++){ 
			 		$("#myList").append(' <li class="list-group-item remove draggable"  style="color:#000;"> <div class="col-xs-12 col-sm-3">'+
                       '<img src="'+day[0][j].image+'" style="width:62px; height:62px" class="img-responsive img-circle"  /></div>'+
                       ' <div class="col-xs-12 col-sm-9" align = "center">' +
                       '<span class="name" style="color:#000;">'+day[0][j].title+'</span><br/>'+
                       '<span style="color:#000;" class="addr" >'+day[0][j].addr+'</span>'+
                       '<input type="hidden" class="mapx" value="'+day[0][j].mapx+'"/>'+
                       '<input type="hidden" class="mapy" value="'+day[0][j].mapy+'"/>'+
                       '<input type="hidden" class="contentid" value="'+day[0][j].contentid+'"/>'+
                       '</div><div class="clearfix"></div></li>');
		   }//end for j		
       	   	
       	    }else{//저장된 값이 없을 경우 알림
       	    	alert("저장된 데이터 없음 ");
       	    }		
       	     }//end ajax
            ,error:function(err,status,error){
   	         //alert("일정있을경우 일쩡뿌려오기실패!"+err.status+error);
   	        
   	      }
		});//else
		
	}//else
	
	//--------------------------------------------------------------------------	
	//day 별 리스트 저장 
	//alert($("#DaySelectBoxNum").val());	
	//var day = []; // 날짜 수 만큼 만들어져서 list를 저장하는 배열 
	$("#DaySelectBox").change(function(){
		   $("#myList").empty(); 
		  
		   for(var i=0; i<day.length; i++){
			  
			 if(day[i] != null && i==$("#DaySelectBox option:selected").val()){		
				 for(var j=0; j<day[i].length;  j++){ 
					 		$("#myList").append(' <li class="list-group-item remove draggable"  style="color:#000;"> <div class="col-xs-12 col-sm-3">'+
	                           '<img src="'+day[i][j].image+'" style="width:62px; height:62px" class="img-responsive img-circle"  /></div>'+
	                           ' <div class="col-xs-12 col-sm-9" align = "center">' +
	                           '<span class="name" style="color:#000;">'+day[i][j].title+'</span><br/>'+
	                           '<span style="color:#000;" class="addr" >'+day[i][j].addr+'</span>'+
	                           '<input type="hidden" class="mapx" value="'+day[i][j].mapx+'"/>'+
	                           '<input type="hidden" class="mapy" value="'+day[i][j].mapy+'"/>'+
	                           '<input type="hidden" class="contentid" value="'+day[i][j].contentid+'"/>'+
	                           '</div><div class="clearfix"></div></li>');
				   }//end for j		
			 }else{
				 continue;
			 }
			  
		   }//end for i
		   
		}); //end change
	
	
	
	//경로 최적화 버튼 눌렀을 경우
	   $("#distanceCal").click(function(){
	      
	      var title = [];
	      var image = [];
	      var addr = [];
	      var mapx = [];
	      var mapy = [];
	      var contentid = [];
	      
	      var titleTemp = [];
	      var imageTemp = [];
	      var addrTemp = [];
	      var mapxTemp = [];
	      var mapyTemp = [];
	      var contentidTemp = [];
	      
	      var index1=0;
	      var index2=0;
	      //리스트의 정보를 ajax로 넘긴다
	      $('#myList > li').each(function(i,item){	
	    	  
	    	  //개인일정 추가한 것은 경로최적화에서 뺀다
	    	if($(item).find(".mapx").attr("value") != 0.0){    	  
	         title[index1] = $(item).find(".name").text();
	         image[index1] = $(item).find("img").attr("src");
	         addr[index1] = $(item).find(".addr").text();
	         mapx[index1] = $(item).find(".mapx").attr("value");
	         mapy[index1] = $(item).find(".mapy").attr("value"); 
	         contentid[index1] = $(item).find(".contentid").attr("value"); 
	         index1++;
	    	 }else{//일정추가는 따로 배열에 저장해놓는다
	    		 titleTemp[index2] = $(item).find(".name").text();
		         imageTemp[index2] = $(item).find("img").attr("src");
		         addrTemp[index2] = $(item).find(".addr").attr("value");
		         mapxTemp[index2] = $(item).find(".mapx").attr("value");
		         mapyTemp[index2] = $(item).find(".mapy").attr("value");
		         contentidTemp[index2] = $(item).find(".contentid").attr("value"); 
	    	 }
	         //alert(i + '/' + title);
	      });
	      
	      var listInfo = {
	            "image":image,
	            "title":title,
	            "addr":addr,
	            "mapx":mapx,
	            "mapy":mapy,
	            "contentid":contentid
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
	                              '<input type="hidden" class="contentid" value="'+data.contentid[i]+'"/>'+
	                              '</div><div class="clearfix"></div></li>');

	            	   }//end for
	            	   
	            	   for(var i=0; i<titleTemp.length; i++){
	            		   $("#myList").append(' <li class="list-group-item remove draggable"  style="color:#000;"> <div class="col-xs-12 col-sm-3">'+
		                              '<img src="'+imageTemp[i]+'" style="width:62px; height:62px" class="img-responsive img-circle"  /></div>'+
		                              ' <div class="col-xs-12 col-sm-9" align = "center">' +
		                              '<span class="name" style="color:#000;">'+titleTemp[i]+'</span><br/>'+
		                              '<input type="hidden" class="addr" value="'+addrTemp[i]+'"/>'+
		                              '<input type="hidden" class="mapx" value="'+mapxTemp[i]+'"/>'+
		                              '<input type="hidden" class="mapy" value="'+mapyTemp[i]+'"/>'+
		                              '<input type="hidden" class="contentid" value="'+contentidTemp[i]+'"/>'+
		                              '</div><div class="clearfix"></div></li>');
	            	   }
//--------------------------------지도에 새로 바뀐경로 찍어주기-----------------------------------------------	            	   
	            	   var arrayX = [];
	            	   var arrayY = [];
	            	   var arrayTitle=[];
	            	 //리스트가 바뀔 때마다 위도, 경도 정보 가져와 배열에 저장하기
	                   $('#myList > li').each(function(i,item){
	                     var mapx = $(item).find(".mapx").attr("value");
	                     var mapy = $(item).find(".mapy").attr("value");
	                     var title = $(item).find(".name").text();
	                     
	                     if(mapx != 0.0){
	                   	  arrayX[i] = mapx;
	                   	  arrayY[i] = mapy;
	                   	  arrayTitle[i] = title;
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
	                     
	                  // 마커를 클릭했을 때 마커 위에 표시할 인포윈도우를 생성합니다
	                     var iwContent = '<div style="padding:5px;">'+arrayTitle[i]+'</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
	                         iwRemoveable = true, // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다
	                     	   iwPosition = new daum.maps.LatLng(arrayY[i], arrayX[i]); //인포윈도우 표시 위치입니다


	                     // 인포윈도우를 생성합니다
	                     var infowindow = new daum.maps.InfoWindow({
	                  	   position : iwPosition, 
	                         content : iwContent,
	                         removable : iwRemoveable
	                     });
	                     
	                  // 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
	                     infowindow.open(map, marker); 
	                 }
	                 
	                 // LatLngBounds 객체에 추가된 좌표들을 기준으로 지도의 범위를 재설정합니다
	                  // 이때 지도의 중심좌표와 레벨이 변경될 수 있습니다
	                  map.setBounds(bounds);
	                 
	                 // 지도에 선을 표시합니다 
	                 polyline.setMap(map);
	                 
	                 
//--------------------------------디비저장-----------------------------------------------
	                 //몽고디비에 바뀐 경로로 저장하기                                  
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
	        	            	        	           	    "contentid":$(item).find(".contentid").attr("value"), 
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
	        	            	   	     var state=0;
	        	            	   	     var schedule={
	        	            	   	    		"_id":_IDdata[x]._id,	        	            
	        	            	   	    		"member_id":_IDdata[x].member_id,
	        	            	   	    		"group_num":group_num,
	        	            	   	    		"tour_title":_IDdata[x].tour_title,
	        	            	   	    		"sDate":_IDdata[x].sDate,
	        	            	   	    		"eDate":_IDdata[x].eDate,
	        	            	   	    		"dayNum":_IDdata[x].dayNum,
	        	            	   	    		"tour":tour,
	        	            	   	    		"cityList":_IDdata[x].cityList,
	        	            	   	    		"save_state":state
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
	                  
	//----------------------------------            	   
	               }
	      ,error:function(err,status,error){
	         alert("경로최적화실패!"+err.status+error);
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
   
 
   
   //mylist에 변경이 있을 때 디비 저장하고 지도 변경해주기
   var arrayX = [];
   var arrayY=[];
   var arrayTitle=[];
   var arrayContentid=[];

   $( "#myList" ).sortable({
         connectWith: "ul",
         item:'#myList > li',
         update:function(event, ui){
        	 
        	      	 
            //리스트가 바뀔 때마다 위도, 경도 정보 가져와 배열에 저장하기
           $('#myList > li').each(function(i,item){
              var mapx = $(item).find(".mapx").attr("value");
              var mapy = $(item).find(".mapy").attr("value");
              var contentid = $(item).find(".contentid").attr("value");
              var title =$(item).find(".name").text();
              
              
              if(mapx != 0.0){
            	  arrayX[i] = mapx;
            	  arrayY[i] = mapy;
            	  arrayTitle[i] = title;
            	  arrayContentid[i] = contentid;
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
              
           // 마커를 클릭했을 때 마커 위에 표시할 인포윈도우를 생성합니다
              var iwContent = '<div style="padding:5px;">'+arrayTitle[i]+'</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
                  iwRemoveable = true, // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다
              	   iwPosition = new daum.maps.LatLng(arrayY[i], arrayX[i]); //인포윈도우 표시 위치입니다


              // 인포윈도우를 생성합니다
              var infowindow = new daum.maps.InfoWindow({
           	   position : iwPosition, 
                  content : iwContent,
                  removable : iwRemoveable
              });
              
           // 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
              infowindow.open(map, marker); 
          }
          
          // LatLngBounds 객체에 추가된 좌표들을 기준으로 지도의 범위를 재설정합니다
           // 이때 지도의 중심좌표와 레벨이 변경될 수 있습니다
           map.setBounds(bounds);
          
          // 지도에 선을 표시합니다 
          polyline.setMap(map);
          
       //----------------------------------------------------   그룹아이디 저장해주기
          
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
	            	        	           	    "contentid":$(item).find(".contentid").attr("value"),  
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
	            	          			"place":day[i]
	            	          			
	            	          	}
	            	          }      
	            	         var city =  $("#hiddenCity").val();	           
	            	   	     var schedule={
	            	   	    		"_id":_IDdata[x]._id,	        	            
	            	   	    		"member_id":_IDdata[x].member_id,
	            	   	    		"group_num":group_num,
	            	   	    		"tour_title":_IDdata[x].tour_title,
	            	   	    		"sDate":_IDdata[x].sDate,
	            	   	    		"eDate":_IDdata[x].eDate,
	            	   	    		"dayNum":_IDdata[x].dayNum,
	            	   	    		"tour":tour,
	            	   	    		"cityList":_IDdata[x].cityList,
	            	   	    		"save_state":save_state
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
          
        }//update end
   
   
      });//소터블 end
      
   //개인일정 추가 버튼 누르면 팝업 띄우고 결과값 리스트에 저장하는 함수
   $("#chuga").click(function(){
      $a.popup({
         url : "addTravelPopup.tm",
         ifram:true,
         width : 600,
         height : 250,
         callback:function(chugadata){ // $a.close(data) API 사용 시 동작하는 콜백
            if(chugadata !== null){ // 팝업 우측 상단 x 버튼으로 닫을 경우, $a.close(data); 와 같이 data를 넘겨주지 않으므로 data === null이다.
            	$("#myList").append(' <li class="list-group-item remove draggable" style="color:#000;"> <div class="col-xs-12 col-sm-3">'+
                        '<img src="/resource/step3/step3_image/cityscape.png" style="width:62px; height:62px" class="img-responsive img-circle"  /></div>'+
                        ' <div class="col-xs-12 col-sm-9" align = "center">' +
                        '<span class="name" style="color:#000;">'+chugadata+'</span><br/>'+
                        '<input type="hidden" class="addr" value="없음" >'+
                        '<input type="hidden" class="mapx" value=0.0 >'+
                        '<input type="hidden" class="mapy" value=0.0 >'+
                        '<input type="hidden" class="contentid" value="00000" >'+
                        '</div><div class="clearfix"></div></li>'//결과 값 리스트에 붙이기
                  );   //결과 값 리스트에 붙이기
            	
            	
            	//몽고디비에 바뀐 경로로 저장하기                                  
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
       	            	        	           	    "contentid":$(item).find(".contentid").attr("value"), 
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
       	            	   	     var state=0;
       	            	   	     var schedule={
       	            	   	    		"_id":_IDdata[x]._id,	        	            
       	            	   	    		"member_id":_IDdata[x].member_id,
       	            	   	    		"group_num":group_num,
       	            	   	    		"tour_title":_IDdata[x].tour_title,
       	            	   	    		"sDate":_IDdata[x].sDate,
       	            	   	    		"eDate":_IDdata[x].eDate,
       	            	   	    		"dayNum":_IDdata[x].dayNum,
       	            	   	    		"tour":tour,
       	            	   	    		"cityList":_IDdata[x].cityList,
       	            	   	    		"save_state":state
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
   
   $(document).on('click', '#cityList li', function(){
//   $("#cityList li").click(function(){
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
                     '<input type="hidden" class="contentid" value="'+item[i].contentid+'"/>'+
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
               
            // 마커를 클릭했을 때 마커 위에 표시할 인포윈도우를 생성합니다
               var iwContent = '<div style="padding:5px;">'+item[i].title+'</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
                   iwRemoveable = true, // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다
               	   iwPosition = new daum.maps.LatLng(item[i].mapy, item[i].mapx); //인포윈도우 표시 위치입니다


               // 인포윈도우를 생성합니다
               var infowindow = new daum.maps.InfoWindow({
            	   position : iwPosition, 
                   content : iwContent,
                   removable : iwRemoveable
               });
               
            // 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
               infowindow.open(map, marker); 

            }
         }


         });


      }//end success
      ,error:function(err){
         alert("정보얻어오기실패!"+err.status);
      }


      }); //end of ajax

   });//end of click
   
   
		
		//저장버튼----------------------------------------------------------------------------
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
		                 if(stateData == 1){	                	 
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
		            	            	        	           	    "contentid":$(item).find(".contentid").attr("value"),  
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
		            	            	          			"place":day[i]
		            	            	          			
		            	            	          	}
		            	            	          }      
		            	            	         var city =  $("#hiddenCity").val();	   	  
		            	            	   	     var schedule={
		            	            	   	    		"_id":_IDdata[x]._id,	        	            
		            	            	   	    		"member_id":_IDdata[x].member_id,
		            	            	   	    		"group_num":group_num,
		            	            	   	    		"tour_title":_IDdata[x].tour_title,
		            	            	   	    		"sDate":_IDdata[x].sDate,
		            	            	   	    		"eDate":_IDdata[x].eDate,
		            	            	   	    		"tour":tour,
		            	            	   	    		"dayNum":_IDdata[x].dayNum,
		            	            	   	    		"cityList":_IDdata[x].cityList,
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
		                     location.href = "/mylist/donelist.tm";
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
		   
		   
   
   
   
   
   //전체/여행지/맛집/기타 ajax불러오기
   $(".categoryBtn").click(function(){
   
     var keyword =   $("#hiddenCity").val();
     
     if(keyword == ""){
    	 alert("지역을 먼저 선택해주세요");
     }
     else{
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
                        '<input type="hidden" class="contentid" value="'+item[i].contentid+'"/>'+
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
                  
               // 마커를 클릭했을 때 마커 위에 표시할 인포윈도우를 생성합니다
                  var iwContent = '<div style="padding:5px;">'+item[i].title+'</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
                      iwRemoveable = true, // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다
                  	   iwPosition = new daum.maps.LatLng(item[i].mapy, item[i].mapx); //인포윈도우 표시 위치입니다


                  // 인포윈도우를 생성합니다
                  var infowindow = new daum.maps.InfoWindow({
               	   position : iwPosition, 
                      content : iwContent,
                      removable : iwRemoveable
                  });
                  
               // 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
                  infowindow.open(map, marker); 
               }
            }
            });
         }//end success
         ,error:function(err){
            alert("api실패!"+err.status);
         }


         }); //end of ajax
     }
   });//end click
   
   
   
   //친구추가버튼 누를 시 팝업 뜨기
   $("#addFriend").click(function(){
	   
	   var addDate = new Date();
	   
	   var popupData={
		   "group_num" :group_num,
		   "_id":"S"+getFormatDate(addDate),
		   "tour_title":tour_title,
		   "sDate":sDate,
			"eDate":eDate,
			"dayNum":dayNum,
			"cityList":cityList,
			"save_state":save_state,
	   }
	   
      $a.popup({
             url: "addFriend.tm" // 팝업에 표시될 HTML
           , iframe: true // default
           , data:popupData
           , width: 600
           , height : 250
           , callback:function(fridenData){ // $a.close(data) API 사용 시 동작하는 콜백
              //친구추가ㅏㅏㅏㅏ 
           }//end calback
           ,title: "string"
      });
   });//end addFriend
   
   
   
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
                        '<input type="hidden" class="contentid" value="'+item[i].contentid+'"/>'+
                        '</div><div class="clearfix"></div></li>'
                  );

               }//end for

               for(var i=0; i<item.length; i++){

                  //마커가 표시될 위치입니다 
                  var markerPosition  = new daum.maps.LatLng(item[i].mapy,item[i].mapx); 

                  // 마커를 생성합니다
                  var marker = new daum.maps.Marker({
                     position: markerPosition
                  });

                  // 마커가 지도 위에 표시되도록 설정합니다
                  marker.setMap(map);
                  
               // 마커를 클릭했을 때 마커 위에 표시할 인포윈도우를 생성합니다
                  var iwContent = '<div style="padding:5px;">'+item[i].title+'</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
                      iwRemoveable = true, // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다
                  	   iwPosition = new daum.maps.LatLng(item[i].mapy, item[i].mapx); //인포윈도우 표시 위치입니다


                  // 인포윈도우를 생성합니다
                  var infowindow = new daum.maps.InfoWindow({
               	   position : iwPosition, 
                      content : iwContent,
                      removable : iwRemoveable
                  });
                  
               // 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
                  infowindow.open(map, marker); 
               }
            }


            });


         }//end success
         ,error:function(err){
            alert("api실패!"+err.status);
         }


         }); //end of ajax
      
      
      
   });//end click
   
   
   //setIntrval---친구와 함께 작성 할 경우 ---------------------------------------------------------------------

   
   setInterval(function(){
	   
	   var findList = {
				"_id":$("#scheduleId").val()
		}
		$.ajax({
			
			url : "/step/findList.tm"
      	     ,type:"post"
      	     ,contentType:"application/json "
      	     ,data:JSON.stringify(findList)
      	     ,success:function(data){
      	    	 	_id=data._id;
        	    	group_num = data.group_num;
        	    	tour_title=data.tour_title;
        	    	save_state = data.save_state;
        	    	sDate = data.sDate;
        	    	eDate = data.eDate;
        	    	dayNum = data.dayNum;
        	    	cityList = data.cityList;
        	    	save_state = data.save_state;
        	    	
        	  if(save_state == 1){ //저장상태가 1이면 이미 누가 완전저장한 상태이므로 
        		  
        		  location.href = "/mylist/donelist.tm";
        		  
        	  }else{
        		  //데이터에 투어가 널이 아닐 경우 day배열에 저장
            	    if(data.tour != null){
            	    	for(var i=0; i<data.tour.length && data.tour[i].place != null; i++){	
            	    		var place = [];
            	    		for(var j=0; j<data.tour[i].place.length; j++){
            	    			place[j] = data.tour[i].place[j];
            	    		}
            	    		day[i] = place;
            	    	}   
            	    	
            	    }else{//저장된 값이 없을 경우 알림
            	    	
            	    }	
            	  
            	    //현재 선택된 셀렉트 박스에 해당하는 여행 리스트를 myList에 뿌려줌
            	    $("#myList").empty(); 
            	  for(var i=0; i<day.length; i++){
      			 			 if(day[i] != null && i==$("#DaySelectBox option:selected").val()){		
       				 for(var j=0; j<day[i].length;  j++){ 
       					 		$("#myList").append(' <li class="list-group-item remove draggable"  style="color:#000;"> <div class="col-xs-12 col-sm-3">'+
       	                           '<img src="'+day[i][j].image+'" style="width:62px; height:62px" class="img-responsive img-circle"  /></div>'+
       	                           ' <div class="col-xs-12 col-sm-9" align = "center">' +
       	                           '<span class="name" style="color:#000;">'+day[i][j].title+'</span><br/>'+
       	                           '<span style="color:#000;" class="addr" >'+day[i][j].addr+'</span>'+
       	                           '<input type="hidden" class="mapx" value="'+day[i][j].mapx+'"/>'+
       	                           '<input type="hidden" class="mapy" value="'+day[i][j].mapy+'"/>'+
       	                           '<input type="hidden" class="contentid" value="'+day[i][j].contentid+'"/>'+
       	                           '</div><div class="clearfix"></div></li>');
       				   }//end for j		
       			 }else{
       				 continue;
       			 }
       			  
       		   }//end for i
        		 
        		  
        	  }
        	    	
      	    	
      	  
      	     }//end ajax success
           ,error:function(err,status,error){
  	         //alert("일정있을경우 일쩡뿌려오기실패!"+err.status+error);
  	        
  	      }
			
	   });//end ajax;
   },1000*3);//end setInterval
   
   
  
   
   
});