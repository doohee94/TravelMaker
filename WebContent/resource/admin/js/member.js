
		//리스트 클릭
		$(document).on("click",".selectid",function(){
			//현재 클릭된 라인에 id컬럼값만 얻어옴
			var id = $(this).children().first().text();
			//ajax로 검색결과를 얻어옴
			$.ajax({
				url : "/tmadmin/adminshowmem.tm",
				type : "POST",
				data : "user_id="+id,
				dataType : "json",
				success : function(data){
					//검색결과의 값을 뿌려줌
					$("#userId").val(data.userId);
					$("#userPw").val(data.userPw);
					$("#userName").val(data.userName);
					$("#userNick").val(data.userNick);
					$("#userAddr").val(data.userAddr);
					$("#userTel").val(data.userTel);
					$("#userDate").val(data.userDate);
					var type="";
					if(data.userType == 10){
						type = "회원";
						$("#userDate").prev().text("가입일");
					}else if(data.userType == 30){
						type = "관리자";
					}else{
						type = "탈퇴";
						$("#userDate").prev().text("탈퇴일");
					}
					$("#userState").val(type);
					$("#userEmail").val(data.userEmail);
				}
			});
		});
		
		$("#searchmember").click(function(){
			$("#frmsearch").submit();
		});
		
		//이전 버튼이 눌렸을 때
		$("#prevPage").click(function(){
			//현재 페이지 넘버를 얻어옴
			var pageNumber = $("#pageNumber").val();
			//다음 페이지 넘버가 저장될 변수
			var nextNumber = 0;
			
			//페이지는 10보다 크고 10으로 나누어 나머지가 1일때 이전페이지
			if(pageNumber > 10 && pageNumber%10 == 1){
				nextNumber = pageNumber - 1;
			//10으로 나누어 떨어지는 페이지 일때 이전페이지 이동
			}else if(pageNumber >= 10 && pageNumber%10 == 0){
				nextNumber = pageNumber - 1;
			//만약 10으로 나눈 나머지에 1을 뺄때 0보다 작거나 같다면 그 페이지에서 멈추게
			}else if(pageNumber%10-1 <= 0 ){
				if(parseInt(pageNumber/10) == 0){
					var temp = parseInt(pageNumber/10);
					nextNumber = temp*10+1;
				}
			}else{
				//위에 조건이 안걸리면 전페이지로 이동
				nextNumber = pageNumber - 1;
			}
			var url = $("#url").val();
			//검색일때와 리스트일때를 구분하여 링크를 보냄
			if(url == "adminsearchmem.tm"){
				location.href = "/tmadmin/"+$("#url").val()+"?pageNumber="+nextNumber+"&sel="+$("#sel").val()+"&con="+$("#con").val();
			}else{
				location.href = "/tmadmin/"+$("#url").val()+"?pageNumber="+nextNumber;
			}
		});
		
		//다음 버튼이 눌렸을 때
		$("#nextPage").click(function(){
			//현재 페이지 넘버를 얻어옴
			var pageNumber = $("#pageNumber").val();
			//총 페이지 수를 얻어옴
			var totalpage = $("#totalpage").val();
			//다음 페이지 넘버가 저장될 변수
			var nextNumber = 0;
			
			//다음 페이지가 총페이지 이상일때는 그페이지에 멈춤
			if(parseInt(pageNumber)+1 > totalpage){
				nextNumber = totalpage;
			}else{
				//아니라면 다음페이지로 이동
				nextNumber = parseInt(pageNumber) + 1;
			}
			var url = $("#url").val();
			//검색일때와 리스트일때를 구분하여 링크를 보냄
			if(url == "adminsearchmem.tm"){
				location.href = "/tmadmin/"+$("#url").val()+"?pageNumber="+nextNumber+"&sel="+$("#sel").val()+"&con="+$("#con").val();
			}else{
				location.href = "/tmadmin/"+$("#url").val()+"?pageNumber="+nextNumber;
			}
		});