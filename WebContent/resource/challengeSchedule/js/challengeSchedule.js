$(document).ready(function() {
			// 이미지 클릭시 상세페이지로 이동.
			$(".titles").click(function() {
				//상세페이지로 보낸다
				location.href = "challengeScheduleDetail.tm";
			});

			//     $("[rel='tooltip']").tooltip();    

			//게시글(네모창)에 마우스 오버시 기능 
			//     $('.thumbnail').hover(
			//         function(){
			//슬라이드 내려오는 속도
			//             $(this).find('.caption').slideDown(250); //.fadeIn(250)
			//         },
			//         function(){
			//슬라이드 다시 올라가는 속도
			//             $(this).find('.caption').slideUp(250); //.fadeOut(205)
			//         }
			//     ); 

			//top 버튼 스크립트
			 // 탑 버튼 숨김
//			$(".return-top").hide();
			
			$(function() {

//				$(window).scroll(function() {
//					if ($(this).scrollTop() > 100) {
						// 스크롤 내릴 표시
//						$('.return-top').fadeIn();
//					} else {
//						$('.return-top').fadeOut();
//					}
//				});

				$('.return-top').click(function() {
					$('body,html').animate({
						scrollTop : 0
					}, 350); // 탑 이동 스크롤 속도
					return false;
				});
			});
			
			//무한스크롤 addDiv()함수 호출 addDiv() 함수는 말 그대로 div add.
			$(window).scroll(function(){
				var docH=$(document).height();
				var scrolH = $(window).height() + $(window).scrollTop();
				if(scrolH>=docH){
					addDiv();
				}
			});
			
});



function addDiv(){
	for(var i=0; i<6; i++){
		$("#secondcontainer").append(
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