
// step2 로 페이지 이동시 나오는 로딩화면
$("#loading").hide();

$(".nextbtnstep2").click(function(event) {

	// form 태그에 있는 정보를 중간 정보 저장공간에 넣어주고 그걸 hidden 에 넣어주기

	// 중간 저장공간에 넣어줌.
	temptitle = $(".traveltitle").val();
	templiststart = $(".liststart").val();
	templistthrough = $(".listthrough").val();
	templistarrival = $(".listarrival").val();
	tempfellowpeople = $(".fellowpeople").val();
	tempstartdate = $("#startdate").val();
	tempenddate = $("#arrivaldate").val();

	// hidden에 넣어줌.
	$("#ttitle").val(temptitle);
	$("#sregion").val(templiststart);
	$("#tregion").val(templistthrough);
	$("#aregion").val(templistarrival);
	$("#ffellow").val(tempfellowpeople);
	$("#stdate").val(tempstartdate);
	$("#enddate").val(tempenddate);
	// hidden에 넣어준 값을 넘겨주기.
	//

	var ttitle = document.getElementById('ttitle');
	var sregion = document.getElementById('sregion');
	var aregion = document.getElementById('aregion');
	var stdate = document.getElementById('stdate');
	var enddate = document.getElementById('enddate');

	if (sregion.value == '' || sregion.value == null) {
		alert('출발지역을 입력해주세요');
		return false;
		
	} else if (aregion.value == '' || aregion.value == null) {
		alert('도착지를 입력해주세요');
		return false;
		
	} else if (ttitle.value == '' || ttitle.value == null) {
		alert('일정 제목을 입력해주세요');
		return false;
		
	} else if (stdate.value == '' || stdate.value == null) {
		alert('출발날짜를 선택해주세요');
		return false;
		
	} else if (enddate.value == '' || enddate.value == null) {
		alert('도착날짜를 선택해주세요');
		return false;
		
	}else{
		
		// #("#infofrm").attr('action=');
		$("#hiddeninfofrm").submit();
		// var url = "/step1/step1.tm";
		// $(location).attr('href', url);
		$(".container").hide();
		$(".navbar").hide();
		$("#loading").show();
	
	}
	
	
});

// 동행자 팝업 창에서 search 버튼 눌렀을때
$("#modalsearchbtn").click(function() {

					// 입력된 값 저장 변수
					tempid = $("#modalsearchplace").val();

					$.ajax({
					url : "/step1/step1searchfellow.tm",
					type : "POST",
					data : {
					"step1search" : tempid
					},
					dataType : "json",
					success : function(data) {
					// 내용값을 지우고
					$(".idlistfrm").empty();
					// 결과 리스트를 읽어와서 추가
						for (var i = 0; i < data.length; i++) {
						$(".idlistfrm").append("<label class='idlb'>ID</label>");
						$(".idlistfrm").append("<input type='text' class='idlist'name='idlist' value='"	+ data[i].userId+ "' readonly='readonly' />");
						$(".idlistfrm").append("<label class='nicklb'>닉네임</label>");
						$(".idlistfrm").append("<input type='text' class='nicklist'name='nicklist' value='"+ data[i].userNick+ "' readonly='readonly'>");
						$(".idlistfrm").append("<input type='button' value='O' class='okbtn'>");
						$(".idlistfrm").append("<br>");
						}
					
				    }
					});
});

// 동행자 최대4명만 선택할 수 있도록 카운트를 구하기위해 필요한 변수.
var okcount = 0;
// 출력된 아이디와 닉네임을 확인하여 O버튼을 클릭하면 팝업창 하단에 선택된 아이디 출력.
$(document).on('click',	'.okbtn', function() {
			if (okcount < 4) {
				var searchedid = $(this).prev().prev().prev().val();
				$(".mbbul").append("<li class='mbulli'>"+ searchedid+ 
						"<input type='button' value='X' class='cancelbtn'/>"+ 
						" " + "</li>");

						// 동행자 카운트 1 증가
						++okcount;

			}else{
				alert("동행자는 최대 4명까지 선택 가능합니다. 즐거운 여행되세요.");
			}

});

