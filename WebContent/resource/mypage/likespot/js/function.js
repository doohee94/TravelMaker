			$(document).ready(function() {

				//사이드 메뉴 숨겨놨다 보이게 하는 플러그인 
				$('#simple-menu').sidr({
				    name: 'sidr-main',
				    source: '#side_menu_nav'
				  });
				});
				
				
				$("#delete").click(function(){
					var likename = $(".likename").val;
					var likenum = $("this").next.val;
					
					alert("삭제 버튼 눌림" + "지역이름 : [ "+likename+" ] 번호 [ "+likenum+" ]");
				});
				