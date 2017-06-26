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
		//상세페이지로 보낸다
		location.href="reviewDetail.tm";
	});
});

//getDiv() : 스크롤이 다 했을 때 불러올 정보 4개씩 가져오는 함수
function getDiv(){
	for(var i=0; i<4; i++){
		$("#divCon").append(
				'<div class="row row-margin-bottom" id="divCon">'+
				'<div class="col-md-5 no-padding lib-item" data-category="view" id="divContent">'+
				'<div class="lib-panel">'+
				'<div class="row box-shadow">'+
				'<div class="col-md-6">'+
				'<button id="" class="images">'+
				'<img class="lib-img-show" src="http://lorempixel.com/850/850/?random=123">'+
				'</button>'+
				'</div>'+
				'<div class="col-md-6">'+
				'<div class="lib-row lib-header">'+
				'여행리뷰'+
				'<div class="lib-header-seperator"></div>'+
				'</div>'+
				'<div class="lib-row lib-desc">'+
				'여행리뷰 내용들입니다 하하하하하하하하하하하하핳'+
				'</div>'+
				'</div>'+
				'</div>'+
				'</div>'+
				'</div>'+
				'<div class="col-md-1"></div>'+
				'</div>'
				
		);
	}
}