// 동행자 검색 창에서 검색한 아이디를 선택하고 선택한 아이디를 다시 삭제.
$(document).on('click', '.cancelbtn', function() {

	$(this).parent().detach();

	// 동행자 카운트 1 감소
	--okcount;

});

// 동행자 팝업 창에서 닫기 버튼 (close 버튼) 누르면 동행자 목록이 초기화.
$(".close").click(function() {
	// 동행자 목록 초기화
	$(".modal-body").find(".idlistfrm *").detach();
	// 동행자 목록에서 선택한 아이디 값들을 초기화
	$(".modal-body-bottom").find(".mbbul *").detach();

});

// 동행자 목록 초기화 버튼 클릭시
$(".ftrsbtn").click(function() {
	// 동행자 목록 초기화
	// $(".modal-body").find
	$(".modal-body").find(".idlistfrm *").detach();
	// 동행자 목록에서 선택한 아이디 값들을 초기화
	// $(".modal-body-bottom").find
	$(".modal-body-bottom").find(".mbbul *").detach();

	okcount = 0;
});

//동행자 팝업창에서 완료 버트 눌렀을때 일정 만들기 페이지로 선택한 아이디 가져간다.
$(document).on('click', '.ftokbtn', function() {

	// step1 동행자 공간 id,class 는 fellowpeople
	// 선택된 아이디가 있는 곳은 li 의 class mbulli

	// 동행자 팝업 창에서 선택된 아이디 값을 모달창에서 step1 페이지 동행자란에 가져오기.
	var idgroup = $(".modal-body-bottom").find(".mbulli").text();

	$("#fellowpeople").val(idgroup);

	// 검색한 아이디 목록 초기화
	$(".modal-body").find(".idlistfrm *").detach();

});

// 제목 입력란 유효성 글자 25자 내로 입력
$('.traveltitle').on('keydown', function() {
	if ($(this).val().length > 25) {
		$(this).val($(this).val().substring(0, 25));
	}

});

// 경유지 리셋 버튼 기능
$(".reset").click(function() {

	$(".listthrough").val("");
	temp = '';

});

// 출발날짜 도착날짜
// startdate = 출발날짜, arrivaldate = 도착날짜
$("#startdate").datepicker({
	minDate : 0,
	dateFormat : "yy-mm-dd",
	onSelect : function(selected) {
		$("#arrivaldate").datepicker("option", "minDate", selected)
	}
});

$("#arrivaldate").datepicker({
	minDate : 0,
	dateFormat : "yy-mm-dd",
	onSelect : function(selected) {
		$("#startdate").datepicker("option", "maxDate", selected)
	}
});

// 여행지 지역 메뉴 탭의 하위 메뉴 펼치기/접기

// 출발지 탭
// 출발지 탭 강원도 펼치기/접기
$(".Gangwondo").click(function() {
	// 현재 클릭한 태그가 a 이기 때문에
	// a 옆의 태그중 ul 태그에 hide 클래스 태그를 넣던지 빼던지 한다.
	// $(".Gangwondodiv").show();

	var con = document.getElementById("Gangwondodiv");
	if (con.style.display == "none") {
		con.style.display = "block";
	} else {
		con.style.display = "none";
	}

	// $(".Gangwondodiv").css("display","block");
});

// 출발지 탭 경기도 펼치기/접기
$(".Gyeonggido").click(function() {
	var con = document.getElementById("Gyeonggidodiv");
	if (con.style.display == "none") {
		con.style.display = "block";
	} else {
		con.style.display = "none";
	}
	// $(".Gyeonggidodiv").slideToggle("fast");
});

// 출발지 탭 경상남도 펼치기/접기
$(".Gyeongsangnamdo").click(function() {
	var con = document.getElementById("Gyeongsangnamdodiv");
	if (con.style.display == "none") {
		con.style.display = "block";
	} else {
		con.style.display = "none";
	}
	// $(".Gyeongsangnamdodiv").slideToggle("fast");
});

// 출발지 탭 경상북도 펼치기/접기
$(".Gyeongsangbukdo").click(function() {
	var con = document.getElementById("Gyeongsangbukdodiv");
	if (con.style.display == "none") {
		con.style.display = "block";
	} else {
		con.style.display = "none";
	}
	// $(".Gyeongsangbukdodiv").slideToggle("fast");
});

