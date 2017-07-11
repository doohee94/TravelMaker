    $(function(){
    	// 질문 버튼 누를때의 이벤트
    	$('#btn-question').click(function(){
    		//감춰진 모달 생성
    		 $("#myModal").modal();
    	});
    	//모달의 작성 버튼 누를때 이벤트
    	$('#btn-write').click(function(){
    	  //content의 값
  		  var content = $('#content').val();
  		  //select box값
		  var select = $('#select-box').val();
		  //db에 들어가기 전에 content 문자열 치환
		  content = content.replace(/\n/g, "<br>");
		  //예외 처리 값이 비었을때
		  if(content==""||select=="")
		  { 
			  alert("내용괴 유형을 확인 하세요~");
		    return;
		  }
		  //값이 다 있을때
		  else{
			  	//ajax 
			    //POST방식 type, content값을 넘기고 입력된 값을 받아옴 실패시 경고창뜸
				$.ajax({
					type : "POST",
					url : "/tmmypage/inputqna.tm",
					data : {
						qnaType : select,
						qnaContent : content
					},
					success : function(data){
						$(location).attr("href","/tmmypage/qna.tm");						
					},
					error : function(err){
						alert("작성실패"+err.status);
					}
				});
		  }
    	});
    	//더보기 버튼을 누를때
    	$('#btn-moreqna').click(function(){
    		//페이지 번호를 받음
    		var tempPage = $('#pageNum').val();
    		//페이지 번호를 파라메터로 보내서 호출
    		$(location).attr("href","/tmmypage/qna.tm?tempPage="+tempPage);
    	});
    });