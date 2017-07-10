// 광고 메인
		$(".btn-danger").click(function(){
			$(this).next().attr("action","deletead.tm");
			$(this).next().submit();
		})
		
		// 광고 상세보기
		$(".showadvi").dblclick(function(){
			$(this).next().attr("action","adminadshow.tm");
			$(this).next().submit();
		});
		
		$(".subtab").click(function(){
			$("#checkend").hide();
		});
		$(".alltab").click(function(){
			$("#checkend").show();
		});
		
		// 이미지 크기 키우기
		$(".clickimg").toggle(function(){
			$(this).animate({"width":"1200px","height":"150px"},"slow","easeOutBack");
		},function(){
			$(this).animate({"width":"120px","height":"15px"},"slow","easeOutBack");
		});
		
		//이전버튼
		$("#prevPage").click(function() {
			//현재 페이지 넘버를 얻어옴
			var pageNumber = $("#pageNumber").val();
			var url = $("#url").val();
			var partnerName = $("#partnerComname").val();
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
			
			if(url == "adminadsearch.tm"){
				location.href = "/tmadmin/"+url+"?pageNumber=" + nextNumber + "&partnerComname=" + partnerName;
			}else{
				location.href = "/tmadmin/"+url+"?pageNumber=" + nextNumber;
			}
		});

		//다음버튼
		$("#nextPage").click(function() {
			var partnerName = $("#partnerComname").val();
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

			if(url == "adminadsearch.tm"){
				location.href = "/tmadmin/"+url+"?pageNumber=" + nextNumber + "&partnerComname=" + partnerName;
			}else{
				location.href = "/tmadmin/"+url+"?pageNumber=" + nextNumber;
			}
		});
		
		//광고 설정
		$("#checkend").click(function(e){
			//a태그를 막음
			e.preventDefault();
			//num 저장 문자열
			var str = "start";
			var end = "end";
			//form안에 input태그중에 name이 checkboxin인 것들중에 체크된 부분을 찾음
			$("#alllistad").find("input[name=checkboxin]").each(function(){
				if($(this).is(":checked")){
					str += "/" + $(this).val();
				}else{
					end += "/" + $(this).val();
				}
				//문자열로 광고 번호를 붙여줌
			});
			//폼안에 value값으로 지정
			$("#textcheck").val(str);
			$("#textnotcheck").val(end);
			//서브밋
			$("#checkfrm").submit();
		});