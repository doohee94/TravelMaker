$(function(){
	//스크롤이 화면 맨 아래에 도착했을 때 getDiv()함수 호출
	$(window).scroll(function(){
		var docH=$(document).height();
		var scrolH = $(window).height() + $(window).scrollTop();
		if(scrolH>=docH){
			getDiv();
		}
		
		//스크롤이 내려왔을 때 TOP버튼 보이게하는 함수
		if($(this).scrollTop() > 500){
			$("#move_top_btn").fadeIn();
		}else{
			$("#move_top_btn").fadeOut();
		}
	});
	
	//탑버튼 누르면 화면 맨 위로 올라가는 함수
	$("#move_top_btn").click(function() {
        $('html, body').animate({
            scrollTop : 0
        }, 400);
        return false;
    });
	
	//이미지 버튼 클릭하면 실행할 함수
	$(".images").click(function(){
	});
});

//getDiv() : 스크롤이 다 했을 때 불러올 정보 4개씩 가져오는 함수
function getDiv(){
	for(var i=0; i<4; i++){
		$("#divCon").append('<img class="lib-img-show"src="http://lorempixel.com/850/850/?random=123">');
	}
}