$(function(){
    //검색 버튼이 눌릴때
    $('#searchBtn').click(function(){
    	var keyword = $('#tf_search').val();
    	//search 유효성 검사
    	if(keyword==""){
    		alert("검색어가 입력되지 않았습니다.");
    		return;
		}else{
    			//검색후 serchview화면 이동
		$(location).attr('href',"/searchpage/search.tm?cityName="+keyword);
		}
    });
});