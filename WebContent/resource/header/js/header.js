$(function() {
	// 검색버튼 누르면
	$('#searchBtn').click(function() {

		 var keyword = $("#searchplace").val();
//		 search 유효성 검사
		 if(keyword==""){
		 alert("검색어가 입력되지 않았습니다.");
		 return;
		 }else{
			 
//		 검색후 serchview화면 이동
		 $(location).attr('href',"/searchpage/search.tm?cityName="+keyword);
		 }
	});
	// 해당 일정 버튼을 누르면 해당 일정으로 이동
});