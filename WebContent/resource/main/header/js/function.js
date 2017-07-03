$(function(){
	$("#btn-search").click(function(){
		var keyword = $(".search-form").val();
		//search 유효성 검사
		if(keyword==""){
			alert("검색어가 입력되지 않았습니다.");
			return;
		}else{
		//검색후 serchview화면 이동
		$(location).attr('href',"/searchpage/search.tm?cityName="+keyword);
		}
	});
	//로그인 버튼을 누르면 로그인 화면으로 이동
	$("#btn-login").click(function(){
		$(location).attr('href',"/member/loginForm.tm");
	});
	//로그아웃 누르면 기존에 가지고 있는 세션값 userId, userNick값을 삭제
	$("#btn-logout").click(function(){	
		$(location).attr('href',"/tmmain/logout.tm");
	});
	//회원가입 버튼을 누르면 회원가입 화면으로 이동
	$("#btn-join").click(function(){
		$(location).attr('href',"/join/join.tm");
	});
	//마이페이지 버튼을 누르면 마이페이지 화면으로 이동
	$("#btn-mypage").click(function(){
		$(location).attr('href',"/tmmypage/likespot.tm");
	});
});