// 출발지 탭 전라남도 펼치기/접기
$(".Jeollanamdo").click(function() {
	var con = document.getElementById("Jeollanamdodiv");
	if (con.style.display == "none") {
		con.style.display = "block";
	} else {
		con.style.display = "none";
	}
});

// 출발지 탭 전라북도 펼치기/접기
$(".Jeollabukdo").click(function() {
	var con = document.getElementById("Jeollabukdodiv");
	if (con.style.display == "none") {
		con.style.display = "block";
	} else {
		con.style.display = "none";
	}
});

// 출발지 탭 충청남도 펼치기/접기
$(".Chungcheongnamdo").click(function() {
	var con = document.getElementById("Chungcheongnamdodiv");
	if (con.style.display == "none") {
		con.style.display = "block";
	} else {
		con.style.display = "none";
	}
});

// 출발지 탭 충청북도 펼치기/접기
$(".Chungcheongbukdo").click(function() {
	var con = document.getElementById("Chungcheongbukdodiv");
	if (con.style.display == "none") {
		con.style.display = "block";
	} else {
		con.style.display = "none";
	}
});

// 경유지 탭
// 경유지 탭 강원도 접기/펼치기
$(".Gangwondo2").click(function() {
	// 현재 클릭한 태그가 a 이기 때문에
	// a 옆의 태그중 ul 태그에 hide 클래스 태그를 넣던지 빼던지 한다.
	// $(".Gangwondodiv").show();

	var con = document.getElementById("Gangwondodiv2");
	if (con.style.display == "none") {
		con.style.display = "block";
	} else {
		con.style.display = "none";
	}

	// $(".Gangwondodiv").css("display","block");
});

// 경유지 탭 경기도 접기/펼치기
$(".Gyeonggido2").click(function() {
	var con = document.getElementById("Gyeonggidodiv2");
	if (con.style.display == "none") {
		con.style.display = "block";
	} else {
		con.style.display = "none";
	}
	// $(".Gyeonggidodiv").slideToggle("fast");
});

// //경유지 탭 경상남도 접기/펼치기
$(".Gyeongsangnamdo2").click(function() {
	var con = document.getElementById("Gyeongsangnamdodiv2");
	if (con.style.display == "none") {
		con.style.display = "block";
	} else {
		con.style.display = "none";
	}
	// $(".Gyeongsangnamdodiv").slideToggle("fast");
});

// 경유지 탭 경상북도 접기/펼치기
$(".Gyeongsangbukdo2").click(function() {
	var con = document.getElementById("Gyeongsangbukdodiv2");
	if (con.style.display == "none") {
		con.style.display = "block";
	} else {
		con.style.display = "none";
	}
	// $(".Gyeongsangbukdodiv").slideToggle("fast");
});

// 경유지 탭 전라남도 접기/펼치기
$(".Jeollanamdo2").click(function() {
	var con = document.getElementById("Jeollanamdodiv2");
	if (con.style.display == "none") {
		con.style.display = "block";
	} else {
		con.style.display = "none";
	}
});

// 경유지 탭 전라남도 접기/펼치기
$(".Jeollabukdo2").click(function() {
	var con = document.getElementById("Jeollabukdodiv2");
	if (con.style.display == "none") {
		con.style.display = "block";
	} else {
		con.style.display = "none";
	}
});

// //경유지 탭 충청남도 접기/펼치기
$(".Chungcheongnamdo2").click(function() {
	var con = document.getElementById("Chungcheongnamdodiv2");
	if (con.style.display == "none") {
		con.style.display = "block";
	} else {
		con.style.display = "none";
	}
});

// 경유지 탭 충청북도 접기/펼치기
$(".Chungcheongbukdo2").click(function() {
	var con = document.getElementById("Chungcheongbukdodiv2");
	if (con.style.display == "none") {
		con.style.display = "block";
	} else {
		con.style.display = "none";
	}
});

// 도착지 탭
// 도착지 탭 강원도 접기/펼치기
$(".Gangwondo3").click(function() {
	// 현재 클릭한 태그가 a 이기 때문에
	// a 옆의 태그중 ul 태그에 hide 클래스 태그를 넣던지 빼던지 한다.
	// $(".Gangwondodiv").show();

	var con = document.getElementById("Gangwondodiv3");
	if (con.style.display == "none") {
		con.style.display = "block";
	} else {
		con.style.display = "none";
	}

	// $(".Gangwondodiv").css("display","block");
});

