$(function(){
//	//스크롤이 화면 맨 아래에 도착했을 때 getDiv()함수 호출
//	$(window).scroll(function(){
//		var docH=$(document).height();
//		var scrolH = $(window).height() + $(window).scrollTop();
//		if(scrolH>=docH){
//			//getDiv();
//		}
//		
//
//	});
	
	//탑버튼 누르면 화면 맨 위로 올라가는 함수
	$("#move_top_btn").click(function() {
        $('html, body').animate({
            scrollTop : 0
        }, 400);
        return false;
    });
	
	
	$("#searchBtn").click(function(){
	
		if($("#reviewSearchContent").val() == ""){
			alert("검색어를 입력해주세요!");
			return false;
		}else{
			
			alert($("#reviewSearchContent").val());
			
			
			location.href="reviewlist.tm?searchContent="+$("#reviewSearchContent").val();
			
			
		}//end else
		
	});//end searchBtn click
	
	
});

//getDiv() : 스크롤이 다 했을 때 불러올 정보 4개씩 가져오는 함수
function getDiv(){
	for(var i=0; i<4; i++){
		$("#divCon").append(
				'<div class="row">'+
				'<div class="col-md-7">'+
				'<a href="portfolio-item.html">'+
				'<img class="img-responsive img-hover" src="http://placehold.it/700x300" alt="">'+
				'</a>'+
				'</div>'+
				'<div class="col-md-5">'+
				'<h3>Project One</h3>'+
				'<h4>Subheading</h4>'+
				'<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Laudantium veniam exercitationem expedita laborum at voluptate. Labore, voluptates totam at aut nemo deserunt rem magni pariatur quos perspiciatis atque eveniet unde.</p>'+
				'<a class="btn btn-primary" href="portfolio-item.html">View Project</i></a>'+
				'</div>'+
				'</div>'+
				'<hr>'
				
		);
	}
}