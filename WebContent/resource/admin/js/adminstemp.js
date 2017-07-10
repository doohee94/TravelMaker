$(".updatebtn").click(function(){
		$(this).next().submit();
	});
	
	
	$("#prevPage").click(function() {
		//현재 페이지 넘버를 얻어옴
		var pageNumber = $("#pageNumber").val();
		var url = $("#url").val();
		var partnerName = $("#partnerName").val();
		//다음 페이지 넘버가 저장될 변수
		var nextNumber = 0;

		//페이지는 10보다 크고 10으로 나누어 나머지가 1일때 이전페이지
		if(pageNumber > 10 && pageNumber%10 == 1){
			nextNumber = pageNumber - 1;
		//10으로 나누어 떨어지는 페이지 일때 이전페이지 이동
		}else if(pageNumber >= 10 && pageNumber%10 == 0){
			nextNumber = pageNumber - 1;
		//만약 10으로 나눈 나머지에 1을 뺄때 0보다 작거나 같다면 그 페이지에서 멈추게
		}else if (pageNumber % 10 - 1 <= 0) {
			if (parseInt(pageNumber / 10) == 0) {
				var temp = parseInt(pageNumber / 10);
				nextNumber = temp * 10 + 1;
			}
		} else {
			//위에 조건이 안걸리면 전페이지로 이동
			nextNumber = pageNumber - 1;
		}
		
		if(url == "searchstemp.tm"){
			location.href = "/tmadmin/"+url+"?pageNumber=" + nextNumber + "&partnerName=" + partnerName;
		}else{
			location.href = "/tmadmin/"+url+"?pageNumber=" + nextNumber;
		}
	});

	$("#nextPage").click(function() {
		var partnerName = $("#partnerName").val();
		//현재 페이지 넘버를 얻어옴
		var pageNumber = $("#pageNumber").val();
		//총 페이지 수를 얻어옴
		var totalpage = $("#totalpage").val();
		var url = $("#url").val();
		//다음 페이지 넘버가 저장될 변수
		var nextNumber = 0;
		//다음 페이지가 총페이지 이상일때는 그페이지에 멈춤
		if (pageNumber + 1 > totalpage) {
			nextNumber = totalpage;
		} else {
			//아니라면 다음페이지로 이동
			nextNumber = parseInt(pageNumber) + 1;
		}

		if(url == "searchstemp.tm"){
			location.href = "/tmadmin/"+url+"?pageNumber=" + nextNumber + "&partnerName=" + partnerName;
		}else{
			location.href = "/tmadmin/"+url+"?pageNumber=" + nextNumber;
		}
	});
	
	$(".stempdel").click(function(){
		var check = confirm("삭제 하시겠습니까? \n삭제 하시면 스탬프 목록도 삭제가 됩니다");
		var parstempNum = $(this).next().val();
		if (check) {
			location.href = "/tmadmin/stempdelete.tm?parstempNum=" + parstempNum;
		}
	});