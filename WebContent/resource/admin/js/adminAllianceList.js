$("#prevPage").click(function() {
	// 현재 페이지 넘버를 얻어옴
	var pageNumber = $("#pageNumber").val();
	// 다음 페이지 넘버가 저장될 변수
	var nextNumber = 0;
	// 만약 10으로 나눈 나머지에 1을 뺄때 0보다 작거나 같다면 그 페이지에서 멈추게
	if (parseInt(pageNumber) % 10 - 1 <= 0) {
		if (parseInt(pageNumber / 10) == 0) {
			var temp = parseInt(pageNumber / 10);
			nextNumber = parseInt(temp) * 10 + 1;
		}
	} else {
		// 위에 조건이 안걸리면 전페이지로 이동
		nextNumber = pageNumber - 1;
	}

	var url = $("#url").val();
	var partnerComname = $("#partnerComname").val();

	if (url == 'searchalli.tm') {
		location.href = "/tmadmin/" + url + "?pageNumber="
						+ nextNumber + "&partnerComname="
						+ partnerComname;
	} else {
		location.href = "/tmadmin/" + url + "?pageNumber="
						+ nextNumber;
	}
});

$("#nextPage").click(function() {
	// 현재 페이지 넘버를 얻어옴
	var pageNumber = $("#pageNumber").val();
	// 총 페이지 수를 얻어옴
	var totalpage = $("#totalpage").val();
	// 다음 페이지 넘버가 저장될 변수
	var nextNumber = 0;

	// 페이지는 10보다 크고 10으로 나누어 나머지가 1일때 이전페이지
	if (pageNumber > 10 && pageNumber % 10 == 1) {
		nextNumber = pageNumber - 1;
		// 10으로 나누어 떨어지는 페이지 일때 이전페이지 이동
	} else if (pageNumber >= 10 && pageNumber % 10 == 0) {
		nextNumber = pageNumber - 1;
		// 만약 10으로 나눈 나머지에 1을 뺄때 0보다 작거나 같다면 그 페이지에서 멈추게
	} else if (parseInt(pageNumber) + 1 > parseInt(totalpage)) {
		nextNumber = totalpage;
	} else {
		// 아니라면 다음페이지로 이동
		nextNumber = parseInt(pageNumber) + 1;
	}
	var url = $("#url").val();
	var partnerComname = $("#partnerComname").val();

	if (url == 'searchalli.tm') {
		location.href = "/tmadmin/" + url + "?pageNumber="
						+ nextNumber + "&partnerComname="
						+ partnerComname;
	} else {
		location.href = "/tmadmin/" + url + "?pageNumber="
						+ nextNumber;
	}
});
//modal이 열렸을떄 다른데 클릭 못하게 변경
$(".infodiv").click(function() {
	$(this).next().modal({
		backdrop : 'static'
	});
});

$(".partnerType").hide();
$(".partnerStatech").hide();

$(".imgshow").click(function() {
	doImgPop($(this).attr("src"));
});

//삭제 버튼이 눌렸을때 경고문
$(".delete").click(function() {
	//경고문
	var check = confirm("삭제 하시겠습니까? \n삭제 하시면 관련광고와 함께 삭제됩니다");
	var num = $(this).next().val();
	//확인을 눌렀을때
	if (check) {
		location.href = "adminalliancedel.tm?num=" + num;
	}
});


$(".closebtnf").click(function() {
	$(".partnerType").hide();
	$(".partnerStatech").hide();
	$(".state").show();
	$(".partnerch").show();
});

function doImgPop(img) {
	img1 = new Image();
	img1.src = (img);
	imgControll(img);
}

function imgControll(img) {
	if ((img1.width != 0) && (img1.height != 0)) {
		viewImage(img);
	} else {
		controller = "imgControll('" + img + "')";
		intervalID = setTimeout(controller, 20);
	}
}

function viewImage(img) {
	W = img1.width;
	H = img1.height;
	O = "width=" + W + ",height=" + H + ",scrollbars=yes";
	imgWin = window.open("", "", O);
	imgWin.document.write("<html><head><title>상세보기</title></head>");
	imgWin.document.write("<body topmargin=0 leftmargin=0>");
	imgWin.document
			.write("<img src="
					+ img
					+ " onclick='self.close()' style='cursor:pointer;' title ='클릭하시면 창이 닫힙니다.'>");
	imgWin.document.close();
}