// 도착지 탭 경기도 접기/펼치기
$(".Gyeonggido3").click(function() {
	var con = document.getElementById("Gyeonggidodiv3");
	if (con.style.display == "none") {
		con.style.display = "block";
	} else {
		con.style.display = "none";
	}
	// $(".Gyeonggidodiv").slideToggle("fast");
});

// 도착지 탭 경상남도 접기/펼치기
$(".Gyeongsangnamdo3").click(function() {
	var con = document.getElementById("Gyeongsangnamdodiv3");
	if (con.style.display == "none") {
		con.style.display = "block";
	} else {
		con.style.display = "none";
	}
	// $(".Gyeongsangnamdodiv").slideToggle("fast");
});

// 도착지 탭 경상북도 접기/펼치기
$(".Gyeongsangbukdo3").click(function() {
	var con = document.getElementById("Gyeongsangbukdodiv3");
	if (con.style.display == "none") {
		con.style.display = "block";
	} else {
		con.style.display = "none";
	}
	// $(".Gyeongsangbukdodiv").slideToggle("fast");
});

// 도착지 탭 전라남도 접기/펼치기
$(".Jeollanamdo3").click(function() {
	var con = document.getElementById("Jeollanamdodiv3");
	if (con.style.display == "none") {
		con.style.display = "block";
	} else {
		con.style.display = "none";
	}
});

// 도착지 탭 전라북도 접기/펼치기
$(".Jeollabukdo3").click(function() {
	var con = document.getElementById("Jeollabukdodiv3");
	if (con.style.display == "none") {
		con.style.display = "block";
	} else {
		con.style.display = "none";
	}
});

// 도착지 탭 충청남도 접기/펼치기
$(".Chungcheongnamdo3").click(function() {
	var con = document.getElementById("Chungcheongnamdodiv3");
	if (con.style.display == "none") {
		con.style.display = "block";
	} else {
		con.style.display = "none";
	}
});

// 도착지 탭 충청북도 접기/펼치기
$(".Chungcheongbukdo3").click(function() {
	var con = document.getElementById("Chungcheongbukdodiv3");
	if (con.style.display == "none") {
		con.style.display = "block";
	} else {
		con.style.display = "none";
	}
});

// 여행지 버튼클릭 이벤트

// 출발지 탭
// 여행지 지역 선택 3행으로 이루어진상태
var tempstart;

// 출발지 탭 1행 
$(".wrap .city0 .a").click(function() {
	tempstart = $(this).val();
	$(".liststart").val(tempstart);
	
	$(".nav .tabstopover").attr("class","active tabstopover");
	$(".nav .tabstart").attr("class","tabstart");
	$(".tab-content .active").attr("class", "tab-pane fade");
	$(".tab-content #menu2").attr("class","tab-pane fade in active");
});

// 출발지 탭 2행 
$(".wrap .city1 .a").click(function() {
	tempstart = $(this).val();
	$(".liststart").val(tempstart);
	
	$(".nav .tabstopover").attr("class","active tabstopover");
	$(".nav .tabstart").attr("class","tabstart");
	$(".tab-content .active").attr("class", "tab-pane fade");
	$(".tab-content #menu2").attr("class","tab-pane fade in active");
});

// 출발지 탭 3행 
$(".wrap .city2 .a").click(function() {
	tempstart = $(this).val();
	$(".liststart").val(tempstart);
	
	$(".nav .tabstopover").attr("class","active tabstopover");
	$(".nav .tabstart").attr("class","tabstart");
	$(".tab-content .active").attr("class", "tab-pane fade");
	$(".tab-content #menu2").attr("class","tab-pane fade in active");
});

// 출발지 탭 강원도 하위에 포함된 버튼  
$(".wrap .Gangwondodiv input").click(function() {
	tempstart = $(this).val();
	$(".liststart").val(tempstart);
	
	$(".nav .tabstopover").attr("class","active tabstopover");
	$(".nav .tabstart").attr("class","tabstart");
	$(".tab-content .active").attr("class", "tab-pane fade");
	$(".tab-content #menu2").attr("class","tab-pane fade in active");
});

