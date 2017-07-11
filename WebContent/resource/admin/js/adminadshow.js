var now = new Date();
	    var year= now.getFullYear();
	    var day = now.getDate()>9 ? ''+now.getDate() : '0'+now.getDate();
	    //현재 날짜에 +20년도 만큼 추가
		for (var i = year; i < (year+20); i++) {
			$("#startyear").append("<option value='"+i+"'>" + i)
			$("#endyear").append("<option value='"+i+"'>" + i)
		}
		
		//년도부분 SELECT부분에서 OPTION을 찾아 반복문을 돌림
		$("#startyear").find("option").each(function(){
			//DB에서 불러온 값과 같으면 옵션변경
			if($(this).val() == $("#pstartyear").val()){
				$(this).attr("selected","selected");
			}
		});
		
		//월 부분 SELECT부분에서 OPTION을 찾아 반복문을 돌림
		$("#startmonth").find("option").each(function(){
			//DB에서 불러온 값과 같으면 옵션변경
			if($(this).val() == $("#pstartmonth").val()){
				$(this).attr("selected","selected");
			}
		});
		
		//년도부분 SELECT부분에서 OPTION을 찾아 반복문을 돌림
		$("#endyear").find("option").each(function(){
			//DB에서 불러온 값과 같으면 옵션변경
			if($(this).val() == $("#pendyear").val()){
				$(this).attr("selected","selected");
			}
		});
		
		//월 부분 SELECT부분에서 OPTION을 찾아 반복문을 돌림
		$("#endmonth").find("option").each(function(){
			//DB에서 불러온 값과 같으면 옵션변경
			if($(this).val() == $("#pendmonth").val()){
				$(this).attr("selected","selected");
			}
		});
		// 일부분 초기화
		$("#startday option").remove();
		//현재 날짜를 가져옴
		var d = new Date();
		//날짜를 받아온 날짜로 설정
		d.setYear($("#pstartyear").val());
		//월을 받아온 날짜로 설정
		d.setMonth($("#pstartmonth").val());
		//그달의 마지막날로 지정
		d.setDate(0);
		//지정된 날짜로 DATA에 저장
		var date = d.getDate();
		
		
		//1~마지막날까지 옵션 추가
		for (var i = 1; i <= date; i++) {
			if(i <10){
				$("#startday").append("<option value='0" + i + "'>" + i);
			}else{
				$("#startday").append("<option value=" + i + ">" + i);
			}
		}
		
		//일 부분 SELECT부분에서 OPTION을 찾아 반복문을 돌림
		$("#startday").find("option").each(function(){
			//DB에서 불러온 값과 같으면 옵션변경
			if($(this).val() == $("#pstartday").val()){
				$(this).attr("selected","selected");
			}
		});
		//날짜를 받아온 날짜로 설정
		d.setYear($("#pendyear").val());
		//월을 받아온 날짜로 설정
		d.setMonth($("#pendmonth").val());
		//그달의 마지막날로 지정
		d.setDate(0);
		//지정된 날짜로 DATA에 저장
		var date = d.getDate();
		
		
		//1~마지막날까지 옵션 추가
		for (var i = 1; i <= date; i++) {
			if(i <10){
				$("#endday").append("<option value='0" + i + "'>" + i);
			}else{
				$("#endday").append("<option value=" + i + ">" + i);
			}
		}
		//일 부분 SELECT부분에서 OPTION을 찾아 반복문을 돌림
		$("#endday").find("option").each(function(){
			//DB에서 불러온 값과 같으면 옵션변경
			if($(this).val() == $("#pendday").val()){
				$(this).attr("selected","selected");
			}
		});
		
		//select에 이벤트를 설정
		$("#startyear").change(startchangeday);
		$("#startmonth").change(startchangeday);
		$("#endyear").change(endchangeday);
		$("#endmonth").change(endchangeday);
		
		//시작날짜의 년도이 끝날짜의 년도보다 클경우 배제 
		$("#endday").change(function(){
			if($("#startyear").val() == $("#endyear").val() && $("#startmonth").val() == $("#endmonth").val() && $("#startday").val() > $("#endday").val()){
				alert("설정된 날짜보다 이전 날짜는 적용되지 않습니다");
				$("#endday").val($("#startday").val());
			}
		});
		
		//시작날짜 설정
		function startchangeday(){	
			//일부분 초기화
			$("#startday option").remove();
			//현재 날짜를 가져옴
			var d = new Date();
			//날짜를 받아온 날짜로 설정
			d.setYear($("#startyear").val());
			d.setMonth($("#startmonth").val());
			//그달의 마지막날로 지정
			d.setDate(0);
			//지정된 날짜로 DATA에 저장
			var date = d.getDate();

			//1~마지막날까지 옵션 추가
			for (var i = 1; i <= date; i++) {
				if(i <10){
					$("#startday").append("<option value='0" + i + "'>" + i);
				}else{
					$("#startday").append("<option value=" + i + ">" + i);
				}
			}
			$("#endyear").val($("#startyear").val());
			$("#endmonth").val($("#startmonth").val());
		};
		
		//끝날짜 설정
		function endchangeday(){
			if($("#startyear").val() > $("#endyear").val()){
				alert("설정된 날짜보다 이전 날짜는 적용되지 않습니다");
				$("#endyear").val($("#startyear").val());
			}else if($("#startyear").val() == $("#endyear").val() && $("#startmonth").val() > $("#endmonth").val()){
				alert("설정된 날짜보다 이전 날짜는 적용되지 않습니다");
				$("#endmonth").val($("#startmonth").val());
			}
			
			$("#endday option").remove();
			var d = new Date();
			d.setYear($("#endyear").val());
			d.setMonth($("#endmonth").val());
			d.setDate(0);
			var date = d.getDate();

			//1~마지막날까지 옵션 추가
			for (var i = 1; i <= date; i++) {
				if(i <10){
					$("#endday").append("<option value='0" + i + "'>" + i);
				}else{
					$("#endday").append("<option value=" + i + ">" + i);
				}
			}
		};
		//사진이 변경되었을때
		$("#file").change(function(){
			showImg(this);
		});
		
		//미리보기 
		function showImg(input){	
			//파일의 값이 입력되었을때
			if (input.files && input.files[0]) {
				//파일을 읽는 객체생성
				var reader = new FileReader();
				//파일을 읽어 미리보기에 적용
				reader.onload = function (e) {
					$('#show').attr('src', e.target.result); 
				}
				reader.readAsDataURL(input.files[0]); 
			}
		}
		//제휴 회사 검색
		$("#alsearchbtn").click(function(){
			//입력된 값을 저장
			var partnercomname = $("#partner_comname").val();
			//ajax를 통해 제휴 리스트를 받아옴
			$.ajax({
				url : "/tmadmin/adadsearch.tm",
				type : "POST",
				data : {
					"partnercomname" : partnercomname,
				},
				dataType : "json",
				success : function(data){
					//검색된 내용을 초기화
					$("tbody").empty();
					//리스트를 읽어서 추가
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
		
		//불러온 리스트가 선택되었을떄
		$(document).on("click",".allisttr",function(){
			//선택된 회사번호
			var num = $(this).children().first();
			//선택된 회사명
			var name = num.next().text();
			//선택된 타입
			var type = num.next().next().next().val();
			
			$("#partnername").val(name);
			$("#partnerNum").val(num.text());
			$("#partnerType").val(type);
		});