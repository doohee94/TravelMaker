$(document).ready(function() {

	//사이드 메뉴 숨겨놨다 보이게 하는 플러그인 
	$('#simple-menu').sidr({
		name: 'sidr-main',
		source: '#side_menu_nav'
		});
	});
	$(".delete").click(function(){
		var likenum = $(this).next().val();
		alert("삭제버튼 눌림" + likenum);
		//db타고 와서 해당 여행지 삭제 시기기
//		$(location).attr('href',"/tmmypage/deletespot.tm&likeNum="+likenum);
		$.ajax({
			type : "POST",
			url : "/tmmypage/deletespot.tm",
			data : {
				likespotNum : likenum
			},
			success : function(data){
				if(data=!null){
				alert("삭제를 성공하였습니다.");
				$(location).attr("href","/tmmypage/likespot.tm")
				}
			},
			error : function(err){
				alert("삭제실패"+err.status)
			}
		});
});
				