// 출발지 탭 경기도 하위에 포함된 버튼  
$(".wrap .Gyeonggidodiv input").click(function() {
	tempstart = $(this).val();
	$(".liststart").val(tempstart);
	
	$(".nav .tabstopover").attr("class","active tabstopover");
	$(".nav .tabstart").attr("class","tabstart");
	$(".tab-content .active").attr("class", "tab-pane fade");
	$(".tab-content #menu2").attr("class","tab-pane fade in active");
});

// 출발지 탭 경상남도 하위에 포함된 버튼  
$(".wrap .Gyeongsangnamdodiv input").click(function() {
	tempstart = $(this).val();
	$(".liststart").val(tempstart);
	
	$(".nav .tabstopover").attr("class","active tabstopover");
	$(".nav .tabstart").attr("class","tabstart");
	$(".tab-content .active").attr("class", "tab-pane fade");
	$(".tab-content #menu2").attr("class","tab-pane fade in active");
});
// 출발지 탭 경상북도 하위에 포함된 버튼    
$(".wrap .Gyeongsangbukdodiv input").click(function() {
	tempstart = $(this).val();
	$(".liststart").val(tempstart);
	
	$(".nav .tabstopover").attr("class","active tabstopover");
	$(".nav .tabstart").attr("class","tabstart");
	$(".tab-content .active").attr("class", "tab-pane fade");
	$(".tab-content #menu2").attr("class","tab-pane fade in active");
});
// 출발지 탭 전남 하위에 포함된 버튼  
$(".wrap .Jeollanamdodiv input").click(function() {
	tempstart = $(this).val();
	$(".liststart").val(tempstart);
	
	$(".nav .tabstopover").attr("class","active tabstopover");
	$(".nav .tabstart").attr("class","tabstart");
	$(".tab-content .active").attr("class", "tab-pane fade");
	$(".tab-content #menu2").attr("class","tab-pane fade in active");
});
// 출발지 탭 전북 하위에 포함된 버튼  
$(".wrap .Jeollabukdodiv input").click(function() {
	tempstart = $(this).val();
	$(".liststart").val(tempstart);
	
	$(".nav .tabstopover").attr("class","active tabstopover");
	$(".nav .tabstart").attr("class","tabstart");
	$(".tab-content .active").attr("class", "tab-pane fade");
	$(".tab-content #menu2").attr("class","tab-pane fade in active");
});
// 출발지 탭 충남 하위에 포함된 버튼  
$(".wrap .Chungcheongnamdodiv input").click(function() {
	tempstart = $(this).val();
	$(".liststart").val(tempstart);
	
	$(".nav .tabstopover").attr("class","active tabstopover");
	$(".nav .tabstart").attr("class","tabstart");
	$(".tab-content .active").attr("class", "tab-pane fade");
	$(".tab-content #menu2").attr("class","tab-pane fade in active");
});
// 출발지 탭 충북 하위에 포함된 버튼  
$(".wrap .Chungcheongbukdodiv input").click(function() {
	tempstart = $(this).val();
	$(".liststart").val(tempstart);
	
	$(".nav .tabstopover").attr("class","active tabstopover");
	$(".nav .tabstart").attr("class","tabstart");
	$(".tab-content .active").attr("class", "tab-pane fade");
	$(".tab-content #menu2").attr("class","tab-pane fade in active");
});

// 경유지탭 1행*/
var temp = [];

