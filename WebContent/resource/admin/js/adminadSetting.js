//현재 날짜를 받아옴
		var now = new Date();
		//현재 년도
	    var year= now.getFullYear();
		//현재 일
	    var day = now.getDate()>9 ? ''+now.getDate() : '0'+now.getDate();

	    //select박스 년도 부분에 현재 년도에서 20년후까지 입력
		for (var i = year; i < (year+20); i++) {
			$("#startyear").append("<option value='"+i+"'>" + i)
			$("#endyear").append("<option value='"+i+"'>" + i)
		}
		
	    //초기 화면에서 종료 날짜 입력부분을 안보이게
		$("#endyear").hide();
		$("#endmonth").hide();
		$("#endday").hide();
		
		//체인지 이벤트가 걸리면 이벤트를 실행
		$("#startyear").change(startchangeday);
		$("#startmonth").change(startchangeday);
		$("#endyear").change(endchangeday);
		$("#endmonth").change(endchangeday);
		
		//시작 날짜 부분
		function startchangeday(){
			//시작 년도나 월이 입력되면 종료 날짜를 입력가능하게 해줌
			$("#endyear").show();
			$("#endmonth").show();
			$("#endday").show();
			
			//day 초기화
			$("#startday option").remove();
			
			//현재 날짜를 불러옴
			var d = new Date();
			//설정된 년도로 설정
			d.setYear($("#startyear").val());
			//설정된 달을 선택
			d.setMonth($("#startmonth").val());
			//마지막날로 설정
			d.setDate(0);
			//마지막날을 가져옴
			var date = d.getDate();
			//1~마지막날까지 옵션 추가
			for (var i = 1; i <= date; i++) {
				if(i <10){
					$("#startday").append("<option value='0" + i + "'>" + i);
				}else{
					$("#startday").append("<option value=" + i + ">" + i);
				}
			}
			//종료날짜를 선택한 날짜로 지정
			$("#endyear").val($("#startyear").val());
			$("#endmonth").val($("#startmonth").val());
		};
		
		function endchangeday(){
			//예외처리부분
			if($("#startyear").val() > $("#endyear").val()){
				alert("설정된 날짜보다 이전 날짜는 적용되지 않습니다");
				$("#endyear").val($("#startyear").val());
			}else if($("#startyear").val() == $("#endyear").val() && $("#startmonth").val() > $("#endmonth").val()){
				alert("설정된 날짜보다 이전 날짜는 적용되지 않습니다");
				$("#endmonth").val($("#startmonth").val());
			}
			
			//현재 날짜를 불러옴
			var d = new Date();
			//설정된 년도로 설정
			d.setYear($("#endyear").val());
			//설정된 달을 선택
			d.setMonth($("#endmonth").val());
			//마지막날로 설정
			d.setDate(0);
			//마지막날을 가져옴
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
		
		//예외처리
		$("#endday").change(function(){
			if($("#startyear").val() == $("#endyear").val() && $("#startmonth").val() == $("#endmonth").val() && $("#startday").val() > $("#endday").val()){
				alert("설정된 날짜보다 이전 날짜는 적용되지 않습니다");
				$("#endday").val($("#startday").val());
			}
		});
		
		//미리보기 부분
		$("#file").change(function(){
			showImg(this);
		});
		
		//현재 이미지를 읽어서 미리보여줌
		function showImg(input){	
			if (input.files && input.files[0]) {
				var reader = new FileReader();
				reader.onload = function (e) {
					$('#show').attr('src', e.target.result); 
				}
				reader.readAsDataURL(input.files[0]); 
			}
		}
		
		//제휴 불러오기
		$("#alsearchbtn").click(function(){
			//입력된 값을 가져옴
			var partnercomname = $("#partner_comname").val();
			
			//입력된 값으로 DB검색을 하여 결과값을 뿌려줌
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
		
		//불려진 값에 이벤트, 선택된 값을 입력
		$(document).on("click",".allisttr",function(){
			//선택한 번호
			var num = $(this).children().first();
			//선택한 회사명
			var name = num.next().text();
			//회사 타입 번호
			var type = num.next().next().next().val();
			
			$("#partnername").val(name);
			$("#partnerNum").val(num.text());
			$("#partnerType").val(type);
		});