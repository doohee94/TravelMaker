var now = new Date();
	    var year= now.getFullYear();
	    var day = now.getDate()>9 ? ''+now.getDate() : '0'+now.getDate();

		for (var i = year; i < (year+20); i++) {
			$("#startyear").append("<option value='"+i+"'>" + i)
			$("#endyear").append("<option value='"+i+"'>" + i)
		}
		
		$("#startyear").find("option").each(function(){
			if($(this).val() == $("#pstartyear").val()){
				$(this).attr("selected","selected");
			}
		});
		$("#startmonth").find("option").each(function(){
			if($(this).val() == $("#pstartmonth").val()){
				$(this).attr("selected","selected");
			}
		});
		$("#endyear").find("option").each(function(){
			if($(this).val() == $("#pendyear").val()){
				$(this).attr("selected","selected");
			}
		});
		$("#endmonth").find("option").each(function(){
			if($(this).val() == $("#pendmonth").val()){
				$(this).attr("selected","selected");
			}
		});
		
		$("#startday option").remove();
		var d = new Date();
		d.setYear($("#pstartyear").val());
		d.setMonth($("#pstartmonth").val());
		d.setDate(0);
		var date = d.getDate();
		
		
		//1~마지막날까지 옵션 추가
		for (var i = 1; i <= date; i++) {
			if(i <10){
				$("#startday").append("<option value='0" + i + "'>" + i);
			}else{
				$("#startday").append("<option value=" + i + ">" + i);
			}
		}
		
		$("#startday").find("option").each(function(){
			if($(this).val() == $("#pstartday").val()){
				$(this).attr("selected","selected");
			}
		});
		
		d.setYear($("#pendyear").val());
		d.setMonth($("#pendmonth").val());
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
		
		$("#endday").find("option").each(function(){
			if($(this).val() == $("#pendday").val()){
				$(this).attr("selected","selected");
			}
		});
		
		$("#startyear").change(startchangeday);
		$("#startmonth").change(startchangeday);
		$("#endyear").change(endchangeday);
		$("#endmonth").change(endchangeday);
		$("#endday").change(function(){
			if($("#startyear").val() == $("#endyear").val() && $("#startmonth").val() == $("#endmonth").val() && $("#startday").val() > $("#endday").val()){
				alert("설정된 날짜보다 이전 날짜는 적용되지 않습니다");
				$("#endday").val($("#startday").val());
			}
		});
		
		function startchangeday(){	
			$("#startday option").remove();
			var d = new Date();
			d.setYear($("#startyear").val());
			d.setMonth($("#startmonth").val());
			d.setDate(0);
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
	
		$("#file").change(function(){
			showImg(this);
		});
		
		function showImg(input){	
			if (input.files && input.files[0]) {
				var reader = new FileReader();
				reader.onload = function (e) {
					$('#show').attr('src', e.target.result); 
				}
				reader.readAsDataURL(input.files[0]); 
			}
		}
		
		$("#alsearchbtn").click(function(){
			var partnercomname = $("#partner_comname").val();
			
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
					}
				}
			});
		});
		
		$(document).on("click",".allisttr",function(){
			var num = $(this).children().first();
			var name = num.next().text();
			
			$("#partnername").val(name);
			$("#partnerNum").val(num.text());
		});