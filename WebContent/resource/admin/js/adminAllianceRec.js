		$("#prevPage").click(function(){
			var pageNumber = $("#pageNumber").val();
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
				nextNumber = pageNumber - 1;
			}
			var url = $("#url").val();
			var partnerComname = $("#partnerComname").val();
			
			if(url == 'searchallirec.tm'){
				location.href = "/tmadmin/"+url+"?pageNumber="+nextNumber+"&partnerComname="+partnerComname;
			}else{
				location.href = "/tmadmin/"+url+"?pageNumber="+nextNumber;
			}
		});
		
		$("#nextPage").click(function(){
			var pageNumber = $("#pageNumber").val();
			var totalpage = $("#totalpage").val();
			var nextNumber = 0;
			
			if(pageNumber+1 > totalpage){
				nextNumber = totalpage;
			}else{
				nextNumber = parseInt(pageNumber) + 1;
			}
			
			var url = $("#url").val();
			var partnerComname = $("#partnerComname").val();
			
			if(url == 'searchallirec.tm'){
				location.href = "/tmadmin/"+url+"?pageNumber="+nextNumber+"&partnerComname="+partnerComname;
			}else{
				location.href = "/tmadmin/"+url+"?pageNumber="+nextNumber;
			}
		});
	
	
	
		$(".imgshow").click(function(){
			doImgPop($(this).attr("src"));
		});
		
		$(".updateal").click(function(){
			var num = $(this).children().val();
			$(location).attr('href',"adminalup.tm?num="+num);
		});
		
		$(".deleteal").click(function(){
			var num = $(this).children().val();
			$(location).attr('href',"adminalde.tm?num="+num);
		});	
		
		function doImgPop(img) {
			img1 = new Image();
			img1.src = (img);
			imgControll(img);
		}

		function imgControll(img) {
			if ((img1.width != 0) && (img1.height != 0)) {
				viewImage(img);
			} else {
				controller = "imgControll('" + img + "')";
				intervalID = setTimeout(controller, 20);
			}
		}

		function viewImage(img) {
			W = img1.width;
			H = img1.height;
			O = "width=" + W + ",height=" + H + ",scrollbars=yes";
			imgWin = window.open("", "", O);
			imgWin.document
					.write("<html><head><title>상세보기</title></head>");
			imgWin.document.write("<body topmargin=0 leftmargin=0>");
			imgWin.document
					.write("<img src="
							+ img
							+ " onclick='self.close()' style='cursor:pointer;' title ='클릭하시면 창이 닫힙니다.'>");
			imgWin.document.close();
		}