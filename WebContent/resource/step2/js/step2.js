$( function() {
	//Ul태그의 Li태그를 이동 가능하게 변경
	//li태그를 받지만 이동은 불가
    $( "ul.changelist" ).sortable();
    //li태그를 주고 받기 가능
    $( "ul.dropfalse" ).sortable({
    	connectWith: "ul"
    });
    
    //변경리스트에서 경유지 제거를 할때
    // 더블 클릭하면 발동
    $(".ui-sortable-handle").dblclick(function(){
    	//현재 선택된 li태그를 삭제하고 경유지 ul에 삭제된 li를 다시 추가 해준다
    	if($(this).attr("class") == "sellist ui-sortable-handle"){
    		$(".dropfalse").append("<li class='sellist ui-sortable-handle'>"+$(this).text());
    		$(this).remove();
    	}else{
    		$(this).remove();
    	}
    });
    
    //여행지 추천
    $(".sellist").click(function(){
    	//그림파일은 숨긴다
    	$("#con").hide();
    	//선택된 도시를 가져옴
    	var keyword = $(this).text();
    	var key = "CKOKxPOpAhEnu8gzrMSEwqHCW3zGNCxaFWAOjtXL%2B82aon1CjzdWU8g%2BkknZZRWgd9CnHDJywcDr495yzWoV4g%3D%3D";
    	//ajax를 통해 얻어온 데이터를 div태그안에 출력한다
		$.ajax({
			//ajax Url (한국 관광 공사 API)
			url : "http://api.visitkorea.or.kr/openapi/service/rest/KorService/searchKeyword?ServiceKey="+key
			//받는 형식으로는 JSON
			,dataType:"json"
			//넘겨주는 데이터
			,data : {
				"keyword":keyword,
				"MobileOS":"ETC",
				"MobileApp":"AppTesting",
				"arrange":"B",
				"numOfRows":"6",
				"_type":"json"
			}
			//성공했을때 값을 얻어와 화면에 출력
			,success:function(data){
				$(".mainright").text("");
				//undefined
				for (var i = 0; i < 7; i++) {
					$(".mainright").append("<div class='for2"+[i]+" cours2' style='overflow:hidden;'>");
					//만약 그림이 없다면 noimage로 변경
					if(data.response.body.items.item[i].firstimage == null || data.response.body.items.item[i].firstimage=="undefined"){
						$(".for2"+[i]).append("<img class='hover' src='/resource/step2/noimage.jpg' style='width:100%;height:200px;border:1px solid transparent;transition:1s;'>");
					}else{
						$(".for2"+[i]).append("<img class='hover' src='"+data.response.body.items.item[i].firstimage+"' style='width:100%;height:200px;border:1px solid transparent;transition:1s;'>");
					}
					$(".for2"+[i]).append("<div class='for3"+[i]+" cours3'>");
					$(".for3"+[i]).append("<h3 style='text-align:center;margin-top:-6px;color:rgb(237,78,110);'>"+data.response.body.items.item[i].title+"</h3>");
					$(".for3"+[i]).append("<h5 style='text-align:center;'>"+data.response.body.items.item[i].addr1+data.response.body.items.item[i].addr2+"</h5>");
					$(".for2"+[i]).hide().delay().fadeIn(1000);
				}
				
			}//end success
			,error:function(err){
				consol.log("실패!"+err.status);
			}
		}); //end of ajax
	});
    
    //경유지를 추가 후 다시 화면을 불러온다
    $("#changelistbtn").click(function(){
    	var str = "";
    	//리스트의 값을 불러옴
    	$(".changelist li").each(function(){
    		str += $(this).text();
    		str += " ";
    	});
    	//form안에 값을 입력
    	$("#changelisthidden").val(str.trim());
    	//form을 submit
    	$("#frm").attr("action","step2.tm");
    	$("#frm").submit();
    });
    
  } );