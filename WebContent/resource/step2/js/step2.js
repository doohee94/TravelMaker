$( function() {
    $( "ul.changelist" ).sortable();
    $( "ul.dropfalse" ).sortable({
    	connectWith: "ul"
    });
//     $( "#selectlist" ).disableSelection();
    
    $(".ui-sortable-handle").dblclick(function(){
    	if($(this).attr("class") == "sellist ui-sortable-handle"){
    		$(".dropfalse").append("<li class='sellist ui-sortable-handle'>"+$(this).text());
    		$(this).remove();
    	}else{
    		$(this).remove();
    	}
    });
    
    $(".sellist").click(function(){
    	$("#con").hide();
    	var keyword = $(this).text();
    	var key = "CKOKxPOpAhEnu8gzrMSEwqHCW3zGNCxaFWAOjtXL%2B82aon1CjzdWU8g%2BkknZZRWgd9CnHDJywcDr495yzWoV4g%3D%3D";
		$.ajax({
			url : "http://api.visitkorea.or.kr/openapi/service/rest/KorService/searchKeyword?ServiceKey="+key
			,dataType:"json"
			,data : {
				"keyword":keyword,
				"MobileOS":"ETC",
				"MobileApp":"AppTesting",
				"arrange":"B",
				"numOfRows":"6",
				"_type":"json"
			}
			,success:function(data){
				$(".mainright").text("");
				//undefined
				for (var i = 0; i < 7; i++) {
					$(".mainright").append("<div class='for2"+[i]+" cours2' style='overflow:hidden;'>");
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
    
    $("#changelistbtn").click(function(){
    	var str = "";
    	$(".changelist li").each(function(){
    		str += $(this).text();
    		str += " ";
    	});
    	$("#changelisthidden").val(str.trim());
    	$("#frm").attr("action","step2.tm");
    	$("#frm").submit();
    });
    
  } );