$(".wrap .city0 .b").click(function() {
    //첫번째 if문 출발지 탭에서 선택한 값을 경유지 탭에서 선택 못하게 하는 기능.
	//두번째 if문 경유지 탭에서 동일한 지역을 입력 못하도록 하는 기능.
	if( $(".liststart").val() != $(this).val() ){
		
		if( $(this).attr("class") == ""){
			return false;
		}else{
			temp += $(this).val() + ">";
	    	$(".listthrough").val(temp);
	    	$(this).attr("class", "");
		}
	}else{
		return false;
	}
    
});
// 경유지탭 2행 travelregion */
$(".wrap .city1 .b").click(function() {
    //첫번째 if문 출발지 탭에서 선택한 값을 경유지 탭에서 선택 못하게 하는 기능.
	//경유지 탭에서 동일한 지역을 입력 못하도록 하는 기능.
	if( $(".liststart").val() != $(this).val() ){
		
		if( $(this).attr("class") == ""){
			return false;
		}else{
			temp += $(this).val() + ">";
	    	$(".listthrough").val(temp);
	    	$(this).attr("class", "");
		}
	}else{
		return false;
	}
});
// 경유지탭 3행 travelregion */
$(".wrap .city2 .b").click(function() {
    //첫번째 if문 출발지 탭에서 선택한 값을 경유지 탭에서 선택 못하게 하는 기능.
	//경유지 탭에서 동일한 지역을 입력 못하도록 하는 기능.
	if( $(".liststart").val() != $(this).val() ){
		
		if( $(this).attr("class") == ""){
			return false;
		}else{
			temp += $(this).val() + ">";
	    	$(".listthrough").val(temp);
	    	$(this).attr("class", "");
		}
	}else{
		return false;
	}
});

// 경유지탭 강원도 하위 버튼 (travelregion2) 
$(".wrap .Gangwondodiv2 input").click(function() {
    //첫번째 if문 출발지 탭에서 선택한 값을 경유지 탭에서 선택 못하게 하는 기능. 
	//경유지 탭에서 동일한 지역을 입력 못하도록 하는 기능.
	if( $(".liststart").val() != $(this).val() ){
		
		if( $(this).attr("class") == ""){
			return false;
		}else{
			temp += $(this).val() + ">";
	    	$(".listthrough").val(temp);
	    	$(this).attr("class", "");
		}
	}else{
		return false;
	}
});
// 경유지탭 경기도 하위 버튼 (travelregion2) 
$(".wrap .Gyeonggidodiv2 input").click(function() {
    //첫번째 if문 출발지 탭에서 선택한 값을 경유지 탭에서 선택 못하게 하는 기능.
	//경유지 탭에서 동일한 지역을 입력 못하도록 하는 기능.
	if( $(".liststart").val() != $(this).val() ){
		
		if( $(this).attr("class") == ""){
			return false;
		}else{
			temp += $(this).val() + ">";
	    	$(".listthrough").val(temp);
	    	$(this).attr("class", "");
		}
	}else{
		return false;
	}
});

// 경유지탭 경상남도 하위 버튼 (travelregion2) 
$(".wrap .Gyeongsangnamdodiv2 input").click(function() {
    //첫번째 if문 출발지 탭에서 선택한 값을 경유지 탭에서 선택 못하게 하는 기능.
	//경유지 탭에서 동일한 지역을 입력 못하도록 하는 기능.
	if( $(".liststart").val() != $(this).val() ){
		
		if( $(this).attr("class") == ""){
			return false;
		}else{
			temp += $(this).val() + ">";
	    	$(".listthrough").val(temp);
	    	$(this).attr("class", "");
		}
	}else{
		return false;
	}
});
// 경유지탭 경상북도 하위 버튼 (travelregion2) 
$(".wrap .Gyeongsangbukdodiv2 input").click(function() {
    //첫번째 if문 출발지 탭에서 선택한 값을 경유지 탭에서 선택 못하게 하는 기능.
	//경유지 탭에서 동일한 지역을 입력 못하도록 하는 기능.
	if( $(".liststart").val() != $(this).val() ){
		
		if( $(this).attr("class") == ""){
			return false;
		}else{
			temp += $(this).val() + ">";
	    	$(".listthrough").val(temp);
	    	$(this).attr("class", "");
		}
	}else{
		return false;
	}
});
// 경유지탭 전남 하위 버튼 (travelregion2) 
$(".wrap .Jeollanamdodiv2 input").click(function() {
    //첫번째 if문 출발지 탭에서 선택한 값을 경유지 탭에서 선택 못하게 하는 기능.
	//경유지 탭에서 동일한 지역을 입력 못하도록 하는 기능.
	if( $(".liststart").val() != $(this).val() ){
		
		if( $(this).attr("class") == ""){
			return false;
		}else{
			temp += $(this).val() + ">";
	    	$(".listthrough").val(temp);
	    	$(this).attr("class", "");
		}
	}else{
		return false;
	}
});
// 경유지탭 전북 하위 버튼 (travelregion2) 
$(".wrap .Jeollabukdodiv2 input").click(function() {
    //첫번째 if문 출발지 탭에서 선택한 값을 경유지 탭에서 선택 못하게 하는 기능.
	//경유지 탭에서 동일한 지역을 입력 못하도록 하는 기능.
	if( $(".liststart").val() != $(this).val() ){
		
		if( $(this).attr("class") == ""){
			return false;
		}else{
			temp += $(this).val() + ">";
	    	$(".listthrough").val(temp);
	    	$(this).attr("class", "");
		}
	}else{
		return false;
	}
});
// 경유지탭 충남 하위 버튼 (travelregion2) 
$(".wrap .Chungcheongnamdodiv2 input").click(function() {
    //첫번째 if문 출발지 탭에서 선택한 값을 경유지 탭에서 선택 못하게 하는 기능.
	//경유지 탭에서 동일한 지역을 입력 못하도록 하는 기능.
	if( $(".liststart").val() != $(this).val() ){
		
		if( $(this).attr("class") == ""){
			return false;
		}else{
			temp += $(this).val() + ">";
	    	$(".listthrough").val(temp);
	    	$(this).attr("class", "");
		}
	}else{
		return false;
	}
});
// 경유지탭 충북 하위 버튼 (travelregion2) 
$(".wrap .Chungcheongbukdodiv2 input").click(function() {
    //첫번째 if문 출발지 탭에서 선택한 값을 경유지 탭에서 선택 못하게 하는 기능.
	//경유지 탭에서 동일한 지역을 입력 못하도록 하는 기능.
	if( $(".liststart").val() != $(this).val() ){
		
		if( $(this).attr("class") == ""){
			return false;
		}else{
			temp += $(this).val() + ">";
	    	$(".listthrough").val(temp);
	    	$(this).attr("class", "");
		}
	}else{
		return false;
	}
});


