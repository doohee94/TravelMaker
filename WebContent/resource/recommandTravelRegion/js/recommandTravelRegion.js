$(document).ready(function(){
        
    $(".return-top").hide(); // 탑 버튼 숨김
    $(function () {
                 
        $(window).scroll(function () {
            if ($(this).scrollTop() > 100) { // 스크롤 내릴 표시
                $('.return-top').fadeIn();
            } else {
                $('.return-top').fadeOut();
            }
        });
                
        $('.return-top').click(function () {
            $('body,html').animate({
                scrollTop: 0
            }, 350);  // 탑 이동 스크롤 속도
            return false;
        });
    });
 
  //무한스크롤 addDiv()함수 호출 addDiv() 함수는 말 그대로 div add.
    
    $("#populartab").click(function(){
    	
    });
   
    $(window).scroll(function(){
		var docH=$(document).height();
		var scrolH = $(window).height() + $(window).scrollTop();
		if(scrolH>=docH ){
			addDivPopulartab();
			addDivmyInteresttab();
		}
	});
    
});

function addDivPopulartab(){
	for(var i=0; i<6; i++){
		$("#populartab").append(
				"<div class='col-md-4 text-center'>"+
					"<div class='thumbnail'>"+
						"<img class='img-responsive' src='http://placehold.it/750x450' alt=''>"+
						"<div class='caption'><h3>대제목 공간<br><small>소제목 공간</small></h3>"+
							"<p>내용 공간</p>"+
						"</div>"+
					"</div>"+
				"</div>"
				);
	}
}

function addDivmyInteresttab(){
	for(var i=0; i<6; i++){
		$("#myinteresttab").append(
				"<div class='col-md-4 text-center'>"+
					"<div class='thumbnail'>"+
						"<img class='img-responsive' src='http://placehold.it/750x450' alt=''>"+
						"<div class='caption'><h3>대제목 공간<br><small>소제목 공간</small></h3>"+
							"<p>내용 공간</p>"+
						"</div>"+
					"</div>"+
				"</div>"
				);
	}
}