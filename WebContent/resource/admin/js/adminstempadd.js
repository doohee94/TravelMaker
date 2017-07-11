//제휴 불러오기
		$("#alsearchbtn").click(function(){
			//입력된 값을 가져옴
			var partnercomname = $("#partner_comname").val();
			
			//입력된 값으로 검색된 DB값을 출력
			$.ajax({
				url : "/tmadmin/adadsearch.tm",
				type : "POST",
				data : {
					"partnercomname" : partnercomname,
				},
				dataType : "json",
				success : function(data){
					$("tbody").empty();
					for (var i = 0; i < data.length; i++) {
						$("tbody").append("<tr class='for"+i+" allisttr' data-dismiss='modal'>");
						$(".for"+i).append("<td>"+data[i].partnerNum);	
						$(".for"+i).append("<td>"+data[i].partnerComname);	
						$(".for"+i).append("<td>"+data[i].partnerReginum);
						$(".for"+i).append("<input type='hidden' value='"+data[i].partnerType+"'>");
					}
				}
			});
		});
		
		//ajax로 추가된 부분에 이벤트
		$(document).on("click",".allisttr",function(){
			var num = $(this).children().first();
			var name = num.next().text();
			var type = num.next().next().next().val();
			
			$("#partnername").val(name);
			$("#partnerNum").val(num.text());
			$("#partnerType").val(type);
		});
		