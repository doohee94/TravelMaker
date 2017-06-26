			//사이드 메뉴 숨겨놨다 보이게 하는 플러그인 
			$(document).ready(function() {
				  $('#simple-menu').sidr({
				    name: 'sidr-main',
				    source: '#side_menu_nav'
				  });
				  //공백 정규화
				  $('#btn_write').click(function(){
					  var title = $('#title').val();
					  var content = $('#content').val();
					    
					  if(title==""||content=="")
					  { 
						  alert("제목과 메세지를 확인 하세요~")
					    return;
					  }
	
					  alert("입력!!");
				  });
				});