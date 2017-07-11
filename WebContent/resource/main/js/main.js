    	$(function(){
    		//검색버튼 누르면
    		$('.btn-search').click(function(){
    			var keyword = $("#search_bar").val();
    			//search 유효성 검사
    			if(keyword==""){
    				alert("검색어가 입력되지 않았습니다.");
    				return;
    			}else{
    			//검색후 serchview화면 이동
    			$(location).attr('href',"/searchpage/search.tm?cityName="+keyword);
    			}
    		});   		
    		//해당 일정 버튼을 누르면 해당 일정으로 이동
    		$('.review').click(function(){
    			//해당 일정 작성자 아이디 받기
    			var userId = $(this).next().val();
    			//해당 일정 번호 받기
    			var scNum = $(this).next().next().val();
    			//해당 리뷰 번호 받기
    			var totalNum = $(this).next().next().next().val();
    		});
    		//리뷰 더보기 버튼을 누르면 리뷰리스트 화면으로 이동
    		$('#reviewMore').click(function(){
    			$(location).attr('href',"/travelReview/reviewlist.tm");
    		});
    		$('#spotMore').click(function(){
    			$(location).attr('href',"/recommandtravelregion/recommandTravelRegion.tm");
    		});
    		
    	});