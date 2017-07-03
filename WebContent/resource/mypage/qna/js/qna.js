    $(function(){
    	$('#btn-question').click(function(){
    		 $("#myModal").modal();
    	});
    	$('#btn-write').click(function(){
  		  var content = $('#content').val();
		  var select = $('#select-box').val();  
		  if(content==""||select=="")
		  { 
			  alert("내용괴 유형을 확인 하세요~");
		    return;
		  }else{
			 
				alert("선택 값 { " + select+" } 내용 {"+content+ " } " );
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
    });