// 경유지역에서 선택한 지역을 
//var stopoverlist;
//stopoverlist = $(".listthrough").val();
//
//StringTokenizer st = new StringTokenizer(stopoverlist ,">");


//while(st.hasMoreTokens()){
//	String temp = st.nextToken();
//	if(!(temp.equals("") || temp == null)){
//		
//	}
//}
//



//  도착지 탭 1행  
$(".wrap .city0 .c").click(function() {
	// $(".container .liststart").val($(this).val());
	$(".listarrival").val($(this).val());
});
// 도착지 탭 2행 
$(".wrap .city1 .c").click(function() {
	$(".listarrival").val($(this).val());
});
// 도착지 탭  3행 
$(".wrap .city2 .c").click(function() {
	$(".listarrival").val($(this).val());
});

// 도착지 탭 강원도 하위 버튼 (travelregion3) 
$(".wrap .Gangwondodiv3 input").click(function() {
	$(".listarrival").val($(this).val());
});
// 도착지 탭 경기도 하위 버튼 (travelregion3) 
$(".wrap .Gyeonggidodiv3 input").click(function() {
	$(".listarrival").val($(this).val());
});

// 도착지 탭 경상남도 하위 버튼 (travelregion3) 
$(".wrap .Gyeongsangnamdodiv3 input").click(function() {
	$(".listarrival").val($(this).val());
});
// 도착지 탭 경상북도 하위 버튼 (travelregion3) 
$(".wrap .Gyeongsangbukdodiv3 input").click(function() {
	$(".listarrival").val($(this).val());
});
// 도착지 탭 전남 하위 버튼 (travelregion3) 
$(".wrap .Jeollanamdodiv3 input").click(function() {
	$(".listarrival").val($(this).val());
});
// 도착지 탭 전북 하위 버튼 (travelregion3) 
$(".wrap .Jeollabukdodiv3 input").click(function() {
	$(".listarrival").val($(this).val());
});
// 도착지 탭 충남 하위 버튼 (travelregion3) 
$(".wrap .Chungcheongnamdodiv3 input").click(function() {
	$(".listarrival").val($(this).val());
});
// 도착지 탭 충북 하위 버튼 (travelregion3) 
$(".wrap .Chungcheongbukdodiv3 input").click(function() {
	$(".listarrival").val($(this).val());
});
